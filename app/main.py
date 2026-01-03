from fastapi import FastAPI
import os

from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(title="AWS Production Platform")

# -----------------------------
# Prometheus Instrumentation
# -----------------------------
Instrumentator(
    should_group_status_codes=False,
    should_ignore_untemplated=True,
    should_respect_env_var=True,
    excluded_handlers=["/metrics"]
).instrument(app).expose(app)

# -----------------------------
# Routes
# -----------------------------
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
def version():
    return {"version": "v5"}

# @app.get("/bug")
# def bug():
#     return {"message": "BUGGY VERSION"}


