<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revshop</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Chart.js library -->
    <style>
    /* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', 'Arial', sans-serif;
}

:root {
    --primary: #3b82f6;
    --success: #10b981;
    --warning: #f59e0b;
    --purple: #8b5cf6;
    --sidebar-width: 250px;
    --transition-speed: 0.3s;
}

body {
    background: #f8fafc;
    min-height: 100vh;
}

/* Sidebar Styles */
.sidebar {
    width: var(--sidebar-width);
    height: 100vh;
    background: white;
    position: fixed;
    left: 0;
    top: 0;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
    transition: transform var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
    z-index: 1000;
}

.sidebar-header {
    padding: 24px;
    border-bottom: 1px solid #e5e7eb;
    background: linear-gradient(135deg, #fff, #f8fafc);
}

.logo {
    font-size: 1.75rem;
    font-weight: 800;
    background: linear-gradient(45deg, var(--primary), var(--purple));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    animation: logoShine 3s ease-in-out infinite;
}

@keyframes logoShine {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.8; }
}

.menu-list {
    padding: 16px 0;
    list-style: none;
}

.menu-item {
    padding: 14px 24px;
    margin: 4px 12px;
    display: flex;
    align-items: center;
    color: #64748b;
    text-decoration: none;
    border-radius: 8px;
    transition: all var(--transition-speed) ease;
    position: relative;
    overflow: hidden;
}

.menu-item::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 0;
    background: var(--primary);
    opacity: 0.1;
    transition: width var(--transition-speed) ease;
}

.menu-item:hover::before {
    width: 100%;
}

.menu-item:hover {
    color: var(--primary);
    transform: translateX(4px);
}

.menu-item.active {
    background: #eff6ff;
    color: var(--primary);
    font-weight: 600;
    box-shadow: 0 2px 4px rgba(59, 130, 246, 0.1);
}

.menu-icon {
    margin-right: 12px;
    font-size: 1.2rem;
    transition: transform var(--transition-speed) ease;
}

.menu-item:hover .menu-icon {
    transform: scale(1.1);
}

/* Dashboard Content */
.dashboard {
    padding: 32px;
    max-width: 1600px;
    margin: 0 auto;
    margin-left: var(--sidebar-width);
    transition: margin-left var(--transition-speed) ease;
}

/* Stats Cards */
.stats-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 24px;
    margin-bottom: 32px;
    animation: fadeInUp 0.6s ease-out;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.stat-card {
    background: white;
    padding: 28px;
    border-radius: 16px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: all var(--transition-speed) ease;
    position: relative;
    overflow: hidden;
}

.stat-card::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
    transform: translateX(-100%);
    transition: transform 0.6s ease;
}

.stat-card:hover::after {
    transform: translateX(100%);
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.1);
}

.stat-card h3 {
    color: #64748b;
    font-size: 0.95em;
    margin-bottom: 16px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    position: relative;
}

.stat-card .value {
    font-size: 2.5em;
    font-weight: 700;
    color: #1e293b;
    margin-bottom: 12px;
    transition: color var(--transition-speed) ease;
}

.stat-card:hover .value {
    color: var(--primary);
}

