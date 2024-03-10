-- Таблица категорий (жанров)
CREATE TABLE IF NOT EXISTS Categories (
  categories_id SERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  CONSTRAINT unique_genre_name UNIQUE (name)
);

-- Таблица исполнителей
CREATE TABLE IF NOT EXISTS Singer (
  singer_id SERIAL PRIMARY KEY,
  name_singer VARCHAR(120) NOT NULL,
  CONSTRAINT unique_singer_name UNIQUE (name_singer)
);

-- Таблица для связи жанров и исполнителей (многие-ко-многим)
CREATE TABLE IF NOT EXISTS GenreSinger (
  genre_id INTEGER NOT NULL REFERENCES Categories(categories_id),
  singer_id INTEGER NOT NULL REFERENCES Singer(singer_id),
  PRIMARY KEY (genre_id, singer_id)
);

-- Таблица альбомов
CREATE TABLE IF NOT EXISTS Album (
  album_id SERIAL PRIMARY KEY,
  name_album VARCHAR(120) NOT NULL,
  year INTEGER CHECK (year >= 1900),
  CONSTRAINT unique_album_name UNIQUE (name_album)
);

-- Таблица для связи исполнителей и альбомов (многие-ко-многим)
CREATE TABLE IF NOT EXISTS SingerAlbum (
  singer_id INTEGER NOT NULL REFERENCES Singer(singer_id),
  album_id INTEGER NOT NULL REFERENCES Album(album_id),
  PRIMARY KEY (singer_id, album_id)
);

-- Таблица треков
CREATE TABLE IF NOT EXISTS Track (
  track_id SERIAL PRIMARY KEY,
  name_track VARCHAR(160) NOT NULL,
  duration INTEGER CHECK (duration > 0),
  album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

-- Таблица коллекций
CREATE TABLE IF NOT EXISTS Collection (
  collection_id SERIAL PRIMARY KEY,
  name_collection VARCHAR(120) NOT NULL,
  year INTEGER CHECK (year >= 1900),
  CONSTRAINT unique_collection_name UNIQUE (name_collection)
);

-- Таблица для связи коллекций и треков (многие-ко-многим)
CREATE TABLE IF NOT EXISTS CollectionTrack (
  collection_id INTEGER NOT NULL REFERENCES Collection(collection_id),
  track_id INTEGER NOT NULL REFERENCES Track(track_id),
  PRIMARY KEY (collection_id, track_id)
);