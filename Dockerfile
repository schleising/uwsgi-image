FROM python:3
ENV PYTHONUNBUFFERED 1

# Make the code directory
RUN mkdir /code
WORKDIR /code

# Install requirements for the covid charts script
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy the start server script
COPY start-server.py /code/

# Add files
#ADD run.sh /run.sh
#ADD entrypoint.sh /entrypoint.sh

#RUN chmod +x /run.sh /entrypoint.sh

#ENTRYPOINT /entrypoint.sh

# Run a command to ensure the container does not exit
#CMD ["sleep", "infinity"]
CMD [ "uwsgi", "--socket", ":8001", "--wsgi-file", "mainsite/wsgi.py" ]
