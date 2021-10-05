import pandas as pd
import simplejson
from flask import Flask
from flask_pymongo import MongoClient, PyMongo
import uuid


# config

MongoURL = "mongodb+srv://JayBhakhar:jay456789@book-cluster.oec1c.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"
app = Flask(__name__)
app.config["MONGO_URI"] = MongoURL
mongo = PyMongo(app)
supplierCollection = MongoClient(MongoURL).datadase.supplier
bookCollection = MongoClient(MongoURL).datadase.book
app.config['SECRET_KEY'] = 'secret'

# load file
Book = pd.read_excel('C:/Users/Jay Bhakhar/Desktop/Книги.xlsx')
Supplier = pd.read_excel('C:/Users/Jay Bhakhar/Desktop/Поставщики.xlsx')

# fill empty fill to None (Convert np.nan to None)
dfBooks = Book.where(pd.notnull(Book), None)
dfSuppliers = Supplier.where(pd.notnull(Supplier), None)

# convert to dict
_listBooks = dfBooks.to_dict(orient='records')
_listSuppliers = dfSuppliers.to_dict(orient='records')


# for add book to database
# for book in _listBooks:
#     book.update({'_id': str(uuid.uuid4())})
#     bookCollection.insert_one(book)
    # print(book)

# for add supplier to database
# for supplier in _listSuppliers:
#     supplier.update({'_id': str(uuid.uuid4())})
#     supplierCollection.insert_one(supplier)
#     print(supplier)

print('finish')
    


# from models.book_model import Book
# from fastapi import FastAPI
# import motor.motor_asyncio
# import os
# # from pymongo import MongoClient

# app = FastAPI()
# client = motor.motor_asyncio.AsyncIOMotorClient(os.environ["MONGODB_URL"])
# # MongoURL = "mongodb+srv://JayBhakhar:jay456789@book-cluster.oec1c.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"
# # client = MongoClient()
# # db = client['database']
# # books = client.database.book

# @app.get("/")
# async def index():
#     output = []
#     for book in db.book.find():
#         # output.append(Book)
#         output.append(book)
#     print('yes')
#     print(output)    
#     return output
