# set the default working environment as python with respective version
FROM python:3.11

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# make present working directory as hello-app
WORKDIR /hello-app

# copying requirements.txt file to hello-app directory
COPY requirements.txt /hello-app/

# Installing dependencies
RUN pip install -r requirements.txt

# Install Gunicorn
RUN pip install gunicorn

# copy the all current directory to hello-app folder 
COPY . /hello-app/


EXPOSE 8000

# Run the gunicorn wsgi server to run django hello-world app
CMD ["gunicorn", "hello_world.wsgi:application", "--bind", "0.0.0.0:8000"]