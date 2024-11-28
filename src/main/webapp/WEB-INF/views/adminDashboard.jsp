<%@ page import="java.util.List" %>
<%@ page import="com.example.entity.Buyer" %>
<%@ page import="com.example.entity.Seller" %>
<%@ page import="com.example.entity.Product" %>
<%@ page import="com.example.entity.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
//* Modern CSS Reset and Custom Properties */
:root {
  --primary: #0077CC;
  --primary-dark: #005999;
  --secondary: #666666;
  --success: #00A854;
  --danger: #FF4D4F;
  --warning: #FAAD14;
  --info: #1890FF;
  --background: #F5F7FA;
  --surface: #FFFFFF;
  --text-primary: #2C3E50;
  --text-secondary: #606F7B;
  --border: #E2E8F0;
  --shadow-sm: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  --shadow-md: 0 4px 6px rgba(0,0,0,0.1), 0 2px 4px rgba(0,0,0,0.06);
  --shadow-lg: 0 10px 15px -3px rgba(0,0,0,0.1), 0 4px 6px -2px rgba(0,0,0,0.05);
  --shadow-xl: 0 20px 25px -5px rgba(0,0,0,0.1), 0 10px 10px -5px rgba(0,0,0,0.04);
  --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  --radius-sm: 4px;
  --radius-md: 6px;
  --radius-lg: 8px;
}

/* Modern CSS Reset */
*, *::before, *::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Base Styles */
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  background-color: var(--background);
  color: var(--text-primary);
  line-height: 1.5;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  padding: 2rem;
}

/* Typography */
h1 {
  font-size: 2rem;
  font-weight: 700;
  color: var(--text-primary);
  text-align: center;
  margin: 2rem 0;
  letter-spacing: -0.025em;
  position: relative;
  padding-bottom: 1rem;
}

h1::after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 4px;
  background: var(--primary);
  border-radius: var(--radius-sm);
}

h2 {
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--text-primary);
  margin: 2.5rem 0 1.5rem;
  display: flex;
  align-items: center;
  gap: 0.75rem;
  position: relative;
  padding-left: 1rem;
}

h2::before {
  content: "";
  position: absolute;
  left: 0;
  width: 4px;
  height: 100%;
  background: var(--primary);
  border-radius: var(--radius-sm);
}

/* Table Container */
.table-container {
  background: var(--surface);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-md);
  transition: var(--transition);
  margin-bottom: 2rem;
  overflow: hidden;
}

.table-container:hover {
  box-shadow: var(--shadow-lg);
}

/* Table Styles */
table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  font-size: 0.875rem;
}

/* Table Header */
thead {
  background-color: #F8FAFC;
  position: sticky;
  top: 0;
  z-index: 10;
}

th {
  padding: 1rem 1.5rem;
  text-align: left;
  font-weight: 600;
  color: var(--text-secondary);
  text-transform: uppercase;
  font-size: 0.75rem;
  letter-spacing: 0.05em;
  border-bottom: 2px solid var(--border);
  position: relative;
  transition: var(--transition);
}

th:hover {
  background-color: #F1F5F9;
}

/* Table Body */
td {
  padding: 1rem 1.5rem;
  color: var(--text-primary);
  border-bottom: 1px solid var(--border);
  transition: var(--transition);
}

tbody tr {
  transition: var(--transition);
}

tbody tr:hover {
  background-color: rgba(0, 119, 204, 0.04);
  transform: translateX(4px);
}

/* Status Indicators */
td[data-status] {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

td[data-status]::before {
  content: "";
  width: 8px;
  height: 8px;
  border-radius: 50%;
  transition: var(--transition);
}

td[data-status="active"]::before {
  background-color: var(--success);
  box-shadow: 0 0 0 3px rgba(0, 168, 84, 0.2);
}

td[data-status="inactive"]::before {
  background-color: var(--danger);
  box-shadow: 0 0 0 3px rgba(255, 77, 79, 0.2);
}

/* Button Styles */
button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.625rem 1.25rem;
  font-size: 0.875rem;
  font-weight: 500;
  border-radius: var(--radius-md);
  border: none;
  cursor: pointer;
  transition: var(--transition);
  gap: 0.5rem;
  min-width: 120px;
  position: relative;
  overflow: hidden;
}

button::before {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  transition: width 0.6s ease-out, height 0.6s ease-out;
}

button:hover::before {
  width: 300%;
  height: 300%;
}

/* Action Buttons */
.active {
  background-color: var(--success);
  color: white;
  box-shadow: 0 2px 4px rgba(0, 168, 84, 0.2);
}

.active:hover {
  background-color: #008C46;
  transform: translateY(-1px);
  box-shadow: 0 4px 6px rgba(0, 168, 84, 0.3);
}

.deactivated {
  background-color: var(--danger);
  color: white;
  box-shadow: 0 2px 4px rgba(255, 77, 79, 0.2);
}

.deactivated:hover {
  background-color: #FF3333;
  transform: translateY(-1px);
  box-shadow: 0 4px 6px rgba(255, 77, 79, 0.3);
}

.view-button {
  background-color: var(--primary);
  color: white;
  box-shadow: 0 2px 4px rgba(0, 119, 204, 0.2);
}

.view-button:hover {
  background-color: var(--primary-dark);
  transform: translateY(-1px);
  box-shadow: 0 4px 6px rgba(0, 119, 204, 0.3);
}

/* Form Styles */
form {
  display: inline-flex;
  margin: 0 0.375rem;
}

/* Loading States and Animations */
@keyframes pulse {
  0% { opacity: 1; }
  50% { opacity: 0.4; }
  100% { opacity: 1; }
}

.loading {
  animation: pulse 1.5s ease-in-out infinite;
  pointer-events: none;
}

