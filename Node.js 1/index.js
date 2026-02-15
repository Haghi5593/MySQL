const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.json());

let books = [
  { id: 1, title: 'Atomic Habits', author: 'James Clear' },
  { id: 2, title: 'Deep Work', author: 'Cal Newport' }
];

// Get all books
app.get('/books', (req, res) => {
  res.json(books);
});

// Get a single book
app.get('/books/:id', (req, res) => {
  const book = books.find(b => b.id === parseInt(req.params.id));
  
  if (!book) {
    return res.send('Book not found');
  }
  
  res.json(book);
});

// Add a new book
app.post('/books', (req, res) => {
  const newBook = {
    id: books.length + 1,
    title: req.body.title,
    author: req.body.author
  };
  
  books.push(newBook);
  res.json(newBook);
});

// Update a book's title
app.put('/books/:id', (req, res) => {
  const book = books.find(b => b.id === parseInt(req.params.id));
  
  if (!book) {
    return res.send('Book not found');
  }
  
  book.title = req.body.title;
  res.json(book);
});

// Delete a book
app.delete('/books/:id', (req, res) => {
  const index = books.findIndex(b => b.id === parseInt(req.params.id));
  
  if (index === -1) {
    return res.send('Book not found');
  }
  
  books.splice(index, 1);
  res.send('Book deleted');
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});