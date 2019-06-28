

/*1. What query would you run to get all the countries that speak Slovene? 
Your query should return the name of the country, language and language percentage. 
Your query should arrange the result by language percentage in descending order. (1)*/

/*
SELECT * From world.country limit 10
SELECT * From world.countrylanguage limit 10
SELECT * From world.city limit 10
*/

	SELECT 
		A.NAME, 
		B.Language, 
		B.Percentage 
FROM 
	world.country A
INNER JOIN
	world.countrylanguage B
ON A.CODE = B.COUNTRYCODE
	WHERE language ="Slovene"
ORDER BY B.Percentage DESC

/*2. What query would you run to display the total number of cities for each country? 
Your query should return the name of the country and the total number of cities. 
Your query should arrange the result by the number of cities in descending order. (3)*/

	SELECT
		A.NAME,
		COUNT(B.ID) AS COUNT
FROM
	world.country A
LEFT JOIN
	world.city B
ON A.Code=B.CountryCode
GROUP BY A.NAME
ORDER BY COUNT DESC


/*3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? 
Your query should arrange the result by population in descending order. (1)*/

	SELECT
		A.NAME,
		B.NAME AS CITY,
		B.POPULATION
FROM
	world.country A
LEFT JOIN
	world.city B
ON A.Code=B.CountryCode
		WHERE B.POPULATION > 500000 AND A.NAME='Mexico'
ORDER BY B.POPULATION DESC

/*4. What query would you run to get all languages in each country with a percentage greater than 89%? 
Your query should arrange the result by percentage in descending order. (1)*/

	SELECT
		A.NAME,
		B.LANGUAGE,
		B.PERCENTAGE
FROM
	world.country A
LEFT JOIN
	world.countrylanguage B
ON A.Code=B.CountryCode
		WHERE B.PERCENTAGE > 89.0 
ORDER BY B.PERCENTAGE DESC

/*5. What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000? (2)*/

	SELECT
		A.NAME,
		A.SurfaceArea,
		B.POPULATION
FROM
	world.country A
LEFT JOIN
	world.city B
ON A.Code=B.CountryCode
		WHERE B.POPULATION > 100000 AND A.SurfaceArea<501

/*6. What query would you run to get countries with only Constitutional Monarchy 
with a capital greater than 200 and a life expectancy greater than 75 years? (1)*/

	SELECT 
		NAME,
        Capital,
        LifeExpectancy,
        GovernmentForm
FROM
	world.country
		WHERE GovernmentForm like "%Constitutional Monarchy%" AND LifeExpectancy>75 
			AND Capital>200
	
/*7. What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000? 
The query should return the Country Name, City Name, District and Population. (2)*/

	SELECT
		A.NAME,
        B.NAME AS CityName,
		B.District,
		B.POPULATION
FROM
	world.country A
LEFT JOIN
	world.city B
ON A.Code=B.CountryCode
		WHERE B.POPULATION > 500000 AND B.District like "%Buenos Aires%"

/*8. What query would you run to summarize the number of countries in each region? The query should display the name of the region and the number of countries. 
Also, the query should arrange the result by the number of countries in descending order. (2)*/

	SELECT 
		Region,
		COUNT(CODE) AS NumberOfCountries
FROM
	world.country
GROUP BY region
ORDER BY NumberOfCountries DESC





