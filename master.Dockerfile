# syntax=docker/dockerfile:1
# FROM docker/compose

# WORKDIR /code
# COPY docker-compose.yml docker-compose.yml
# COPY . .
FROM docker:24.0
# FROM alpine:3.14
# COPY --from=docker/compose-bin:v2.20.2 /docker-compose /usr/bin/compose
# FROM python:3.8

# RUN pip install docker-compose
WORKDIR /code
COPY . .
RUN docker compose version
CMD docker compose up
