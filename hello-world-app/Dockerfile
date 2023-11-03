FROM python:3.12.0-alpine

WORKDIR /

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8088

CMD [ "python",  "./app.py" ]