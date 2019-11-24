import socket
from flaskr import mongoDB
import json

from pyhanlp import *

BUFSIZE = 4096  #设置缓冲区大小
tcpServerSocket = socket.socket()  # 1.创建
hostip = '192.168.1.148'
port = 5000
tcpServerSocket.bind((hostip, port))  # 2.bind
tcpServerSocket.listen(10)  # 监听，设置等待队列最大数目
while True:
    print("等待连接...")
    clientSocket, addr = tcpServerSocket.accept()  # 3.接收连接请求，并获得ip和端口号
    while True:
        data = clientSocket.recv(BUFSIZE).decode()  # 4.接收数据
        print('接收值:',data)
        # 关键词提取
        list=HanLP.extractKeyword(data, 20)
        print("分词结果：",list)
        data_list = []
        for list_data in list:
            poem_cursor = mongoDB.collection.find({'label': list_data})
            for poem in poem_cursor:
                data_list = mongoDB.serach(data_list, poem)
        if not data:
            break
        s = json.dumps(data_list,ensure_ascii=False)
        print('返回值：',s)
        clientSocket.send(s.encode())  # 5.发送数据
        print('重新建立连接....')

    clientSocket.close()