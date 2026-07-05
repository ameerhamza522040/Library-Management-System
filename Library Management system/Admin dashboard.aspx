<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin dashboard.aspx.cs" Inherits="Library_Management_System.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            min-height: 100%;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-image: url('Images/uog1.jfif');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            background-attachment: fixed;
            color: #F5F1E6;
            min-height: 100vh;
        }

        .overlay {
            min-height: 100vh;
            width: 100%;
            display: flex;
            flex-direction: column;
            background: linear-gradient(180deg, rgba(12,10,20,0.55) 0%, rgba(12,10,20,0.72) 40%, rgba(10,8,16,0.9) 100%);
        }

        /* ====== Navbar ====== */
        .navbar {
            width: 100%;
            padding: 24px 56px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            background: rgba(20, 16, 30, 0.35);
            border-bottom: 1px solid rgba(217, 164, 65, 0.25);
        }

        .navbar .brand-eyebrow {
            font-size: 0.66rem;
            letter-spacing: 0.24em;
            text-transform: uppercase;
            color: #D9A441;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .navbar h1 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 1.7rem;
            color: #fff;
        }

        .navbar .logout {
            color: #f1a89c;
            border: 1.5px solid #d9695a;
            padding: 11px 26px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            font-size: 0.88rem;
            background: rgba(217, 105, 90, 0.1);
            transition: all 0.3s ease;
        }

        .navbar .logout:hover {
            background: #d9695a;
            color: #fff;
            box-shadow: 0 8px 20px rgba(217, 105, 90, 0.4);
        }

        /* ====== Stats Row ====== */
        .stats-row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 18px;
            padding: 46px 56px 0;
        }

        .stat-box {
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(217, 164, 65, 0.3);
            border-radius: 14px;
            padding: 22px 30px;
            text-align: center;
            min-width: 150px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .stat-box:hover {
            transform: translateY(-4px);
            border-color: rgba(217, 164, 65, 0.7);
            box-shadow: 0 12px 28px rgba(0,0,0,0.3);
        }

        .stat-box .stat-number {
            font-family: 'Fraunces', Georgia, serif;
            font-size: 2.1rem;
            font-weight: 600;
            color: #EFC96D;
        }

        .stat-box .stat-label {
            font-size: 0.78rem;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            color: #d8d2c4;
            margin-top: 6px;
        }

        /* ====== Section Label ====== */
        .section-label {
            text-align: center;
            padding: 46px 24px 0;
        }

        .section-label .eyebrow {
            font-size: 0.68rem;
            letter-spacing: 0.24em;
            text-transform: uppercase;
            color: #D9A441;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .section-label h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 1.6rem;
            color: #fff;
        }

        /* ====== Dashboard Grid ====== */
        .dashboard {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-content: flex-start;
            gap: 26px;
            padding: 30px 56px 60px;
            max-width: 1180px;
            margin: 0 auto;
        }

        .card {
            position: relative;
            flex: 1 1 260px;
            max-width: 280px;
            background: rgba(255, 255, 255, 0.06);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border: 1px solid rgba(217, 164, 65, 0.22);
            border-radius: 16px;
            padding: 30px 24px 24px;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            transition: transform 0.35s ease, box-shadow 0.35s ease, border-color 0.35s ease;
        }

        .card::before {
            content: "";
            position: absolute;
            top: -60%;
            left: -60%;
            width: 55%;
            height: 220%;
            background: linear-gradient(120deg, transparent, rgba(239,201,109,0.14), transparent);
            transform: rotate(20deg);
            transition: left 0.7s ease;
            pointer-events: none;
        }

        .card:hover::before {
            left: 130%;
        }

        .card:hover {
            transform: translateY(-6px);
            border-color: rgba(239, 201, 109, 0.6);
            box-shadow: 0 18px 36px rgba(0,0,0,0.35);
        }

        .card-index {
            font-family: 'Fraunces', Georgia, serif;
            font-size: 0.75rem;
            color: #D9A441;
            letter-spacing: 0.1em;
            margin-bottom: 14px;
            opacity: 0.85;
        }

        .card h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 1.2rem;
            margin-bottom: 8px;
            color: #fff;
        }

        .card p {
            font-size: 0.84rem;
            color: #d8d2c4;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        /* ====== Buttons inside cards ====== */
        asp\:Button, button {
            width: 100%;
            padding: 12px;
            border-radius: 30px;
            border: 1.5px solid #D9A441;
            background: transparent;
            color: #EFC96D;
            font-family: 'Inter', sans-serif;
            font-size: 0.88rem;
            font-weight: 600;
            letter-spacing: 0.02em;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        asp\:Button:hover, button:hover {
            background: #D9A441;
            color: #1c1420;
            box-shadow: 0 10px 22px rgba(217,164,65,0.35);
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 18px;
            font-size: 0.8rem;
            color: #b9b2a3;
            background: rgba(0,0,0,0.3);
            border-top: 1px solid rgba(217,164,65,0.2);
        }

        /* ====== Responsive ====== */
        @media (max-width: 600px) {
            .navbar, .stats-row, .section-label, .dashboard {
                padding-left: 20px;
                padding-right: 20px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="overlay">

            <!-- Navigation -->
            <div class="navbar">
                <div>
                    <div class="brand-eyebrow">Control Panel</div>
                    <h1>Admin Dashboard</h1>
                </div>
                <asp:Button ID="btnLogout" runat="server" CssClass="logout" Text="Logout" OnClick="btnLogout_Click" />
            </div>

            <!-- Stats Row -->
            <div class="stats-row">
                <div class="stat-box">
                    <div class="stat-number"><asp:Label ID="lblTotalBooks" runat="server" Text="0" /></div>
                    <div class="stat-label">Total Books</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><asp:Label ID="lblTotalStudents" runat="server" Text="0" /></div>
                    <div class="stat-label">Total Students</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><asp:Label ID="lblBooksIssued" runat="server" Text="0" /></div>
                    <div class="stat-label">Books Issued</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><asp:Label ID="lblPendingRequests" runat="server" Text="0" /></div>
                    <div class="stat-label">Pending Requests</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><asp:Label ID="lblOverdue" runat="server" Text="0" /></div>
                    <div class="stat-label">Overdue Books</div>
                </div>
            </div>

            <!-- Section label -->
            <div class="section-label">
                <div class="eyebrow">Quick Access</div>
                <h2>Manage Your Library</h2>
            </div>

            <!-- Dashboard Main Section -->
            <div class="dashboard">
                <div class="card">
                    <span class="card-index">01</span>
                    <h2>Manage Students</h2>
                    <p>Check and manage all registered students.</p>
                    <asp:Button ID="btnManageStudents" runat="server" Text="Open" OnClick="btnManageStudents_Click" />
                </div>

                <div class="card">
                    <span class="card-index">02</span>
                    <h2>Manage Books</h2>
                    <p>Add, edit, or remove books from the library.</p>
                    <asp:Button ID="btnManageBooks" runat="server" Text="Manage" OnClick="btnManageBooks_Click" />
                </div>

                <div class="card">
                    <span class="card-index">03</span>
                    <h2>Issue Books</h2>
                    <p>Issue books to students.</p>
                    <asp:Button ID="btnIssuedBooks" runat="server" Text="View" OnClick="btnIssuedBooks_Click" />
                </div>
                <div class="card">
                    <span class="card-index">04</span>
                    <h2>Manage Requests</h2>
                    <p>Manage book requests.</p>
                    <asp:Button ID="btnManageRequests" runat="server" Text="Manage Book Requests" OnClick="btnManageRequests_Click" />
                </div>
                <div class="card">
                    <span class="card-index">05</span>
                    <h2>Change Password</h2>
                    <p>Change your admin password.</p>
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                </div>
            </div>

            <!-- Footer -->
            <div class="footer">
                Library Management System © 2025 | Admin Panel
            </div>
        </div>
    </form>
</body>
</html>