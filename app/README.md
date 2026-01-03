Commands used to run on AWS (for testing purpose):
sudo apt install python3
sudo apt install uvicorn
sudo apt install python3-fastapi

in the root directory:
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
