FROM python:3.9-slim
# Set the working directory inside the container
WORKDIR /app
# Copy the Python script into the container
COPY script.py .
# Copy the data files into the container
COPY data/ /home/data/
# Install any necessary packages (if required)
# RUN pip install some-package
# Set the entry point to run the script when the container starts
CMD ["python", "script.py"]