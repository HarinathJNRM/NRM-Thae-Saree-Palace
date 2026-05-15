<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nrmpattusaries.model.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saree Collection — NRM The Saree Palace</title>
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
    :root {
        --crimson:      #8b1a2f;
        --crimson-dark: #5c0f1e;
        --gold:         #b8892a;
        --gold-light:   #d4a84b;
        --gold-pale:    #f5e6c8;
        --cream:        #faf6f0;
        --text-dark:    #2a1f18;
        --text-mid:     #6b5a4e;
        --text-light:   #a89080;
        --border:       #e2d5c8;
        --white:        #ffffff;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    html, body {
        font-family: 'Jost', sans-serif;
        background: var(--cream);
        color: var(--text-dark);
        min-height: 100vh;
    }

    /* ════════════════════════
       TOP NAV / HEADER
    ════════════════════════ */
    .site-header {
        background: var(--crimson-dark);
        position: relative;
        overflow: hidden;
        padding: 0 40px;
    }

    /* Silk weave texture */
    .site-header::before {
        content: '';
        position: absolute;
        inset: 0;
        background-image:
            repeating-linear-gradient(
                45deg,
                rgba(184,137,42,0.07) 0px, rgba(184,137,42,0.07) 1px,
                transparent 1px, transparent 8px
            ),
            repeating-linear-gradient(
                -45deg,
                rgba(184,137,42,0.05) 0px, rgba(184,137,42,0.05) 1px,
                transparent 1px, transparent 8px
            );
        z-index: 0;
    }

    .site-header::after {
        content: '';
        position: absolute;
        inset: 0;
        background: radial-gradient(ellipse 80% 120% at 50% -20%, rgba(139,26,47,0.0) 0%, rgba(92,15,30,0.6) 100%);
        z-index: 0;
    }

    .header-inner {
        position: relative;
        z-index: 1;
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 72px;
    }

    /* Logo */
    .logo-block {
        display: flex;
        align-items: center;
        gap: 14px;
        text-decoration: none;
    }

    .logo-emblem {
        width: 42px; height: 42px;
        border: 1.5px solid rgba(184,137,42,0.6);
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        flex-shrink: 0;
    }
    .logo-emblem::before {
        content: '';
        position: absolute;
        inset: 4px;
        border: 1px solid rgba(184,137,42,0.3);
    }
    .logo-letter {
        font-family: 'Libre Baskerville', serif;
        font-size: 18px;
        font-weight: 700;
        color: var(--gold-light);
        line-height: 1;
    }

    .logo-text {}
    .logo-title {
        font-family: 'Libre Baskerville', serif;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 2px;
        text-transform: uppercase;
        color: var(--gold-pale);
        line-height: 1.2;
    }
    .logo-sub {
        font-size: 10px;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: rgba(245,230,200,0.45);
        margin-top: 2px;
    }

    /* Add button in header */
    .btn-add {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 10px 22px;
        background: transparent;
        border: 1.5px solid rgba(184,137,42,0.55);
        color: var(--gold-light);
        font-family: 'Jost', sans-serif;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        text-decoration: none;
        border-radius: 2px;
        transition: background 0.2s, border-color 0.2s, color 0.2s;
        position: relative;
        overflow: hidden;
    }
    .btn-add::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.12), transparent);
        transform: skewX(-15deg);
        transition: left 0.5s;
    }
    .btn-add:hover {
        background: rgba(184,137,42,0.12);
        border-color: var(--gold-light);
        color: var(--gold-pale);
    }
    .btn-add:hover::after { left: 130%; }

    /* Gold strip below header */
    .header-strip {
        height: 2px;
        background: linear-gradient(to right, transparent, var(--gold), var(--gold-light), var(--gold), transparent);
        opacity: 0.5;
    }

    /* ════════════════════════
       PAGE TITLE SECTION
    ════════════════════════ */
    .page-hero {
        text-align: center;
        padding: 48px 20px 36px;
        position: relative;
    }

    .page-eyebrow {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 4px;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 10px;
    }

    .page-title {
        font-family: 'Libre Baskerville', serif;
        font-size: clamp(28px, 4vw, 42px);
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.2;
        margin-bottom: 12px;
    }

    .page-desc {
        font-size: 14px;
        color: var(--text-light);
        font-weight: 300;
        max-width: 480px;
        margin: 0 auto;
        line-height: 1.7;
    }

    /* Ornament rule */
    .hero-rule {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 14px;
        margin-top: 24px;
    }
    .hero-rule-line {
        height: 1px;
        width: 60px;
        background: linear-gradient(to right, transparent, var(--gold));
    }
    .hero-rule-line.right {
        background: linear-gradient(to left, transparent, var(--gold));
    }
    .hero-rule-diamond {
        width: 6px; height: 6px;
        background: var(--gold);
        transform: rotate(45deg);
        flex-shrink: 0;
    }

    /* ════════════════════════
       GRID
    ════════════════════════ */
    .collection-wrap {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 32px 60px;
    }

    .collection-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 24px;
    }

    /* ── Card ── */
    .card {
        background: var(--white);
        border: 1px solid var(--border);
        border-radius: 2px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        transition: box-shadow 0.25s, transform 0.25s;
        animation: fadeUp 0.5s ease both;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .card:hover {
        box-shadow: 0 8px 32px rgba(139,26,47,0.12), 0 2px 8px rgba(0,0,0,0.06);
        transform: translateY(-3px);
    }

    /* Image */
    .card-img-wrap {
        position: relative;
        overflow: hidden;
        background: #f0e8df;
    }

    .card img {
        width: 100%;
        height: 220px;
        object-fit: cover;
        display: block;
        transition: transform 0.4s ease;
    }

    .card:hover img { transform: scale(1.04); }

    /* Gold top border on hover */
    .card-img-wrap::after {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0;
        height: 2px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), var(--gold));
        opacity: 0;
        transition: opacity 0.25s;
    }
    .card:hover .card-img-wrap::after { opacity: 1; }

    /* Card body */
    .card-body {
        padding: 16px 16px 12px;
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .card-name {
        font-family: 'Libre Baskerville', serif;
        font-size: 15px;
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.35;
    }

    .card-meta {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 4px;
    }

    .card-price {
        font-size: 16px;
        font-weight: 600;
        color: var(--crimson);
        letter-spacing: 0.3px;
    }

    .card-stock {
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 1.5px;
        text-transform: uppercase;
        color: var(--text-light);
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .stock-dot {
        width: 5px; height: 5px;
        border-radius: 50%;
        background: #4caf50;
        flex-shrink: 0;
    }

    .stock-dot.low { background: #ff9800; }
    .stock-dot.out { background: #dc2626; }

    /* Card footer — actions */
    .card-footer {
        display: grid;
        grid-template-columns: 1fr 1fr;
        border-top: 1px solid var(--border);
    }

    .btn-view,
    .btn-delete {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        padding: 11px 8px;
        font-family: 'Jost', sans-serif;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 2px;
        text-transform: uppercase;
        text-decoration: none;
        border: none;
        cursor: pointer;
        transition: background 0.2s, color 0.2s;
        background: transparent;
        width: 100%;
    }

    .btn-view {
        color: var(--crimson);
        border-right: 1px solid var(--border);
    }
    .btn-view:hover {
        background: var(--crimson);
        color: #fff;
    }

    .btn-delete {
        color: var(--text-light);
    }
    .btn-delete:hover {
        background: #fef2f2;
        color: #dc2626;
    }

    /* ── Empty state ── */
    .empty-state {
        grid-column: 1 / -1;
        text-align: center;
        padding: 80px 20px;
    }
    .empty-icon {
        font-size: 48px;
        margin-bottom: 16px;
        opacity: 0.4;
    }
    .empty-title {
        font-family: 'Libre Baskerville', serif;
        font-size: 22px;
        color: var(--text-mid);
        margin-bottom: 8px;
    }
    .empty-desc {
        font-size: 14px;
        color: var(--text-light);
        font-weight: 300;
    }

    /* ════════════════════════
       FILTER BAR
    ════════════════════════ */
    .filter-bar {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 32px 28px;
        display: flex;
        align-items: center;
        gap: 16px;
        flex-wrap: wrap;
    }

    .filter-label {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--text-light);
        white-space: nowrap;
        flex-shrink: 0;
    }

    .filter-label span {
        color: var(--gold);
        margin-right: 2px;
    }

    .select-wrap {
        position: relative;
        flex-shrink: 0;
    }

    /* Custom dropdown arrow */
    .select-wrap::after {
        content: '';
        position: absolute;
        right: 14px;
        top: 50%;
        transform: translateY(-50%);
        width: 0; height: 0;
        border-left: 4px solid transparent;
        border-right: 4px solid transparent;
        border-top: 5px solid var(--gold);
        pointer-events: none;
    }

    .filter-select {
        appearance: none;
        -webkit-appearance: none;
        padding: 10px 40px 10px 16px;
        background: var(--white);
        border: 1.5px solid var(--border);
        border-radius: 2px;
        color: var(--text-dark);
        font-family: 'Jost', sans-serif;
        font-size: 13px;
        font-weight: 500;
        letter-spacing: 0.3px;
        cursor: pointer;
        outline: none;
        min-width: 200px;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    .filter-select:focus {
        border-color: var(--gold);
        box-shadow: 0 0 0 3px rgba(184,137,42,0.10);
    }

    .filter-select:hover { border-color: var(--gold-light); }

    /* Search input */
    .search-wrap {
        position: relative;
        flex: 1;
        min-width: 180px;
        max-width: 320px;
    }

    .search-icon {
        position: absolute;
        left: 13px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-light);
        font-size: 13px;
        pointer-events: none;
        line-height: 1;
    }

    .filter-search {
        width: 100%;
        padding: 10px 13px 10px 38px;
        background: var(--white);
        border: 1.5px solid var(--border);
        border-radius: 2px;
        color: var(--text-dark);
        font-family: 'Jost', sans-serif;
        font-size: 13px;
        font-weight: 400;
        outline: none;
        transition: border-color 0.2s, box-shadow 0.2s;
        -webkit-appearance: none;
    }

    .filter-search::placeholder {
        color: var(--text-light);
        font-weight: 300;
    }

    .filter-search:focus {
        border-color: var(--gold);
        box-shadow: 0 0 0 3px rgba(184,137,42,0.10);
    }

    /* Submit button */
    .btn-search {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        padding: 10px 22px;
        background: var(--crimson);
        color: #fff;
        border: none;
        border-radius: 2px;
        font-family: 'Jost', sans-serif;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        cursor: pointer;
        flex-shrink: 0;
        position: relative;
        overflow: hidden;
        transition: background 0.2s, box-shadow 0.2s, transform 0.15s;
        box-shadow: 0 3px 12px rgba(139,26,47,0.2);
    }

    .btn-search::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.18), transparent);
        transform: skewX(-15deg);
        transition: left 0.5s;
    }

    .btn-search:hover {
        background: var(--crimson-dark);
        box-shadow: 0 5px 18px rgba(139,26,47,0.32);
        transform: translateY(-1px);
    }
    .btn-search:hover::after { left: 130%; }
    .btn-search:active { transform: translateY(0); }

    .filter-divider {
        flex: 1;
        height: 1px;
        background: var(--border);
        min-width: 20px;
    }

    .filter-count {
        font-size: 12px;
        color: var(--text-light);
        font-weight: 300;
        white-space: nowrap;
        flex-shrink: 0;
    }

    @media (max-width: 780px) {
        .filter-bar { padding: 0 20px 24px; }
        .filter-select { min-width: 160px; }
        .filter-divider, .filter-count { display: none; }
        .search-wrap { max-width: 100%; }
    }

    @media (max-width: 520px) {
        .filter-bar { padding: 0 14px 20px; gap: 10px; flex-wrap: wrap; }
        .filter-select { min-width: 100%; }
        .filter-label { display: none; }
        .search-wrap { max-width: 100%; min-width: 100%; }
        .select-wrap  { width: 100%; }
        .filter-select { min-width: 100%; width: 100%; }
        .btn-search   { width: 100%; justify-content: center; }
    }

    @media (max-width: 1100px) {
        .collection-grid { grid-template-columns: repeat(3, 1fr); }
    }

    @media (max-width: 780px) {
        .collection-grid { grid-template-columns: repeat(2, 1fr); }
        .collection-wrap { padding: 0 20px 48px; }
        .site-header { padding: 0 20px; }
    }

    @media (max-width: 520px) {
        .collection-grid { grid-template-columns: 1fr; gap: 16px; }
        .card img { height: 240px; }
        .collection-wrap { padding: 0 14px 40px; }
        .page-hero { padding: 36px 16px 28px; }
        .logo-text { display: none; }
        .header-inner { height: 60px; }
        .btn-add { padding: 9px 16px; font-size: 10px; letter-spacing: 2px; }
    }
