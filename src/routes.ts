import 'dotenv/config';
import { Request, Response, Router } from "express";

const routes = Router();

const temp_vars = {
  mp_domain: process.env.MAINPAGE_DOMAIN,
  bff_domain: process.env.BFF_DOMAIN,
}

routes.get('/login', (req:Request, res:Response) => {
  res.render('index', temp_vars);
});

routes.get('/panel', (req:Request, res:Response) => {
  res.render('panel', temp_vars);
});

routes.all('/*', (req:Request, res:Response) => {
  res.status(404).render('404', temp_vars);
});

export default routes;