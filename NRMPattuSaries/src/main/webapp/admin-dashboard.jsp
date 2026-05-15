<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.nrmpattusaries.model.Order, com.nrmpattusaries.model.Saree, java.util.List" %>
<%@ page import="com.nrmpattusaries.model.Order, com.nrmpattusaries.model.Saree, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
*, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'DM Sans', sans-serif;
    background: #F1EFE8;
    min-height: 100vh;
}

/* ── Dashboard layout ── */
.dashboard-layout {
    display: flex;
    min-height: 100vh;
}

/* ── Sidebar ── */
.sidebar {
    width: 240px;
    flex-shrink: 0;
    background: #1A1A28;
    display: flex;
    flex-direction: column;
    padding: 28px 16px 24px;
    position: sticky;
    top: 0;
    height: 100vh;
    overflow-y: auto;
}

.sidebar-logo {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 0 8px 28px;
    border-bottom: 0.5px solid rgba(255,255,255,0.08);
    margin-bottom: 20px;
}

.sidebar-logo-mark {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    background: linear-gradient(135deg, #7F77DD, #534AB7);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.sidebar-logo-text {
    font-family: 'Cormorant Garamond', serif;
    font-size: 17px;
    font-weight: 600;
    color: #F1EFE8;
    letter-spacing: -0.2px;
    line-height: 1.2;
}

.sidebar-logo-sub {
    font-size: 10px;
    color: #6B6A7A;
    letter-spacing: 1px;
    text-transform: uppercase;
    font-family: 'DM Sans', sans-serif;
}

.sidebar-section-label {
    font-size: 9px;
    font-weight: 500;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: #4D4C60;
    padding: 0 10px;
    margin-bottom: 6px;
}

.sidebar a {
    display: flex;
    align-items: center;
    gap: 10px;
    color: #9998B0;
    text-decoration: none;
    padding: 10px 12px;
    margin-bottom: 2px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 400;
    transition: background 0.15s, color 0.15s;
}

.sidebar a:hover {
    background: rgba(255,255,255,0.06);
    color: #F1EFE8;
}

.sidebar a.active {
    background: rgba(127,119,221,0.18);
    color: #A9A4EE;
    font-weight: 500;
}

.sidebar a svg {
    width: 15px;
    height: 15px;
    stroke: currentColor;
    fill: none;
    stroke-width: 1.75;
    stroke-linecap: round;
    stroke-linejoin: round;
    flex-shrink: 0;
    opacity: 0.8;
}

.sidebar-spacer {
    flex: 1;
}

.sidebar-logout {
    border-top: 0.5px solid rgba(255,255,255,0.08);
    padding-top: 16px;
    margin-top: 8px;
}

/* ── Main content ── */
.main-content {
    flex: 1;
    background: #F1EFE8;
    padding: 32px 36px;
    min-width: 0;
}

.topbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 28px;
}

.topbar-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: 26px;
    font-weight: 600;
    color: #2C2C2A;
    letter-spacing: -0.3px;
}

.topbar-date {
    font-size: 12px;
    color: #888780;
}

/* ── Page body ── */
.page-body {
    display: flex;
    flex-direction: column;
    gap: 0;
}

.section-eyebrow {
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: #888780;
    margin-bottom: 16px;
}

/* ── Card grid ── */
.container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
}

/* ── Metric card ── */
.card {
    background: #ffffff;
    border-radius: 14px;
    border: 0.5px solid #D3D1C7;
    overflow: hidden;
}

.card-stripe {
    height: 3px;
}

.card-inner {
    padding: 22px 22px 24px;
}

.card-icon {
    width: 36px;
    height: 36px;
    border-radius: 9px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 17px;
    margin-bottom: 16px;
}

.card h2 {
    font-size: 36px;
    font-weight: 500;
    color: #2C2C2A;
    line-height: 1;
    margin-bottom: 6px;
    letter-spacing: -1px;
}

