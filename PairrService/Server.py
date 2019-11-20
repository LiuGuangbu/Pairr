import socket
import mongoDB
import json

BUFSIZE = 4096  #设置缓冲区大小
tcpServerSocket = socket.socket()  # 1.创建
hostip = '192.168.1.148'
port = 5000
tcpServerSocket.bind((hostip, port))  # 2.bind
tcpServerSocket.listen(5)  # 监听，设置等待队列最大数目
while True:
    print("等待连接...")
    clientSocket, addr = tcpServerSocket.accept()  # 3.接收连接请求，并获得ip和端口号
    while True:
        data = clientSocket.recv(BUFSIZE).decode()  # 4.接收数据
        data_list = []
        poem_cursor = mongoDB.collection.find({'lable': data})
        for poem in poem_cursor:
            data_list = mongoDB.serach(data_list, poem)
        print(data)
        if not data:
            break
        s = json.dumps(data_list,ensure_ascii=False)
        print(s)
        clientSocket.send(s.encode())  # 5.发送数据

    clientSocket.close()