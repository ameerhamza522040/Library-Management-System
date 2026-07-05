<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Library_Management_system.AdminLogin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - Library Management System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* ===== Global Styles ===== */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            background-color: #0d1830;
            background-image:
                linear-gradient(rgba(18,33,59,0.94), rgba(10,18,34,0.97)),
                repeating-linear-gradient(0deg, rgba(201,162,39,0.06) 0px, rgba(201,162,39,0.06) 1px, transparent 1px, transparent 38px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 16px;
        }

        /* ===== Admin Login Card ===== */
        .login-card {
            position: relative;
            background: #F3ECD9;
            width: 400px;
            padding: 54px 40px 40px;
            border-radius: 6px;
            border: 1px solid rgba(201,162,39,0.5);
            box-shadow: 0 25px 60px rgba(0,0,0,0.45);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .login-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 30px 70px rgba(0,0,0,0.5);
        }

        .badge {
            width: 62px;
            height: 62px;
            margin: 0 auto 18px;
            border-radius: 50%;
            border: 2px solid #C9A227;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            color: #12213B;
            background: #fff;
        }

        .eyebrow {
            font-size: 0.72rem;
            letter-spacing: 0.28em;
            text-transform: uppercase;
            color: #6E2A2A;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .login-card h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            color: #12213B;
            font-size: 1.9rem;
            margin-bottom: 8px;
            letter-spacing: 0.2px;
        }

        .subtext {
            font-size: 0.85rem;
            color: #55554a;
            font-style: italic;
            margin-bottom: 30px;
        }

        /* ===== Input Fields ===== */
        .login-card input[type="text"],
        .login-card input[type="password"] {
            width: 100%;
            padding: 14px 16px;
            margin: 8px 0;
            border-radius: 4px;
            border: 1px solid #c9c2a8;
            background: #fffdf7;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            color: #12213B;
            transition: all 0.3s ease;
        }
        .login-card input::placeholder {
            color: #8a8674;
        }
        .login-card input:focus {
            border-color: #C9A227;
            box-shadow: 0 0 0 3px rgba(201,162,39,0.2);
            outline: none;
        }

        /* ===== Buttons ===== */
        .login-card button,
        .login-card input[type="submit"] {
            width: 100%;
            padding: 14px 0;
            margin-top: 16px;
            border: none;
            border-left: 5px solid #C9A227;
            border-radius: 4px;
            font-family: 'Inter', sans-serif;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.02em;
            cursor: pointer;
            background: #12213B;
            color: #F3ECD9;
            transition: all 0.25s ease;
        }
        .login-card button:hover {
            background: #1a2f52;
            transform: translateX(3px);
        }

        /* Back Button */
        .login-card .back-btn {
            background: transparent;
            border: 1px solid #b9b193;
            border-left: 1px solid #b9b193;
            color: #55554a;
            box-shadow: none;
            margin-top: 10px;
        }
        .login-card .back-btn:hover {
            background: rgba(0,0,0,0.04);
            transform: none;
            color: #12213B;
            border-color: #12213B;
        }

        /* Message Label */
        #<%= lblMessage.ClientID %> {
            display: block;
            margin-top: 16px;
            font-size: 14px;
            font-weight: 600;
        }

        /* ===== Responsive ===== */
        @media (max-width: 500px) {
            .login-card {
                width: 100%;
                padding: 46px 24px 32px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <div class="badge">🔐</div>
            <div class="eyebrow">Restricted Access</div>
            <h2>Admin Login</h2>
            <p class="subtext">Sign in to manage the library records.</p>

            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email"></asp:TextBox><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox><br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br />
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="back-btn" OnClick="btnBack_Click" /><br />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>