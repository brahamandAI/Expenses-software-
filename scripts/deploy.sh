#!/bin/bash
set -e
cd /home/tutorbuddy/htdocs/tutorbuddy.co/Tutorbuddy

echo "Pulling latest code..."
git pull origin main

echo "Installing dependencies..."
npm ci

echo "Building application..."
npm run build

echo "Restarting PM2 process (delete and start fresh)..."
pm2 delete tutorbuddy || true
pm2 start ecosystem.config.js --env production

echo "Deployment completed successfully!"
pm2 status 