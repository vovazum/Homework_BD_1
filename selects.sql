-- SELECT-запросы

-- Задание 2
SELECT name_track, duration
FROM Track
WHERE duration = (SELECT MAX(duration) FROM Track);

SELECT name_track
FROM Track
WHERE duration >= 210;

SELECT name_collection
FROM Collection
WHERE year BETWEEN 2018 AND 2020;

SELECT name_singer
FROM Singer
WHERE name_singer NOT LIKE '% %';

SELECT name_track
FROM Track
WHERE LOWER(name_track) LIKE '%мой%' OR LOWER(name_track) LIKE '%my%';

-- Задание 3
SELECT c.name AS genre, COUNT(gs.singer_id) AS num_of_singers
FROM Categories c
LEFT JOIN GenreSinger gs ON c.categories_id = gs.genre_id
GROUP BY c.name;

SELECT COUNT(t.track_id) AS num_of_tracks
FROM Track t
JOIN Album a ON t.album_id = a.album_id
WHERE a.year BETWEEN 2019 AND 2020;

SELECT a.name_album, AVG(t.duration) AS avg_duration
FROM Album a
JOIN Track t ON a.album_id = t.album_id
GROUP BY a.name_album;

SELECT s.name_singer
FROM Singer s
LEFT JOIN SingerAlbum sa ON s.singer_id = sa.singer_id
LEFT JOIN Album a ON sa.album_id = a.album_id
WHERE a.year != 2020 OR a.year IS NULL;

SELECT c.name_collection
FROM Collection c
JOIN CollectionTrack ct ON c.collection_id = ct.collection_id
JOIN Track t ON ct.track_id = t.track_id
JOIN Album a ON t.album_id = a.album_id
JOIN SingerAlbum sa ON a.album_id = sa.album_id
JOIN Singer s ON sa.singer_id = s.singer_id
WHERE s.name_singer = 'Исполнитель1';
