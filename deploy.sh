#!/bin/bash

# Vercel Deployment Script for Immanuel's Portfolio

echo "🚀 Deploying Immanuel's Portfolio to Vercel..."

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI not found. Installing..."
    npm install -g vercel
fi

# Check if user is logged in
if ! vercel whoami &> /dev/null; then
    echo "🔐 Please login to Vercel:"
    vercel login
fi

# Deploy to production
echo "📦 Deploying to production..."
vercel --prod

echo "✅ Deployment complete!"
echo "🌐 Your portfolio is now live on Vercel!"
echo "📋 Don't forget to:"
echo "   - Set environment variables in Vercel dashboard"
echo "   - Update CORS origins in backend/server.js with your domain"
echo "   - Configure custom domain if needed"