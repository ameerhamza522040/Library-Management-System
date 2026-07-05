<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="Library_Management_system.StudentLogin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login - Library Management System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            background-color: #0d1f18;
            background-image:
                linear-gradient(rgba(20,46,36,0.94), rgba(10,24,19,0.97)),
                repeating-linear-gradient(0deg, rgba(201,162,39,0.06) 0px, rgba(201,162,39,0.06) 1px, transparent 1px, transparent 38px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 16px;
        }

        .login-container {
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
        .login-container:hover {
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
            background: #fff;
        }

        .eyebrow {
            font-size: 0.72rem;
            letter-spacing: 0.28em;
            text-transform: uppercase;
            color: #1B4332;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .login-container h2 {
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

        .login-container input[type="text"],
        .login-container input[type="password"] {
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
        .login-container input::placeholder {
            color: #8a8674;
        }
        .login-container input:focus {
            border-color: #1B4332;
            box-shadow: 0 0 0 3px rgba(27,67,50,0.18);
            outline: none;
        }

        /* ===== Login Button: targeted by class, works on the actual <input type=submit> ASP.NET renders ===== */
        .btn-primary {
            width: 100%;
            padding: 15px 0;
            margin-top: 18px;
            border: none;
            border-radius: 50px;
            font-family: 'Inter', sans-serif;
            font-size: 16px;
            font-weight: 700;
            letter-spacing: 0.02em;
            cursor: pointer;
            background: linear-gradient(120deg, #1B4332 0%, #2f6b4f 100%);
            color: #F3ECD9;
            box-shadow: 0 8px 20px rgba(27,67,50,0.35);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }
        .btn-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 14px 30px rgba(27,67,50,0.45);
        }
        .btn-primary:active {
            transform: translateY(0) scale(0.99);
        }

        /* ===== Back Button: quiet text-link style, not a competing button ===== */
        .back-btn {
            width: auto;
            display: inline-block;
            margin-top: 16px;
            padding: 6px 4px;
            background: none;
            border: none;
            border-radius: 0;
            box-shadow: none;
            color: #6E2A2A;
            font-size: 0.85rem;
            font-weight: 500;
            border-bottom: 1px dashed rgba(110,42,42,0.5);
            cursor: pointer;
        }
        .back-btn:hover {
            transform: none;
            box-shadow: none;
            color: #C9A227;
            border-color: #C9A227;
        }

        #<%= lblMessage.ClientID %> {
            display: block;
            margin-top: 16px;
            font-size: 14px;
            font-weight: 600;
        }

        @media (max-width: 480px) {
            .login-container {
                width: 100%;
                padding: 46px 24px 32px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="badge">🎓</div>
            <div class="eyebrow">Member Access</div>
            <h2>Student Login</h2>
            <p class="subtext">Sign in to browse the catalog and manage your books.</p>

            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email"></asp:TextBox><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox><br />
            <asp:Button ID="btnLogin" runat="server" Text="📖  Login" CssClass="btn-primary" OnClick="btnLogin_Click" /><br />
            <asp:Button ID="btnBack" runat="server" Text="←  Back" CssClass="btn-primary" OnClick="btnBack_Click" /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>