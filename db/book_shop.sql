DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS genres;

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255)
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    bio VARCHAR(255),
    status VARCHAR(255)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description VARCHAR(255),
    quantity INT,
    buying_cost FLOAT(2),
    selling_price FLOAT(2),
    author_id INT REFERENCES authors(id),
    genre_id INT REFERENCES genres(id)
);