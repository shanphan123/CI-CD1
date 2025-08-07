# Use an official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project files
COPY . /app/

# Expose port (optional; depends on setup)
EXPOSE 8000

# Run the Django app using Gunicorn
CMD ["gunicorn", "your_django_project.wsgi:application", "--bind", "0.0.0.0:8000"]
