<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nrmpattusaries.model.Saree" %>
<%
Saree s = (Saree) request.getAttribute("saree");
%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Saree</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
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
    display: flex;
    align-items: flex-start;
    justify-content: center;
    padding: 40px 16px;
}

.container {
    width: 100%;
    max-width: 560px;
    background: #ffffff;
    border-radius: 16px;
    border: 0.5px solid #D3D1C7;
    padding: 32px;
}

/* Header */
.form-header {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    margin-bottom: 28px;
    padding-bottom: 20px;
    border-bottom: 0.5px solid #D3D1C7;
}

.form-header-left .form-eyebrow {
    font-size: 11px;
    font-weight: 500;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: #888780;
    margin-bottom: 4px;
}

.form-header-left .form-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: 30px;
    font-weight: 600;
    color: #2C2C2A;
    letter-spacing: -0.5px;
}

.form-badge {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    background: #F1EFE8;
    border: 0.5px solid #D3D1C7;
    border-radius: 20px;
    padding: 5px 12px;
    font-size: 11px;
    font-weight: 500;
    color: #5F5E5A;
}

.form-badge svg {
    width: 12px;
    height: 12px;
    stroke: #5F5E5A;
}

/* Section label */
.section-label {
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: #B4B2A9;
    margin: 20px 0 12px;
}

.section-divider {
    height: 0.5px;
    background: #D3D1C7;
    margin: 20px 0 16px;
}

/* Grid */
.field-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
}

.field-full {
    grid-column: 1 / -1;
}

/* Field */
.field {
    display: flex;
    flex-direction: column;
    gap: 6px;
}

label {
    font-size: 11px;
    font-weight: 500;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: #5F5E5A;
}

.input-wrap {
    position: relative;
}

.input-wrap .input-icon {
    position: absolute;
    left: 12px;
    top: 50%;
    transform: translateY(-50%);
    width: 15px;
    height: 15px;
    stroke: #B4B2A9;
    fill: none;
    stroke-width: 1.75;
    stroke-linecap: round;
    stroke-linejoin: round;
    pointer-events: none;
}

.input-wrap.has-icon input,
.input-wrap.has-icon textarea {
    padding-left: 36px;
}

input[type="text"],
input[type="number"],
textarea,
select {
    width: 100%;
    background: #ffffff;
    border: 0.5px solid #B4B2A9;
    border-radius: 8px;
    padding: 10px 14px;
    font-size: 13.5px;
    font-family: 'DM Sans', sans-serif;
    font-weight: 400;
    color: #2C2C2A;
    transition: border-color 0.15s, box-shadow 0.15s;
    appearance: none;
}

input[type="text"]:focus,
input[type="number"]:focus,
textarea:focus {
    outline: none;
    border-color: #7F77DD;
    box-shadow: 0 0 0 3px rgba(127, 119, 221, 0.12);
}

input::placeholder,
textarea::placeholder {
    color: #B4B2A9;
}

textarea {
    resize: vertical;
    min-height: 90px;
    line-height: 1.6;
    padding-top: 10px;
}

/* Textarea icon sits at top */
.input-wrap.has-icon.textarea-wrap .input-icon {
    top: 14px;
    transform: none;
}

/* Field hint */
.field-hint {
    font-size: 11px;
    color: #B4B2A9;
    line-height: 1.4;
}

/* ID chip */
.id-chip {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    background: #F1EFE8;
    border: 0.5px solid #D3D1C7;
    border-radius: 6px;
    padding: 10px 12px;
    font-size: 12.5px;
    color: #888780;
    font-family: monospace;
    letter-spacing: 0.5px;
    height: 40px;
}

/* Actions */
.form-actions {
    display: flex;
    gap: 10px;
    margin-top: 28px;
    padding-top: 20px;
    border-top: 0.5px solid #D3D1C7;
}

.btn-cancel {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: transparent;
    border: 0.5px solid #B4B2A9;
    border-radius: 8px;
    padding: 11px 20px;
    font-size: 13px;
    font-family: 'DM Sans', sans-serif;
    font-weight: 500;
    color: #5F5E5A;
    cursor: pointer;
    text-decoration: none;
    transition: background 0.15s;
}

.btn-cancel:hover {
    background: #F1EFE8;
}

.btn-cancel svg {
    width: 14px;
    height: 14px;
    stroke: currentColor;
    fill: none;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
}

.btn-submit {
    flex: 1;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    background: #3C3489;
    border: none;
    border-radius: 8px;
    padding: 12px 20px;
    font-size: 13px;
    font-family: 'DM Sans', sans-serif;
    font-weight: 500;
    letter-spacing: 0.3px;
    color: #EEEDFE;
    cursor: pointer;
    transition: background 0.15s, transform 0.1s;
}

