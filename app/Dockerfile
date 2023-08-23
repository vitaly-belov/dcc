FROM python:3.11-alpine
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY ./app /app
ENV AUTHOR "Vitaliy S. Belov"
ENV UUID "123e4567-e89b-12d3-a456-426655440000"
CMD ["python3", "/app/main.py"]
EXPOSE 8000
