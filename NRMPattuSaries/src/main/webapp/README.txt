-> NRM The Saree Palace – Premium Saree E-Commerce Web Application <-

NRM The Saree Palace is a full-stack Java web application developed for online saree shopping and administration.  
The application provides separate user and admin modules with secure authentication, product management, order handling, analytics dashboard, and modern UI features.


🚀 Features

👤 User Module
- User Registration & Login
- Secure Password Hashing using BCrypt
- Browse Sarees
- Search & Filter Sarees
- View Saree Details
- Add to Cart
- Update Quantity / Remove Items
- Checkout & Place Orders
- Order History
- WhatsApp Customer Support
- Responsive About Us Page



🛠 Admin Module
- Separate Admin Login & Registration
- Admin Dashboard
- Total Users Statistics
- Total Sarees Statistics
- Total Orders Statistics
- Revenue Analytics Chart
- Recent Orders Table
- Update Order Status
- Low Stock Alerts
- Saree Management (Add / Edit / Delete)
- User Management
- Order Management
- Route Protection & Authorization



🔐 Security Features
- BCrypt Password Encryption
- Session Management
- Admin Route Protection using Filters
- Role-Based Authorization
- Secure Login Validation



🏗 Architecture

The project follows MVC Architecture:

- Model → Java Beans / Entity Classes
- View → JSP Pages
- Controller → Servlets
- DAO Layer → Database Operations
- Filter Layer → Authorization & Security



🧰 Technologies Used

### Backend
- Java
- JDBC
- Servlets
- JSP
- MySQL

### Frontend
- HTML5
- CSS3
- JavaScript
- Chart.js

### Server
- Apache Tomcat 10

### Security
- BCrypt Password Hashing






📂 Project Structure

```text
src/main/java
│
├── dao
├── daoimplementation
├── model
├── servlet
├── filter
└── util

webapp
│
├── jsp pages
├── css
├── js
└── images


Developed By -- Harinath Jujare