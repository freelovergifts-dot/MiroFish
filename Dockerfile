# Use Python 3.10 slim image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend source code
COPY backend/ .

# Expose the Render port
EXPOSE $PORT

# Start FastAPI backend on Render port
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]
