FROM public.ecr.aws/docker/library/python:3.9-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils wget

RUN apt-get install -y postgresql-client libpq-dev gcc python3-dev musl-dev libmagic1 \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED 1
COPY ./ /
WORKDIR /
RUN rm -rf .circleci deployment 
RUN pip install poetry==1.5.1
RUN poetry install
RUN pip install gunicorn
RUN pip install uwsgi
RUN pip install awscli
EXPOSE 8000