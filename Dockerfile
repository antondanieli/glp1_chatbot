FROM python:3.10-slim

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Train the model on deploy
RUN rasa train

# Expose the port
EXPOSE 10000

# Start the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "10000"]
