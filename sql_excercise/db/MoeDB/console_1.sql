-- Events — community anime/cosplay events, grouped by region.
-- Schedule is a real date range (starts_at, ends_at). Page derives day-of-week
-- + month labels from starts_at. starts_at NULL => "đang cập nhật" / TBA.

CREATE TABLE IF NOT EXISTS public.events (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Content (bilingual). *_en is optional; fall back to the vi value.
  name            VARCHAR(200) NOT NULL,
  name_en         VARCHAR(200),
  description     TEXT,
  description_en  TEXT,

  -- Grouping / filtering
  region          VARCHAR(20) NOT NULL,        -- 'north' | 'south' | 'central'

  -- Schedule. starts_at NULL => TBA. ends_at optional (multi-day events).
  starts_at       TIMESTAMPTZ,
  ends_at         TIMESTAMPTZ,

  -- Location + Google Maps routing
  location        VARCHAR(300),                -- display address (vi)
  location_en     VARCHAR(300),
  address         TEXT,                        -- full routable address for Maps
  place_id        VARCHAR(200),                -- Google Maps Place ID — canonical routing target
  latitude        NUMERIC(9,6),                -- -90..90
  longitude       NUMERIC(9,6),                -- -180..180
  maps_url        TEXT,                        -- pre-built Google Maps link (optional override)

  -- Ticketing. is_paid: true=paid, false=free, NULL=TBA. Label derived in i18n.
  is_paid         BOOLEAN,
  ticket_url      TEXT,

  -- Media
  cover_url       TEXT,

  -- Lifecycle
  status          VARCHAR(20) NOT NULL DEFAULT 'published',  -- 'draft' | 'published' | 'cancelled'
  is_featured     BOOLEAN NOT NULL DEFAULT false,
  sort_order      INTEGER NOT NULL DEFAULT 0,

  created_by      UUID REFERENCES public.users(id) ON DELETE SET NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT events_region_chk  CHECK (region IN ('north', 'south', 'central')),
  CONSTRAINT events_status_chk  CHECK (status IN ('draft', 'published', 'cancelled')),
  CONSTRAINT events_range_chk   CHECK (ends_at IS NULL OR starts_at IS NULL OR ends_at >= starts_at),
  CONSTRAINT events_lat_chk     CHECK (latitude IS NULL OR (latitude BETWEEN -90 AND 90)),
  CONSTRAINT events_lng_chk     CHECK (longitude IS NULL OR (longitude BETWEEN -180 AND 180))
);

-- Listing is grouped/ordered by region -> month (derived from starts_at) -> sort_order -> starts_at.
-- Functional index on EXTRACT(MONTH FROM starts_at) keeps the page's region+month query cheap.
CREATE INDEX IF NOT EXISTS idx_events_region_month
  ON public.events (region, EXTRACT(MONTH FROM (starts_at AT TIME ZONE '')), sort_order)
  WHERE status = 'published' AND starts_at IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_events_starts_at ON public.events (starts_at);
CREATE INDEX IF NOT EXISTS idx_events_status    ON public.events (status);

-- Table is read through the Workers API only; block direct client access.
ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

-- Seed: 16 events from the original hardcoded list. Real date ranges — day-of-week
-- and month labels are derived from starts_at at read time. TBA rows have NULL.
-- All timestamps are local VN (UTC+7) — store as TIMESTAMPTZ; the server returns
-- the instant and the page renders in the user's locale.

INSERT INTO public.events
  (name, region, starts_at, ends_at, location, location_en, is_paid, sort_order)
