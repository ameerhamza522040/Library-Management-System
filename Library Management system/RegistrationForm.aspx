<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Library_Management_system.RegistrationForm" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration - Library Management System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #0d1830;
            background-image:
                linear-gradient(rgba(18,33,59,0.94), rgba(10,18,34,0.97)),
                repeating-linear-gradient(0deg, rgba(201,162,39,0.06) 0px, rgba(201,162,39,0.06) 1px, transparent 1px, transparent 38px);
            margin: 0;
            min-height: 100vh;
        }

        .page-header {
            width: 100%;
            padding: 26px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(201,162,39,0.3);
            backdrop-filter: blur(10px);
            background: rgba(255,255,255,0.03);
        }

        .page-header .eyebrow {
            font-size: 0.68rem;
            letter-spacing: 0.26em;
            text-transform: uppercase;
            color: #C9A227;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .page-header .title {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 1.5rem;
            color: #fff;
        }

        .form-wrapper {
            display: flex;
            justify-content: center;
            padding: 48px 16px 60px;
        }

        .form-container {
            position: relative;
            background: #F3ECD9;
            padding: 46px 44px 40px;
            border-radius: 6px;
            border: 1px solid rgba(201,162,39,0.5);
            box-shadow: 0 30px 70px rgba(0,0,0,0.45);
            width: 100%;
            max-width: 560px;
            text-align: center;
        }

        .card-index {
            position: absolute;
            top: 18px;
            left: 22px;
            font-size: 0.7rem;
            letter-spacing: 0.12em;
            color: #12213B;
            opacity: 0.55;
            text-transform: uppercase;
        }

        .badge-row {
            display: flex;
            justify-content: center;
            margin-bottom: 14px;
        }

        .badge {
            width: 58px;
            height: 58px;
            border-radius: 50%;
            border: 2px solid #C9A227;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            background: #fff;
        }

        h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 1.7rem;
            color: #12213B;
            margin-bottom: 6px;
        }

        .subtext {
            font-size: 0.85rem;
            color: #55554a;
            font-style: italic;
            margin-bottom: 32px;
        }

        /* Two-column field grid — fields that pair naturally sit side by side */
        .field-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0 16px;
            text-align: left;
        }

        .field-grid .full {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin: 0 0 6px;
            font-weight: 600;
            color: #12213B;
            font-size: 0.85rem;
        }

        input[type=text], input[type=email], input[type=password], input[type=tel], textarea, select {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 18px;
            border-radius: 4px;
            border: 1px solid #c9c2a8;
            background: #fffdf7;
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            color: #12213B;
            outline: none;
            transition: all 0.3s ease;
        }

        textarea {
            resize: vertical;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #C9A227;
            box-shadow: 0 0 0 3px rgba(201,162,39,0.2);
        }

        .btn-row {
            display: flex;
            gap: 14px;
            margin-top: 8px;
        }

        .btn {
            flex: 1;
            padding: 14px;
            border-radius: 30px;
            border: none;
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            font-weight: 600;
            letter-spacing: 0.02em;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-register {
            background: #12213B;
            color: #F3ECD9;
            border-left: 4px solid #C9A227;
            box-shadow: 0 8px 20px rgba(18,33,59,0.3);
        }
        .btn-register:hover {
            background: #1a2f52;
            transform: translateY(-2px);
            box-shadow: 0 12px 26px rgba(18,33,59,0.4);
        }

        .btn-back {
            background: transparent;
            border: 1px solid #b9b193;
            color: #55554a;
        }
        .btn-back:hover {
            background: rgba(0,0,0,0.04);
            color: #12213B;
            border-color: #12213B;
        }

        .message {
            display: block;
            margin-top: 18px;
            font-weight: 600;
            font-size: 0.88rem;
            text-align: center;
        }
        .success { color: #1B4332; }
        .error { color: #7a2020; }

        @media screen and (max-width: 560px) {
            .form-container {
                padding: 40px 24px 32px;
            }
            .field-grid {
                grid-template-columns: 1fr;
            }
            .btn-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="page-header">
        <div class="eyebrow">New Member Enrollment</div>
        <div class="title">📚 Library Management System</div>
    </div>

    <div class="form-wrapper">
        <form id="form1" runat="server">
            <div class="form-container">
                <span class="card-index">Form No. REG&ndash;01</span>

                <div class="badge-row">
                    <div class="badge">🪪</div>
                </div>

                <h2>Register New Student</h2>
                <p class="subtext">Fill in your details to get your library membership.</p>

                <div class="field-grid">
                    <div class="full">
                        <asp:Label ID="lblName" runat="server" Text="Student Name:" AssociatedControlID="txtStudentName"></asp:Label>
                        <asp:TextBox ID="txtStudentName" runat="server" OnTextChanged="txtStudentName_TextChanged"></asp:TextBox>
                    </div>

                    <div class="full">
                        <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtStudentEmail"></asp:Label>
                        <asp:TextBox ID="txtStudentEmail" runat="server" TextMode="Email" OnTextChanged="txtStudentEmail_TextChanged"></asp:TextBox>
                    </div>

                    <div class="full">
                        <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </div>

                    <div>
                        <asp:Label ID="lblGender" runat="server" Text="Gender:" AssociatedControlID="ddlGender"></asp:Label>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div>
                        <asp:Label ID="lblMobile" runat="server" Text="Mobile No:" AssociatedControlID="txtMobile"></asp:Label>
                        <asp:TextBox ID="txtMobile" runat="server" TextMode="Phone"></asp:TextBox>
                    </div>

                    <div class="full">
                        <asp:Label ID="lblAddress" runat="server" Text="Address:" AssociatedControlID="txtAddress"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                </div>

                <div class="btn-row">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-register" OnClick="btnRegister_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-back" OnClick="btnBack_Click" />
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>