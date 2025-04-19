# app.py
import os

def greet(name):
    return f"Hello, {name}!"

if __name__ == "__main__":
    name = os.getenv("NAME", "World")
    print(greet(name))