1. Create Books Table:

CREATE TABLE Books (
      BookID INT PRIMARY KEY,              -- Unique ID for each book
      Title VARCHAR(255),
      Author VARCHAR(255),
      Publisher VARCHAR(255),
      YearPublished INT,
      Genre VARCHAR(100),
      ISBN VARCHAR(20),
      QuantityAvailable INT
  );

2. Insert sample data:

INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(1, 'The Silent Patient', 'Alex Michaelides', 'Macmillan Publishers', 2019, 'Thriller', '9781250301697', 10);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(2, 'Educated', 'Tara Westover', 'Penguin Random House', 2018, 'Memoir', '9780399590504', 5);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(3, 'Atomic Habits', 'James Clear', 'Simon & Schuster', 2018, 'Self-help', '9780735211292', 15);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(4, 'Sapiens', 'Yuval Noah Harari', 'HarperCollins', 2011, 'History', '9780062316097', 8);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(5, 'The Alchemist', 'Paulo Coelho', 'HarperCollins', 1988, 'Fiction', '9780061122415', 12);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(6, 'A Brief History of Time', 'Stephen Hawking', 'Oxford University Press', 1988, 'Science', '9780553380163', 6);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(7, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Macmillan Publishers', 1925, 'Fiction', '9780743273565', 4);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(8, 'Thinking, Fast and Slow', 'Daniel Kahneman', 'Penguin Random House', 2011, 'Psychology', '9780374533557', 7);
INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre, ISBN, QuantityAvailable) VALUES(9, 'The Power of Now', 'Eckhart Tolle', 'Scholastic', 1997, 'Spirituality', '9781577314806', 9);

3. Aggregate Queries:

  a) COUNT → Number of Books per Genre:

        SELECT Genre,
               COUNT(*) AS book_count
        FROM Books
        GROUP BY Genre;

Shows how many books are available in each genre.

  b) SUM → Total Quantity Available per Genre
        SELECT Genre,
               SUM(QuantityAvailable) AS total_stock
        FROM Books
        GROUP BY Genre;

Calculates total stock of books per genre.

  c) AVG → Average Year Published per Genre
        SELECT Genre,
               AVG(YearPublished) AS avg_year
        FROM Books
        GROUP BY Genre;

Gives the average publication year — useful for seeing how recent books are in each genre.

  e) HAVING → Filter Genres with Stock Above 20
        SELECT Genre,
               SUM(QuantityAvailable) AS total_stock
        FROM Books
        GROUP BY Genre
        HAVING total_stock > 20;

Shows only genres where total stock exceeds 20 copies.

  f) Multiple Aggregates Together
        SELECT Genre,
               COUNT(*) AS total_titles,
               SUM(QuantityAvailable) AS total_stock,
               AVG(YearPublished) AS avg_year
        FROM Books
        GROUP BY Genre;
