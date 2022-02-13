# syntax=docker/dockerfile:1

FROM python:3.9.10-alpine3.15

WORKDIR /src

COPY . .

RUN pip install -r requirements.txt --no-cache-dir