</style>

</head>
<body>

<!-- ══ HEADER ══ -->
<header class="site-header">
    <div class="header-inner">
        <a href="#" class="logo-block">
            <div class="logo-emblem">
                <span class="logo-letter">N</span>
            </div>
            <div class="logo-text">
                <div class="logo-title">NRM The Saree Palace</div>
                <div class="logo-sub">Admin Panel</div>
            </div>
        </a>
        <a href="add-saree.jsp" class="btn-add">+ Add New Saree</a>
        <a href="about" class="btn-add">About Us</a>
    </div>
</header>
<div class="header-strip"></div>

<!-- ══ PAGE HERO ══ -->
<section class="page-hero">
    <div class="page-eyebrow">Inventory</div>
    <h1 class="page-title">Saree Collection</h1>
    <p class="page-desc">Browse, manage and curate your entire saree catalogue from one place.</p>
    <div class="hero-rule">
        <div class="hero-rule-line"></div>
        <div class="hero-rule-diamond"></div>
        <div class="hero-rule-line right"></div>
    </div>
</section>

<!-- ══ FILTER BAR ══ -->
<%
List<Category> categories = (List<Category>) request.getAttribute("categories");
List<Saree> listCount = (List<Saree>) request.getAttribute("sarees");
int count = (listCount != null) ? listCount.size() : 0;
%>
<div class="filter-bar">
    <span class="filter-label"><span>&#9632;</span> Filter by</span>
    <form action="AdminSareeList" method="get" id="filterForm"
          style="display:contents;">
        

        <!-- Search -->
        <div class="search-wrap">
            <span class="search-icon">&#128269;</span>
            <input type="text" name="keyword" class="filter-search"
                   placeholder="Search sarees...">
        </div>

        <!-- Category -->
        <div class="select-wrap">
            <select name="categoryId" class="filter-select">
                <option value="">All Categories</option>
                <%
                if(categories != null){
                for(Category c : categories){
                %>
                <option value="<%= c.getCategoryId() %>">
                    <%= c.getCategoryName() %>
                </option>
                <%
                }}
                %>
            </select>
        </div>

        <!-- Submit -->
        <button type="submit" class="btn-search">Search</button>

    </form>
    <div class="filter-divider"></div>
    <span class="filter-count"><%= count %> saree<%= count != 1 ? "s" : "" %> found</span>
