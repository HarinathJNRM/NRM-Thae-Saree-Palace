<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.nrmpattusaries.model.User" %>
<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>
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

/* ── Topbar ── */
.topbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 28px;
}

.topbar-left .topbar-eyebrow {
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: #888780;
    margin-bottom: 4px;
}

.topbar-left .topbar-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: 26px;
    font-weight: 600;
    color: #2C2C2A;
    letter-spacing: -0.3px;
}

.user-count-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: #ffffff;
    border: 0.5px solid #D3D1C7;
    border-radius: 20px;
    padding: 6px 14px;
    font-size: 12px;
    color: #5F5E5A;
}

.user-count-badge svg {
    width: 13px;
    height: 13px;
    stroke: #888780;
    fill: none;
    stroke-width: 1.75;
    stroke-linecap: round;
    stroke-linejoin: round;
}

/* ── Card ── */
.card {
    background: #ffffff;
    border-radius: 14px;
    border: 0.5px solid #D3D1C7;
    overflow: hidden;
}

/* ── Search bar ── */
.card-toolbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 20px;
    border-bottom: 0.5px solid #D3D1C7;
    gap: 12px;
}

.search-wrap {
    position: relative;
    flex: 1;
    max-width: 340px;
}

.search-wrap svg {
    position: absolute;
    left: 12px;
    top: 50%;
    transform: translateY(-50%);
    width: 14px;
    height: 14px;
    stroke: #B4B2A9;
    fill: none;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
    pointer-events: none;
}

.search-wrap input[type="text"] {
    width: 100%;
    padding: 9px 14px 9px 36px;
    font-size: 13px;
    font-family: 'DM Sans', sans-serif;
    background: #F1EFE8;
    border: 0.5px solid #D3D1C7;
    border-radius: 8px;
    color: #2C2C2A;
    transition: border-color 0.15s, box-shadow 0.15s;
}

.search-wrap input[type="text"]:focus {
    outline: none;
    border-color: #7F77DD;
    box-shadow: 0 0 0 3px rgba(127,119,221,0.1);
    background: #ffffff;
}

.search-wrap input::placeholder { color: #B4B2A9; }

.btn-search {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: #3C3489;
    color: #EEEDFE;
    border: none;
    border-radius: 8px;
    padding: 9px 16px;
    font-size: 12px;
    font-family: 'DM Sans', sans-serif;
    font-weight: 500;
    letter-spacing: 0.3px;
    cursor: pointer;
    transition: background 0.15s;
}

.btn-search:hover { background: #534AB7; }

.btn-search svg {
    width: 13px;
    height: 13px;
    stroke: currentColor;
    fill: none;
    stroke-width: 2.5;
    stroke-linecap: round;
    stroke-linejoin: round;
}

/* ── Table ── */
.users-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
}

.users-table thead tr {
    background: #F1EFE8;
}

.users-table th {
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

.users-table td {
    padding: 13px 20px;
    color: #2C2C2A;
    border-bottom: 0.5px solid #D3D1C7;
    vertical-align: middle;
}

.users-table tbody tr:last-child td {
    border-bottom: none;
}

.users-table tbody tr:hover td {
    background: #FAFAF8;
}

/* ID chip */
.user-id {
    font-family: monospace;
    font-size: 12px;
    color: #5F5E5A;
    background: #F1EFE8;
    border: 0.5px solid #D3D1C7;
    border-radius: 5px;
    padding: 2px 7px;
}

/* Avatar + name */
.user-name-cell {
    display: flex;
    align-items: center;
    gap: 10px;
}

.user-avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background: linear-gradient(135deg, #EEEDFE, #D3D0F7);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 11px;
    font-weight: 600;
    color: #534AB7;
    flex-shrink: 0;
    text-transform: uppercase;
}

/* Role badge */
.role-badge {
    display: inline-block;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 500;
}

.role-admin    { background: #FAEEDA; color: #854F0B; }
.role-user     { background: #EEEDFE; color: #534AB7; }
.role-default  { background: #F1EFE8; color: #5F5E5A; }

/* Delete button */
.delete-btn {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    background: #FCEBEB;
    color: #A32D2D;
    border: 0.5px solid #F09595;
    border-radius: 7px;
    padding: 6px 12px;
    font-size: 11px;
    font-weight: 500;
    font-family: 'DM Sans', sans-serif;
    text-decoration: none;
    transition: background 0.15s, border-color 0.15s;
}

.delete-btn:hover {
    background: #f8d7d7;
    border-color: #D63B3B;
}

.delete-btn svg {
    width: 12px;
    height: 12px;
    stroke: currentColor;
    fill: none;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
}

/* ── Responsive ── */
@media (max-width: 900px) {
    .sidebar { display: none; }
    .main-content { padding: 20px; }
}
</style>
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
        <a href="orders">
            <svg viewBox="0 0 24 24"><path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 01-8 0"/></svg>
            Orders
        </a>
        <a href="manage-users" class="active">
            <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg>
            Users
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
            <div class="topbar-left">
                <p class="topbar-eyebrow">Admin Panel</p>
                <h1 class="topbar-title">User Management</h1>
            </div>
            <div class="user-count-badge">
                <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg>
                All Users
            </div>
        </div>

        <div class="card">
            <!-- SEARCH -->
            <form action="manage-users" method="get" class="card-toolbar">
                <div class="search-wrap">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <circle cx="11" cy="11" r="8"/>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                    </svg>
                    <input type="text"
                           name="keyword"
                           placeholder="Search by name, email or role…">
                </div>
                <button type="submit" class="btn-search">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <circle cx="11" cy="11" r="8"/>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                    </svg>
                    Search
                </button>
            </form>

            <!-- TABLE -->
            <table class="users-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                List<User> users = (List<User>) request.getAttribute("users");
                for (User user : users) {
                    String role = user.getRole();
                    String roleClass = "role-default";
                    if ("ADMIN".equalsIgnoreCase(role))      roleClass = "role-admin";
                    else if ("USER".equalsIgnoreCase(role))  roleClass = "role-user";
                    String initials = user.getName() != null && user.getName().length() > 0
                        ? String.valueOf(user.getName().charAt(0)) : "?";
                %>
                    <tr>
                        <td><span class="user-id">#<%= user.getUserId() %></span></td>
                        <td>
                            <div class="user-name-cell">
                                <div class="user-avatar"><%= initials %></div>
                                <%= user.getName() %>
                            </div>
                        </td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhone() %></td>
                        <td><span class="role-badge <%= roleClass %>"><%= user.getRole() %></span></td>
                        <td>
                            <a href="DeleteUser?id=<%= user.getUserId() %>" class="delete-btn">
                                <svg viewBox="0 0 24 24" aria-hidden="true">
                                    <polyline points="3 6 5 6 21 6"/>
                                    <path d="M19 6l-1 14a2 2 0 01-2 2H8a2 2 0 01-2-2L5 6"/>
                                    <path d="M10 11v6M14 11v6"/>
                                    <path d="M9 6V4h6v2"/>
                                </svg>
                                Delete
                            </a>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>

    </div><!-- /.main-content -->
</div><!-- /.dashboard-layout -->

</body>
</html>
