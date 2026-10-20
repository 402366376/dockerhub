ARG PYTHON_BASE_IMAGE=python:3.14.2-slim-bookworm
FROM ${PYTHON_BASE_IMAGE}

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app

# This directory is a standalone build context; no application code is needed.
COPY requirements.txt /opt/realrag/requirements.txt
ARG PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/
RUN python -m pip install --no-cache-dir --index-url "$PIP_INDEX_URL" \
        --timeout 30 --retries 3 -r /opt/realrag/requirements.txt \
    && python -m pip check

CMD ["python"]
