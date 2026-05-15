<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Saree — NRM The Saree Palace</title>
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
        --input-bg:     #ffffff;
        --panel-w:      40%;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    html, body {
        height: 100%;
        font-family: 'Jost', sans-serif;
        background: var(--cream);
        color: var(--text-dark);
    }

    /* ════════════════════════
       LAYOUT — split panel
    ════════════════════════ */
    .page {
        display: flex;
        min-height: 100vh;
        min-height: 100dvh;
    }

    /* ── LEFT: brand panel ── */
    .brand-panel {
        width: var(--panel-w);
        flex-shrink: 0;
        position: relative;
        background: var(--crimson-dark);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 52px 48px;
        overflow: hidden;
    }

    .brand-panel::before {
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

    .brand-panel::after {
        content: '';
        position: absolute;
        inset: 0;
        background:
            radial-gradient(ellipse 70% 60% at 30% 40%, rgba(139,26,47,0.0) 0%, rgba(92,15,30,0.7) 100%),
            radial-gradient(ellipse 50% 40% at 80% 80%, rgba(184,137,42,0.12) 0%, transparent 70%);
        z-index: 0;
    }

    .brand-panel > * { position: relative; z-index: 1; }

    .logo-block {}

    .logo-emblem {
        width: 52px; height: 52px;
        border: 1.5px solid rgba(184,137,42,0.6);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 20px;
        position: relative;
    }
    .logo-emblem::before,
    .logo-emblem::after {
        content: '';
        position: absolute;
        border: 1px solid rgba(184,137,42,0.3);
    }
    .logo-emblem::before { inset: 4px; }
    .logo-emblem::after  { inset: -5px; }

    .logo-letter {
        font-family: 'Libre Baskerville', serif;
        font-size: 22px;
        font-weight: 700;
        color: var(--gold-light);
        line-height: 1;
    }

    .brand-name {
        font-family: 'Libre Baskerville', serif;
        font-size: 13px;
        font-weight: 400;
        letter-spacing: 5px;
        text-transform: uppercase;
        color: rgba(245,230,200,0.55);
        margin-top: 4px;
    }

    .brand-center {}

    .brand-tagline {
        font-family: 'Libre Baskerville', serif;
        font-size: clamp(20px, 2.4vw, 30px);
        font-weight: 400;
        font-style: italic;
        color: var(--gold-pale);
        line-height: 1.55;
        margin-bottom: 24px;
    }
    .brand-tagline em {
        font-style: normal;
        color: var(--gold-light);
    }

    .gold-rule {
        display: flex;
        align-items: center;
        gap: 12px;
        margin: 26px 0;
    }
    .gold-rule-line {
        height: 1px;
        width: 40px;
        background: linear-gradient(to right, var(--gold), transparent);
    }
    .gold-rule-dot {
        width: 5px; height: 5px;
        background: var(--gold);
        transform: rotate(45deg);
        flex-shrink: 0;
    }

    /* Tips list */
    .tips { list-style: none; }
    .tips li {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        font-size: 13px;
        font-weight: 300;
        color: rgba(245,230,200,0.5);
        line-height: 1.6;
        margin-bottom: 10px;
    }
    .tip-dot {
        width: 5px; height: 5px;
        border-radius: 50%;
        background: var(--gold);
        opacity: 0.5;
        flex-shrink: 0;
        margin-top: 7px;
    }

    .brand-footer {
        display: flex;
        gap: 20px;
        flex-wrap: wrap;
    }
    .trust-badge {
        display: flex;
        align-items: center;
        gap: 8px;
        color: rgba(245,230,200,0.4);
        font-size: 11px;
        letter-spacing: 1.5px;
        text-transform: uppercase;
    }
    .trust-badge-dot {
        width: 4px; height: 4px;
        border-radius: 50%;
        background: var(--gold);
        opacity: 0.6;
        flex-shrink: 0;
    }

    /* ── RIGHT: form panel ── */
    .form-panel {
        flex: 1;
        display: flex;
        align-items: flex-start;
        justify-content: center;
        padding: 48px 40px;
        background: var(--cream);
        position: relative;
        overflow-y: auto;
    }

    .form-panel::before {
        content: '';
        position: absolute;
        top: 0; right: 0;
        width: 200px; height: 200px;
        background: radial-gradient(circle at top right, rgba(184,137,42,0.07), transparent 70%);
        pointer-events: none;
    }
    .form-panel::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0;
        width: 200px; height: 200px;
        background: radial-gradient(circle at bottom left, rgba(139,26,47,0.05), transparent 70%);
        pointer-events: none;
    }

    .form-inner {
        width: 100%;
        max-width: 420px;
        position: relative;
        z-index: 1;
        padding: 8px 0 32px;
        animation: slideIn 0.7s cubic-bezier(.22,1,.36,1) both;
    }

    @keyframes slideIn {
        from { opacity: 0; transform: translateX(20px); }
        to   { opacity: 1; transform: translateX(0); }
    }

    /* Form header */
    .form-header { margin-bottom: 30px; }

    .form-eyebrow {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 4px;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 10px;
    }

    .form-title {
        font-family: 'Libre Baskerville', serif;
        font-size: clamp(24px, 2.8vw, 32px);
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.25;
        margin-bottom: 10px;
    }

    .form-subtitle {
        font-size: 14px;
        color: var(--text-light);
        font-weight: 300;
        line-height: 1.6;
    }

    /* Section label */
    .section-label {
        font-size: 10px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--gold);
        border-bottom: 1px solid var(--border);
        padding-bottom: 8px;
        margin: 24px 0 18px;
    }

    /* Two-column grid */
    .field-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 14px;
    }

    /* ── Fields ── */
    .field { margin-bottom: 16px; }

    label {
        display: block;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 2.5px;
        text-transform: uppercase;
        color: var(--text-mid);
        margin-bottom: 7px;
    }

    .opt-badge {
        display: inline-block;
        font-size: 9px;
        letter-spacing: 1.5px;
        text-transform: uppercase;
        color: var(--text-light);
        border: 1px solid var(--border);
        border-radius: 2px;
        padding: 1px 5px;
        margin-left: 7px;
        vertical-align: middle;
        font-weight: 400;
    }

    .input-wrap { position: relative; }

    .input-icon {
        position: absolute;
        left: 13px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-light);
        font-size: 13px;
        pointer-events: none;
        line-height: 1;
    }

    .textarea-icon { top: 13px; transform: none; }

    input[type="text"],
    input[type="number"],
    textarea {
        width: 100%;
        padding: 12px 13px 12px 40px;
        background: var(--input-bg);
        border: 1.5px solid var(--border);
        border-radius: 2px;
        color: var(--text-dark);
        font-family: 'Jost', sans-serif;
        font-size: 14.5px;
        font-weight: 400;
        outline: none;
        transition: border-color 0.2s, box-shadow 0.2s;
        -webkit-appearance: none;
        -moz-appearance: textfield;
    }

    /* Remove number spinners */
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button { -webkit-appearance: none; }

    textarea {
        resize: vertical;
        min-height: 90px;
        padding-top: 12px;
        line-height: 1.5;
    }

    input::placeholder,
    textarea::placeholder {
        color: var(--text-light);
        font-weight: 300;
    }

    input:focus,
    textarea:focus {
        border-color: var(--gold);
        box-shadow: 0 0 0 3px rgba(184,137,42,0.10);
    }

    /* Price prefix symbol */
    .prefix-wrap { position: relative; }
    .prefix-symbol {
        position: absolute;
        left: 13px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-mid);
        font-size: 14px;
        font-weight: 600;
        pointer-events: none;
        line-height: 1;
    }
    .prefix-wrap input { padding-left: 30px; }

    /* ── Submit button ── */
    .btn-submit {
        width: 100%;
        padding: 15px;
        margin-top: 8px;
        background: var(--crimson);
        color: #fff;
        border: none;
        border-radius: 2px;
        font-family: 'Jost', sans-serif;
        font-size: 13px;
        font-weight: 600;
        letter-spacing: 3.5px;
        text-transform: uppercase;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        transition: background 0.25s, box-shadow 0.25s, transform 0.15s;
        box-shadow: 0 4px 20px rgba(139,26,47,0.25);
    }

    .btn-submit::before {
        content: '';
        position: absolute;
        inset: 0;
        background: linear-gradient(135deg, rgba(255,255,255,0.08) 0%, transparent 60%);
        pointer-events: none;
    }

    .btn-submit::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.18), transparent);
        transform: skewX(-15deg);
        transition: left 0.55s ease;
    }

    .btn-submit:hover {
        background: var(--crimson-dark);
        box-shadow: 0 6px 28px rgba(139,26,47,0.38);
        transform: translateY(-1px);
    }
    .btn-submit:hover::after { left: 120%; }
    .btn-submit:active { transform: translateY(0); box-shadow: none; }

    .btn-accent-line {
        height: 2px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), transparent);
        opacity: 0.6;
    }

    .error {
        font-size: 12px;
        color: #dc2626;
        font-style: italic;
        letter-spacing: 0.2px;
    }

    input[type="hidden"] { display: none; }

    /* ════════════════════════
       RESPONSIVE
    ════════════════════════ */
    @media (max-width: 860px) {
        :root { --panel-w: 36%; }
        .brand-panel { padding: 40px 32px; }
        .tips { display: none; }
        .form-panel { padding: 40px 28px; }
    }

    @media (max-width: 640px) {
        .page { flex-direction: column; }

        .brand-panel {
            width: 100%;
            padding: 22px 20px;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            min-height: unset;
        }

        .brand-center,
        .brand-footer,
        .tips { display: none; }

        .logo-block {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .logo-emblem {
            width: 38px; height: 38px;
            margin-bottom: 0;
        }
        .logo-letter { font-size: 15px; }

        .brand-name {
            font-size: 10px;
            letter-spacing: 3px;
            margin-top: 0;
        }

        .mobile-tagline {
            font-family: 'Libre Baskerville', serif;
            font-size: 12px;
            font-style: italic;
            color: rgba(245,230,200,0.45);
        }

        .form-panel {
            flex: 1;
            padding: 28px 20px 40px;
            align-items: flex-start;
        }

        .form-inner { max-width: 100%; padding-bottom: 24px; }
        .form-title  { font-size: 24px; }
        .form-header { margin-bottom: 24px; }
        .field-row   { grid-template-columns: 1fr; gap: 0; }
    }

    @media (max-width: 380px) {
        .form-panel { padding: 20px 14px 32px; }
        input[type="text"],
        input[type="number"],
        textarea { font-size: 14px; padding: 11px 11px 11px 36px; }
        .btn-submit { letter-spacing: 2px; font-size: 12px; }
    }
</style>

<script>
function validateForm() {
    let name = document.forms["form"]["name"].value;
    let price = document.forms["form"]["price"].value;

    if (name.length < 3) {
        alert("Name must be at least 3 characters");
        return false;
    }

    if (price <= 0) {
        alert("Price must be greater than 0");
        return false;
    }

    return true;
}
</script>

</head>
<body>

<div class="page">

    <!-- ══ LEFT: Brand Panel ══ -->
    <aside class="brand-panel">
        <div class="logo-block">
            <div class="logo-emblem">
                <span class="logo-letter">N</span>
            </div>
            <div class="brand-name">NRM The Saree Palace</div>
        </div>

        <div class="brand-center">
            <p class="brand-tagline">
                Curate your finest<br>
                collection with<br>
                <em>care &amp; precision.</em>
            </p>
            <div class="gold-rule">
                <div class="gold-rule-line"></div>
                <div class="gold-rule-dot"></div>
            </div>
            <ul class="tips">
                <li>
                    <div class="tip-dot"></div>
                    Use a clear, descriptive saree name for easy discovery
                </li>
                <li>
                    <div class="tip-dot"></div>
                    Add a high-quality image URL for better presentation
                </li>
                <li>
                    <div class="tip-dot"></div>
                    Set accurate stock levels to manage availability
                </li>
                <li>
                    <div class="tip-dot"></div>
                    Assign the correct category for organised browsing
                </li>
            </ul>
        </div>

        <div class="brand-footer">
            <div class="trust-badge">
                <div class="trust-badge-dot"></div>
                Pure Silk
            </div>
            <div class="trust-badge">
                <div class="trust-badge-dot"></div>
                Handwoven
            </div>
            <div class="trust-badge">
                <div class="trust-badge-dot"></div>
                Since 1987
            </div>
        </div>

        <!-- Mobile only -->
        <div class="mobile-tagline">Timeless Elegance</div>
    </aside>

    <!-- ══ RIGHT: Form Panel ══ -->
    <main class="form-panel">
        <div class="form-inner">

            <div class="form-header">
                <div class="form-eyebrow">Admin Panel</div>
                <h1 class="form-title">Add New<br>Saree</h1>
                <p class="form-subtitle">Fill in the details below to list a new saree in the collection.</p>
            </div>

            <form name="form" action="AdminSareeList" method="post" onsubmit="return validateForm()">

                

                <!-- Product Info -->
                <div class="section-label">Product Information</div>

                <div class="field">
                    <label for="name">Saree Name</label>
                    <div class="input-wrap">
                        <input type="text" id="name" name="name"
                               placeholder="e.g. Kanjivaram Bridal Silk" required>
                        <span class="input-icon">🪡</span>
                    </div>
                </div>

                <div class="field">
                    <label for="description">
                        Description
                        <span class="opt-badge">Optional</span>
                    </label>
                    <div class="input-wrap">
                        <textarea id="description" name="description"
                                  placeholder="Fabric type, weave pattern, occasion, colours..."></textarea>
                        <span class="input-icon textarea-icon">📝</span>
                    </div>
                </div>

                <div class="field">
                    <label for="image">
                        Image URL
                        <span class="opt-badge">Optional</span>
                    </label>
                    <div class="input-wrap">
                        <input type="text" id="image" name="image"
                               placeholder="https://example.com/saree.jpg">
                        <span class="input-icon">🖼</span>
                    </div>
                </div>

                <!-- Pricing & Inventory -->
                <div class="section-label">Pricing &amp; Inventory</div>

                <div class="field-row">
                    <div class="field">
                        <label for="price">Price (₹)</label>
                        <div class="input-wrap prefix-wrap">
                            <span class="prefix-symbol">₹</span>
                            <input type="number" id="price" name="price"
                                   placeholder="0" required>
                        </div>
                    </div>

                    <div class="field">
                        <label for="stock">Stock Qty</label>
                        <div class="input-wrap">
                            <input type="number" id="stock" name="stock"
                                   placeholder="0" required>
                            <span class="input-icon">#</span>
                        </div>
                    </div>
                </div>

                <!-- Categorisation -->
                <div class="section-label">Categorisation</div>

                <div class="field">
                    <label for="categoryId">
                        Category ID
                        <span class="opt-badge">Optional</span>
                    </label>
                    <div class="input-wrap">
                        <input type="number" id="categoryId" name="categoryId"
                               placeholder="e.g. 3">
                        <span class="input-icon">🏷</span>
                    </div>
                </div>

                <button type="submit" class="btn-submit">Add Saree</button>
                <div class="btn-accent-line"></div>

            </form>

        </div>
    </main>

</div>

</body>
</html>
