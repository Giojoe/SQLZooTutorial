-- Musical Tutorial

-- 1.Find the title and artist who recorded the song 'Alison'.
SELECT title, artist
FROM album JOIN track
     ON (album.asin=track.album)
WHERE song = 'Alison';

-- 2.Which artist recorded the song 'Exodus'?
SELECT artist
FROM album JOIN track
     ON(album.asin = track.album)
WHERE track.song = 'Exodus';

-- 3.Show the song for each track on the album 'Blur'
SELECT song
FROM album JOIN track
     ON (album.asin = track.album)
WHERE title='Blur';

-- We can use the aggregate functions and "GROUP BY" expressions on the joined table.
-- 4.For each album show the title and the total number of track.
SELECT title, COUNT(*)
  FROM album JOIN track ON (asin=album)
 GROUP BY title;

 -- 5.For each album show the title and the total number of tracks containing the word 'Heart' (albums with no such tracks need not be shown).
 SELECT album.title,COUNT(album.title)
 FROM album JOIN track
      ON (album.asin = track.album)
 WHERE track.song LIKE '%Heart%'
 Group By album.title;

 -- 6.A "title track" is where the song is the same as the title. Find the title tracks.
SELECT track.song
FROM album JOIN track
     ON album.asin = track.album
WHERE album.title LIKE track.song;

-- 7.An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.
SELECT title
FROM album
WHERE title LIKE artist;

-- 8.Find the songs that appear on more than 2 albums. Include a count of the number of times each shows up.
SELECT song,COUNT(DISTINCT title)
FROM album JOIN track
     ON(album.asin = track.album)
GROUP BY song
HAVING COUNT(DISTINCT title)>2;

-- 9.A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the title, the price and the number of tracks.
Select title,price,COUNT(song) AS Number_of_track
From album JOIN track
     ON album.asin = track.album
Group By title,price
Having (album.price/COUNT(song)) < 0.5;

-- 10.Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101 tracks.
-- List albums so that the album with the most tracks is first. Show the title and the number of tracks
Select title,Count(asin)
From album JOIN track
     ON(album.asin = track.album )
Group By title
Order By (Count(asin)) DESC;
