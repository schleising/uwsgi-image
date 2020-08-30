FROM python:3.8-slim-buster
ENV PYTHONUNBUFFERED 1

# Install the build tools
RUN apt update && apt install -y build-essential

# Make the code directory
RUN mkdir /code
WORKDIR /code

# Set the secret key for Bokeh Server
ENV BOKEH_SECRET_KEY=QNmSO4W4tBfOwnpxTkwTLFBF9yXWyWtdeQKx8IH4DlFv

# Install requirements for the covid charts script
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Run a command to ensure the container does not exit
CMD [ "uwsgi", "--socket", "schleising_net.sock", "--wsgi-file", "mainsite/wsgi.py", "--chmod-socket=777" ]
