FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN apt update && apt install -y git
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN  git config --global --add safe.directory /app

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]

EXPOSE 8000
