# Python dependency base image

This standalone directory contains Python 3.14.2 and a snapshot of the
application's Python dependencies. It contains no application source, Node,
Nginx or database server. It does not install PostgreSQL command-line backup
tools; an application image that runs backups must add those separately.

Build from this directory on a Linux amd64 server:

```sh
sudo docker build --progress=plain -t realrag-python-base:py314-v1 .
sudo docker run --rm realrag-python-base:py314-v1 python -m pip check
```

To use a different package index:

```sh
sudo docker build --progress=plain \
  --build-arg PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple/ \
  -t realrag-python-base:py314-v1 .
```

If Docker Hub is inaccessible, add this build argument:

```text
--build-arg PYTHON_BASE_IMAGE=docker.m.daocloud.io/library/python:3.14.2-slim-bookworm
```

When backend/requirements.txt changes, refresh this copy from the project root
and rebuild with a new tag:

```sh
cp backend/requirements.txt deploy/python-base/requirements.txt
```

This build does not upload images or run application integration tests. To use
the image in cloud builds later, push it to an accessible registry and update
the application Dockerfile to build FROM that registry image.
