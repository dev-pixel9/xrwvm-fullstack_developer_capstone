#!/bin/bash

# Exit on error
set -e

echo "=========================================================="
echo "      Setting up Capstone Django Dev Environment          "
echo "=========================================================="
echo ""

# Ensure we are in the server directory
cd /home/project/xrwvm-fullstack_developer_capstone/server

# 1. Virtual Environment Setup
if [ ! -d "djangoenv" ]; then
  echo "Creating virtual environment 'djangoenv'..."
  pip install virtualenv
  virtualenv djangoenv
fi

echo "Activating virtual environment..."
source djangoenv/bin/activate

# 2. Install dependencies
echo "Installing python packages from requirements.txt..."
python3 -m pip install -U -r requirements.txt

# 3. Database Migrations
echo "Running Django migrations..."
python3 manage.py makemigrations djangoapp
python3 manage.py makemigrations
python3 manage.py migrate --run-syncdb

echo ""
echo "=========================================================="
echo "                  SETUP COMPLETE                          "
echo "=========================================================="
echo "To start your Django development server, run:"
echo "  source djangoenv/bin/activate"
echo "  python3 manage.py runserver"
echo "=========================================================="
