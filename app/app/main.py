from fastapi import FastAPI
from socket import gethostname
from os import getenv
import uvicorn

app = FastAPI()

@app.get("/hostname")
async def get_hostname():
    return gethostname()

@app.get("/author")
async def get_author():
    return getenv('AUTHOR')

@app.get("/id")
async def get_id():
    return getenv('UUID')

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=False, log_level="debug")
