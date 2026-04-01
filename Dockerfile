# Use official Python 3.10 image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend code
COPY backend/ .

# Expose the port Render assigns
EXPOSE $PORT

# Start FastAPI on Render's port
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]
