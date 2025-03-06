ARG BASE_IMAGE=hub-mirror.c.163.com/library/python:3.9-slim
FROM ${BASE_IMAGE}
WORKDIR /app
COPY . .
COPY .env .env
RUN mkdir -p /app/data && chmod -R 777 /app/data
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5002
ENV PYTHONUNBUFFERED=1
CMD ["gunicorn", "--bind", "0.0.0.0:5002", "--workers", "4", "app:app"]