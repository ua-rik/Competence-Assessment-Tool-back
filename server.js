const dotenv = require('dotenv');
// має бути визначено до декларації app
dotenv.config({ path: './config.env' });

const app = require('./app')



console.log('🧑‍💻️Enviroment:', app.get('env'))
console.log(process.env)

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`App running on port ${port}`);
});