.card p {
    font-size: 12px;
    font-weight: 400;
    color: #888780;
    letter-spacing: 0.2px;
}

/* ── Color themes ── */
.users   .card-stripe  { background: #378ADD; }
.sarees  .card-stripe  { background: #7F77DD; }
.orders  .card-stripe  { background: #EF9F27; }
.revenue .card-stripe  { background: #639922; }

.users   .card-icon { background: #E6F1FB; color: #185FA5; }
.sarees  .card-icon { background: #EEEDFE; color: #534AB7; }
.orders  .card-icon { background: #FAEEDA; color: #854F0B; }
.revenue .card-icon { background: #EAF3DE; color: #3B6D11; }

/* ── Recent Orders ── */
.orders-section {
    margin-top: 28px;
    background: #ffffff;
    border-radius: 14px;
    border: 0.5px solid #D3D1C7;
    overflow: hidden;
}

.orders-section-header {
    display: flex;
    align-items: center;
    gap: 9px;
    padding: 18px 24px 14px;
    border-bottom: 0.5px solid #D3D1C7;
}

.orders-section-header h2 {
    font-family: 'Cormorant Garamond', serif;
    font-size: 20px;
    font-weight: 600;
    color: #2C2C2A;
    letter-spacing: -0.3px;
}

.orders-section-header svg {
    color: #888780;
}

.orders-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
}

.orders-table thead tr {
    background: #F1EFE8;
}

.orders-table th {
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 1.2px;
    text-transform: uppercase;
    color: #888780;
    padding: 10px 20px;
    text-align: left;
    border-bottom: 0.5px solid #D3D1C7;
}

.orders-table td {
    padding: 13px 20px;
    color: #2C2C2A;
    border-bottom: 0.5px solid #D3D1C7;
    vertical-align: middle;
}

.orders-table tbody tr:last-child td {
    border-bottom: none;
}

.orders-table tbody tr:hover td {
    background: #F1EFE8;
    transition: background 0.1s;
}

.order-id {
    font-family: monospace;
    font-size: 12px;
    color: #5F5E5A;
    background: #F1EFE8;
    border: 0.5px solid #D3D1C7;
    border-radius: 5px;
    padding: 2px 7px;
}

.status-badge {
    display: inline-block;
    padding: 4px 11px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 500;
}

/* Status colours — set dynamically via scriptlet class logic */
.status-pending   { background: #FAEEDA; color: #854F0B; }
.status-delivered { background: #EAF3DE; color: #3B6D11; }
.status-cancelled { background: #FCEBEB; color: #A32D2D; }
.status-default   { background: #EEEDFE; color: #534AB7; }

/* ── Status select ── */
.status-form {
    margin: 0;
}

.status-select {
    appearance: none;
    font-family: 'DM Sans', sans-serif;
    font-size: 11px;
    font-weight: 500;
    padding: 5px 28px 5px 11px;
    border-radius: 20px;
    border: 0.5px solid transparent;
    cursor: pointer;
    background-repeat: no-repeat;
    background-position: right 9px center;
    background-size: 10px;
    transition: opacity 0.15s;
}

.status-select:focus {
    outline: none;
    box-shadow: 0 0 0 2px rgba(127, 119, 221, 0.2);
}

.status-select:hover { opacity: 0.85; }

/* Colour variants match badge colours */
.select-placed    { background-color: #EEEDFE; color: #534AB7; border-color: #AFA9EC;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='10' viewBox='0 0 24 24' fill='none' stroke='%23534AB7' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'/%3E%3C/svg%3E"); }
.select-shipped   { background-color: #E6F1FB; color: #185FA5; border-color: #85B7EB;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='10' viewBox='0 0 24 24' fill='none' stroke='%23185FA5' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'/%3E%3C/svg%3E"); }
.select-delivered { background-color: #EAF3DE; color: #3B6D11; border-color: #97C459;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='10' viewBox='0 0 24 24' fill='none' stroke='%233B6D11' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'/%3E%3C/svg%3E"); }
.select-cancelled { background-color: #FCEBEB; color: #A32D2D; border-color: #F09595;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='10' viewBox='0 0 24 24' fill='none' stroke='%23A32D2D' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'/%3E%3C/svg%3E"); }

/* ── Low Stock Alerts ── */
.stock-section {
    margin-top: 20px;
    background: #ffffff;
    border-radius: 14px;
    border: 0.5px solid #D3D1C7;
    overflow: hidden;
}

.stock-section-header {
    display: flex;
    align-items: center;
    gap: 9px;
    padding: 18px 24px 14px;
    border-bottom: 0.5px solid #D3D1C7;
}

.stock-section-header h2 {
    font-family: 'Cormorant Garamond', serif;
    font-size: 20px;
    font-weight: 600;
    color: #A32D2D;
    letter-spacing: -0.3px;
}

.stock-section-header .alert-icon {
    width: 30px;
    height: 30px;
    border-radius: 8px;
    background: #FCEBEB;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.stock-section-body {
    padding: 16px 24px 20px;
}

.stock-all-good {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 13px;
    color: #3B6D11;
    background: #EAF3DE;
    border: 0.5px solid #97C459;
    border-radius: 8px;
    padding: 11px 14px;
}

.stock-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 12px 16px;
    margin-bottom: 8px;
    background: #FEF6F6;
    border: 0.5px solid #F09595;
    border-left: 3px solid #D63B3B;
    border-radius: 8px;
}

.stock-item:last-child {
    margin-bottom: 0;
}

.stock-item-name {
    font-size: 13px;
    font-weight: 500;
    color: #2C2C2A;
}

.stock-item-count {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    font-size: 11px;
    font-weight: 500;
    color: #A32D2D;
    background: #FCEBEB;
    border: 0.5px solid #F09595;
    border-radius: 20px;
    padding: 3px 10px;
    white-space: nowrap;
}

/* ── Responsive ── */
@media (max-width: 900px) {
    .container {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 500px) {
    .container {
        grid-template-columns: 1fr;
    }
    .navbar {
        padding: 14px 20px;
    }
}
/* ── Chart section ── */
.chart-section {
    margin-top: 20px;
    background: #ffffff;
    border-radius: 14px;
    border: 0.5px solid #D3D1C7;
    overflow: hidden;
}

.chart-section-header {
    display: flex;
    align-items: center;
    gap: 9px;
    padding: 18px 24px 14px;
    border-bottom: 0.5px solid #D3D1C7;
}

.chart-section-header h2 {
    font-family: 'Cormorant Garamond', serif;
    font-size: 20px;
    font-weight: 600;
    color: #2C2C2A;
    letter-spacing: -0.3px;
}

.chart-section-header .chart-icon {
    width: 30px;
    height: 30px;
    border-radius: 8px;
    background: #EEEDFE;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.chart-section-body {
    padding: 20px 24px 24px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="dashboard-layout">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <div class="sidebar-logo">
            <div class="sidebar-logo-mark">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F1EFE8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/>
                </svg>
            </div>
            <div>
                <div class="sidebar-logo-text">NRM The Saree Palace</div>
                <div class="sidebar-logo-sub">Admin Panel</div>
            </div>
        </div>

        <div class="sidebar-section-label">Main Menu</div>

        <a href="admin-dashboard" class="active">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg>
            Dashboard
        </a>
        <a href="AdminSareeList">
            <svg viewBox="0 0 24 24"><path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/></svg>
            Manage Sarees
        </a>
        <a href="admin-orders">
            <svg viewBox="0 0 24 24"><path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 01-8 0"/></svg>
            Orders
        </a>
        <a href="manage-users">
            <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg>
            Users
        </a>
        <a href="about">
            <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            About Us
        </a>

        <div class="sidebar-spacer"></div>

        <div class="sidebar-logout">
            <a href="logout">
                <svg viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 01-2-2V5a2 2 0 012-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
                Logout
            </a>
        </div>
    </aside>

    <!-- MAIN CONTENT -->
    <div class="main-content">

        <div class="topbar">
            <h1 class="topbar-title">Dashboard Overview</h1>
            <span class="topbar-date" id="js-date"></span>
        </div>

        <div class="page-body">
    <p class="section-eyebrow">Overview</p>
    <div class="container">

        <!-- USERS -->
        <div class="card users">
            <div class="card-stripe"></div>
            <div class="card-inner">
                <div class="card-icon">
                    <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 00-3-3.87"/>
                        <path d="M16 3.13a4 4 0 010 7.75"/>
                    </svg>
                </div>
                <h2>${totalUsers}</h2>
                <p>Total Users</p>
            </div>
        </div>

        <!-- SAREES -->
        <div class="card sarees">
            <div class="card-stripe"></div>
            <div class="card-inner">
                <div class="card-icon">
                    <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/>
                    </svg>
                </div>
                <h2>${totalSarees}</h2>
                <p>Total Sarees</p>
            </div>
        </div>

        <!-- ORDERS -->
        <div class="card orders">
            <div class="card-stripe"></div>
            <div class="card-inner">
                <div class="card-icon">
                    <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/>
                        <line x1="3" y1="6" x2="21" y2="6"/>
                        <path d="M16 10a4 4 0 01-8 0"/>
                    </svg>
                </div>
                <h2>${totalOrders}</h2>
                <p>Total Orders</p>
            </div>
        </div>

        <!-- REVENUE -->
        <div class="card revenue">
            <div class="card-stripe"></div>
            <div class="card-inner">
                <div class="card-icon">
                    <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <line x1="12" y1="1" x2="12" y2="23"/>
                        <path d="M17 5H9.5a3.5 3.5 0 000 7h5a3.5 3.5 0 010 7H6"/>
                    </svg>
                </div>
                <h2>&#8377; ${totalRevenue}</h2>
                <p>Total Revenue</p>
            </div>
        </div>

    </div>

    <!-- RECENT ORDERS -->
    <div class="orders-section">
        <div class="orders-section-header">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/>
                <polyline points="14 2 14 8 20 8"/>
                <line x1="16" y1="13" x2="8" y2="13"/>
                <line x1="16" y1="17" x2="8" y2="17"/>
                <polyline points="10 9 9 9 8 9"/>
            </svg>
            <h2>Recent Orders</h2>
        </div>
        <table class="orders-table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
            <%
            List<Order> recentOrders = (List<Order>) request.getAttribute("recentOrders");
            for (Order order : recentOrders) {
                String status = order.getStatus();
                String selectClass = "select-placed";
                if ("SHIPPED".equalsIgnoreCase(status))    selectClass = "select-shipped";
                else if ("DELIVERED".equalsIgnoreCase(status)) selectClass = "select-delivered";
                else if ("CANCELLED".equalsIgnoreCase(status)) selectClass = "select-cancelled";
            %>
                <tr>
                    <td><span class="order-id">#<%= order.getOrderId() %></span></td>
                    <td><%= order.getUserId() %></td>
                    <td>&#8377; <%= order.getTotalAmount() %></td>
                    <td>
                        <form action="UpdateOrderStatus" method="post" class="status-form">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                            <select name="status"
                                    class="status-select <%= selectClass %>"
                                    onchange="this.form.submit(); this.className='status-select ' + (['PLACED','SHIPPED','DELIVERED','CANCELLED'].indexOf(this.value) >= 0 ? 'select-' + this.value.toLowerCase() : 'select-placed');">
                                <option value="PLACED"    <%= order.getStatus().equals("PLACED")    ? "selected" : "" %>>PLACED</option>
                                <option value="SHIPPED"   <%= order.getStatus().equals("SHIPPED")   ? "selected" : "" %>>SHIPPED</option>
                                <option value="DELIVERED" <%= order.getStatus().equals("DELIVERED") ? "selected" : "" %>>DELIVERED</option>
                                <option value="CANCELLED" <%= order.getStatus().equals("CANCELLED") ? "selected" : "" %>>CANCELLED</option>
                            </select>
                        </form>
                    </td>
                    <td><%= order.getOrderDate() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <!-- LOW STOCK ALERT -->
    <div class="stock-section">
        <div class="stock-section-header">
            <div class="alert-icon">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#A32D2D" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z"/>
                    <line x1="12" y1="9" x2="12" y2="13"/>
                    <line x1="12" y1="17" x2="12.01" y2="17"/>
                </svg>
            </div>
            <h2>Low Stock Alerts</h2>
        </div>
        <div class="stock-section-body">
        <%
        List<Saree> lowStockSarees = (List<Saree>) request.getAttribute("lowStockSarees");
        if (lowStockSarees.isEmpty()) {
        %>
            <div class="stock-all-good">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#3B6D11" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <polyline points="20 6 9 17 4 12"/>
                </svg>
                All products are sufficiently stocked.
            </div>
        <%
        } else {
            for (Saree saree : lowStockSarees) {
        %>
            <div class="stock-item">
                <span class="stock-item-name"><%= saree.getName() %></span>
                <span class="stock-item-count">
                    <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M21 16V8a2 2 0 00-1-1.73l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.73l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"/>
                    </svg>
                    <%= saree.getStock() %> left
                </span>
            </div>
        <%
            }
        }
        %>
        </div>
    </div>

    <!-- REVENUE CHART -->
    <div class="chart-section">
        <div class="chart-section-header">
            <div class="chart-icon">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#534AB7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                    <polyline points="17 6 23 6 23 12"/>
                </svg>
            </div>
            <h2>Revenue Analytics</h2>
        </div>
        <div class="chart-section-body">
            <canvas id="revenueChart" height="100"></canvas>
        </div>
    </div>
    </div><!-- /.page-body -->
    </div><!-- /.main-content -->
</div><!-- /.dashboard-layout -->

<%
double[] revenue = (double[]) request.getAttribute("monthlyRevenue");
%>
<script>
const revenueData = [
<%
for (int i = 0; i < revenue.length; i++) {
    out.print(revenue[i]);
    if (i < revenue.length - 1) {
        out.print(",");
    }
}
%>
];

const dateEl = document.getElementById('js-date');
if (dateEl) {
    dateEl.textContent = new Date().toLocaleDateString('en-IN', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });
}

const ctx = document.getElementById('revenueChart');

new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
            label: 'Revenue (₹)',
            data: revenueData,
            borderColor: '#534AB7',
            backgroundColor: 'rgba(127, 119, 221, 0.08)',
            pointBackgroundColor: '#3C3489',
            pointBorderColor: '#ffffff',
            pointBorderWidth: 2,
            pointRadius: 5,
            borderWidth: 3,
            tension: 0.3,
            fill: true
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: true,
                labels: {
                    font: { family: 'DM Sans', size: 12 },
                    color: '#5F5E5A',
                    boxWidth: 12,
                    boxHeight: 12,
                    borderRadius: 4,
                    useBorderRadius: true
                }
            },
            tooltip: {
                backgroundColor: '#2C2C2A',
                titleFont: { family: 'DM Sans', size: 12 },
                bodyFont: { family: 'DM Sans', size: 12 },
                padding: 10,
                cornerRadius: 8,
                callbacks: {
                    label: ctx => ' ₹ ' + ctx.parsed.y.toLocaleString('en-IN')
                }
            }
        },
        scales: {
            x: {
                grid: { color: '#F1EFE8' },
                ticks: { font: { family: 'DM Sans', size: 11 }, color: '#888780' }
            },
            y: {
                grid: { color: '#F1EFE8' },
                ticks: {
                    font: { family: 'DM Sans', size: 11 },
                    color: '#888780',
                    callback: val => '₹' + (val / 1000) + 'k'
                }
            }
        }
    }
});
</script>

</body>
</html>



