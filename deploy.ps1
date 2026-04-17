# Vercel Deployment Script for Immanuel's Portfolio
# Run with: .\deploy.ps1

Write-Host "🚀 Deploying Immanuel's Portfolio to Vercel..." -ForegroundColor Green

# Check if Vercel CLI is installed
if (!(Get-Command vercel -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Vercel CLI not found. Installing..." -ForegroundColor Red
    npm install -g vercel
}

# Check if user is logged in
try {
    $null = vercel whoami 2>$null
    Write-Host "✅ Vercel CLI authenticated" -ForegroundColor Green
} catch {
    Write-Host "🔐 Please login to Vercel:" -ForegroundColor Yellow
    vercel login
}

# Deploy to production
Write-Host "📦 Deploying to production..." -ForegroundColor Blue
vercel --prod

Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host "🌐 Your portfolio is now live on Vercel!" -ForegroundColor Cyan
Write-Host "📋 Don't forget to:" -ForegroundColor Yellow
Write-Host "   - Set environment variables in Vercel dashboard" -ForegroundColor White
Write-Host "   - Update CORS origins in backend/server.js with your domain" -ForegroundColor White
Write-Host "   - Configure custom domain if needed" -ForegroundColor White