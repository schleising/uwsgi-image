FROM python:3
ENV PYTHONUNBUFFERED 1

# Make the code directory
RUN mkdir /code
WORKDIR /code

# Install requirements for the covid charts script
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Run a command to ensure the container does not exit
CMD [ "uwsgi", "--socket", "schleising_net.sock", "--wsgi-file", "mainsite/wsgi.py", "--chmod-socket=777" ]
