-- INSERT-запросы для заполнения таблиц базы данных

--Заполнение таблицы жанров.
INSERT INTO Categories (name) VALUES ('Жанр1'), ('Жанр2'), ('Жанр3');

--Заполнение таблицы исполнителей.
INSERT INTO Singer (name_singer) VALUES ('Исполнитель1'), ('Исполнитель2'), ('Исполнитель3'), ('Исполнитель4');

--Заполнение таблицы связей исполнителей и жанров.
INSERT INTO GenreSinger (genre_id, singer_id) VALUES (1, 1), (2, 2), (3, 3), (1, 4);

--Заполнение таблицы альбомов.
INSERT INTO Album (name_album, year) VALUES ('Альбом1', 2019), ('Альбом2', 2020), ('Альбом3', 2018);

--Заполнение таблицы связей исполнителей и альбомов.
INSERT INTO SingerAlbum (singer_id, album_id) VALUES (1, 1), (2, 2), (3, 3), (4, 1);

--Заполнение таблицы треков.
INSERT INTO Track (name_track, duration, album_id) 
VALUES ('Трек1', 180, 1), ('Трек2', 240, 1), ('Трек3', 330, 2), ('Трек4', 280, 2), ('Трек5', 200, 3), ('Трек6', 220, 3);

--Заполнение таблицы сборников.
INSERT INTO Collection (name_collection, year) VALUES ('Сборник1', 2018), ('Сборник2', 2019), ('Сборник3', 2020), ('Сборник4', 2020);

--Заполнение таблицы связей сборников и треков.
INSERT INTO CollectionTrack (collection_id, track_id) VALUES (1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6);
