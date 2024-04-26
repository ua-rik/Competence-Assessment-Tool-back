const express = require('express');

const app = express();

app.use(express.json())
// app.get('/', (req, res) => {
//     res.status(200).send('Hello World!');
// })


app.get('/api/v1/participants', (req, res) => {

})

app.post('/api/v1/participants', (req, res) => {
    console.log(req.body)
})


const port = 3000;
app.listen(port, () => {
    console.log(`App running on port ${port}`);
})