# base image
FROM python:3.8
# working directory
WORKDIR /app
# copying requirements file into my working directory
COPY requirements.txt .
# installing requirement file
RUN pip3 install --no-cache-dir -r requirements.txt
# copying rest of files into my working directory
COPY . .
# command for running my app
CMD ["python", "app.py"]