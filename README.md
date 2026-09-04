# Grocery Store Billing System

A simple web-based **Grocery Store Billing System** developed using **ASP.NET Web Forms and C#**. The application allows users to add grocery products, calculate bills, apply discounts, select payment methods, and generate a final bill.

## Features

- User Login
- Grocery Product Selection
- Add Multiple Products
- Quantity and Price Calculation
- Automatic Subtotal Calculation
- Discount Calculation
- Final Total Calculation
- Multiple Payment Methods
- Bill Generation
- Clear/Reset Billing Form
- Input Validation
- Simple and User-Friendly Interface

## Technologies Used

- ASP.NET Web Forms
- C#
- HTML
- CSS
- JavaScript
- Visual Studio
- .NET Framework

## Project Workflow

The basic application flow is:

```text
User Login
    ↓
Grocery Billing Page
    ↓
Select Product
    ↓
Enter Quantity & Price
    ↓
Add Product
    ↓
Calculate Subtotal
    ↓
Apply Discount
    ↓
Calculate Final Amount
    ↓
Select Payment Method
    ↓
Generate Bill
```

## Project Structure

```text
Grocery Billing From/
│
├── Login.aspx
├── Login.aspx.cs
│
├── GroceryBilling.aspx
├── GroceryBilling.aspx.cs
│
├── Web.config
└── Other project configuration files
```

### Login.aspx

Provides the user interface for the login functionality.

### Login.aspx.cs

Contains the C# server-side logic for validating the user and handling the login process.

### GroceryBilling.aspx

Contains the UI of the grocery billing system, including product selection, quantity, price, billing information, and payment options.

### GroceryBilling.aspx.cs

Contains the main C# billing logic such as:

- Adding products
- Calculating subtotal
- Applying discounts
- Calculating the final amount
- Generating the bill
- Clearing billing information

## How to Run

1. Clone the repository.

```bash
git clone <your-repository-url>
```

2. Open the project/solution in **Visual Studio**.

3. Build the solution.

4. Run the application using **IIS Express**.

5. Login to access the Grocery Billing page.

6. Add products and generate the bill.

## Purpose

This project was created to practice and understand the fundamentals of **ASP.NET Web Forms**, **C# server-side programming**, form handling, validation, state management, and basic billing operations.

## Future Improvements

- SQL Server database integration
- Product inventory management
- Admin dashboard
- Customer management
- User registration
- Database-based authentication
- Invoice history
- Printable invoices
- Sales reports

## Author
**Titiksha**
