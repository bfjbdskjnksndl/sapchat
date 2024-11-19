const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000; // You can change this port if needed

// Serve static files (like HTML, CSS, JS) from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Define a route for the main page
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
