import pg from "pg";
import env from "dotenv";
env.config();
const db = new pg.Client({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PASSWORD,
  port: process.env.PGPORT,
});
export default db;
