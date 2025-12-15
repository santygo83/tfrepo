
// Simple Express server for color control
const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// In-memory state for current color
let currentColor = '#3498db'; // default blue

// Serve static files from public
app.use(express.static(path.join(__dirname, 'public')));

// API to get current color
app.get('/api/color', (req, res) => {
  res.json({ color: currentColor });
});

// API to set color
app.post('/api/color', (req, res) => {
  const { color } = req.body || {};
  if (typeof color !== 'string' || !/^#?[0-9a-fA-F]{3}([0-9a-fA-F]{3})?$/.test(color)) {
    return res.status(400).json({ error: 'Invalid color. Use hex like #ff6600' });
  }
  // Normalize to #xxxxxx
  currentColor = color.startsWith('#') ? color : `#${color}`;
  res.json({ ok: true, color: currentColor });
});

// Fallback to index.html for root
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
   console.log(`Colorify app listening on port ${PORT}`);
