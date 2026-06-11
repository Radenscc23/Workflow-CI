FROM python:3.10-slim

WORKDIR /app

RUN pip install --no-cache-dir \
    mlflow==2.19.0 \
    pandas \
    numpy \
    scikit-learn

COPY model/ /app/model/

EXPOSE 8080

CMD ["mlflow", "models", "serve", \
     "--model-uri", "/app/model", \
     "--host", "0.0.0.0", \
     "--port", "8080", \
     "--no-conda"]
