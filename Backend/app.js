const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const path = require('path');

// Load environment variables from .env file, where API keys and passwords are configured
require('dotenv').config({ path: `.env.${process.env.NODE_ENV}` });

// Create Express server
const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(morgan('dev'));
app.use(cors({ origin: '*' }));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/', require('./routes/index.route.js'));
app.use('/report', require('./routes/report.route.js'));

// Port assignment
const server = app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
});

// Catch 404
app.use(require('./middlewares/notFound'));

module.exports = {
  app,
  server,
};
