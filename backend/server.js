const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middleware
app.use(cors({
  origin: process.env.NODE_ENV === 'production'
    ? ['https://your-vercel-domain.vercel.app'] // Replace with your actual Vercel domain
    : ['http://localhost:3000', 'http://localhost:5173', 'http://localhost:5000'],
  credentials: true
}));
app.use(express.json());
app.use(express.static('../igbanna'));

// Routes
app.get('/api/health', (req, res) => {
  res.json({ status: 'Backend is running' });
});

// Contact form endpoint
app.post('/api/contact', (req, res) => {
  const { name, email, message } = req.body;

  // Validation
  if (!name || !email || !message) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  // TODO: Add email sending logic with nodemailer
  console.log('Contact form data:', { name, email, message });

  res.json({
    success: true,
    message: 'Message received! I will get back to you soon.'
  });
});

// Portfolio data endpoint
app.get('/api/portfolio', (req, res) => {
  res.json({
    name: 'Immanuel Igbana',
    title: 'UI/UX Designer',
    experience: '2+ years',
    projects: 10,
    clients: 12,
    skills: [
      'Figma', 'Adobe XD', 'Sketch', 'ProtoPie',
      'User Research', 'Wireframing', 'Prototyping',
      'Design Systems', 'HTML/CSS/JS', 'After Effects'
    ]
  });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({ error: 'Route not found' });
});

// Export for Vercel serverless functions
module.exports = app;

// Local development
if (require.main === module) {
  const PORT = process.env.PORT || 5000;
  app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
  });
}
