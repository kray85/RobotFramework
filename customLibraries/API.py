import requests
from robot.libraries.BuiltIn import BuiltIn


class API:
    def __init__(self):
     pass

    @staticmethod
    def add_book_to_new_library(base_url,book, isbn,aisle,author):
        req_body = {"book":book, "isbn":isbn, "aisle":aisle, "author":author}
        post = requests.post(f'{base_url}/Library/Addbook.php',json=req_body)
        if post.status_code == 200:
            print("Book Successfully added")
        else:
            print(f"Failed to add book, status code: {post.status_code}")

    @staticmethod
    def add_book_to_library_fail(base_url,book=None, isbn=None,aisle=None,author=None):
        if None in (book, isbn, aisle, author):
            print("Failed to add book, missing required parameters")
            return
        req_body = {"book":book, "isbn":isbn, "aisle":aisle, "author":author}
        post = requests.post(f'{base_url}/Library/Addbook.php',json=req_body)
        if post.status_code == 500:
            print(f"Failed to add book, status code: {post.status_code}")
        else:
            print(f"Book Successfully added, status code: {post.status_code}")