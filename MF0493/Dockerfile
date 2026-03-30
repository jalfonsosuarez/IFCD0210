FROM python:3.11-slim

WORKDIR /app

COPY requeriments.txt requeriments.txt

RUN pip install -r requeriments.txt

COPY . .

CMD ["python","app.py"]
