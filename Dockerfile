FROM python:3
LABEL authors="TetraDigitalGuy Kendal"

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["bash", "-c"]