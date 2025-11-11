-- 1️ Datenbank erstellen
CREATE DATABASE IF NOT EXISTS auto_db;
USE auto_db;

-- 2️ Tabelle Owners
CREATE TABLE IF NOT EXISTS Owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3 Tabelle Cars
CREATE TABLE IF NOT EXISTS Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

-- 4 Tabelle Services
CREATE TABLE IF NOT EXISTS Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5️ Tabelle CarServices (m:n-Beziehung Cars <-> Services)
CREATE TABLE IF NOT EXISTS CarServices (
    car_id INT NOT NULL,
    service_id INT NOT NULL,
    service_date DATE NOT NULL,
    PRIMARY KEY (car_id, service_id, service_date),
    FOREIGN KEY (car_id) REFERENCES Cars(car_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);