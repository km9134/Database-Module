-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2020 at 10:52 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Kmoffett07`
--

-- --------------------------------------------------------

--
-- Table structure for table `ezy_address`
--

CREATE TABLE `ezy_address` (
  `AddressID` int(11) NOT NULL,
  `HouseNameNum` varchar(255) NOT NULL,
  `AddressLineOne` varchar(255) NOT NULL,
  `AddressLineTwo` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `County` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `Postcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_address`
--

INSERT INTO `ezy_address` (`AddressID`, `HouseNameNum`, `AddressLineOne`, `AddressLineTwo`, `City`, `County`, `Country`, `Postcode`) VALUES
(1, '47', 'Cantell Grove', '', 'Belfast', 'Antrim', 'Northern Ireland', 'BT1 2ZN'),
(2, 'George Best Belfast City Airport', 'Airport Road', '', 'Belfast', 'Antrim', 'Northern Ireland', 'BT3 9JH'),
(3, 'Belfast International Airport', 'Airport Rd', '', 'Belfast', 'Antrim', 'Northern Ireland', 'BT29 4AB'),
(4, 'London Gatwick Airport', 'Horley', '', 'Gatwick', 'Sussex', 'England', 'RH6 0NP'),
(5, 'Alicante Airport', 'L\'Altet', '', 'Alicante', 'Murcia', 'Spain', '03195'),
(6, 'Athens International Airport', 'Attiki Odos', 'Spata Artemida', 'Athens', 'Athens', 'Greece', '190 04');

-- --------------------------------------------------------

--
-- Table structure for table `ezy_airplane`
--

CREATE TABLE `ezy_airplane` (
  `AirplaneID` int(11) NOT NULL,
  `AirplaneType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_airplane`
--

INSERT INTO `ezy_airplane` (`AirplaneID`, `AirplaneType`) VALUES
(1, 'Boeing 737'),
(2, 'Airbus A320');

-- --------------------------------------------------------

--
-- Table structure for table `ezy_airport`
--

CREATE TABLE `ezy_airport` (
  `AirportID` int(11) NOT NULL,
  `AirportName` varchar(255) NOT NULL,
  `AirportCode` varchar(255) NOT NULL,
  `AddressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_airport`
--

INSERT INTO `ezy_airport` (`AirportID`, `AirportName`, `AirportCode`, `AddressID`) VALUES
(1, 'Belfast City Airport', 'BHD', 2),
(2, 'Belfast International Airport', 'BFS', 3),
(3, 'London Gatwick', 'LGW', 4),
(4, 'Alicante Airport', 'ALC', 5),
(5, 'Athens International Airport', 'ATH', 6);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_bag_type`
--

