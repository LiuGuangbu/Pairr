from flask import Flask,render_template,request
import pymongo
import json

app=Flask(__name__)

client=pymongo.MongoClient(host='222.22.91.160',port=27017)
db=client.PairrApp
collection=db.PoemInfo

@app.route('/')
def welcome():
    return "Welcome to BuBu House !"

@app.route('/getall',methods=['Get'])
def get_all_poems():
    mongo_data_list=[]
    poems=collection.find({})
    for poem in poems:
        mongo_data_dict={}
        poemname=poem.get("poemname")
        dynasty=poem.get("dynasty")
        author=poem.get("author")
        content=poem.get("content")
        mongo_data_dict.update({"poemname":poemname})
        mongo_data_dict.update({"dynasty:":dynasty})
        mongo_data_dict.update({"author":author})
        mongo_data_dict.update({"content":content})
        mongo_data_list.append(mongo_data_dict)
    return json.dumps(mongo_data_list,ensure_ascii=False)

def serach(data_list,poem):
    poemname = poem.get("poemname")
    dynasty = poem.get("dynasty")
    author = poem.get("author")
    content = poem.get("content")
    data_dict = {}
    data_dict.update({"poemname": poemname})
    data_dict.update({"dynasty:": dynasty})
    data_dict.update({"author": author})
    data_dict.update({"content": content})
    data_list.append(data_dict)
    return data_list

@app.route('/serach',methods=['GET','POST'])
def find_one():
    if request.method=="GET":
        return render_template('Pairr.html')
    else:
        poemname=request.form.get('poemname')
        author=request.form.get('author')
        dynasty=request.form.get('dynasty')
        lable=request.form.get('lable')
        print(poemname)
        print(author)
        print(dynasty)
        print(lable)
        data_list = []
        if(poemname!=''):
            poem = collection.find_one({'poemname': poemname})
            if(poem==None):
                return "你想多啦！兄弟！"
            # 多条件查询
            # poem = collection.find_one({'poemname': poemname, 'author': author})
            data_list=serach(data_list,poem)
        elif(author!=''):
            poem_cursor=collection.find({'author':author})
            for poem in poem_cursor:
                data_list=serach(data_list,poem)
        elif(dynasty!=''):
            poem_cursor = collection.find({'dynasty': dynasty})
            for poem in poem_cursor:
                data_list = serach(data_list, poem)
        elif(lable!=''):
            poem_cursor=collection.find({'lable':lable})
            for poem in poem_cursor:
                data_list=serach(data_list,poem)
        return json.dumps(data_list, ensure_ascii=False)

if __name__=='__main__':
    print("给我冲鸭！！！")
    app.run()