.btn-submit:hover {
    background: #534AB7;
}

.btn-submit:active {
    transform: scale(0.98);
}

.btn-submit svg {
    width: 15px;
    height: 15px;
    stroke: currentColor;
    fill: none;
    stroke-width: 2.5;
    stroke-linecap: round;
    stroke-linejoin: round;
}
</style>
</head>
<body>
<div class="container">

    <div class="form-header">
        <div class="form-header-left">
            <p class="form-eyebrow">Product Management</p>
            <h1 class="form-title">Edit Saree</h1>
        </div>
        <span class="form-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
            </svg>
            Editing
        </span>
    </div>

    <form action="EditSaree" method="post">
        <input type="hidden" name="sareeId" value="<%= s.getSareeId() %>">

        <p class="section-label">Basic info</p>

        <div class="field-grid">

            <div class="field field-full">
                <label for="name">Product name</label>
                <div class="input-wrap has-icon">
                    <svg class="input-icon" viewBox="0 0 24 24">
                        <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"/>
                        <line x1="7" y1="7" x2="7.01" y2="7"/>
                    </svg>
                    <input type="text"
                           id="name"
                           name="name"
                           value="<%= s.getName() %>"
                           placeholder="e.g. Kanjivaram Silk Saree"
                           required>
                </div>
            </div>

            <div class="field field-full">
                <label for="description">Description</label>
                <div class="input-wrap has-icon textarea-wrap">
                    <svg class="input-icon" viewBox="0 0 24 24">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                        <polyline points="14 2 14 8 20 8"/>
                        <line x1="16" y1="13" x2="8" y2="13"/>
                        <line x1="16" y1="17" x2="8" y2="17"/>
                        <polyline points="10 9 9 9 8 9"/>
                    </svg>
                    <textarea id="description"
                              name="description"
                              placeholder="Describe the saree — fabric, occasion, weave style…"><%= s.getDescription() %></textarea>
                </div>
            </div>

        </div>

        <div class="section-divider"></div>
        <p class="section-label">Pricing &amp; inventory</p>

        <div class="field-grid">

            <div class="field">
                <label for="price">Price (₹)</label>
                <div class="input-wrap has-icon">
                    <svg class="input-icon" viewBox="0 0 24 24">
                        <line x1="12" y1="1" x2="12" y2="23"/>
                        <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                    </svg>
                    <input type="number"
                           id="price"
                           name="price"
                           step="0.01"
                           value="<%= s.getPrice() %>"
                           placeholder="0.00"
                           required>
                </div>
            </div>

            <div class="field">
                <label for="stock">Stock quantity</label>
                <div class="input-wrap has-icon">
                    <svg class="input-icon" viewBox="0 0 24 24">
                        <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
                    </svg>
                    <input type="number"
                           id="stock"
                           name="stock"
                           value="<%= s.getStock() %>"
                           placeholder="0"
                           required>
                </div>
            </div>

        </div>

        <div class="section-divider"></div>
        <p class="section-label">Media &amp; categorisation</p>

        <div class="field-grid">

            <div class="field field-full">
                <label for="image">Image filename / URL</label>
                <div class="input-wrap has-icon">
                    <svg class="input-icon" viewBox="0 0 24 24">
                        <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                        <circle cx="8.5" cy="8.5" r="1.5"/>
                        <polyline points="21 15 16 10 5 21"/>
                    </svg>
                    <input type="text"
                           id="image"
                           name="image"
                           value="<%= s.getImage() %>"
                           placeholder="saree-001.jpg or https://…">
                </div>
                <span class="field-hint">Relative path or absolute URL for the product image</span>
            </div>

            <div class="field">
                <label for="categoryId">Category ID</label>
                <div class="input-wrap has-icon">
                    <svg class="input-icon" viewBox="0 0 24 24">
                        <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>
                    </svg>
                    <input type="number"
                           id="categoryId"
                           name="categoryId"
                           value="<%= s.getCategoryId() %>"
                           placeholder="e.g. 3">
                </div>
            </div>

            <div class="field">
                <label>Saree ID</label>
                <span class="id-chip"># <%= s.getSareeId() %></span>
            </div>

        </div>

        <div class="form-actions">
            <a href="javascript:history.back()" class="btn-cancel">
                <svg viewBox="0 0 24 24">
                    <line x1="19" y1="12" x2="5" y2="12"/>
                    <polyline points="12 19 5 12 12 5"/>
                </svg>
                Cancel
            </a>
            <button type="submit" class="btn-submit">
                <svg viewBox="0 0 24 24">
                    <polyline points="20 6 9 17 4 12"/>
                </svg>
                Update Saree
            </button>
        </div>

    </form>
</div>
</body>
</html>
