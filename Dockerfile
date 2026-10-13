# базовый образ
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ARG VERSION=dev
RUN echo "${VERSION}" > /app/VERSION

# порт приложения внутри
ENV APP_PORT=5011
ENV PYTHONDONTWRITEBYTECODE=1
ENV MARKER=datalab

EXPOSE 5011

CMD ["python", "app.py"]

