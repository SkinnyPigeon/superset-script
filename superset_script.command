#!/bin/bash

# Check if Docker Desktop is running
docker info > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Docker Desktop is already running."
else
  # Start Docker Desktop
  open -a Docker
  echo "Starting Docker Desktop..."

  # Wait for Docker Desktop to finish starting
  while true; do
    docker info > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "Docker Desktop is now running."
      break
    fi
    sleep 5
  done
fi

cd $HOME/superset
docker-compose -f docker-compose-non-dev.yml pull
docker-compose -f docker-compose-non-dev.yml up
