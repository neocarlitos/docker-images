FROM python:2-slim

RUN apt-get update
RUN apt-get install -y git

RUN pip install grlc

RUN mkdir /grlc
ADD config.docker.ini /grlc/config.ini
ADD gunicorn_config.py /grlc/

RUN git clone https://github.com/candYgene/queries.git /queries

WORKDIR /grlc

CMD gunicorn -c gunicorn_config.py grlc.server:app
