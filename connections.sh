#!/bin/bash

# Endpoint to send requests
ENDPOINT="https://dec.chrisaubuchon.com"

# Maximum number of connections to keep alive
MAX_CONNECTIONS=150

# Function to make a single request
make_request() {
    curl -s -o /dev/null --http1.1 "$ENDPOINT"
}

# Main loop
while true; do
    # Start up to MAX_CONNECTIONS parallel requests
    for ((i = 1; i <= MAX_CONNECTIONS; i++)); do
        make_request &
    done

    # Wait for all background jobs to complete
    wait

    # Pause for a short duration to control the rate
    sleep 1
done
