from fastapi import FastAPI
import os

app = FastAPI(title="AWS Production Platform")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/")
def root():
    return {
        "service": "aws-production-platform",
        "environment": os.getenv("ENV", "local")
    }

@app.get("/secret-check")
def secret_check():
    return {
        "secret_present": bool(os.getenv("APP_SECRET_KEY"))
    }

@app.get("/version")
def root():
    return {"version": "v4"}

@app.get("/bug")
def root():
    return {"message": "BUGGY VERSION"}