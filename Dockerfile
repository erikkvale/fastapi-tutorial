FROM python:3.7.3-alpine

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./Pipfile /usr/src/Pipfile
COPY ./Pipfile.lock /usr/src/Pipfile.lock

RUN set -eux \
    && apk add --no-cache --virtual .build-deps build-base \
        libressl-dev libffi-dev gcc musl-dev python3-dev \
    && pip install pipenv \
    && pipenv install --system
