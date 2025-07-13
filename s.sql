-- Create Donor table
CREATE TABLE Donor (
donor_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
blood_group VARCHAR(5),
contact_number VARCHAR(15),
email VARCHAR(100) UNIQUE
);
COMMENT ON TABLE Donor IS 'Table to store information about blood donors.';
-- Insert example
INSERT INTO Donor (name, blood_group, contact_number, email) VALUES ('John Smith', 'A+',
'+1234567890', 'john@example.com');
INSERT INTO Donor (name, blood_group, contact_number, email) VALUES ('Alice Johnson',
'O-', '+9876543210', 'alice@example.com');
-- Create Receptionist table
CREATE TABLE Receptionist (
receptionist_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
contact_number VARCHAR(15),
email VARCHAR(100) UNIQUE
);
COMMENT ON TABLE Receptionist IS 'Table to store information about receptionists in blood
banks.';
-- Insert example
INSERT INTO Receptionist (name, contact_number, email) VALUES ('Emma Brown',
'+1122334455', 'emma@example.com');
INSERT INTO Receptionist (name, contact_number, email) VALUES ('Michael Davis',
'+9988776655', 'michael@example.com');
-- Create BloodBank table
CREATE TABLE BloodBank (
bloodbank_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
location VARCHAR(255),
contact_number VARCHAR(15),
email VARCHAR(100) UNIQUE
);
COMMENT ON TABLE BloodBank IS 'Table to store information about blood banks.';
-- Insert example
INSERT INTO BloodBank (name, location, contact_number, email) VALUES ('New York Blood
Center', 'New York', '+1122334455', 'nybc@example.com');
INSERT INTO BloodBank (name, location, contact_number, email) VALUES ('California Blood
Bank', 'California', '+9988776655', 'calibb@example.com');
-- Create Blood table
CREATE TABLE Blood (
blood_id INT AUTO_INCREMENT PRIMARY KEY,
blood_group VARCHAR(5) NOT NULL,
quantity INT NOT NULL,
expiry_date DATE,
bloodbank_id INT,
FOREIGN KEY (bloodbank_id) REFERENCES BloodBank(bloodbank_id)
);
COMMENT ON TABLE Blood IS 'Table to store information about available blood units.';
-- Insert example
INSERT INTO Blood (blood_group, quantity, expiry_date, bloodbank_id) VALUES ('A+', 100,
'2024-12-31', 1);
INSERT INTO Blood (blood_group, quantity, expiry_date, bloodbank_id) VALUES ('O-', 50,
'2025-01-31', 2);
-- Create BloodInventoryView
CREATE VIEW BloodInventoryView AS
SELECT Blood.blood_group, Blood.quantity, Blood.expiry_date, BloodBank.name AS
bloodbank_name
FROM Blood
INNER JOIN BloodBank ON Blood.bloodbank_id = BloodBank.bloodbank_id;
COMMENT ON VIEW BloodInventoryView IS 'View to display information about available blood
units in blood banks.';
-- Cursor example
DELIMITER //
CREATE PROCEDURE DisplayBloodInventory()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE blood_group_var VARCHAR(5);
DECLARE quantity_var INT;
DECLARE expiry_date_var DATE;
DECLARE bloodbank_name_var VARCHAR(100);
DECLARE cur CURSOR FOR
SELECT blood_group, quantity, expiry_date, bloodbank_name FROM BloodInventoryView;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur;
read_loop: LOOP
FETCH cur INTO blood_group_var, quantity_var, expiry_date_var, bloodbank_name_var;
IF done THEN
LEAVE read_loop;
END IF;
-- Display or process fetched data as needed
SELECT CONCAT('Blood Group: ', blood_group_var, ', Quantity: ', quantity_var, ', Expiry Date: ', expiry_date_var, ', Blood Bank: ', bloodbank_name_var);
END LOOP;
CLOSE cur;
END //
DELIMITER ;
-- Call the procedure to display blood inventory
CALL DisplayBloodInventory();
-- Trigger example
CREATE TRIGGER UpdateBloodInventory AFTER INSERT ON Blood
FOR EACH ROW
BEGIN
UPDATE BloodInventoryView SET quantity = quantity + NEW.quantity WHERE blood_group =
NEW.blood_group;
END;
