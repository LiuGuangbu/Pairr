# coding:utf-8
from flask import Flask
import pymongo
import json

app = Flask(__name__)

client=pymongo.MongoClient(host='39.97.250.70',port=27017)
db=client.Pairr
collection=db.PoemInfo

def serach(data_list,poem):
    poemname = poem.get("poemname")
    dynasty = poem.get("dynasty")
    author = poem.get("author")
    content = poem.get("content")
    data_dict = {}
    data_dict.update({"poemname": poemname})
    data_dict.update({"dynasty": dynasty})
    data_dict.update({"author": author})
    data_dict.update({"content": content})
    data_list.append(data_dict)
    return data_list

@app.route('/')
def hello_world():
    return 'Pairr'

@app.route('/findall',methods=['GET'])
def findall():
    poem_list=[]
    poems=collection.find({})
    for poem in poems:
        poem_list=serach(poem_list,poem)
    return json.dumps(poem_list,ensure_ascii=False)

@app.route('/find/<label>')
def findone(label):
    poem_list = []
    poems=collection.find({'label':label})
    for poem in poems:
        poem_list=serach(poem_list,poem)
    if poem_list==[]:
        return "小编这里没有呢，请主人稍等片刻！"
    return json.dumps(poem_list,ensure_ascii=False)


if __name__ == '__main__':
    app.run()
