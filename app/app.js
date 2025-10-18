const express = require('express');
const app = express();
const color = process.env.COLOR || 'blue';
app.get('/', (req, res) => res.send(`Hello from myapp (${color})`));
app.listen(8080, () => console.log(`Running on 8080, color=${color}`));