VALUES
  -- ===== NORTH =====
  ('YOSAKOI SUMMER FESTIVAL', 'north',
   '2026-05-10 10:00:00+07', '2026-05-10 18:00:00+07',
   'Phố đi bộ Pont de Long Biên, Hà Nội', 'Pont de Long Bien walking street, Hanoi',
   false, 0),

  ('Anime Collection Tour season 19: Cosplay Summer Festival', 'north',
   '2026-05-24 09:00:00+07', '2026-05-24 18:00:00+07',
   'Công viên Thống Nhất, đường Trần Nhân Tông, p.Hai Bà Trưng, tp.Hà Nội',
   'Thong Nhat Park, Tran Nhan Tong St., Hai Ba Trung, Hanoi',
   false, 1),

  ('Cosplay Showcase Series', 'north',
   '2026-05-31 10:00:00+07', '2026-05-31 18:00:00+07',
   'TTTM Diamond Place - 25 Lê Văn Lưng', 'Diamond Place Mall - 25 Le Van Luong',
   false, 2),

  ('Fantasia: Voice of The Sky', 'north',
   NULL, NULL,
   'Đang cập nhật', 'To be updated',
   NULL, 0),

  ('Ambedo Fiesta - Pool Party', 'north',
   NULL, NULL,
   'Đang cập nhật', 'To be updated',
   true, 0),

  ('Artist Day ss19', 'north',
   '2026-07-26 10:00:00+07', '2026-07-26 17:00:00+07',
   'Tầng 3, TTTM Tasco Mall - số 7 & 9 Nguyễn Văn Linh, P. Việt Hưng, Hà Nội',
   'Floor 3, Tasco Mall - 7 & 9 Nguyen Van Linh, Viet Hung, Hanoi',
   false, 1),

  ('Cosplay Showcase Series', 'north',
   '2026-08-30 10:00:00+07', '2026-08-30 18:00:00+07',
   'TTTM Diamond Place - 25 Lê Văn Lưng', 'Diamond Place Mall - 25 Le Van Luong',
   false, 0),

  ('Fantasia Halloween Festival', 'north',
   NULL, NULL,
   'Đang cập nhật', 'To be updated',
   NULL, 0),

  ('AMBEDO FIESTA SS8', 'north',
   NULL, NULL,
   'Đang cập nhật', 'To be updated',
   NULL, 0),

  ('Cosplay Showcase Series', 'north',
   '2026-12-13 10:00:00+07', '2026-12-13 18:00:00+07',
   'TTTM Diamond Place - 25 Lê Văn Lưng', 'Diamond Place Mall - 25 Le Van Luong',
   false, 0),

  ('Ambedo Fiesta season 9', 'north',
   NULL, NULL,
   'Đang cập nhật', 'To be updated',
   true, 1),

  ('Rantantaun', 'north',
   NULL, NULL,
   'Đang cập nhật', 'To be updated',
   NULL, 2),

  -- ===== SOUTH =====
  ('Lễ Hội Mùa Xuân - Matsuri Runway', 'south',
   '2026-05-03 09:00:00+07', '2026-05-03 18:00:00+07',
   'Sky Expo Center, TP.HCM', 'Sky Expo Center, Ho Chi Minh City',
   true, 0),

  ('Artist Day vol 18', 'south',
   '2026-06-14 10:00:00+07', '2026-06-14 17:00:00+07',
   'Bãi xe P6 - Tháp ô tô | TTTM AEON TÂN PHÚ CELADON: 30 Tân Thắng, Tân Sơn Nhì, Tp.HCM',
   'P6 parking - AEON Tan Phu Celadon: 30 Tan Thang, Tan Son Nhi, Ho Chi Minh City',
   false, 0),

  ('HIMA FIESTA 05', 'south',
   '2026-07-05 10:00:00+07', '2026-07-05 18:00:00+07',
   'Vincom Plaza Biên Hòa', 'Vincom Plaza Bien Hoa',
   false, 0),

  ('Hobby Hoziron: Singularity', 'south',
   '2026-07-17 09:00:00+07', '2026-07-19 21:00:00+07',
   'Đang cập nhật', 'To be updated',
   true, 1);

CREATE OR REPLACE FUNCTION public.month_of_vn(ts timestamptz)
RETURNS integer
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT EXTRACT(MONTH FROM ts AT TIME ZONE 'Asia/Ho_Chi_Minh')::integer;
$$;

CREATE INDEX IF NOT EXISTS idx_events_region_month
ON public.events (region, public.month_of_vn(starts_at), sort_order)
WHERE status = 'published' AND starts_at IS NOT NULL;

ALTER TABLE public.events
  ADD COLUMN IF NOT EXISTS source_url TEXT;