/* Welcome Message */
.welcome-message {
    font-size: 2.2em;
    font-weight: 800;
    color: #1e293b;
    text-align: center;
    padding: 32px;
    border-radius: 16px;
    background: linear-gradient(135deg, #fff, #f8fafc);
    border: 2px solid #e2e8f0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    margin-bottom: 32px;
    animation: welcomeSlide 1s ease-out;
}

@keyframes welcomeSlide {
    0% {
        transform: translateX(-100%);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

/* Charts Section */
.charts-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
    gap: 24px;
    animation: fadeIn 0.8s ease-out;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

.chart-card {
    background: white;
    padding: 28px;
    border-radius: 16px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: transform var(--transition-speed) ease;
}

.chart-card:hover {
    transform: translateY(-3px);
}

.chart-card h3 {
    color: #1e293b;
    margin-bottom: 24px;
    font-size: 1.2em;
    font-weight: 600;
    position: relative;
    padding-bottom: 8px;
}

.chart-card h3::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 40px;
    height: 3px;
    background: var(--primary);
    border-radius: 2px;
    transition: width var(--transition-speed) ease;
}

.chart-card:hover h3::after {
    width: 60px;
}

/* Toggle Button */
.toggle-btn {
    display: none;
    position: fixed;
    left: 20px;
    top: 20px;
    z-index: 1001;
    background: white;
    border: none;
    padding: 12px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: all var(--transition-speed) ease;
}

.toggle-btn:hover {
    background: var(--primary);
    color: white;
    transform: scale(1.05);
}

/* Loading Animation */
.loading {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 3px;
    background: linear-gradient(to right, var(--primary), var(--success));
    animation: loading 1.5s ease-in-out infinite;
    z-index: 1002;
}

@keyframes loading {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

/* Responsive Design */
@media (max-width: 768px) {
    .sidebar {
        transform: translateX(-100%);
    }

    .sidebar.active {
        transform: translateX(0);
    }

    .toggle-btn {
        display: block;
    }

    .dashboard {
        margin-left: 0;
        padding: 20px;
    }

    .charts-container {
        grid-template-columns: 1fr;
    }
    
    .stat-card {
        padding: 20px;
    }
    
    .stat-card .value {
        font-size: 2em;
    }
    
    .welcome-message {
        font-size: 1.8em;
        padding: 24px;
    }
}

/* Custom Scrollbar */
::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: #f1f5f9;
}

::-webkit-scrollbar-thumb {
    background: #cbd5e1;
    border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
    background: #94a3b8;
}

/* Add this to your body tag to enable smooth scrolling */
html {
    scroll-behavior: smooth;
}
</style>
</head>
<body>

    <!-- New Sidebar Toggle Button -->
    <button class="toggle-btn">☰</button>

    <!-- New Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="logo">Revshop_2</div>
        </div>
        
        <ul class="menu-list">
            <a href="/dashboard/stats" class="menu-item active">
                <span class="menu-icon">📊</span>
                <span class="menu-text">Stats</span>
            </a>
            
            <a href="javascript:void(0);" class="menu-item" id="dashboard-link">
    		<span class="menu-icon">🛍️</span>
    		<span class="menu-text">Dashboard</span>
		</a>
		

            
            <a href="javascript:void(0);" class="menu-item"id="addCategory-Link">
                <span class="menu-icon">📦</span>
                <span class="menu-text">Add-Category</span>
            </a>
            
            <a href="javascript:void(0);" class="menu-item"id="addSubCategory-Link">
                <span class="menu-icon">👥</span>
                <span class="menu-text">Add-SubCategory</span>
            </a>
            
            <a href="javascript:void(0)" class="menu-item"id = "Orders-Link">
                <span class="menu-icon">⚙️</span>
                <span class="menu-text">Orders</span>
            </a>
        </ul>
    </div>

    <!-- Your existing dashboard content -->
    <div class="dashboard">
        <!-- Statistics Section -->
        <div class="stats-container">
            <div class="stat-card">
                <h3>Total Sellers</h3>
                <div class="value"><%= request.getAttribute("dashboardStats") != null ? ((com.example.entity.DashboardStats) request.getAttribute("dashboardStats")).getTotalSellers() : 0 %></div>
                <div class="stat-icon">🛒</div>
            </div>
            <div class="stat-card">
                <h3>Total Buyers</h3>
                <div class="value"><%= request.getAttribute("dashboardStats") != null ? ((com.example.entity.DashboardStats) request.getAttribute("dashboardStats")).getTotalBuyers() : 0 %></div>
                <div class="stat-icon">👥</div>
            </div>
            <div class="stat-card">
                <h3>Total Orders</h3>
                <div class="value"><%= request.getAttribute("dashboardStats") != null ? ((com.example.entity.DashboardStats) request.getAttribute("dashboardStats")).getTotalOrders() : 0 %></div>
                <div class="stat-icon">📦</div>
            </div>
            <div class="stat-card">
                <h3>Total Sales</h3>
                <div class="value">$<%= request.getAttribute("dashboardStats") != null ? ((com.example.entity.DashboardStats) request.getAttribute("dashboardStats")).getTotalSales() : 0 %></div>
                <div class="stat-icon">💰</div>
            </div>
        </div>
        

      <!--  <!--  <!-- Charts Section -->
      <div class="chart-card">
    <h3 class="welcome-message">Welcome, Admin!</h3>
</div>
        
   
    <script>
 // Handle the "Dashboard" button click event
    document.getElementById('dashboard-link').addEventListener('click', function() {
        // Fetch the content dynamically from the server
        fetch('/admin') // Replace with your actual URL endpoint
            .then(response => response.text())
            .then(data => {
                // Inject the content into the dynamic content area
                document.querySelector('.dashboard').innerHTML = data;
            })
            .catch(error => console.error('Error loading dashboard content:', error));
        
        // Optionally, highlight the active menu item
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => item.classList.remove('active'));
        this.classList.add('active');
    });
    
/////////////////////////////////////////////////////

 // Handle the "Dashboard" button click event
    document.getElementById('addCategory-Link').addEventListener('click', function() {
        // Fetch the content dynamically from the server
        fetch('/admin/addCategory') // Replace with your actual URL endpoint
            .then(response => response.text())
            .then(data => {
                // Inject the content into the dynamic content area
                document.querySelector('.dashboard').innerHTML = data;
            })
            .catch(error => console.error('Error loading dashboard content:', error));
        
        // Optionally, highlight the active menu item
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => item.classList.remove('active'));
        this.classList.add('active');
    });
    //////////////////////////////////////////////////////////
     // Handle the "Dashboard" button click event
    document.getElementById('addSubCategory-Link').addEventListener('click', function() {
        // Fetch the content dynamically from the server
        fetch('/admin/addSubcategory') // Replace with your actual URL endpoint
            .then(response => response.text())
            .then(data => {
                // Inject the content into the dynamic content area
                document.querySelector('.dashboard').innerHTML = data;
            })
            .catch(error => console.error('Error loading dashboard content:', error));
        
        // Optionally, highlight the active menu item
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => item.classList.remove('active'));
        this.classList.add('active');
    });
    //////////////////////////////////////////////////////////
     document.getElementById('Orders-Link').addEventListener('click', function() {
        // Fetch the content dynamically from the server
        fetch('/admin/orders') // Replace with your actual URL endpoint
            .then(response => response.text())
            .then(data => {
                // Inject the content into the dynamic content area
                document.querySelector('.dashboard').innerHTML = data;
            })
            .catch(error => console.error('Error loading dashboard content:', error));
        
        // Optionally, highlight the active menu item
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => item.classList.remove('active'));
        this.classList.add('active');
    });

    
        // Your existing chart JavaScript
        function updateDashboardCharts(data) {
            // Monthly Orders Chart
            new Chart(document.getElementById('ordersChart'), {
                type: 'line',
                data: {
                    labels: data.monthlyOrders.map(item => item.month),
                    datasets: [{
                        label: 'Orders',
                        data: data.monthlyOrders.map(item => item.count),
                        borderColor: '#3b82f6',
                        backgroundColor: '#93c5fd20',
                        tension: 0.3,
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        }
                    }
                }
            });

            // Monthly Sales Chart
            new Chart(document.getElementById('salesChart'), {
                type: 'bar',
                data: {
                    labels: data.monthlySales.map(item => item.month),
                    datasets: [{
                        label: 'Sales',
                        data: data.monthlySales.map(item => item.amount),
                        backgroundColor: '#10b981'
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        }
                    }
                }
            });
        }

        // Get data from the JSP model attribute and update the charts
        const dashboardData = <%= request.getAttribute("dashboardStats") != null ? new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(request.getAttribute("dashboardStats")) : "{}" %>;
        updateDashboardCharts(JSON.parse(dashboardData));

        // New JavaScript for sidebar toggle
        const toggleBtn = document.querySelector('.toggle-btn');
        const sidebar = document.querySelector('.sidebar');
        
        toggleBtn.addEventListener('click', () => {
            sidebar.classList.toggle('active');
        });

        // Handle menu item clicks
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => {
            item.addEventListener('click', () => {
                // Remove active class from all items
                menuItems.forEach(i => i.classList.remove('active'));
                // Add active class to clicked item
                item.classList.add('active');
                
                // On mobile, close sidebar after click
                if (window.innerWidth <= 768) {
                    sidebar.classList.remove('active');
                }
            });
        });
    </script>
</body>
</html>