# Immanuel's Portfolio - Full Stack Setup

This project contains both a Node.js backend API and a frontend portfolio website, configured for Vercel deployment.

## Project Structure

```
imma_portfolio/
├── igbanna/              # Frontend (HTML/CSS/JS)
│   └── index.html
├── backend/              # Node.js backend
│   ├── server.js
│   ├── package.json
│   └── .env
├── vercel.json           # Vercel configuration
├── package.json          # Root package.json for Vercel
├── .vercelignore         # Files to exclude from deployment
└── README.md
```

## 🚀 Vercel Deployment

### Quick Deploy

1. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel:**
   ```bash
   vercel login
   ```

3. **Deploy:**
   ```bash
   vercel --prod
   ```

### Manual Deploy

1. **Push to GitHub** (recommended for continuous deployment)
2. **Connect to Vercel:**
   - Go to [vercel.com](https://vercel.com)
   - Import your GitHub repository
   - Vercel will automatically detect the configuration

### Environment Variables

Set these in your Vercel dashboard (Project Settings > Environment Variables):

```
NODE_ENV=production
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password
```

### Custom Domain

After deployment, update the CORS origin in `backend/server.js`:
```javascript
origin: ['https://yourdomain.com']
```

## Local Development

### Backend Setup

1. **Install dependencies:**
   ```bash
   cd backend
   npm install
   ```

2. **Configure environment variables:**
   - Edit `backend/.env` with your settings
   - Default PORT: 5000

3. **Start the backend server:**
   ```bash
   npm start          # Production mode
   npm run dev        # Development mode (with nodemon)
   ```

   The server will run on `http://localhost:5000`

### Frontend Setup

1. **Open the frontend:**
   - Open `igbanna/index.html` in a web browser
   - Or serve with a local server:
     ```bash
     cd igbanna
     npx http-server
     ```

### Run Both (Development)

```bash
npm run dev
```

This starts both backend and frontend concurrently.

## API Endpoints

### Health Check
```
GET /api/health
Response: { status: "Backend is running" }
```

### Get Portfolio Data
```
GET /api/portfolio
Response: { name, title, experience, projects, clients, skills }
```

### Submit Contact Form
```
POST /api/contact
Body: { name, email, message }
Response: { success: true, message: "..." }
```

## Features Implemented

✅ **Full-Stack Architecture**
- Node.js/Express backend API
- Static HTML/CSS/JS frontend
- RESTful API endpoints

✅ **Vercel Deployment Ready**
- Serverless function configuration
- Static file serving
- Environment variable support
- CORS configuration for production

✅ **Frontend-Backend Integration**
- API health checks on page load
- Contact form submission
- Portfolio data fetching
- Automatic localhost/production API switching

✅ **Development Tools**
- Concurrent development server
- Hot reload with nodemon
- CORS for local development

## Next Steps

1. **Project Links:** Update project URLs in `igbanna/index.html` to link to your actual case studies, Behance, or Dribbble pages
2. **Email Integration:** Configure nodemailer in `backend/server.js` for contact form
3. **Database:** Add MongoDB/PostgreSQL for dynamic content
4. **Authentication:** Add user authentication if needed
5. **Analytics:** Integrate Google Analytics or Vercel Analytics
6. **Custom Domain:** Set up your custom domain on Vercel

## Environment Variables

Create `.env` file in backend folder:

```env
PORT=5000
NODE_ENV=development

# Email configuration (for contact form)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password
```

## Troubleshooting

- **CORS Issues:** Update allowed origins in `backend/server.js`
- **API Not Working:** Check Vercel function logs in dashboard
- **Static Files:** Ensure paths are correct in `vercel.json`
- **Environment Variables:** Set in Vercel dashboard for production
