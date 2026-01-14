🛒**E-Commerce Web Application**

Spring Boot | Angular | MySQL

📌 **Overview**

This repository contains a full-stack E-Commerce web application developed using Spring Boot for the backend, Angular for the frontend, and MySQL as the relational database.

The application is designed following industry-standard practices, with a clear separation of concerns, RESTful API communication, and secure data handling. It simulates core e-commerce workflows such as user authentication, product management, cart operations, and order processing.

🚀** Features**

 **User Functionality**
-Secure user registration and authentication
-rowse products by category
-Add products to cart and manage cart items
-Place orders and view order history

**Admin Functionality**

-Create, update, and delete products
-Manage product categories

View and manage customer orders

Manage registered users

🧱**Technology Stack**

**Frontend**
-Angular
-TypeScript
-HTML5, CSS3
-Bootstrap / Angular Material

**Backend**

-Spring Boot
-Spring MVC
-Spring Data JPA
-Spring Security
-RESTful APIs

**Database**
-MySQL

**Tools & Platforms**
-Maven
-Git & GitHub
-Postman
-Docker (optional)

🗂️**Project Structure**
ecommerce-project/
├── backend/    → Spring Boot REST API
├── frontend/   → Angular frontend application
└── README.md


Build-generated directories such as target/, node_modules/, and dist/ are excluded from version control using .gitignore.

⚙️**Application Setup & Execution**
**Backend (Spring Boot)**

Navigate to the backend directory

Configure database credentials in application.properties:

spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce_db
spring.datasource.username=root
spring.datasource.password=your_password


Run the Spring Boot application using your IDE or Maven

Frontend (Angular)

Navigate to the frontend directory

Install project dependencies:

npm instal


Start the Angular development server:

ng serve


Access the application at:

http://localhost:4200
