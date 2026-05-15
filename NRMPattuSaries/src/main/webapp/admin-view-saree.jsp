<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nrmpattusaries.model.Saree" %>
<%
Saree s = (Saree) request.getAttribute("saree");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin — <%= s.getName() %></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  :root {
    --cream:     #faf7f2;
    --ink:       #1a1410;
    --gold:      #b8872a;
    --gold-lt:   #e8c97a;
    --rust:      #c0392b;
    --rust-dk:   #96251e;
    --border:    #e2d9cc;
    --muted:     #8a7d6e;
    --card-bg:   #ffffff;
    --shadow:    0 4px 32px rgba(26,20,16,.08);
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--cream);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 16px;
  }

  /* ── Subtle woven-texture overlay ── */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      repeating-linear-gradient(0deg,   transparent, transparent 3px, rgba(184,135,42,.04) 3px, rgba(184,135,42,.04) 4px),
      repeating-linear-gradient(90deg,  transparent, transparent 3px, rgba(184,135,42,.04) 3px, rgba(184,135,42,.04) 4px);
    pointer-events: none;
    z-index: 0;
  }

  /* ── Card ── */
  .card {
    position: relative;
    z-index: 1;
    background: var(--card-bg);
    width: 100%;
    max-width: 520px;
    border-radius: 2px;
    box-shadow: var(--shadow), 0 0 0 1px var(--border);
    overflow: hidden;
    animation: rise .55s cubic-bezier(.22,1,.36,1) both;
  }

  @keyframes rise {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ── Top gold bar ── */
  .card::before {
    content: '';
    display: block;
    height: 4px;
    background: linear-gradient(90deg, var(--gold) 0%, var(--gold-lt) 50%, var(--gold) 100%);
  }

  /* ── Admin label ── */
  .admin-badge {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 14px 28px 0;
    font-size: 10px;
    font-weight: 500;
    letter-spacing: .18em;
    text-transform: uppercase;
    color: var(--muted);
  }

  .admin-badge span {
    display: inline-block;
    width: 6px; height: 6px;
    border-radius: 50%;
    background: var(--gold);
  }

  /* ── Image ── */
  .image-wrap {
    position: relative;
    margin: 18px 28px 0;
    border-radius: 2px;
    overflow: hidden;
    background: var(--cream);
    aspect-ratio: 3/4;
    max-height: 380px;
  }

  .image-wrap img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    transition: transform .6s cubic-bezier(.22,1,.36,1);
  }

  .image-wrap:hover img { transform: scale(1.04); }

  /* ── Corner ornament ── */
  .image-wrap::after {
    content: '';
    position: absolute;
    inset: 0;
    border: 1px solid rgba(184,135,42,.3);
    border-radius: 2px;
    pointer-events: none;
  }

  /* ── Body content ── */
  .content {
    padding: 24px 28px 28px;
  }

  .saree-name {
    font-family: 'Cormorant Garamond', serif;
    font-size: 28px;
    font-weight: 600;
    color: var(--ink);
    line-height: 1.2;
    letter-spacing: .01em;
    margin-bottom: 10px;
  }

  .description {
    font-size: 13.5px;
    line-height: 1.7;
    color: var(--muted);
    font-weight: 300;
    margin-bottom: 20px;
  }

  /* ── Price / stock row ── */
  .meta-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 14px 16px;
    background: var(--cream);
    border-radius: 2px;
    border: 1px solid var(--border);
    margin-bottom: 24px;
  }

  .price {
    font-family: 'Cormorant Garamond', serif;
    font-size: 24px;
    font-weight: 400;
    color: var(--gold);
    letter-spacing: .02em;
  }

  .price sup {
    font-size: 14px;
    vertical-align: super;
    font-family: 'DM Sans', sans-serif;
    font-weight: 400;
  }

  .stock-wrap {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    gap: 2px;
  }

  .stock-label {
    font-size: 10px;
    letter-spacing: .12em;
    text-transform: uppercase;
    color: var(--muted);
  }

  .stock-value {
    font-size: 18px;
    font-weight: 500;
    color: var(--ink);
  }

  /* ── Divider ── */
  .divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--border) 20%, var(--border) 80%, transparent);
    margin-bottom: 24px;
  }

  /* ── Action buttons ── */
  .actions {
    display: flex;
    gap: 12px;
  }

  .btn {
    flex: 1;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 13px 20px;
    border: none;
    border-radius: 2px;
    font-family: 'DM Sans', sans-serif;
    font-size: 12px;
    font-weight: 500;
    letter-spacing: .12em;
    text-transform: uppercase;
    cursor: pointer;
    text-decoration: none;
    transition: filter .2s, transform .18s cubic-bezier(.22,1,.36,1), box-shadow .2s;
  }

  .btn:hover  { filter: brightness(1.08); transform: translateY(-1px); }
  .btn:active { transform: translateY(0); filter: brightness(.96); }

  .btn-edit {
    background: linear-gradient(135deg, #c9832a 0%, var(--gold) 100%);
    color: #fff;
    box-shadow: 0 2px 12px rgba(184,135,42,.35);
  }

  .btn-delete {
    background: linear-gradient(135deg, var(--rust-dk) 0%, var(--rust) 100%);
    color: #fff;
    box-shadow: 0 2px 12px rgba(192,57,43,.3);
  }

  /* ── SVG icons ── */
  .icon { width: 14px; height: 14px; fill: currentColor; flex-shrink: 0; }
</style>
</head>
<body>

<div class="card">
  <div class="admin-badge">
    <span></span> Admin Panel &nbsp;/&nbsp; Saree Detail
  </div>

  <div class="image-wrap">
    <img src="<%= s.getImage() %>" alt="<%= s.getName() %>">
  </div>

  <div class="content">
    <h2 class="saree-name"><%= s.getName() %></h2>
    <p class="description"><%= s.getDescription() %></p>

    <div class="meta-row">
      <div class="price">
        <sup>₹</sup><%= s.getPrice() %>
      </div>
      <div class="stock-wrap">
        <span class="stock-label">In Stock</span>
        <span class="stock-value"><%= s.getStock() %></span>
      </div>
    </div>

    <div class="divider"></div>

    <div class="actions">
      <!-- EDIT -->
      <a href="EditSaree?id=<%= s.getSareeId() %>" class="btn btn-edit">
        <svg class="icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a1 1 0 0 0 0-1.41l-2.34-2.34a1 1 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
        </svg>
        Edit Saree
      </a>

      <!-- DELETE -->
      <a href="DeleteSaree?id=<%= s.getSareeId() %>" class="btn btn-delete"
         onclick="return confirm('Delete \'<%= s.getName() %>\'? This cannot be undone.')">
        <svg class="icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path d="M6 19c0 1.1.9 2 2 2h8a2 2 0 0 0 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>
        </svg>
        Delete
      </a>
    </div>
  </div>
</div>

</body>
</html>
