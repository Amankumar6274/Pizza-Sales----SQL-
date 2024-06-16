# Pizza Sales SQL Project

This repository contains SQL scripts and data related to a pizza sales database. The project focuses on managing orders, order details, pizzas, and pizza types within a fictional pizza delivery service.

## Dataset Description

1. **Orders**
   - **Description**: This table contains information about customer orders.
   - **Fields**: order_id, customer_id, order_date, delivery_address, total_amount, payment_status

2. **Orders_Details**
   - **Description**: This table provides detailed information about each pizza ordered in every order.
   - **Fields**: order_id, pizza_id, quantity, price_per_unit

3. **Pizzas**
   - **Description**: Details about different types of pizzas offered by the pizzeria.
   - **Fields**: pizza_id, pizza_name, base_price, topping1, topping2, topping3

4. **Pizzas_Types**
   - **Description**: Categorization of pizzas into types (e.g., vegetarian, meat lovers, Hawaiian).
   - **Fields**: pizza_id, pizza_type

## Project Structure

- **`queries/`**: Contains SQL scripts for common queries such as fetching orders by customer, calculating total sales, etc.
- **`schema.png`**: PNG file defining the database schema including tables, relationships, and constraints.
- **`data/`**: Sample CSV files or SQL dump files for initial data setup.
- **`question_file`/**: contains all the questions 

## Usage

1. **Setting Up the Database**:
   - Execute the `schema.sql` script on your SQL database to create the necessary tables and relationships.

2. **Loading Data**:
   - Load data into the tables using SQL `INSERT` statements or import data from CSV files provided in the `data/` directory.

3. **Running Queries**:
   - Use the scripts in the `queries/` directory to perform analysis on the pizza sales data. For example:
     - Fetching all orders made by a specific customer.
     - Calculating total sales for a given period.
     - Finding the most popular pizza types.

4. **Contributing**:
   - Feel free to contribute by adding more queries, improving database design, or suggesting enhancements through pull requests.
