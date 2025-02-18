FROM ubuntu:16.04

LABEL org.opencontainers.image.authors="paulkim@hmc.edu"
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev && \
    pip3 install  --upgrade pip==20.0.2

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
