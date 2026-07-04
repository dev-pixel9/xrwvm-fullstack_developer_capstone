#!/bin/bash
cd /home/project/xrwvm-fullstack_developer_capstone/server/database
docker build . -t nodeapp
docker compose up || docker-compose up
