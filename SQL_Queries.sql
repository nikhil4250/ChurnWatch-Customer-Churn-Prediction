-- ==========================================
-- ChurnWatch - Customer Churn Prediction
-- Developed By: Nikhil Rahul Patil
-- ==========================================

-- Create Database
CREATE DATABASE churnwatch;

-- Select Database
USE churnwatch;

-- Create Customers Table
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    signup_date DATE
);

-- Create Subscriptions Table
CREATE TABLE subscriptions(
    customer_id INT,
    plan VARCHAR(30),
    monthly_fee DECIMAL(10,2),
    status VARCHAR(20)
);

-- Create Product Usage Table
CREATE TABLE product_usage(
    customer_id INT,
    last_login_days INT,
    monthly_logins INT,
    feature_usage INT
);

-- Create Support Tickets Table
CREATE TABLE support_tickets(
    customer_id INT,
    total_tickets INT,
    unresolved_tickets INT
);

-- Create Payments Table
CREATE TABLE payments(
    customer_id INT,
    failed_payments INT
);

-- Create Interventions Table
CREATE TABLE interventions(
    customer_id INT,
    owner VARCHAR(50),
    action_taken VARCHAR(100),
    intervention_status VARCHAR(30)
);

-- Display All Tables
SHOW TABLES;

-- Final Dataset Query
SELECT
    c.customer_id,
    c.customer_name,
    c.country,
    c.signup_date,
    s.plan,
    s.monthly_fee,
    s.status,
    u.last_login_days,
    u.monthly_logins,
    u.feature_usage,
    t.unresolved_tickets,
    p.failed_payments
FROM customers c
JOIN subscriptions s
    ON c.customer_id = s.customer_id
JOIN product_usage u
    ON c.customer_id = u.customer_id
JOIN support_tickets t
    ON c.customer_id = t.customer_id
JOIN payments p
    ON c.customer_id = p.customer_id;