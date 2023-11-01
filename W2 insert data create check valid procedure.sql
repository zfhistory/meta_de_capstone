INSERT INTO booking(BookingID, Date, TableNumber)
VALUES 
(1, '2022-10-10', 5),
(2, '2022-11-12', 3),
(3, '2022-10-11', 2),
(4, '2022-10-13', 2);



#-----create procedure check booking
CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNumber INT)
SELECT BookingDate, TableNumber
WHERE exists (SELECT * from Booking where Date = BookingDate and TableNumber = TableNumber);
	


	

#------add valid booking
CREATE PROCEDURE AddValidBooking (IN BookingDate DATE, IN TableNumber INT)

START TRANSACTION;

SELECT BookingDate, TableNumber
WHERE exists (SELECT * from Booking where Date = BookingDate and TableNumber = TableNumber);

	INSERT INTO booking (date, table_number)
	VALUES (BookingDate, TableNumber);
    
	COMMIT;
    
    
    
#----------add booking
DELIMITER //

CREATE PROCEDURE AddBooking (IN p_BookingID INT, IN p_CustomerID INT, IN p_TableNumber INT, IN p_BookingDate DATE)
BEGIN
  INSERT INTO booking (BookingID, CustomerID, TableNumber, BookingDate) VALUES (p_BookingID, p_CustomerID, p_TableNumber, p_BookingDate);
END;
//

DELIMITER ;


#--------update booking
DELIMITER //

CREATE PROCEDURE UpdateBooking (IN p_BookingID INT, IN p_BookingDate DATE)
BEGIN
  UPDATE booking SET `date` = p_BookingDate WHERE booking_id = p_BookingID;
END;
//

DELIMITER ;


#---------cancel booking
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN BookingID INT)
BEGIN
DELETE FROM booking WHERE booking_id = BookingID;
END;
//

DELIMITER ;