/* Custom Scrollbar */
::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

::-webkit-scrollbar-track {
  background: var(--background);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb {
  background: #CBD5E0;
  border-radius: 4px;
  transition: var(--transition);
}

::-webkit-scrollbar-thumb:hover {
  background: #A0AEC0;
}

/* Empty State */
.empty-state {
  padding: 4rem 2rem;
  text-align: center;
  color: var(--text-secondary);
  background: linear-gradient(to bottom, transparent, rgba(0, 119, 204, 0.02));
}

/* Responsive Design */
@media (max-width: 1280px) {
  body {
    padding: 1rem;
  }
  
  .table-container {
    border-radius: var(--radius-sm);
  }
}

@media (max-width: 1024px) {
  table {
    display: block;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
  }
  
  th, td {
    white-space: nowrap;
  }
}

@media (max-width: 640px) {
  h1 {
    font-size: 1.5rem;
  }
  
  h2 {
    font-size: 1.25rem;
  }
  
  button {
    padding: 0.5rem 1rem;
    min-width: 100px;
    font-size: 0.813rem;
  }
  
  th, td {
    padding: 0.75rem 1rem;
  }
}

/* Print Styles */
@media print {
  body {
    background: white;
    padding: 0;
  }
  
  .table-container {
    box-shadow: none;
    border: 1px solid var(--border);
  }
  
  button {
    display: none;
  }
}

/* Focus Styles */
:focus-visible {
  outline: 2px solid var(--primary);
  outline-offset: 2px;
}

/* Accessibility */
.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

/* Animations */
@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.table-container {
  animation: slideIn 0.3s ease-out;
}

/* Dark Mode Support */
@media (prefers-color-scheme: dark) {
  :root {
    --background: #1A1A1A;
    --surface: #2D2D2D;
    --text-primary: #E0E0E0;
    --text-secondary: #A0A0A0;
    --border: #404040;
  }
  
  thead {
    background-color: #262626;
  }
  
  tbody tr:hover {
    background-color: rgba(255, 255, 255, 0.04);
  }
}
    </style>
    <script>
        // Function to confirm before removing a product
        function confirmRemoval() {
            return confirm("Are you sure you want to remove this product?");
        }
    </script>
</head>
<body>
    <h1>Admin Dashboard</h1>

    <!-- Buyers Table -->
    <div id="1">
    <h2>Buyers</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Buyer> buyers = (List<Buyer>) request.getAttribute("buyers");
                for (Buyer buyer : buyers) {
            %>
                <tr>
                    <td><%= buyer.getId() %></td>
                    <td><%= buyer.getName() %></td>
                    <td><%= buyer.getEmail() %></td>
                    <td><%= buyer.getMobileNumber() %></td>
                    <td><%= buyer.isApproval_status() ? "Active" : "Deactivated" %></td>
                    <td>
                        <form action="/admin/updateBuyerStatus" method="POST">
                            <input type="hidden" name="id" value="<%= buyer.getId() %>">
                            <input type="hidden" name="approval_status" value="<%= buyer.isApproval_status() ? "false" : "true" %>">
                            <button type="submit" class="<%= buyer.isApproval_status() ? "deactivated" : "active" %>">
                                <%= buyer.isApproval_status() ? "Deactivate" : "Activate" %>
                            </button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
    </div>

    <!-- Sellers Table -->
    <div id="2">
    <h2>Sellers</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Seller> sellers = (List<Seller>) request.getAttribute("sellers");
                for (Seller seller : sellers) {
            %>
                <tr>
                    <td><%= seller.getId() %></td>
                    <td><%= seller.getName() %></td>
                    <td><%= seller.getEmail() %></td>
                    <td><%= seller.getMobileNumber() %></td>
                    <td><%= seller.isAccountStatus() ? "Active" : "Deactivated" %></td>
                    <td>
                        <form action="/admin/updateSellerStatus" method="POST">
                            <input type="hidden" name="id" value="<%= seller.getId() %>">
                            <input type="hidden" name="accountStatus" value="<%= seller.isAccountStatus() ? "false" : "true" %>">
                            <button type="submit" class="<%= seller.isAccountStatus() ? "deactivated" : "active" %>">
                                <%= seller.isAccountStatus() ? "Deactivate" : "Activate" %>
                            </button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
    </div>

    <!-- Products Table -->
<div id="3">
    <h2>Products</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Subcategory</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product product : products) {
            %>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getCategory() != null ? product.getCategory().getName() : "N/A" %></td>
                    <td><%= product.getSubcategory() != null ? product.getSubcategory().getName() : "N/A" %></td>
                    <td>
                        <!-- Remove Product Form with Confirmation -->
                        <form action="/admin/removeProduct" method="POST" style="display:inline;" onsubmit="return confirmRemoval();">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <button type="submit" class="deactivated">Remove</button>
                        </form>
                        
                        <!-- View Product Form -->
                        <form action="/admin/viewProduct/<%= product.getId() %>" method="GET" style="display:inline;">
                            <button type="submit" class="active">View</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>


    <!-- Categories Table -->
    <div id="4">
    <h2>Categories</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                for (Category category : categories) {
            %>
                <tr>
                    <td><%= category.getId() %></td>
                    <td><%= category.getName() %></td>
                    <td>
                        <!-- Remove Category Form with Confirmation -->
                        <form action="/admin/removeCategory" method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to remove this category?');">
                            <input type="hidden" name="categoryId" value="<%= category.getId() %>">
                            <button type="submit" class="deactivated">Remove</button>
                        </form>

                        <!-- View Category Form -->
                        <form action="/admin/viewCategory/<%= category.getId() %>" method="GET" style="display:inline;">
                            <button type="submit" class="active">View Subcategories</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
    </div>

</body>
</html>
