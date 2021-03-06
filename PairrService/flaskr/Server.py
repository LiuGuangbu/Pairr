# coding:utf-8
import socket
from flaskr import mongoDB
import json
import logging
from pyhanlp import *


BUFSIZE = 4096  #设置缓冲区大小
tcpServerSocket = socket.socket()  # 1.创建
<<<<<<< HEAD
hostip = '192.168.1.181'
=======
hostip = '192.168.1.131'     #120.24.216.203  手机192.168.123.9    电脑192.168.108.1
>>>>>>> c1cecbab708c0fe87bfc15f160f0d38212a87e12
port = 5000
tcpServerSocket.bind((hostip, port))  # 2.bind
tcpServerSocket.listen(10)  # 监听，设置等待队列最大数目
while True:
    logging.basicConfig(filename=os.path.join(os.getcwd(),'log.txt'),level=logging.DEBUG)
    print("等待连接...")
    clientSocket, addr = tcpServerSocket.accept()  # 3.接收连接请求，并获得ip和端口号
    # while True:
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