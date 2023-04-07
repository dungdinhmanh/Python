import speech_recognition
import pyttsx3
from datetime import date, datetime
micro=speech_recognition.Recognizer()
spk=pyttsx3.init()
ai=""
date=date.today()
time=datetime.now()
while True:
    with speech_recognition.Microphone() as mic:
        print("Haru: I'm listening")
        audio=micro.listen(mic)
    print('Haru: ...')
    try:
        user=micro.recognize_google(audio)
    except:
        user=''
    print('You: '+user)

    if user=='':
        ai="I can't hear you, please try again!"
    elif 'hello' in user:
        ai='Hello, User'
    elif 'today' in user:
        ai=('Today is: '+ date.strftime("%d - %m - %Y"))
    elif 'time' in user:
        ai=('Current time is: '+ time.strftime("%H hours %M minutes %S seconds"))
    elif 'bye' in user:
        ai='Goodbye, User.'
        print(ai)
        spk.say(ai)
        spk.runAndWait()
        break
    else:
        ai="I can't understand your request, please try again!"
    print(ai)

    spk.say(ai)
    spk.runAndWait()