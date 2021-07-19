FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apt-get update && apt-get install -y git

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
