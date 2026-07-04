#!/bin/bash

# Default values
USERNAME=${1:-root}
PASSWORD=${2:-root}
SENTI_URL=${3:-https://sentianalyzer.2bvfe9kgwsx9.us-south.codeengine.appdomain.cloud/}

# Ensure trailing slash on sentiment URL
if [[ ! "$SENTI_URL" == */ ]]; then
    SENTI_URL="$SENTI_URL/"
fi

echo "=========================================================="
echo "      Running AI-Graded Submission Test Suite             "
echo "=========================================================="
echo "Using Username: $USERNAME"
echo "Using Password: $PASSWORD"
echo "Using Sentiment Analyzer URL: $SENTI_URL"
echo ""

# 1. getallcarmakes
echo "Testing /djangoapp/get_cars..."
echo 'theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone$ curl -X GET "http://localhost:8000/djangoapp/get_cars"' > getallcarmakes
curl -s -X GET "http://localhost:8000/djangoapp/get_cars" >> getallcarmakes
echo "" >> getallcarmakes

# 2. loginuser
echo "Testing /djangoapp/login..."
echo "theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone$ curl -X POST \"http://localhost:8000/djangoapp/login\" -H \"Content-Type: application/json\" -d '{\"userName\": \"$USERNAME\", \"password\": \"$PASSWORD\"}'" > loginuser
curl -s -X POST "http://localhost:8000/djangoapp/login" \
  -H "Content-Type: application/json" \
  -d "{\"userName\": \"$USERNAME\", \"password\": \"$PASSWORD\"}" >> loginuser
echo "" >> loginuser

# 3. logoutuser
echo "Testing /djangoapp/logout..."
echo 'theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone$ curl -X GET "http://localhost:8000/djangoapp/logout"' > logoutuser
curl -s -X GET "http://localhost:8000/djangoapp/logout" >> logoutuser
echo "" >> logoutuser

# 4. getalldealers
echo "Testing /fetchDealers..."
echo 'theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone$ curl -X GET "http://localhost:3030/fetchDealers"' > getalldealers
curl -s -X GET "http://localhost:3030/fetchDealers" >> getalldealers
echo "" >> getalldealers

# 5. getdealerbyid
echo "Testing /fetchDealer/3..."
echo 'theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone$ curl -X GET "http://localhost:3030/fetchDealer/3"' > getdealerbyid
curl -s -X GET "http://localhost:3030/fetchDealer/3" >> getdealerbyid
echo "" >> getdealerbyid

# 6. getdealersbyState
echo "Testing /fetchDealers/Kansas..."
echo 'theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone$ curl -X GET "http://localhost:3030/fetchDealers/Kansas"' > getdealersbyState
curl -s -X GET "http://localhost:3030/fetchDealers/Kansas" >> getdealersbyState
echo "" >> getdealersbyState

# 7. getdealerreviews
echo "Testing /fetchReviews/dealer/15..."
echo 'theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone$ curl -X GET "http://localhost:3030/fetchReviews/dealer/15"' > getdealerreviews
curl -s -X GET "http://localhost:3030/fetchReviews/dealer/15" >> getdealerreviews
echo "" >> getdealerreviews

# 8. analyzereview
echo "Testing /analyze/Fantastic%20services..."
echo "theia@theiadocker-pixel9softwa:/home/project/xrwvm-fullstack_developer_capstone\$ curl -X GET \"${SENTI_URL}analyze/Fantastic%20services\"" > analyzereview
curl -s -X GET "${SENTI_URL}analyze/Fantastic%20services" >> analyzereview
echo "" >> analyzereview

echo "=========================================================="
echo "      All AI-Graded submission files created!             "
echo "=========================================================="
ls -la getallcarmakes loginuser logoutuser getalldealers getdealerbyid getdealersbyState getdealerreviews analyzereview
