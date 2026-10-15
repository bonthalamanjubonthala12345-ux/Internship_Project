CREATE DATABASE IF NOT EXISTS uber_analytics;

USE uber_analytics;

CREATE TABLE uber_trips1 (
    trip_key VARCHAR(100),
    fare_amount DECIMAL(10,2),
    pickup_datetime DATETIME,
    pickup_longitude DOUBLE,
    pickup_latitude DOUBLE,
    dropoff_longitude DOUBLE,
    dropoff_latitude DOUBLE,
    passenger_count INT
);

USE uber_analytics;

SHOW TABLES;

DESCRIBE uber_trips;
SELECT COUNT(*) AS total_trips
FROM uber_trips;

SELECT *
FROM uber_trips
LIMIT 10;

SELECT
    COUNT(*) AS total_trips,
    ROUND(SUM(fare_amount), 2) AS total_fare_amount,
    ROUND(AVG(fare_amount), 2) AS average_fare,
    ROUND(MIN(fare_amount), 2) AS minimum_fare,
    ROUND(MAX(fare_amount), 2) AS maximum_fare,
    ROUND(AVG(passenger_count), 2) AS average_passengers
FROM uber_trips;

SELECT
    HOUR(pickup_datetime) AS pickup_hour,
    COUNT(*) AS total_trips,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber_trips
GROUP BY HOUR(pickup_datetime)
ORDER BY pickup_hour;

SELECT
    DAYNAME(pickup_datetime) AS day_name,
    COUNT(*) AS total_trips,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber_trips
GROUP BY DAYOFWEEK(pickup_datetime), DAYNAME(pickup_datetime)
ORDER BY DAYOFWEEK(pickup_datetime);

SELECT
    DATE_FORMAT(pickup_datetime, '%Y-%m') AS trip_month,
    COUNT(*) AS total_trips,
    ROUND(SUM(fare_amount), 2) AS total_fares,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber_trips
GROUP BY DATE_FORMAT(pickup_datetime, '%Y-%m')
ORDER BY trip_month;

SELECT
    passenger_count,
    COUNT(*) AS total_trips,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber_trips
GROUP BY passenger_count
ORDER BY passenger_count;

SELECT
    trip_key,
    pickup_datetime,
    passenger_count,
    fare_amount
FROM uber_trips
ORDER BY fare_amount DESC
LIMIT 10;