--Retrieve All Movies with Ratings Greater than 8
SELECT movie_name, rating
FROM Movies
WHERE rating > 8
ORDER BY rating DESC;

--List Movies Released in a Specific Year
SELECT movie_name, release_date
FROM Movies
WHERE EXTRACT(YEAR FROM release_date) = 2020;

--Get Average Box Collection for a Specific Genre
SELECT genre, AVG(box_collection) AS average_box_collection
FROM Movies
WHERE genre = 'Action'
GROUP BY genre;

--Top 5 Highest Grossing Movies
SELECT movie_name, box_collection
FROM Movies
ORDER BY box_collection DESC
FETCH FIRST 5 ROWS ONLY;

--Count of Movies with Subtitles Available
SELECT COUNT(*) AS movies_with_subtitles
FROM Movies
WHERE subtitle_availability = 'yes';

--Movies Available on Specific Streaming Platform
SELECT movie_name, release_format
FROM Movies
WHERE streaming_availability LIKE '%Netflix%';

--Calculate Box Office Profit for Each Movie
SELECT movie_name, box_collection - budget AS profit
FROM Movies
WHERE box_collection IS NOT NULL AND budget IS NOT NULL
ORDER BY profit DESC;

--List All Unique Genres Available
SELECT DISTINCT genre
FROM Movies
WHERE genre IS NOT NULL;

--Find Movies with the Highest Ratings for Each Genre
SELECT genre, movie_name, MAX(rating) AS highest_rating
FROM Movies
GROUP BY genre, movie_name
HAVING MAX(rating) = (
    SELECT MAX(rating)
    FROM Movies m2
    WHERE m2.genre = Movies.genre
)
ORDER BY genre;

--List Movies Released After a Certain Date and Sorted by Box Collection
SELECT movie_name, release_date, box_collection
FROM Movies
WHERE release_date > TO_DATE('2015-01-01', 'YYYY-MM-DD')
ORDER BY box_collection DESC;

--Top 3 Most Expensive Movies (by Budget) in Each Language
SELECT language, movie_name, budget
FROM (
    SELECT language, movie_name, budget,
           ROW_NUMBER() OVER (PARTITION BY language ORDER BY budget DESC) AS rank
    FROM Movies
    WHERE budget IS NOT NULL
)
WHERE rank <= 3
ORDER BY language, budget DESC;

--Calculate Total Box Collection by Director
SELECT director, SUM(box_collection) AS total_box_collection
FROM Movies
GROUP BY director
ORDER BY total_box_collection DESC;

--Movies with Awards Mentioning ‘Academy’
SELECT movie_name, awards
FROM Movies
WHERE awards LIKE '%Academy%';

--List Movies with Both Subtitles and Streaming Availability
SELECT movie_name, release_format, streaming_availability
FROM Movies
WHERE subtitle_availability = 'Yes' AND streaming_availability IS NOT NULL;

--Find Movies with a Budget Exceeding Box Collection
SELECT movie_name, budget, box_collection
FROM Movies
WHERE budget > box_collection;

--Calculate Rating Difference Between Highest and Lowest Rated Movies in Each Genre
SELECT genre, MAX(rating) - MIN(rating) AS rating_difference
FROM Movies
WHERE rating IS NOT NULL
GROUP BY genre
ORDER BY rating_difference DESC;

--List Movies with Duration Above Average for Their Genre
SELECT movie_name, genre, duration
FROM Movies m1
WHERE duration > (
    SELECT AVG(duration)
    FROM Movies m2
    WHERE m2.genre = m1.genre
)
ORDER BY genre, duration DESC;

--Count of Movies per Country of Origin
SELECT country_of_origin, COUNT(*) AS movie_count
FROM Movies
GROUP BY country_of_origin
ORDER BY movie_count DESC;

--Average Rating by Language and Release Format
SELECT language, release_format, AVG(rating) AS average_rating
FROM Movies
GROUP BY language, release_format
ORDER BY language, average_rating DESC;

--Movies with a Rating Above Genre Average
SELECT movie_name, genre, rating
FROM Movies m1
WHERE rating > (
    SELECT AVG(rating)
    FROM Movies m2
    WHERE m2.genre = m1.genre
)
ORDER BY genre, rating DESC;

--Most Frequent Language in the Movies Database
SELECT language, COUNT(*) AS count
FROM Movies
GROUP BY language
ORDER BY count DESC
FETCH FIRST 1 ROWS ONLY;

-- The count of all movies
SELECT COUNT(*) AS total_movies
FROM Movies;

--Count Movies by Genre
SELECT genre, COUNT(*) AS genre_count
FROM Movies
GROUP BY genre
ORDER BY genre_count DESC;

--Average Rating of All Movies
SELECT AVG(rating) AS average_rating
FROM Movies;

--Find the Movie with the Highest Box Collection
SELECT movie_name, box_collection
FROM Movies
ORDER BY box_collection DESC
FETCH FIRST 1 ROW ONLY;

--Total Box Collection by Language
SELECT language, SUM(box_collection) AS total_box_collection
FROM Movies
GROUP BY language
ORDER BY total_box_collection DESC;

--Find All Movies Directed by a Specific Director (e.g., ‘Christopher Nolan’)
SELECT movie_name, release_date
FROM Movies
WHERE director = 'Christopher Nolan'
ORDER BY release_date;

--Movies Released After a Specific Date
SELECT movie_name, release_date
FROM Movies
WHERE release_date > TO_DATE('2020-01-01', 'YYYY-MM-DD')
ORDER BY release_date;

--Find Movies with a Budget Greater than a Certain Amount (e.g., 100 million)
SELECT movie_name, budget
FROM Movies
WHERE budget > 100
ORDER BY budget DESC;

--List Movies by Star Actor
SELECT star_actor, COUNT(*) AS movies_count
FROM Movies
GROUP BY star_actor
ORDER BY movies_count DESC;

--Find the Maximum and Minimum Ratings for Each Genre
SELECT genre, MAX(rating) AS max_rating, MIN(rating) AS min_rating
FROM Movies
GROUP BY genre
ORDER BY genre;
