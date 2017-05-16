CREATE TABLE book(
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHAR(50) NOT NULL,
author VARCHAR(30) NOT NULL,
rating INTEGER NOT NULL
);
INSERT INTO book (title,author,rating) VALUES ('Harry potter','J.K.Rowling',5);
INSERT INTO book (title,author,rating) VALUES ('A Song','George',4);
INSERT INTO book (title,author,rating) VALUES ('The Dog Story','Ravinder Singh',3);
