<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.nrmpattusaries.model.Order" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Orders — NRM The Saree Palace</title>
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

.sidebar-spacer { flex: 1; }

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

.section-eyebrow {
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: #888780;
    margin-bottom: 16px;
}

/* ── Summary cards ── */
.summary-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 16px;
    margin-bottom: 20px;
}

.card {
    background: #ffffff;
    border-radius: 14px;
    border: 0.5px solid #D3D1C7;
    overflow: hidden;
}

.card-stripe { height: 3px; }

.card-inner {
    padding: 20px 20px 22px;
}

.card-icon {
    width: 34px;
    height: 34px;
    border-radius: 9px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 14px;
}

.card h2 {
    font-size: 32px;
    font-weight: 500;
    color: #2C2C2A;
    line-height: 1;
    margin-bottom: 5px;
    letter-spacing: -1px;
}

.card p {
    font-size: 12px;
    font-weight: 400;
    color: #888780;
    letter-spacing: 0.2px;
}

/* colour themes */
.s-pending   .card-stripe { background: #EF9F27; }
.s-confirmed .card-stripe { background: #378ADD; }
.s-shipped   .card-stripe { background: #7F77DD; }
.s-delivered .card-stripe { background: #639922; }
.s-cancelled .card-stripe { background: #D63B3B; }

.s-pending   .card-icon { background: #FAEEDA; color: #854F0B; }
.s-confirmed .card-icon { background: #E6F1FB; color: #185FA5; }
.s-shipped   .card-icon { background: #EEEDFE; color: #534AB7; }
.s-delivered .card-icon { background: #EAF3DE; color: #3B6D11; }
.s-cancelled .card-icon { background: #FCEBEB; color: #A32D2D; }

/* ── Orders table section ── */
.orders-section {
    background: #ffffff;
    border-radius: 14px;
    border: 0.5px solid #D3D1C7;
    overflow: hidden;
}

.orders-section-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 18px 24px 14px;
    border-bottom: 0.5px solid #D3D1C7;
}

.orders-section-header-left {
    display: flex;
    align-items: center;
    gap: 9px;
}

.orders-section-header h2 {
    font-family: 'Cormorant Garamond', serif;
    font-size: 20px;
    font-weight: 600;
    color: #2C2C2A;
    letter-spacing: -0.3px;
}

.header-icon {
    width: 16px;
    height: 16px;
    stroke: #888780;
    fill: none;
    stroke-width: 1.75;
    stroke-linecap: round;
    stroke-linejoin: round;
}

.order-total-badge {
    font-size: 11px;
    font-weight: 500;
    color: #534AB7;
    background: #EEEDFE;
    border: 0.5px solid #AFA9EC;
    border-radius: 20px;
    padding: 4px 12px;
}

/* ── Table ── */
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
    white-space: nowrap;
}

.orders-table td {
    padding: 13px 20px;
    color: #2C2C2A;
    border-bottom: 0.5px solid #D3D1C7;
    vertical-align: middle;
    font-size: 13px;
}

.orders-table tbody tr:last-child td { border-bottom: none; }

.orders-table tbody tr:hover td {
    background: #F1EFE8;
    transition: background 0.1s;
}

/* order id chip */
.order-id {
    font-family: monospace;
    font-size: 12px;
    color: #5F5E5A;
    background: #F1EFE8;
    border: 0.5px solid #D3D1C7;
    border-radius: 5px;
    padding: 2px 7px;
}

/* user cell */
.user-cell {
    display: flex;
    align-items: center;
    gap: 8px;
}

.user-avatar {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: linear-gradient(135deg, #7F77DD, #534AB7);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 11px;
    font-weight: 600;
    color: #fff;
    flex-shrink: 0;
}

/* ── Status badges ── */
.status-badge {
    display: inline-block;
    padding: 4px 11px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.3px;
}

.status-pending   { background: #FAEEDA; color: #854F0B; }
.status-confirmed { background: #E6F1FB; color: #185FA5; }
.status-placed    { background: #EEEDFE; color: #534AB7; }
.status-shipped   { background: #EEEDFE; color: #534AB7; }
.status-delivered { background: #EAF3DE; color: #3B6D11; }
.status-cancelled { background: #FCEBEB; color: #A32D2D; }
.status-default   { background: #EEEDFE; color: #534AB7; }

/* ── Empty state ── */
.empty-state {
    padding: 56px 24px;
    text-align: center;
}

.empty-icon {
    font-size: 40px;
    margin-bottom: 12px;
    opacity: .35;
}

.empty-state p {
    font-size: 14px;
    color: #888780;
}

/* ── Table footer ── */
.table-footer {
    padding: 12px 20px;
    border-top: 0.5px solid #D3D1C7;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: #FAFAF8;
}

.table-footer-note {
    font-size: 12px;
    color: #888780;
}

/* ── Responsive ── */
@media (max-width: 1100px) {
    .summary-grid { grid-template-columns: repeat(3, 1fr); }
}

@media (max-width: 768px) {
    .summary-grid { grid-template-columns: repeat(2, 1fr); }
    .orders-table th:nth-child(2),
    .orders-table td:nth-child(2) { display: none; }
    .main-content { padding: 24px 20px; }
}

@media (max-width: 520px) {
    .orders-table th:nth-child(5),
    .orders-table td:nth-child(5) { display: none; }
}
</style>
</head>
<body>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    if (orders == null) orders = new ArrayList<>();

    int cntPending = 0, cntConfirmed = 0, cntShipped = 0, cntDelivered = 0, cntCancelled = 0;
    for (Order o : orders) {
        String st = o.getStatus() == null ? "" : o.getStatus().trim().toUpperCase();
        if      (st.equals("PENDING"))               cntPending++;
        else if (st.equals("CONFIRMED") || st.equals("PLACED")) cntConfirmed++;
        else if (st.equals("SHIPPED"))               cntShipped++;
        else if (st.equals("DELIVERED"))             cntDelivered++;
        else if (st.equals("CANCELLED"))             cntCancelled++;
    }
%>

<div class="dashboard-layout">

    <!-- ── SIDEBAR ── -->
    <aside class="sidebar">
        <div class="sidebar-logo">
            <div class="sidebar-logo-mark">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F1EFE8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/>
                </svg>
            </div>
            <div>
                <div class="sidebar-logo-text">NRM Pattusarees</div>
                <div class="sidebar-logo-sub">Admin Panel</div>
            </div>
        </div>

        <div class="sidebar-section-label">Main Menu</div>

        <a href="admin-dashboard">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg>
            Dashboard
        </a>
        <a href="AdminSareeList">
            <svg viewBox="0 0 24 24"><path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/></svg>
            Manage Sarees
        </a>
        <a href="admin-orders" class="active">
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

    <!-- ── MAIN CONTENT ── -->
    <div class="main-content">

        <div class="topbar">
            <h1 class="topbar-title">Order Management</h1>
            <span class="topbar-date" id="js-date"></span>
        </div>

        <!-- Summary strip -->
        <p class="section-eyebrow">Overview</p>
        <div class="summary-grid">

            <div class="card s-pending">
                <div class="card-stripe"></div>
                <div class="card-inner">
                    <div class="card-icon">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/>
                        </svg>
                    </div>
                    <h2><%= cntPending %></h2>
                    <p>Pending</p>
                </div>
            </div>

            <div class="card s-confirmed">
                <div class="card-stripe"></div>
                <div class="card-inner">
                    <div class="card-icon">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 11.08V12a10 10 0 11-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
                        </svg>
                    </div>
                    <h2><%= cntConfirmed %></h2>
                    <p>Confirmed</p>
                </div>
            </div>

            <div class="card s-shipped">
                <div class="card-stripe"></div>
                <div class="card-inner">
                    <div class="card-icon">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="1" y="3" width="15" height="13"/><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/>
                        </svg>
                    </div>
                    <h2><%= cntShipped %></h2>
                    <p>Shipped</p>
                </div>
            </div>

            <div class="card s-delivered">
                <div class="card-stripe"></div>
                <div class="card-inner">
                    <div class="card-icon">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="20 6 9 17 4 12"/>
                        </svg>
                    </div>
                    <h2><%= cntDelivered %></h2>
                    <p>Delivered</p>
                </div>
            </div>

            <div class="card s-cancelled">
                <div class="card-stripe"></div>
                <div class="card-inner">
                    <div class="card-icon">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/>
                        </svg>
                    </div>
                    <h2><%= cntCancelled %></h2>
                    <p>Cancelled</p>
                </div>
            </div>

        </div>

        <!-- Orders Table -->
        <div class="orders-section">
            <div class="orders-section-header">
                <div class="orders-section-header-left">
                    <svg class="header-icon" viewBox="0 0 24 24">
                        <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/>
                        <line x1="3" y1="6" x2="21" y2="6"/>
                        <path d="M16 10a4 4 0 01-8 0"/>
                    </svg>
                    <h2>All Orders</h2>
                </div>
                <span class="order-total-badge"><%= orders.size() %> total</span>
            </div>

            <% if (orders.isEmpty()) { %>
                <div class="empty-state">
                    <div class="empty-icon">📦</div>
                    <p>No orders found yet.</p>
                </div>
            <% } else { %>

                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>User</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Order order : orders) {
                            String rawStatus = order.getStatus() == null ? "PENDING" : order.getStatus().trim();
                            String statusClass = "status-" + rawStatus.toLowerCase();
                            String userId = String.valueOf(order.getUserId());
                            String avatarLetter = userId.length() > 0 ? userId.substring(0, 1).toUpperCase() : "U";
                    %>
                        <tr>
                            <td><span class="order-id">#<%= order.getOrderId() %></span></td>
                            <td>
                                <div class="user-cell">
                                    <div class="user-avatar"><%= avatarLetter %></div>
                                    <%= order.getUserId() %>
                                </div>
                            </td>
                            <td>&#8377; <%= order.getTotalAmount() %></td>
                            <td>
                                <span class="status-badge <%= statusClass %>">
                                    <%= rawStatus %>
                                </span>
                            </td>
                            <td><%= order.getOrderDate() %></td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>

                <div class="table-footer">
                    <span class="table-footer-note">Showing <%= orders.size() %> order<%= orders.size() != 1 ? "s" : "" %></span>
                </div>

            <% } %>
        </div>

    </div><!-- /.main-content -->
</div><!-- /.dashboard-layout -->

<script>
    const dateEl = document.getElementById('js-date');
    if (dateEl) {
        dateEl.textContent = new Date().toLocaleDateString('en-IN', {
            weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
        });
    }
</script>

</body>
</html>
