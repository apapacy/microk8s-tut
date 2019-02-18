FROM python:3-slim
LABEL maintainer="mark.gituma@gmail.com"
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN django-admin startproject mysite /app \
&& echo "\nALLOWED_HOSTS = ['*']\n" >> /app/mysite/settings.py
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]
