FROM alpine
WORKDIR /usr/src/app
# Copy package.json and package-lock.json to the container
COPY requirements.txt ./
# Install application dependencies
RUN apk add --no-cache python3
RUN apk add --no-cache py3-pip

RUN pip install -r requirements.txt --break-system-packages
# Copy the rest of the application code
COPY ./ ./

# Specify the command to run your application
CMD ["python3", "app.py"]
