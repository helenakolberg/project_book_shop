DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    bio VARCHAR(255)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    quantity INT,
    buying_cost INT,
    selling_price INT,
    authors_id INT REFERENCES authors(id)
);