<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Library_Management_system.ChangePassword" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
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
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: #FBF8F2;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 30px 16px;
        }

        .form-container {
            position: relative;
            background: #fff;
            border-radius: 10px;
            border: 1px solid #ece4d8;
            border-top: 3px solid #1B4332;
            box-shadow: 0 15px 40px rgba(27,67,50,0.14);
            padding: 46px 40px 38px;
            width: 100%;
            max-width: 440px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 50px rgba(27,67,50,0.18);
        }

        .badge {
            width: 58px;
            height: 58px;
            margin: 0 auto 16px;
            border-radius: 50%;
            border: 2px solid #C9A227;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            background: #FBF8F2;
        }

        .eyebrow {
            font-size: 0.68rem;
            letter-spacing: 0.24em;
            text-transform: uppercase;
            color: #1B4332;
            font-weight: 600;
            margin-bottom: 8px;
        }

        h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            color: #12213B;
            font-size: 1.7rem;
            margin: 0 0 30px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #12213B;
            font-size: 0.9rem;
            text-align: left;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #d8d0c2;
            font-family: 'Inter', sans-serif;
            font-size: 1rem;
            background: #FBF8F2;
            transition: all 0.3s ease;
        }

        input[type="password"]:focus {
            border-color: #1B4332;
            box-shadow: 0 0 0 3px rgba(27,67,50,0.18);
            outline: none;
            background: #fff;
        }

        /* asp:Button renders as <input type="submit">, not <button> — target by ID */
        #btnChangePassword {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 30px;
            font-family: 'Inter', sans-serif;
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 0.02em;
            color: #fff;
            cursor: pointer;
            background: #1B4332;
            transition: all 0.3s ease;
        }

        #btnChangePassword:hover {
            background: #C9A227;
            color: #12213B;
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(201,162,39,0.35);
        }

        .message {
            text-align: center;
            margin-top: 16px;
            font-weight: 600;
            font-size: 0.88rem;
        }

        .success { color: #1B4332; }
        .error { color: #7a2020; }

        @media (max-width: 480px) {
            .form-container {
                padding: 38px 26px 30px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="badge">🔒</div>
            <div class="eyebrow">Member &middot; Security</div>
            <h2>Change Password</h2>

            <label>Current Password</label>
            <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
            <label>New Password</label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
            <label>Confirm New Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnChangePassword" runat="server" Text="Update Password" OnClick="btnChangePassword_Click" />
            <div class="message">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>