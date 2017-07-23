-- 1.List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
WHERE population >
                  (SELECT population FROM world
                   WHERE name='Russia');

-- 2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
Select name
From world
Where continent='Europe' and gdp/population >
                            (Select gdp/population From world
                             Where name='United Kingdom');

-- 3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name,continent FROM world
WHERE continent IN
                (SELECT continent
                FROM world
                WHERE name='Argentina' OR name='Australia')
                ORDER BY name ASC;

-- 4.Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name,population
FROM world
WHERE population > (SELECT population
                    FROM world
                    WHERE name='Canada')
  and population < (SELECT population
                    FROM world
                    WHERE name='Poland');

-- 5.Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name,CONCAT(ROUND((population*100)/(SELECT population FROM world WHERE name='Germany') , 0),'%')
FROM world
WHERE population IN   (SELECT population
                                   FROM world
                                    WHERE continent='Europe');
