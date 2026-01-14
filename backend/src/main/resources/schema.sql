-- Create database if not exists
CREATE DATABASE IF NOT EXISTS full_stack_ecommerce;
USE full_stack_ecommerce;

-- Roles table
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(120) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- User roles junction table
CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Product categories table
CREATE TABLE IF NOT EXISTS product_category (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Products table
CREATE TABLE IF NOT EXISTS product (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_id BIGINT NOT NULL,
    sku VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    unit_price DECIMAL(13,2) NOT NULL,
    image_url VARCHAR(255),
    active BOOLEAN DEFAULT TRUE,
    units_in_stock INT DEFAULT 0,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Cart table
CREATE TABLE IF NOT EXISTS cart (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE,
    total_price DECIMAL(13,2) DEFAULT 0.00,
    total_quantity INT DEFAULT 0,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Cart items table
CREATE TABLE IF NOT EXISTS cart_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(13,2) NOT NULL,
    total_price DECIMAL(13,2) NOT NULL,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cart_id) REFERENCES cart(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Countries table
CREATE TABLE IF NOT EXISTS country (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(2) NOT NULL,
    name VARCHAR(255) NOT NULL
);

-- States table
CREATE TABLE IF NOT EXISTS state (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country_id BIGINT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- Addresses table
CREATE TABLE IF NOT EXISTS address (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    zip_code VARCHAR(15)
);

-- Customers table (for orders)
CREATE TABLE IF NOT EXISTS customer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_tracking_number VARCHAR(255),
    total_quantity INT,
    total_price DECIMAL(13,2),
    status VARCHAR(128),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id BIGINT,
    shipping_address_id BIGINT,
    billing_address_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (shipping_address_id) REFERENCES address(id),
    FOREIGN KEY (billing_address_id) REFERENCES address(id)
);

-- Order items table
CREATE TABLE IF NOT EXISTS order_item (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255),
    quantity INT,
    unit_price DECIMAL(13,2),
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Insert default roles
INSERT IGNORE INTO roles (name) VALUES ('ROLE_CUSTOMER'), ('ROLE_ADMIN');

-- Insert sample categories
INSERT IGNORE INTO product_category (category_name) VALUES
('Books'), ('Coffee Mugs'), ('Mouse Pads'), ('Luggage Tags');

-- Insert sample products
INSERT IGNORE INTO product (category_id, sku, name, description, unit_price, image_url, active, units_in_stock) VALUES
(1, 'BOOK-TECH-1000', 'JavaScript - The Fun Parts', 'Learn JavaScript', 19.99, 'assets/images/products/books/book-luv2code-1000.png', 1, 100),
(1, 'BOOK-TECH-1001', 'Spring Boot - The Fun Parts', 'Learn Spring Boot', 29.99, 'assets/images/products/books/book-luv2code-1001.png', 1, 100),
(2, 'COFFEEMUG-1000', 'Coffee Mug - Express', 'Express Coffee Mug', 18.99, 'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png', 1, 100),
(2, 'COFFEEMUG-1001', 'Coffee Mug - Cherokee', 'Cherokee Coffee Mug', 18.99, 'assets/images/products/coffeemugs/coffeemug-luv2code-1001.png', 1, 100),
(3, 'MOUSEPAD-1000', 'Mouse Pad - Express', 'Express Mouse Pad', 17.99, 'assets/images/products/mousepads/mousepad-luv2code-1000.png', 1, 100),
(3, 'MOUSEPAD-1001', 'Mouse Pad - Cherokee', 'Cherokee Mouse Pad', 17.99, 'assets/images/products/mousepads/mousepad-luv2code-1001.png', 1, 100),
(4, 'LUGGAGETAG-1000', 'Luggage Tag - Express', 'Express Luggage Tag', 16.99, 'assets/images/products/luggagetags/luggagetag-luv2code-1000.png', 1, 100),
(4, 'LUGGAGETAG-1001', 'Luggage Tag - Cherokee', 'Cherokee Luggage Tag', 16.99, 'assets/images/products/luggagetags/luggagetag-luv2code-1001.png', 1, 100);
