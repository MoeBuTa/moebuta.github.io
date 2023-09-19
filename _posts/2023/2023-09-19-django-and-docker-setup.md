---
title: "Django and Docker Setup"
tags: Django
categories: Tech
---

Notes for learning how to set up Django with Docker, constantly updated...

## Using Docker

run all commands through Docker Compose

```console
docker-compose run --rm app sh -c "python manage.py collectstatic"
```
 - `docker-compose` runs a Docker Compose command
 - `run` start a specific container defined in config
 - `--rm` removes the container
 - `app` the name of the service
 - `sh -c` passes in a shell command
 - `" "` command to run inside container

docker-compose.yml
```yml
version: "3.9" # version of docker-compose syntax

services:
  app:
    build:
      context: . # build dockerfile in the current directory
    ports:
      - "8000:8000" # port 8000 in local machine : port 8000 in docker container
    volumes:
      - ./app:/app # sync the code between local project and container
    command: >  # command running in the service
      sh -c "python manage.py runserver 0.0.0.0:8000"
```

## Linting and Testing

