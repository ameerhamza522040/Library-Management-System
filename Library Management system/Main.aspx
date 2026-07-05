<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.MainPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Library Management System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background:
                linear-gradient(180deg, rgba(18,33,59,0.45) 0%, rgba(18,33,59,0.78) 65%, rgba(12,22,40,0.92) 100%),
                url('Images/Uog.webp') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .container {
            position: relative;
            width: 100%;
            max-width: 480px;
            background: rgba(243, 236, 217, 0.94);
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
            border: 1px solid rgba(201, 162, 39, 0.5);
            border-radius: 6px;
            padding: 56px 48px 44px;
            box-shadow: 0 30px 70px rgba(0,0,0,0.45);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-4px);
            box-shadow: 0 35px 80px rgba(0,0,0,0.5);
        }

        .catalog-no {
            position: absolute;
            top: 18px;
            left: 22px;
            font-size: 0.7rem;
            letter-spacing: 0.12em;
            color: #1B4332;
            opacity: 0.65;
            text-transform: uppercase;
        }

        .eyebrow {
            font-size: 0.78rem;
            letter-spacing: 0.28em;
            text-transform: uppercase;
            color: #1B4332;
            font-weight: 600;
            margin-bottom: 14px;
        }

        .rule {
            width: 46px;
            height: 2px;
            background: #C9A227;
            margin: 0 auto 22px;
        }

        h1 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 2.3rem;
            line-height: 1.15;
            color: #12213B;
            margin-bottom: 8px;
            text-shadow: none;
        }

        .tagline {
            font-size: 0.95rem;
            color: #4a4a42;
            margin-bottom: 36px;
            font-style: italic;
        }

        .btn {
            display: block;
            width: 100%;
            text-align: left;
            background: #12213B;
            color: #F3ECD9;
            padding: 17px 22px;
            margin: 0 0 14px 0;
            font-size: 1rem;
            font-weight: 600;
            letter-spacing: 0.01em;
            border-radius: 4px;
            border: none;
            border-left: 6px solid #C9A227;
            cursor: pointer;
            transition: transform 0.25s ease, box-shadow 0.25s ease, background 0.25s ease;
            box-shadow: 0 6px 16px rgba(18,33,59,0.25);
        }

        .btn:hover {
            background: #1a2f52;
            transform: translateX(4px);
            box-shadow: 0 10px 24px rgba(18,33,59,0.35);
        }

        #btnStudentLogin {
            background: #1B4332;
            border-left-color: #E4C766;
            box-shadow: 0 6px 16px rgba(27,67,50,0.25);
        }

        #btnStudentLogin:hover {
            background: #235c42;
            box-shadow: 0 10px 24px rgba(27,67,50,0.35);
        }

        /* ===== Register Link Styling ===== */
        .register-link {
            margin-top: 6px;
        }
        .register-link a {
            color: #6E2A2A;
            font-size: 0.88rem;
            text-decoration: none;
            border-bottom: 1px dashed rgba(110,42,42,0.5);
            padding-bottom: 2px;
            font-weight: 500;
            transition: color 0.25s ease, border-color 0.25s ease;
        }
        .register-link a:hover {
            color: #C9A227;
            border-color: #C9A227;
            text-shadow: none;
        }

        /* ===== Responsive ===== */
        @media(max-width: 768px) {
            .container {
                padding: 44px 30px 36px;
                width: 90%;
            }
            h1 {
                font-size: 1.9rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <span class="catalog-no">No. LMS&ndash;01</span>
            <div class="eyebrow">Library Portal</div>
            <div class="rule"></div>
            <h1>📚 Library Management System</h1>
            <p class="tagline">Access the catalog, manage your account, and check your issued titles.</p>

            <!-- Admin Login Button -->
            <asp:Button ID="btnAdminLogin" runat="server" Text="Login as Admin" CssClass="btn" OnClick="btnAdminLogin_Click" />
            <!-- Student Login Button -->
            <asp:Button ID="btnStudentLogin" runat="server" Text="Login as Student" CssClass="btn" OnClick="btnStudentLogin_Click" />
            <!-- Register Link -->
            <div class="register-link">
                <asp:LinkButton ID="btnStudentRegister" runat="server" Text="Not a member yet? Register here" OnClick="btnStudentRegister_Click"></asp:LinkButton>
            </div>
        </div>
    </form>
</body>
</html>