<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestBook.aspx.cs" Inherits="Library_Management_system.RequestBook" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request a Book</title>
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
            font-family: 'Inter', Arial, sans-serif;
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

        .form-box {
            position: relative;
            background: #F3ECD9;
            width: 100%;
            max-width: 420px;
            padding: 54px 40px 40px;
            margin: 0 auto;
            border-radius: 6px;
            border: 1px solid rgba(201,162,39,0.5);
            box-shadow: 0 25px 60px rgba(0,0,0,0.45);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-box:hover {
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

        h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            color: #12213B;
            font-size: 1.8rem;
            margin-bottom: 8px;
            letter-spacing: 0.2px;
        }

        .subtext {
            font-size: 0.85rem;
            color: #55554a;
            font-style: italic;
            margin-bottom: 30px;
        }

        .form-box label {
            display: block;
            text-align: left;
            margin: 0 0 6px;
            font-weight: 600;
            color: #12213B;
            font-size: 0.85rem;
        }

        .form-box input[type="text"] {
            width: 100%;
            padding: 13px 15px;
            margin-bottom: 18px;
            border-radius: 4px;
            border: 1px solid #c9c2a8;
            background: #fffdf7;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            color: #12213B;
            transition: all 0.3s ease;
        }

        .form-box input::placeholder {
            color: #8a8674;
        }

        .form-box input[type="text"]:focus {
            border-color: #1B4332;
            box-shadow: 0 0 0 3px rgba(27,67,50,0.18);
            outline: none;
        }

        #btnRequest {
            display: block;
            width: 100%;
            padding: 15px 0;
            margin-top: 8px;
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

        #btnRequest:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 14px 30px rgba(27,67,50,0.45);
        }

        #btnRequest:active {
            transform: translateY(0) scale(0.99);
        }

        .msg {
            display: block;
            margin-top: 16px;
            font-size: 14px;
            font-weight: 600;
            color: #1B4332;
        }

        @media (max-width: 480px) {
            .form-box {
                padding: 46px 24px 32px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-box">
            <div class="badge">📖</div>
            <div class="eyebrow">Member Request</div>
            <h2>Request a Book</h2>
            <p class="subtext">Can't find a title in the catalog? Ask us to add it.</p>

            <label>Your Name</label>
            <asp:TextBox ID="txtName" runat="server" Placeholder="Enter your name"></asp:TextBox>

            <label>Your Email</label>
            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Enter your email"></asp:TextBox>

            <label>Book Title</label>
            <asp:TextBox ID="txtBookTitle" runat="server" Placeholder="Enter the book title"></asp:TextBox>

            <asp:Button ID="btnRequest" runat="server" Text="Submit Request" OnClick="btnRequest_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="msg"></asp:Label>
        </div>
    </form>
</body>
</html>