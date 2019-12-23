import xlrd
import pymongo

# 222.22.91.160
client=pymongo.MongoClient(host='39.97.250.70',port=27017)
db=client.Pairr
collection=db.PoemInfo

"""python提取Excel数据"""
data=xlrd.open_workbook(r'D:\Flask\数据上传\2019-12-22text.xlsx')
table=data.sheets()[0]
nrows=table.nrows
print(nrows)
ncols=table.ncols
print(ncols)
i=1

while i<nrows:
    poem={}
    poem['poemname']=table.cell(i,0).value
    poem['dynasty'] = table.cell(i, 1).value
    poem['author'] = table.cell(i, 2).value
    poem['content']=table.cell(i,3).value
    poem['label']=table.cell(i,4).value
    poem['translation']=table.cell(i,5).value
    poem['annotation']=table.cell(i,6).value
    poem['appreciation']=table.cell(i,7).value
    i+=1
    print(poem)
    collection.insert_one(poem)
    print("插入成功！")
