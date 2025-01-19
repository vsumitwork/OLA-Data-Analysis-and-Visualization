-- Bookings DataSet

SELECT *
FROM Ola..bookings;

-- Retrieve all successful bookings:

Create View Successful_Bookings As
SELECT *
FROM Ola..bookings
WHERE Booking_Status = 'Success';

-- Find the average ride distance for each vehicle type:

Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance
FROM Ola..bookings
GROUP BY Vehicle_Type;

-- Get the total number of cancelled rides by customers:

Create View cancelled_rides_by_customers As
SELECT COUNT(*) as total_cancelled_rides
FROM Ola..bookings
WHERE Booking_Status = 'Canceled by Customer';

-- List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers As
SELECT TOP(5) Customer_ID, COUNT(Booking_ID) as total_rides
FROM Ola..bookings
GROUP BY Customer_ID
ORDER BY total_rides Desc;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) as total_rides_cancelled
FROM Ola..bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as Max_Rating, MIN(Driver_Ratings) as Min_Rating
FROM Ola..bookings
WHERE Vehicle_Type = 'Prime Sedan';

--  Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
SELECT *
FROM Ola..bookings
WHERE Payment_Method = 'UPI';

-- Find the average customer rating per vehicle type:

Create View AVG_Cust_Rating As
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) as avg_customer_rating
FROM Ola..bookings
GROUP BY Vehicle_Type;

-- Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as Total_booking_Value
FROM Ola..bookings
WHERE Booking_Status = 'Success';

-- List all incomplete rides along with the reason:

Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Ola..bookings
WHERE Incomplete_Rides = 'Yes';

-- Retrieve All Answers Using VIEWS
-- #1. Retrieve all successful bookings:

Select * From Successful_Bookings;

-- #2. Find the average ride distance for each vehicle type:

Select * from ride_distance_for_each_vehicle;

-- #3. Get the total number of cancelled rides by customers:

Select * from cancelled_rides_by_customers;

-- #4. List the top 5 customers who booked the highest number of rides:

Select * from Top_5_Customers;

-- #5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Select * from Rides_cancelled_by_Drivers_P_C_Issues;

-- #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Select * from Max_Min_Driver_Rating;

-- #7. Retrieve all rides where payment was made using UPI:

Select * from UPI_Payment;

-- #8. Find the average customer rating per vehicle type:

Select * from AVG_Cust_Rating;

-- #9. Calculate the total booking value of rides completed successfully:

Select * from total_successful_ride_value;

-- #10. List all incomplete rides along with the reason:

Select * from Incomplete_Rides_Reason;