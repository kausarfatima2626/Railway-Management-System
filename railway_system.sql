-- ========================================================
-- RAILWAY RESERVATION SYSTEM DATABASE PROJECT
-- ========================================================

-- Table 1: Trains Table
CREATE TABLE trains (
    train_number VARCHAR(10) PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL,
    train_type VARCHAR(50),
    train_zone VARCHAR(50)
);

-- Table 2: Train Route Table
CREATE TABLE train_route (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    train_number VARCHAR(10),
    station_name VARCHAR(100) NOT NULL,
    arrival_time TIME,
    departure_time TIME,
    station_order INT,
    FOREIGN KEY (train_number) REFERENCES trains(train_number) ON DELETE CASCADE
);

-- Table 3: Reservations Table
CREATE TABLE reservations (
    pnr BIGINT PRIMARY KEY,
    train_number VARCHAR(10),
    source_station VARCHAR(100) NOT NULL,
    destination_station VARCHAR(100) NOT NULL,
    journey_date DATE NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'Reserved',
    FOREIGN KEY (train_number) REFERENCES trains(train_number) ON DELETE SET NULL
);

-- Table 4: Seats Table
CREATE TABLE seats (
    seat_number INT,
    coach_number VARCHAR(5),
    class_type VARCHAR(20),
    train_number VARCHAR(10),
    pnr BIGINT NULL,
    PRIMARY KEY (seat_number, coach_number, train_number),
    FOREIGN KEY (train_number) REFERENCES trains(train_number) ON DELETE CASCADE,
    FOREIGN KEY (pnr) REFERENCES reservations(pnr) ON DELETE SET NULL
);

-- ========================================================
-- INSERTING SAMPLE DATA FOR TESTING
-- ========================================================

INSERT INTO trains (train_number, train_name, train_type, train_zone) VALUES
('11223', 'Duronto Express', 'Express', 'Southern'),
('12345', 'Rajdhani Express', 'Superfast', 'Eastern'),
('23456', 'Deccan Queen', 'Express', 'Central');

INSERT INTO train_route (train_number, station_name, arrival_time, departure_time, station_order) VALUES
('11223', 'Chennai Central', '08:00:00', '08:30:00', 1),
('11223', 'Bangalore City', '13:00:00', '13:30:00', 2),
('11223', 'Pune Junction', '20:00:00', '20:30:00', 3),
('12345', 'Howrah Junction', '10:00:00', '10:30:00', 1),
('12345', 'New Delhi', '18:00:00', '18:30:00', 2);

INSERT INTO seats (seat_number, coach_number, class_type, train_number, pnr) VALUES
(1, 'C1', 'Sleeper', '11223', NULL),
(2, 'C1', 'Sleeper', '11223', NULL),
(3, 'C1', 'Sleeper', '11223', NULL),
(1, 'S1', 'AC', '12345', NULL);

-- ========================================================
-- SAMPLE QUERIES / OPERATIONS
-- ========================================================

-- Query 1: View all available trains and schedules
SELECT t.train_number, t.train_name, r.station_name, r.arrival_time, r.departure_time
FROM trains t
JOIN train_route r ON t.train_number = r.train_number
ORDER BY t.train_number, r.station_order;

-- Query 2: Check available seats in Duronto Express (11223)
SELECT seat_number, coach_number, class_type 
FROM seats 
WHERE train_number = '11223' AND pnr IS NULL;
