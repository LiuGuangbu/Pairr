import xlrd
import pymongo


client=pymongo.MongoClient(host='222.22.91.160',port=27017)
db=client.PairrApp
collection=db.PoemInfo

"""python提取Excel数据"""
data=xlrd.open_workbook('月亮.xlsx')
table=data.sheets()[0]
nrows=table.nrows
print(nrows)
ncols=table.ncols
print(ncols)
i=0

while i<nrows:
    poem={}
    poem['poemname']=table.cell(i,0).value
    poem['dynasty'] = table.cell(i, 1).value
    poem['author'] = table.cell(i, 2).value
    poem['content']=table.cell(i,3).value
    i+=1
    print(poem)
    # collection.insert(poem)
