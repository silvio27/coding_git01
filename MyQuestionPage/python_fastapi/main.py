#!/usr/bin/python3
# -*- coding: utf-8 -*-
# @Time    : 2020/9/19 12:30
# @Author  : Silvio27
# @Email   : silviosun@outlook.com
# @File    : main.py
# @Software: PyCharm

# -*- coding: UTF-8 -*-
from fastapi import FastAPI, Body, Form
from starlette.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from fastapi.responses import FileResponse
from typing import Optional
import uvicorn
import os
import pymysql

app = FastAPI()
app.add_middleware(  # 添加中间件
    CORSMiddleware,  # CORS中间件类
    allow_origins=["*"],  # 允许起源
    allow_credentials=True,  # 允许凭据
    allow_methods=["*"],  # 允许方法
    allow_headers=["*"],  # 允许头部
)
global baseurl

baseurl = '/Users/silvio/Downloads/Potato Desktop'


@app.get("/")
async def main():
    b = {"message": "这一段文字来自后端发送", 'name': 'silvio',
         'pic_url': 'http://10.0.0.6:9999/pic/1.jpeg'}
    return b


# 查看本地图片
@app.get("/src/{n}")
async def aa(n):
    a = FileResponse(f'./src/{n}')
    print(a)
    return a


# 查看图片 待测试
@app.get("/timeline1")
async def regist():
    a = []
    dir = 'http://10.0.0.6:9999/src/'
    baseurl = './src'
    # './src'
    fileList = os.listdir(baseurl)
    print(fileList)

    # print(fileList)
    for i in fileList:
        if i[0] != '.':
            a.append({'name': i, 'url': dir + i})

    return a


# ********************************************
# 根据前端请求返回后端页面，1次不要返回太多，有待考证
@app.get('/get_all_q')
async def get_all_q(page: Optional[int] = 1, size: Optional[int] = 20):
    page = (page - 1) * size
    sql_insert = f'''
        select q.*,max(update_time),count(q_id) 
        from myquestions q 
        left join myanswers a on q.id=a.q_id 
        group by q.id 
        order by q.id
        limit {page},{size}
        ;'''
    data = connect_db(sql_insert)
    data = [list(i) for i in data]
    data1 = []
    for n in data:
        if n[6]:
            datetime = n[6].strftime("%Y-%m-%d %H:%M:%S")
        else:
            datetime = ''
        data1.append(
            {'id': n[0],
             'question_title': n[1],
             'create_time': n[2].strftime("%Y-%m-%d"),
             'source': n[3],
             'is_archived': n[4],
             'weight': n[5],
             'update_time': datetime,
             'frequency': n[7]
             }
        )
    return data1


# ********************************************


@app.get('/get_all_q_c')
async def get_all_q_c():
    sql = '''select count(*) from myquestions;'''
    data = connect_db(sql)
    print(data)
    print(type(data))
    data = int(data[0][0])
    return data


class new_q(BaseModel):
    content: str
    source: Optional[str] = None


# 添加一个新的问题
@app.post('/add_new_question')
async def add_new_q(q: new_q):
    tablename = 'myquestions'
    sql_insert = f'''insert into {tablename} values (null,"{q.content}", current_timestamp(),"{q.source}",null,null);'''
    data = connect_db(sql_insert)
    print(data)
    return data


# 删除一个问题
def delete_questions(id):
    tablename = 'myquestions'
    sql_delete = f'''delete from {tablename} where id={id}'''
    data = connect_db(sql_delete)
    print(data)


# 更新一个问题需要问题id
def update_questions(q, id):
    tablename = 'myquestions'
    sql_delete = f'''update {tablename}  set question_title = "{q}" where id={id}'''
    data = connect_db(sql_delete)
    print(data)


# TODO 修改成post
class answer(BaseModel):
    q_id: int
    author: Optional[str] = None
    answer: str


@app.post('/add_new_answer')
async def add_new_a(a: answer):
    sql_add_n_a = f'''
        insert into myanswers values (null,{a.q_id},current_timestamp(),null,"{a.answer}")
    '''
    data = connect_db(sql_add_n_a)
    print('add new answer ' + a.answer)
    print(data)
    return {'return': 'done'}


@app.get('/get_answer/{q_id}')
async def get_a(q_id):
    sql_get_answer = f'''
        select * from myanswers where q_id={q_id} order by update_time desc;
    '''
    data = connect_db(sql_get_answer)
    data1 = []
    for n in data:
        data1.append({
            'a_id': n[0],
            'q_id': n[1],
            'update_time': n[2].strftime("%Y-%m-%d %H:%M:%S"),
            'author': n[3],
            'answer': n[4]
        })
    return data1


# TODO search func
# def search_all_tables():
#     # use union to search all tables,
#     # select * from a where item like '%q%' union select b ...
#     pass

# 连接数据库
def connect_db(sql):
    cnx = pymysql.connect(user='root',
                          password='Mysql9127Fir',
                          host='localhost',
                          database='fastapi')
    cursor = cnx.cursor()
    cursor.execute(sql)
    cnx.commit()
    asw = cursor.fetchall()
    cursor.close()
    cnx.close()
    return asw


# Demo BaseModel & Optional
class post_data(BaseModel):
    id: int  # Optional[int] = None
    title: Optional[str] = None


@app.post('/post')
async def postest(item: post_data):
    print(item)
    return item


if __name__ == '__main__':
    uvicorn.run(app='main:app', host="0.0.0.0", port=9999, reload=True, debug=True)
    # add_new_question('什么是真实,什么是梦境？')
    # delete_questions(11)
    # get_all_questions()
    # add_new_answer('体验生活',1)