</div>

<!-- ══ GRID ══ -->
<div class="collection-wrap">
    <div class="collection-grid">

<%
List<Saree> list = (List<Saree>) request.getAttribute("sarees");

if(list != null){
for(Saree s : list){
%>

        <div class="card">
            <div class="card-img-wrap">
                <img src="<%= s.getImage() != null ? s.getImage() : "https://via.placeholder.com/200" %>"
                     alt="<%= s.getName() %>">
            </div>
            <div class="card-body">
                <div class="card-name"><%= s.getName() %></div>
                <div class="card-meta">
                    <span class="card-price">₹ <%= s.getPrice() %></span>
                    <span class="card-stock">
                        <span class="stock-dot<%= s.getStock() == 0 ? " out" : s.getStock() < 5 ? " low" : "" %>"></span>
                        <%= s.getStock() %> left
                    </span>
                </div>
            </div>
            <div class="card-footer">
                <a href="AdminViewSaree?id=<%= s.getSareeId() %>" class="btn-view">
                    &#9654; View
                </a>
                <a href="DeleteSaree?id=<%= s.getSareeId() %>"
                   onclick="return confirm('Delete this saree?')"
                   class="btn-delete">
                    &#10005; Delete
                </a>
            </div>
        </div>

<%
}}
else{
%>
        <div class="empty-state">
            <div class="empty-icon">🪡</div>
            <div class="empty-title">No sarees found</div>
            <div class="empty-desc">Start by adding your first saree to the collection.</div>
        </div>
<%
}
%>

    </div>
</div>

</body>
</html>
