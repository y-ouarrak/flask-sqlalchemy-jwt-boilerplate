FROM python:3.8-alpine

EXPOSE 5000

RUN mkdir /app
WORKDIR /app
ADD requirements.txt requirements.txt 
RUN pip3 install -r requirements.txt
ADD . /app

CMD ["flask", "run"]
