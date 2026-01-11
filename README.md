🛒 E-Commerce Web Application

Spring Boot | Angular | MySQL

📌 Overview

This project is a full-stack E-Commerce web application built using Spring Boot for the backend, Angular for the frontend, and MySQL for data storage.

The goal of this project was to understand how real-world e-commerce systems work by implementing REST APIs, handling frontend–backend communication, and managing database operations in a structured and scalable way.

🚀 Features
👤 User

User registration and login

Browse products by category

Add products to cart

Place orders and view order history

🛠️ Admin

Manage products and categories

Manage user orders

View and manage registered users

🧱 Tech Stack
Frontend

Angular

TypeScript

HTML5, CSS3

Bootstrap / Angular Material

Backend

Spring Boot

Spring MVC

Spring Data JPA

Spring Security

RESTful APIs

Database

MySQL

Tools

Maven

Git & GitHub

Postman

Docker (optional)

🗂️ Project Structure
ecommerce-project/
├── backend/   → Spring Boot REST API
├── frontend/  → Angular frontend application
└── README.md


Common build folders such as target/, node_modules/, and dist/ are excluded using .gitignore.

⚙️ How to Run the Project
Backend (Spring Boot)

Open the backend folder in your IDE

Configure MySQL in application.properties:

spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce_db
spring.datasource.username=root
spring.datasource.password=your_password


Run the Spring Boot application

Frontend (Angular)

Open the frontend folder

Install dependencies:

npm install


Start the Angular server:

ng serve
🔗 Sample API Endpoints
Method	Endpoint	Description
GET	/api/products	Fetch all products
POST	/api/orders	Place an order
GET	/api/orders/{id}	Fetch order details
POST	/api/auth/login	User authentication
🔐 Security

Role-based access control (USER / ADMIN)

Authentication and authorization using Spring Security

Encrypted password storage

📈 Future Enhancements

JWT-based authentication

Payment gateway integration

Product reviews and ratings

Docker-based deployment

Cloud hosting

Open in browser:

http://localhost:4200
