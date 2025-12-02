const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { v4: uuidv4 } = require('uuid');
const app = express();
app.use(cors());
app.use(bodyParser.json());


let activities = [];


app.get('/activities', (req, res) => res.json(activities));


app.post('/activities', (req, res) => {
const activity = { ...req.body };
if (!activity.id) activity.id = uuidv4();
activities.unshift(activity);
res.status(201).json(activity);
});


app.delete('/activities/:id', (req, res) => {
const id = req.params.id;
activities = activities.filter(a => a.id !== id);
res.json({ success: true });
});


const port = 3000;
app.listen(port, () => console.log('Mock server running on port', port));