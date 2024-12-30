const express = require('express');
const app = express();

// Root endpoint
app.get('/', (req, res) => {
    res.status(200).send('thank you');
});

// Keep-alive endpoint
app.get('/keepalive', (req, res) => {
    // Set timeout to 2 minutes
    const keepAliveDuration = 2 * 60 * 1000; // 2 minutes in milliseconds

    // Ensure the response stays alive by sending headers but delaying the response
    res.set({
        'Content-Type': 'text/plain',
        'Connection': 'keep-alive',
    });

    console.log('Keeping connection alive for 2 minutes...');
    
    setTimeout(() => {
        res.status(200).send('Connection kept alive for 2 minutes');
        console.log('Connection closed after 2 minutes');
    }, keepAliveDuration);
});

// Error handling middleware
app.use((err, req, res, next) => {
    if (err) {
        res.status(err.status || 500).send(err.message || 'Internal Server Error');
    }
});

const PORT = 80;
app.listen(PORT, '::', () => {
    console.log(`Server is running on port ${PORT}`);
});
