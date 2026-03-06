#!/bin/bash

# Execute a query asynchronously using the Redshift Data API
# This avoids maintaining persistent database connections.

echo "Submitting query to Redshift..."
aws redshift-data execute-statement \
    --region us-east-1 \
    --db-user awsuser \
    --cluster-identifier redshift-cluster-1 \
    --database dev \
    --sql "select * from users limit 1"

# Note: The command above returns a JSON payload with an "Id" (Query ID).
# In a real automation script, you would parse that ID to retrieve the results.

