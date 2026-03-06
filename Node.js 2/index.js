import express from "express";
import mongoose from "mongoose";
import dotenv from "dotenv";
import booksRoutes from "./routes/books.js";

dotenv.config();

const app = express();

app.use(express.json());

app.use("/books", booksRoutes);

mongoose
  .connect(process.env.MONGO_URI)
  .then(() => {
    console.log("✅ MongoDB Connected");
  })
  .catch((err) => {
    console.log(err);
  });

// const PORT = process.env.PORT || 5000;

app.listen(5000, () => {
  console.log(`🚀 Server running on port http://localhost:5000`);
});