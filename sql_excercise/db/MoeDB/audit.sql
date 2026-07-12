-- Events table lockdown — aligns with the "Workers API only" architecture
-- (see rls_policies_block_direct_access.sql). Direct client (anon / authenticated)
-- access must be blocked; the Worker connects via DATABASE_URL (postgres role),
-- so revoking anon/authenticated grants does NOT affect the API.
--
-- Fixes:
--   P0  REVOKE ALL from anon/authenticated (esp. TRUNCATE — bypasses RLS).
--       Previously anon could wipe the events table via PostgREST.
--   1.  Add `events` to the api_only restrictive-policy block (was missing).
--   2.  Length CHECKs on the unbounded TEXT columns — DB backstop for the
--       Zod caps already enforced in the service layer.
--   3.  updated_at auto-refresh trigger (was relying on the app setting it).

-- ── P0: revoke direct client access ────────────────────────────────────────
REVOKE DELETE, INSERT, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON public.events FROM anon;
REVOKE DELETE, INSERT, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON public.events FROM authenticated;
-- service_role keeps full access (Worker uses the DATABASE_URL role, not these).

-- ── 1. RLS + restrictive api_only policy (matches every other table) ────────
ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname = 'public' AND tablename = 'events' AND policyname = 'api_only') THEN
    EXECUTE 'CREATE POLICY "api_only" ON public.events AS RESTRICTIVE USING (false)';
  END IF;
END $$;

-- ── 2. Length backstops for unbounded TEXT columns (match service Zod caps) ─
-- address <= 500, descriptions <= 5000, URL fields <= 2048
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'events_address_len_chk') THEN
    ALTER TABLE public.events ADD CONSTRAINT events_address_len_chk
      CHECK (address IS NULL OR length(address) <= 500);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'events_description_len_chk') THEN
    ALTER TABLE public.events ADD CONSTRAINT events_description_len_chk
      CHECK (description IS NULL OR length(description) <= 5000);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'events_description_en_len_chk') THEN
    ALTER TABLE public.events ADD CONSTRAINT events_description_en_len_chk
      CHECK (description_en IS NULL OR length(description_en) <= 5000);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'events_url_len_chk') THEN
    ALTER TABLE public.events ADD CONSTRAINT events_url_len_chk
      CHECK (
        (source_url  IS NULL OR length(source_url)  <= 2048)
        AND (maps_url   IS NULL OR length(maps_url)   <= 2048)
        AND (ticket_url IS NULL OR length(ticket_url) <= 2048)
        AND (cover_url  IS NULL OR length(cover_url)  <= 2048)
      );
  END IF;
END $$;

-- ── 3. updated_at auto-refresh ─────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.events_set_updated_at()
RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END $$;

DROP TRIGGER IF EXISTS events_updated_at_trg ON public.events;
CREATE TRIGGER events_updated_at_trg
  BEFORE UPDATE ON public.events
  FOR EACH ROW EXECUTE FUNCTION public.events_set_updated_at();

SELECT relname, relrowsecurity FROM pg_class WHERE relname='events';