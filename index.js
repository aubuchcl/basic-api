// index.js
const express = require('express');
const app = express();

// Root endpoint
app.get('/', (req, res) => {
    res.status(200).send('thank you');
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    if (res.headersSent) {
        return next(err);
    }
    res.status(err.status || 500).send(err.message || 'Internal Server Error');
});

// Start the server
const PORT = 80;
app.listen(PORT, '::', () => {
    console.log(`Server is running on port ${PORT}`);
});
