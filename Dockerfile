# Use official Python 3.10 slim image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy dependencies and install
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend code
COPY backend/ .

# Expose Render's dynamic port
EXPOSE $PORT

# Run FastAPI on Render's port
CMD ["uvicorn", "run:app", "--host", "0.0.0.0", "--port", "$PORT"]
