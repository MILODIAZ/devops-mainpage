import http from 'http';
import { join } from 'path';
import express from 'express';
import 'dotenv/config';

import routes from './routes';

const app = express();
const PORT = Number(process.env.PORT) || 3000;

app.set('view engine', 'ejs');
app.set('views', join(__dirname, '/views'));

app.use('/', routes);

http.createServer(app).listen(PORT, () => {
  console.log(`Mainpage server start at port ${PORT}`)
});
