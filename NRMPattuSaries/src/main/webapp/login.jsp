<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — NRM The Saree Palace</title>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --crimson:      #8b1a2f;
            --crimson-dark: #5c0f1e;
            --gold:         #b8892a;
            --gold-light:   #d4a84b;
            --gold-pale:    #f5e6c8;
            --cream:        #faf6f0;
            --charcoal:     #1c1410;
            --text-dark:    #2a1f18;
            --text-mid:     #6b5a4e;
            --text-light:   #a89080;
            --border:       #e2d5c8;
            --input-bg:     #ffffff;
            --panel-w:      45%;
        }

        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        html, body {
            height: 100%;
            font-family: 'Jost', sans-serif;
            background: var(--cream);
            color: var(--text-dark);
        }

        /* ════════════════════════════════
           LAYOUT — split panel
        ════════════════════════════════ */
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

        /* Silk weave texture overlay */
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

        /* Radial glow */
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

        /* Logo area */
        .logo-block {}

        .logo-emblem {
            width: 52px;
            height: 52px;
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

        /* Centre quote */
        .brand-center {}

        .brand-tagline {
            font-family: 'Libre Baskerville', serif;
            font-size: clamp(22px, 2.8vw, 34px);
            font-weight: 400;
            font-style: italic;
            color: var(--gold-pale);
            line-height: 1.5;
            margin-bottom: 24px;
        }

        .brand-tagline em {
            font-style: normal;
            color: var(--gold-light);
        }

        .brand-desc {
            font-size: 13px;
            font-weight: 300;
            color: rgba(245,230,200,0.5);
            line-height: 1.8;
            letter-spacing: 0.3px;
            max-width: 280px;
        }

        /* Gold rule */
        .gold-rule {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 28px 0;
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

        /* Bottom trust badges */
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
            align-items: center;
            justify-content: center;
            padding: 48px 40px;
            background: var(--cream);
            position: relative;
        }

        /* Subtle corner accents */
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
            max-width: 380px;
            position: relative;
            z-index: 1;
            animation: slideIn 0.7s cubic-bezier(.22,1,.36,1) both;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(20px); }
            to   { opacity: 1; transform: translateX(0); }
        }

        /* Form header */
        .form-header { margin-bottom: 36px; }

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
            font-size: clamp(26px, 3vw, 34px);
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

        /* ── Server error ── */
        .server-error {
            background: #fef2f2;
            border: 1px solid #fca5a5;
            border-left: 3px solid #dc2626;
            border-radius: 2px;
            padding: 11px 14px;
            font-size: 13px;
            color: #991b1b;
            margin-bottom: 20px;
            display: none;
        }
        .server-error:not(:empty) { display: block; }

        /* ── Fields ── */
        .field { margin-bottom: 22px; }

        label {
            display: block;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: var(--text-mid);
            margin-bottom: 8px;
        }

        .input-wrap { position: relative; }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-light);
            font-size: 14px;
            pointer-events: none;
            transition: color 0.2s;
            line-height: 1;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 13px 14px 13px 42px;
            background: var(--input-bg);
            border: 1.5px solid var(--border);
            border-radius: 2px;
            color: var(--text-dark);
            font-family: 'Jost', sans-serif;
            font-size: 15px;
            font-weight: 400;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
            -webkit-appearance: none;
        }

        input[type="email"]::placeholder,
        input[type="password"]::placeholder {
            color: var(--text-light);
            font-weight: 300;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: var(--gold);
            box-shadow: 0 0 0 3px rgba(184,137,42,0.10);
        }

        /* ── Client error ── */
        .field-error {
            font-size: 12px;
            color: #dc2626;
            margin-top: 6px;
            font-style: italic;
            min-height: 16px;
            letter-spacing: 0.2px;
        }

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

        /* Shimmer sweep */
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

        /* Gold accent line below button */
        .btn-accent-line {
            height: 2px;
            background: linear-gradient(to right, var(--gold), var(--gold-light), transparent);
            opacity: 0.6;
        }

        /* ── Divider ── */
        .form-divider {
            display: flex;
            align-items: center;
            gap: 14px;
            margin: 26px 0 20px;
        }
        .form-divider-line {
            flex: 1;
            height: 1px;
            background: var(--border);
        }
        .form-divider-text {
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: var(--text-light);
            white-space: nowrap;
        }

        /* ── Register link ── */
        .register-row { text-align: center; }

        .register-text {
            font-size: 13.5px;
            color: var(--text-light);
        }

        .register-link {
            color: var(--crimson);
            font-weight: 600;
            text-decoration: none;
            letter-spacing: 0.3px;
            border-bottom: 1px solid transparent;
            transition: border-color 0.2s;
        }
        .register-link:hover { border-color: var(--crimson); }

        /* ── Hidden ── */
        input[type="hidden"] { display: none; }

        /* ════════════════════════════════
           RESPONSIVE
        ════════════════════════════════ */
        @media (max-width: 820px) {
            :root { --panel-w: 38%; }
            .brand-panel { padding: 40px 32px; }
            .brand-desc  { display: none; }
            .form-panel  { padding: 40px 28px; }
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
            .brand-footer { display: none; }

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
                padding: 32px 20px 40px;
                align-items: flex-start;
            }

            .form-inner { max-width: 100%; }
            .form-title { font-size: 26px; }
            .form-header { margin-bottom: 28px; }
        }

        @media (max-width: 380px) {
            .form-panel { padding: 24px 16px 32px; }
            input[type="email"],
            input[type="password"] { font-size: 14px; padding: 12px 12px 12px 38px; }
            .btn-submit { letter-spacing: 2.5px; font-size: 12px; }
        }
    </style>

    <script>
        function validateLogin() {
            let email    = document.getElementById("email").value.trim();
            let password = document.getElementById("password").value.trim();
            let error    = "";

            if (email === "") {
                error = "Email address is required.";
            } else if (!email.includes("@")) {
                error = "Please enter a valid email address.";
            } else if (password === "") {
                error = "Password is required.";
            }

            if (error !== "") {
                document.getElementById("errorMsg").innerText = error;
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
                Where every thread<br>
                tells a story of<br>
                <em>timeless elegance.</em>
            </p>
            <div class="gold-rule">
                <div class="gold-rule-line"></div>
                <div class="gold-rule-dot"></div>
            </div>
            <p class="brand-desc">
                Authentic Kanjivaram &amp; Banarasi silks,
                handwoven with centuries-old craftsmanship —
                delivered to your door.
            </p>
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
                <div class="form-eyebrow">Welcome Back</div>
                <h1 class="form-title">Sign in to your<br>account</h1>
                <p class="form-subtitle">Access your orders, wishlist &amp; exclusive collections.</p>
            </div>

            <!-- Server-side error -->
            <div class="server-error">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
            </div>

            <form action="login" method="post" onsubmit="return validateLogin()">

                <!-- REQUIRED: servlet routing -->
               

                <div class="field">
                    <label for="email">Email Address</label>
                    <div class="input-wrap">
                        <input type="email" id="email" name="email"
                               placeholder="you@example.com" required autocomplete="email">
                        <span class="input-icon">✉</span>
                    </div>
                </div>

                <div class="field">
                    <label for="password">Password</label>
                    <div class="input-wrap">
                        <input type="password" id="password" name="password"
                               placeholder="Enter your password" required autocomplete="current-password">
                        <span class="input-icon">🔒</span>
                    </div>
                </div>

                <!-- Client-side error -->
                <p id="errorMsg" class="field-error"></p>

                <button type="submit" class="btn-submit">Sign In</button>
                <div class="btn-accent-line"></div>

            </form>

            <div class="form-divider">
                <div class="form-divider-line"></div>
                <span class="form-divider-text">New here?</span>
                <div class="form-divider-line"></div>
            </div>

            <div class="register-row">
                <span class="register-text">Don't have an account? </span>
                <a href="register.jsp" class="register-link">Create one</a>
            </div>

        </div>
    </main>

</div>

</body>
</html>
