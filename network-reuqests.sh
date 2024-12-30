#!/bin/bash

# Endpoint to send requests
ENDPOINT="https://dec.chrisaubuchon.com"

# Number of requests per minute
REQUESTS_PER_MINUTE=60

# Interval between each request (in seconds)
INTERVAL=0.1

# Function to make a single request
make_request() {
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" --http1.1 --no-keepalive "$ENDPOINT")
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$TIMESTAMP] Response: $RESPONSE"
}

# Main loop
while true; do
    for ((i=1; i<=REQUESTS_PER_MINUTE; i++)); do
        make_request
        sleep $INTERVAL
    done
done