CREATE TABLE `ezy_bag_type` (
  `BagTypeID` int(11) NOT NULL,
  `BagName` varchar(255) NOT NULL,
  `BagWeight` varchar(255) NOT NULL,
  `BagCost` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_bag_type`
--

INSERT INTO `ezy_bag_type` (`BagTypeID`, `BagName`, `BagWeight`, `BagCost`, `CurrencyID`) VALUES
(1, '23kg Hold Bag', '23kg', '25.00', 1),
(2, '15kg Hold Bag', '15kg', '20.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_booker`
--

CREATE TABLE `ezy_booker` (
  `BookerID` int(11) NOT NULL,
  `CustomerDetails` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_booker`
--

INSERT INTO `ezy_booker` (`BookerID`, `CustomerDetails`, `AddressID`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_booking_line_items`
--

CREATE TABLE `ezy_booking_line_items` (
  `BookingLineItemsID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `LineItemName` varchar(255) NOT NULL,
  `LineItemDesc` text NOT NULL,
  `LineItemCost` decimal(15,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_booking_line_items`
--

INSERT INTO `ezy_booking_line_items` (`BookingLineItemsID`, `BookingID`, `LineItemName`, `LineItemDesc`, `LineItemCost`, `CurrencyID`, `PassengerID`) VALUES
(1, 1, 'Die Hard 5 Adult Ticket', '', '8.99', 1, 1),
(2, 1, 'Die Hard 5 Adult Ticket', '', '8.99', 1, 1),
(5, 1, 'Large popcorn', '', '6.99', 1, 1),
(6, 1, 'Nachos', '', '4.50', 1, 1),
(7, 2, 'Hold bag 23kg', '23kg hold bag', '25.00', 1, 5),
(8, 2, 'Hold bag 15kg', '15kg Hold bag', '20.00', 1, 5),
(9, 2, 'Bicycle', 'Bicycle in the hold', '40.00', 1, 5),
(10, 2, 'Crisps', 'In flight food - crisps', '3.99', 1, 5),
(11, 2, 'Flight', 'Belfast International to London Gatwick ', '19.99', 1, 5),
(12, 2, 'Flight', 'Belfast international to Gatwick', '19.99', 1, 6),
(13, 2, 'Ham sandwich', 'In flight food - ham sandwich', '6.50', 1, 6),
(14, 2, 'Golf Clubs', 'Golf clubs in hold', '37.00', 1, 6),
(15, 2, 'Extra leg room', 'Extra leg room seat', '21.99', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_booking_ref`
--

CREATE TABLE `ezy_booking_ref` (
  `BookingID` int(11) NOT NULL,
  `BookingRef` varchar(255) NOT NULL,
  `BookerID` int(11) NOT NULL,
  `TotalPrice` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_booking_ref`
--

INSERT INTO `ezy_booking_ref` (`BookingID`, `BookingRef`, `BookerID`, `TotalPrice`, `CurrencyID`) VALUES
(1, 'book123', 2, '143.50', 1),
(2, 'book321', 1, '194.46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_currency`
--

CREATE TABLE `ezy_currency` (
  `CurrencyID` int(11) NOT NULL,
  `CurrencyName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_currency`
--

INSERT INTO `ezy_currency` (`CurrencyID`, `CurrencyName`) VALUES
(1, 'Great British Pounds'),
(2, 'Euro');

-- --------------------------------------------------------

--
-- Table structure for table `ezy_customer_details`
--

CREATE TABLE `ezy_customer_details` (
  `CustomerDetailsID` int(11) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Phone` varbinary(255) NOT NULL,
  `Email` varbinary(255) NOT NULL,
  `CustomerPassword` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_customer_details`
--

INSERT INTO `ezy_customer_details` (`CustomerDetailsID`, `TitleID`, `FirstName`, `LastName`, `Phone`, `Email`, `CustomerPassword`) VALUES
(1, 1, 'Kyle', 'Moffett', 0x9dc327411168c117ee2cbec8b18d3952, 0xcd7879541a971910c55c05209cb6db76de0ef48341a4ffc18682ef12d4650691, 0x24aac11cc497c6e1dde2f6f1c7a13a78),
(2, 1, 'Billy', 'Murphy', '', '', ''),
(3, 2, 'Janice', 'Smith', 0xdd32a46efdb34a3eb1cb35a770578791, 0x139b08ed1c044eb4f1752a9b9d53c85dde0ef48341a4ffc18682ef12d4650691, ''),
(4, 2, 'Susanne', 'Michaels', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ezy_flight_Schedule`
--

CREATE TABLE `ezy_flight_Schedule` (
  `FlightID` int(11) NOT NULL,
  `FlightNo` varchar(11) NOT NULL,
  `RouteID` int(11) NOT NULL,
  `AirplaneID` int(11) NOT NULL,
  `DepDate` date NOT NULL,
  `DepTime` time NOT NULL,
  `ArrDate` date NOT NULL,
  `ArrTime` time NOT NULL,
  `FlightPrice` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_flight_Schedule`
--

INSERT INTO `ezy_flight_Schedule` (`FlightID`, `FlightNo`, `RouteID`, `AirplaneID`, `DepDate`, `DepTime`, `ArrDate`, `ArrTime`, `FlightPrice`, `CurrencyID`) VALUES
(1, 'EZY123', 1, 1, '2020-11-04', '06:45:00', '2020-11-04', '07:50:00', '19.99', 1),
(2, 'EZY321', 2, 1, '2020-11-04', '16:00:00', '2020-11-04', '17:00:00', '24.99', 1),
(3, 'ezy456', 5, 1, '2020-11-16', '08:00:00', '2020-11-16', '12:05:00', '64.99', 1),
(4, 'ezy654', 6, 1, '2020-11-20', '18:30:00', '2020-11-20', '22:35:00', '34.99', 1),
(5, 'ezy768', 1, 2, '2020-11-05', '06:00:00', '2020-11-05', '07:00:00', '24.99', 1),
(6, 'ezy854', 1, 1, '2020-11-06', '10:30:00', '2020-11-06', '11:30:00', '37.99', 1),
(7, 'ezy789', 2, 1, '2020-11-05', '20:30:00', '2020-11-05', '21:30:00', '27.99', 1),
(8, 'ezy347', 2, 2, '2020-11-06', '22:00:00', '2020-11-06', '23:00:00', '45.99', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_food_type`
--

CREATE TABLE `ezy_food_type` (
  `FoodTypeID` int(11) NOT NULL,
  `FoodName` varchar(255) NOT NULL,
  `FoodCost` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_food_type`
--

INSERT INTO `ezy_food_type` (`FoodTypeID`, `FoodName`, `FoodCost`, `CurrencyID`) VALUES
(1, 'Ham Sandwich', '6.50', 1),
(2, 'Turkey Dinner', '15.99', 1),
(3, 'Crisps', '3.99', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_passenger`
--

CREATE TABLE `ezy_passenger` (
  `PassengerID` int(11) NOT NULL,
  `CustomerDetailsID` int(11) NOT NULL,
  `PassengerTypeID` int(11) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `SeatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_passenger`
--

INSERT INTO `ezy_passenger` (`PassengerID`, `CustomerDetailsID`, `PassengerTypeID`, `TitleID`, `BookingID`, `FlightID`, `SeatID`) VALUES
(1, 2, 1, 1, 1, 1, 1),
(4, 4, 2, 1, 1, 2, 4),
(5, 1, 1, 1, 2, 1, 5),
(6, 3, 1, 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_passenger_bag`
--

CREATE TABLE `ezy_passenger_bag` (
  `PassengerBagID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `BagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_passenger_bag`
--

INSERT INTO `ezy_passenger_bag` (`PassengerBagID`, `PassengerID`, `BagID`) VALUES
(1, 5, 2),
(2, 1, 1),
(3, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_passenger_boarding`
--

CREATE TABLE `ezy_passenger_boarding` (
  `PassengerBoardingID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `BoardingTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_passenger_boarding`
--

INSERT INTO `ezy_passenger_boarding` (`PassengerBoardingID`, `PassengerID`, `BoardingTypeID`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_passenger_food`
--

CREATE TABLE `ezy_passenger_food` (
  `PassengerFoodID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `FoodTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_passenger_food`
--

INSERT INTO `ezy_passenger_food` (`PassengerFoodID`, `PassengerID`, `FoodTypeID`) VALUES
(1, 1, 1),
(2, 5, 3),
(3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_passenger_sports_equipment`
--

CREATE TABLE `ezy_passenger_sports_equipment` (
  `PassengerSportsEqtID` int(11) NOT NULL,
  `SportsEqptID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_passenger_sports_equipment`
--

INSERT INTO `ezy_passenger_sports_equipment` (`PassengerSportsEqtID`, `SportsEqptID`, `PassengerID`) VALUES
(1, 1, 5),
(2, 21, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_passenger_type`
--

CREATE TABLE `ezy_passenger_type` (
  `PassengerTypeID` int(11) NOT NULL,
  `PassengerTypeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_passenger_type`
--

INSERT INTO `ezy_passenger_type` (`PassengerTypeID`, `PassengerTypeName`) VALUES
(1, 'Adults (16+)'),
(2, 'Children (2-15)'),
(3, 'Infants (<2)');

-- --------------------------------------------------------

--
-- Table structure for table `ezy_route`
--

CREATE TABLE `ezy_route` (
  `RouteID` int(11) NOT NULL,
  `RouteName` varchar(255) NOT NULL,
  `DepAirportID` int(11) NOT NULL,
  `ArrivalAirportID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_route`
--

INSERT INTO `ezy_route` (`RouteID`, `RouteName`, `DepAirportID`, `ArrivalAirportID`) VALUES
(1, 'Belfast City to London Gatwick', 1, 3),
(2, 'London Gatwick to Belfast City', 3, 1),
(3, 'London Gatwick to Athens International', 3, 5),
(4, 'Athens International to London Gatwick', 5, 3),
(5, 'London Gatwick to Alicante', 3, 4),
(6, 'Alicante to London Gatwick', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_seat`
--

CREATE TABLE `ezy_seat` (
  `SeatID` int(11) NOT NULL,
  `SeatCostID` int(11) NOT NULL,
  `SeatName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_seat`
--

INSERT INTO `ezy_seat` (`SeatID`, `SeatCostID`, `SeatName`) VALUES
(1, 1, '1A'),
(2, 1, '1B'),
(3, 3, '7E'),
(4, 5, '19C'),
(5, 6, '24F');

-- --------------------------------------------------------

--
-- Table structure for table `ezy_seat_cost`
--

CREATE TABLE `ezy_seat_cost` (
  `SeatCostID` int(11) NOT NULL,
  `SeatCostType` varchar(255) NOT NULL,
  `SeatCost` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_seat_cost`
--

INSERT INTO `ezy_seat_cost` (`SeatCostID`, `SeatCostType`, `SeatCost`) VALUES
(1, 'Extra Leg Room', '21.99'),
(2, 'Up Front', '17.99'),
(3, 'Standard', '6.49'),
(4, 'Extra Leg Room', '18.99'),
(5, 'Standard', '4.99'),
(6, 'Random Allocation', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `ezy_sports_equipment`
--

CREATE TABLE `ezy_sports_equipment` (
  `SportsEqptID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `ItemCost` decimal(12,2) NOT NULL,
  `CurrencyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_sports_equipment`
--

INSERT INTO `ezy_sports_equipment` (`SportsEqptID`, `ItemName`, `ItemCost`, `CurrencyID`) VALUES
(1, 'Bicycle', '45.00', 1),
(19, 'Canoe', '45.00', 1),
(20, 'Sporting firearm', '37.00', 1),
(21, 'Golf clubs', '37.00', 1),
(22, 'Hang Glider', '45.00', 1),
(23, 'Other Small Sports Equiptment', '37.00', 1),
(24, 'Skis and/or boots', '37.00', 1),
(25, 'Snowboard', '37.00', 1),
(26, 'Windsurfing Board', '45.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ezy_title`
--

CREATE TABLE `ezy_title` (
  `TitleID` int(11) NOT NULL,
  `TitleName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezy_title`
--

INSERT INTO `ezy_title` (`TitleID`, `TitleName`) VALUES
(1, 'Mr'),
(2, 'Mrs'),
(5, 'Miss'),
(9, 'Ms'),
(10, 'Ms');

-- --------------------------------------------------------

--
-- Table structure for table `ez_boarding_type`
--

CREATE TABLE `ez_boarding_type` (
  `BoardingTypeID` int(11) NOT NULL,
  `BoardingName` varchar(255) NOT NULL,
  `BoardingCost` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ez_boarding_type`
--

INSERT INTO `ez_boarding_type` (`BoardingTypeID`, `BoardingName`, `BoardingCost`) VALUES
(1, 'Speedy Boarding', '15.99'),
(2, 'Special Assistance', '0.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ezy_address`
--
ALTER TABLE `ezy_address`
  ADD PRIMARY KEY (`AddressID`);

--
-- Indexes for table `ezy_airplane`
--
ALTER TABLE `ezy_airplane`
  ADD PRIMARY KEY (`AirplaneID`);

--
-- Indexes for table `ezy_airport`
--
ALTER TABLE `ezy_airport`
  ADD PRIMARY KEY (`AirportID`),
  ADD KEY `FK_AddressIDAirport` (`AddressID`);

--
-- Indexes for table `ezy_bag_type`
--
ALTER TABLE `ezy_bag_type`
  ADD PRIMARY KEY (`BagTypeID`),
  ADD KEY `FK_CurrencyIDBagType` (`CurrencyID`);

--
-- Indexes for table `ezy_booker`
--
ALTER TABLE `ezy_booker`
  ADD PRIMARY KEY (`BookerID`),
  ADD KEY `FK_AddressIDBooker` (`AddressID`),
  ADD KEY `FK_CustomerDetailsBooker` (`CustomerDetails`);

--
-- Indexes for table `ezy_booking_line_items`
--
ALTER TABLE `ezy_booking_line_items`
  ADD PRIMARY KEY (`BookingLineItemsID`),
  ADD KEY `FK_BookingIDLineItems` (`BookingID`),
  ADD KEY `FK_CurrencyIDLineItems` (`CurrencyID`),
  ADD KEY `FK_PassengerIDLineItems` (`PassengerID`);

--
-- Indexes for table `ezy_booking_ref`
--
ALTER TABLE `ezy_booking_ref`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `FK_BookerIDBookingRef` (`BookerID`),
  ADD KEY `FK_CurrencyIDBookingRef` (`CurrencyID`);

--
-- Indexes for table `ezy_currency`
--
ALTER TABLE `ezy_currency`
  ADD PRIMARY KEY (`CurrencyID`);

--
-- Indexes for table `ezy_customer_details`
--
ALTER TABLE `ezy_customer_details`
  ADD PRIMARY KEY (`CustomerDetailsID`),
  ADD KEY `FK_TitleIDCustomerDetails` (`TitleID`);

--
-- Indexes for table `ezy_flight_Schedule`
--
ALTER TABLE `ezy_flight_Schedule`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `FK_JourneyRouteID` (`RouteID`),
  ADD KEY `FK_AirplaneIDFlightSch` (`AirplaneID`),
  ADD KEY `FK_CurrencyIDFlightSch` (`CurrencyID`);

--
-- Indexes for table `ezy_food_type`
--
ALTER TABLE `ezy_food_type`
  ADD PRIMARY KEY (`FoodTypeID`),
  ADD KEY `FK_CurrencyIDFoodType` (`CurrencyID`);

--
-- Indexes for table `ezy_passenger`
--
ALTER TABLE `ezy_passenger`
  ADD PRIMARY KEY (`PassengerID`),
  ADD KEY `FK_BookingIDPassenger` (`BookingID`),
  ADD KEY `FK_JourneyPassIDPassenger` (`FlightID`),
  ADD KEY `FK_PassengerTypeIDPassenger` (`PassengerTypeID`),
  ADD KEY `FK_SeatIDPassenger` (`SeatID`),
  ADD KEY `FK_TitleIDPassenger` (`TitleID`),
  ADD KEY `FK_ CustomerDetailsIDPassenger` (`CustomerDetailsID`);

--
-- Indexes for table `ezy_passenger_bag`
--
ALTER TABLE `ezy_passenger_bag`
  ADD PRIMARY KEY (`PassengerBagID`),
  ADD KEY `FK_PassengerID` (`PassengerID`),
  ADD KEY `FK_BagID` (`BagID`);

--
-- Indexes for table `ezy_passenger_boarding`
--
ALTER TABLE `ezy_passenger_boarding`
  ADD PRIMARY KEY (`PassengerBoardingID`),
  ADD KEY `FK_PassengerIDPassBoard` (`PassengerID`),
  ADD KEY `FK_BoardingTypePassBoard` (`BoardingTypeID`);

--
-- Indexes for table `ezy_passenger_food`
--
ALTER TABLE `ezy_passenger_food`
  ADD PRIMARY KEY (`PassengerFoodID`),
  ADD KEY `FK_PassengerIDPassFood` (`PassengerID`),
  ADD KEY `FK_FoodTypeIDPassFood` (`FoodTypeID`);

--
-- Indexes for table `ezy_passenger_sports_equipment`
--
ALTER TABLE `ezy_passenger_sports_equipment`
  ADD PRIMARY KEY (`PassengerSportsEqtID`),
  ADD KEY `FK_PassengerIDPassSportsEqpt` (`PassengerID`),
  ADD KEY `FK_SportsEqptIDPassSportsEqpt` (`SportsEqptID`);

--
-- Indexes for table `ezy_passenger_type`
--
ALTER TABLE `ezy_passenger_type`
  ADD PRIMARY KEY (`PassengerTypeID`);

--
-- Indexes for table `ezy_route`
--
ALTER TABLE `ezy_route`
  ADD PRIMARY KEY (`RouteID`),
  ADD KEY `FK_DepAirport` (`DepAirportID`),
  ADD KEY `FK_ArrivalStation` (`ArrivalAirportID`);

--
-- Indexes for table `ezy_seat`
--
ALTER TABLE `ezy_seat`
  ADD PRIMARY KEY (`SeatID`),
  ADD KEY `FK_SeatCostIDSeat` (`SeatCostID`);

--
-- Indexes for table `ezy_seat_cost`
--
ALTER TABLE `ezy_seat_cost`
  ADD PRIMARY KEY (`SeatCostID`);

--
-- Indexes for table `ezy_sports_equipment`
--
ALTER TABLE `ezy_sports_equipment`
  ADD PRIMARY KEY (`SportsEqptID`),
  ADD KEY `FK_CurrencyIDSportsEqpt` (`CurrencyID`);

--
-- Indexes for table `ezy_title`
--
ALTER TABLE `ezy_title`
  ADD PRIMARY KEY (`TitleID`);

--
-- Indexes for table `ez_boarding_type`
--
ALTER TABLE `ez_boarding_type`
  ADD PRIMARY KEY (`BoardingTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ezy_address`
--
ALTER TABLE `ezy_address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ezy_airplane`
--
ALTER TABLE `ezy_airplane`
  MODIFY `AirplaneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ezy_airport`
--
ALTER TABLE `ezy_airport`
  MODIFY `AirportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ezy_bag_type`
--
ALTER TABLE `ezy_bag_type`
  MODIFY `BagTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ezy_booker`
--
ALTER TABLE `ezy_booker`
  MODIFY `BookerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ezy_booking_line_items`
--
ALTER TABLE `ezy_booking_line_items`
  MODIFY `BookingLineItemsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ezy_booking_ref`
--
ALTER TABLE `ezy_booking_ref`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ezy_currency`
--
ALTER TABLE `ezy_currency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ezy_customer_details`
--
ALTER TABLE `ezy_customer_details`
  MODIFY `CustomerDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ezy_flight_Schedule`
--
ALTER TABLE `ezy_flight_Schedule`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ezy_food_type`
--
ALTER TABLE `ezy_food_type`
  MODIFY `FoodTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ezy_passenger`
--
ALTER TABLE `ezy_passenger`
  MODIFY `PassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ezy_passenger_bag`
--
ALTER TABLE `ezy_passenger_bag`
  MODIFY `PassengerBagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ezy_passenger_boarding`
--
ALTER TABLE `ezy_passenger_boarding`
  MODIFY `PassengerBoardingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ezy_passenger_food`
--
ALTER TABLE `ezy_passenger_food`
  MODIFY `PassengerFoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ezy_passenger_sports_equipment`
--
ALTER TABLE `ezy_passenger_sports_equipment`
  MODIFY `PassengerSportsEqtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ezy_passenger_type`
--
ALTER TABLE `ezy_passenger_type`
  MODIFY `PassengerTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ezy_route`
--
ALTER TABLE `ezy_route`
  MODIFY `RouteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ezy_seat`
--
ALTER TABLE `ezy_seat`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ezy_seat_cost`
--
ALTER TABLE `ezy_seat_cost`
  MODIFY `SeatCostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ezy_sports_equipment`
--
ALTER TABLE `ezy_sports_equipment`
  MODIFY `SportsEqptID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ezy_title`
--
ALTER TABLE `ezy_title`
  MODIFY `TitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ez_boarding_type`
--
ALTER TABLE `ez_boarding_type`
  MODIFY `BoardingTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ezy_airport`
--
ALTER TABLE `ezy_airport`
  ADD CONSTRAINT `FK_AddressIDAirport` FOREIGN KEY (`AddressID`) REFERENCES `ezy_address` (`AddressID`);

--
-- Constraints for table `ezy_bag_type`
--
ALTER TABLE `ezy_bag_type`
  ADD CONSTRAINT `FK_CurrencyIDBagType` FOREIGN KEY (`CurrencyID`) REFERENCES `ezy_currency` (`CurrencyID`);

--
-- Constraints for table `ezy_booker`
--
ALTER TABLE `ezy_booker`
  ADD CONSTRAINT `FK_AddressIDBooker` FOREIGN KEY (`AddressID`) REFERENCES `ezy_address` (`AddressID`),
  ADD CONSTRAINT `FK_CustomerDetailsBooker` FOREIGN KEY (`CustomerDetails`) REFERENCES `ezy_customer_details` (`CustomerDetailsID`);

--
-- Constraints for table `ezy_booking_line_items`
--
ALTER TABLE `ezy_booking_line_items`
  ADD CONSTRAINT `FK_BookingIDLineItems` FOREIGN KEY (`BookingID`) REFERENCES `ezy_booking_ref` (`BookingID`),
  ADD CONSTRAINT `FK_CurrencyIDLineItems` FOREIGN KEY (`CurrencyID`) REFERENCES `ezy_currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_PassengerIDLineItems` FOREIGN KEY (`PassengerID`) REFERENCES `ezy_passenger` (`PassengerID`);

--
-- Constraints for table `ezy_booking_ref`
--
ALTER TABLE `ezy_booking_ref`
  ADD CONSTRAINT `FK_BookerIDBookingRef` FOREIGN KEY (`BookerID`) REFERENCES `ezy_booker` (`BookerID`),
  ADD CONSTRAINT `FK_CurrencyIDBookingRef` FOREIGN KEY (`CurrencyID`) REFERENCES `ezy_currency` (`CurrencyID`);

--
-- Constraints for table `ezy_customer_details`
--
ALTER TABLE `ezy_customer_details`
  ADD CONSTRAINT `FK_TitleIDCustomerDetails` FOREIGN KEY (`TitleID`) REFERENCES `ezy_title` (`TitleID`);

--
-- Constraints for table `ezy_flight_Schedule`
--
ALTER TABLE `ezy_flight_Schedule`
  ADD CONSTRAINT `FK_AirplaneIDFlightSch` FOREIGN KEY (`AirplaneID`) REFERENCES `ezy_airplane` (`AirplaneID`),
  ADD CONSTRAINT `FK_CurrencyIDFlightSch` FOREIGN KEY (`CurrencyID`) REFERENCES `ezy_currency` (`CurrencyID`),
  ADD CONSTRAINT `FK_JourneyRouteID` FOREIGN KEY (`RouteID`) REFERENCES `ezy_route` (`RouteID`);

--
-- Constraints for table `ezy_food_type`
--
ALTER TABLE `ezy_food_type`
  ADD CONSTRAINT `FK_CurrencyIDFoodType` FOREIGN KEY (`CurrencyID`) REFERENCES `ezy_currency` (`CurrencyID`);

--
-- Constraints for table `ezy_passenger`
--
ALTER TABLE `ezy_passenger`
  ADD CONSTRAINT `FK_ CustomerDetailsIDPassenger` FOREIGN KEY (`CustomerDetailsID`) REFERENCES `ezy_customer_details` (`CustomerDetailsID`),
  ADD CONSTRAINT `FK_BookingIDPassenger` FOREIGN KEY (`BookingID`) REFERENCES `ezy_booking_ref` (`BookingID`),
  ADD CONSTRAINT `FK_JourneyPassIDPassenger` FOREIGN KEY (`FlightID`) REFERENCES `ezy_flight_Schedule` (`FlightID`),
  ADD CONSTRAINT `FK_PassengerTypeIDPassenger` FOREIGN KEY (`PassengerTypeID`) REFERENCES `ezy_passenger_type` (`PassengerTypeID`),
  ADD CONSTRAINT `FK_SeatIDPassenger` FOREIGN KEY (`SeatID`) REFERENCES `ezy_seat` (`SeatID`),
  ADD CONSTRAINT `FK_TitleIDPassenger` FOREIGN KEY (`TitleID`) REFERENCES `ezy_title` (`TitleID`);

--
-- Constraints for table `ezy_passenger_bag`
--
ALTER TABLE `ezy_passenger_bag`
  ADD CONSTRAINT `FK_BagID` FOREIGN KEY (`BagID`) REFERENCES `ezy_bag_type` (`BagTypeID`),
  ADD CONSTRAINT `FK_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `ezy_passenger` (`PassengerID`);

--
-- Constraints for table `ezy_passenger_boarding`
--
ALTER TABLE `ezy_passenger_boarding`
  ADD CONSTRAINT `FK_BoardingTypePassBoard` FOREIGN KEY (`BoardingTypeID`) REFERENCES `ez_boarding_type` (`BoardingTypeID`),
  ADD CONSTRAINT `FK_PassengerIDPassBoard` FOREIGN KEY (`PassengerID`) REFERENCES `ezy_passenger` (`PassengerID`);

--
-- Constraints for table `ezy_passenger_food`
--
ALTER TABLE `ezy_passenger_food`
  ADD CONSTRAINT `FK_FoodTypeIDPassFood` FOREIGN KEY (`FoodTypeID`) REFERENCES `ezy_food_type` (`FoodTypeID`),
  ADD CONSTRAINT `FK_PassengerIDPassFood` FOREIGN KEY (`PassengerID`) REFERENCES `ezy_passenger` (`PassengerID`);

--
-- Constraints for table `ezy_passenger_sports_equipment`
--
ALTER TABLE `ezy_passenger_sports_equipment`
  ADD CONSTRAINT `FK_PassengerIDPassSportsEqpt` FOREIGN KEY (`PassengerID`) REFERENCES `ezy_passenger` (`PassengerID`),
  ADD CONSTRAINT `FK_SportsEqptIDPassSportsEqpt` FOREIGN KEY (`SportsEqptID`) REFERENCES `ezy_sports_equipment` (`SportsEqptID`);

--
-- Constraints for table `ezy_route`
--
ALTER TABLE `ezy_route`
  ADD CONSTRAINT `FK_ArrivalStation` FOREIGN KEY (`ArrivalAirportID`) REFERENCES `ezy_airport` (`AirportID`),
  ADD CONSTRAINT `FK_DepAirport` FOREIGN KEY (`DepAirportID`) REFERENCES `ezy_airport` (`AirportID`);

--
-- Constraints for table `ezy_seat`
--
ALTER TABLE `ezy_seat`
  ADD CONSTRAINT `FK_SeatCostIDSeat` FOREIGN KEY (`SeatCostID`) REFERENCES `ezy_seat_cost` (`SeatCostID`);

--
-- Constraints for table `ezy_sports_equipment`
--
ALTER TABLE `ezy_sports_equipment`
  ADD CONSTRAINT `FK_CurrencyIDSportsEqpt` FOREIGN KEY (`CurrencyID`) REFERENCES `ezy_currency` (`CurrencyID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
