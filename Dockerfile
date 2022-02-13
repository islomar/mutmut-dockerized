# syntax=docker/dockerfile:1

FROM python:3.9.10-alpine3.15

WORKDIR /code

COPY . .

RUN pip3 install -r requirements.txt -r requirements-dev.txt --no-cache-dir