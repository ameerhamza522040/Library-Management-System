<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="Library_Management_System.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
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
            font-family: 'Inter', 'Poppins', sans-serif;
            background-image: url('Images/uog1.jfif');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            background-attachment: fixed;
            color: #F3ECD9;
            min-height: 100vh;
        }

        .overlay {
            min-height: 100vh;
            width: 100%;
            display: flex;
            flex-direction: column;
            background: linear-gradient(180deg, rgba(10,22,17,0.55) 0%, rgba(10,22,17,0.72) 40%, rgba(8,18,14,0.9) 100%);
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
            background: rgba(16, 30, 24, 0.35);
            border-bottom: 1px solid rgba(201, 162, 39, 0.25);
        }

        .navbar .brand-eyebrow {
            font-size: 0.66rem;
            letter-spacing: 0.24em;
            text-transform: uppercase;
            color: #C9A227;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .navbar h1 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 1.7rem;
            color: #fff;
        }

        #btnLogout {
            color: #f1a89c;
            border: 1.5px solid #d9695a;
            padding: 11px 26px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            font-size: 0.88rem;
            font-family: 'Inter', sans-serif;
            background: rgba(217, 105, 90, 0.1);
            transition: all 0.3s ease;
        }

        #btnLogout:hover {
            background: #d9695a;
            color: #fff;
            box-shadow: 0 8px 20px rgba(217, 105, 90, 0.4);
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
            color: #C9A227;
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
        /* Fixed 2-column grid so 4 cards always sit as a clean 2x2,
           instead of flex-wrap letting 3 fit on one row. */
        .dashboard {
            flex: 1;
            display: grid;
            grid-template-columns: repeat(2, minmax(240px, 300px));
            justify-content: center;
            align-content: flex-start;
            gap: 26px;
            padding: 30px 56px 60px;
            max-width: 700px;
            margin: 0 auto;
        }

        .card {
            position: relative;
            background: rgba(255, 255, 255, 0.06);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border: 1px solid rgba(201, 162, 39, 0.22);
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
            background: linear-gradient(120deg, transparent, rgba(76,175,120,0.16), transparent);
            transform: rotate(20deg);
            transition: left 0.7s ease;
            pointer-events: none;
        }

        .card:hover::before {
            left: 130%;
        }

        .card:hover {
            transform: translateY(-6px);
            border-color: rgba(76, 175, 120, 0.6);
            box-shadow: 0 18px 36px rgba(0,0,0,0.35);
        }

        .card-index {
            font-family: 'Fraunces', Georgia, serif;
            font-size: 0.75rem;
            color: #C9A227;
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
            color: #d8ecdf;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        /* ====== Buttons inside cards ====== */
        /* asp:Button renders as <input type="submit"> — target by ID, not tag name */
        #btnViewBooks, #btnRequestBook, #btnMyIssuedBooks, #btnChangePassword {
            width: 100%;
            padding: 12px;
            border-radius: 30px;
            border: 1.5px solid #4CAF78;
            background: transparent;
            color: #7fd9a6;
            font-family: 'Inter', sans-serif;
            font-size: 0.88rem;
            font-weight: 600;
            letter-spacing: 0.02em;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        #btnViewBooks:hover, #btnRequestBook:hover, #btnMyIssuedBooks:hover, #btnChangePassword:hover {
            background: #4CAF78;
            color: #0d1f18;
            box-shadow: 0 10px 22px rgba(76,175,120,0.35);
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 18px;
            font-size: 0.8rem;
            color: #b9ccc0;
            background: rgba(0,0,0,0.3);
            border-top: 1px solid rgba(201,162,39,0.2);
        }

        /* ====== Responsive ====== */
        @media (max-width: 600px) {
            .navbar, .section-label, .dashboard {
                padding-left: 20px;
                padding-right: 20px;
            }
            .dashboard {
                grid-template-columns: 1fr;
                max-width: 340px;
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
                    <div class="brand-eyebrow">Member Access</div>
                    <h1>Student Dashboard</h1>
                </div>
                <asp:Button ID="btnLogout" runat="server" CssClass="logout" Text="Logout" OnClick="btnLogout_Click" />
            </div>

            <!-- Section label -->
            <div class="section-label">
                <div class="eyebrow">Quick Access</div>
                <h2>Your Library Account</h2>
            </div>

            <!-- Dashboard Main Section -->
            <div class="dashboard">
                <div class="card">
                    <span class="card-index">01</span>
                    <h2>View Books</h2>
                    <p>Explore all available books in the library database.</p>
                    <asp:Button ID="btnViewBooks" runat="server" Text="Open" OnClick="btnViewBooks_Click" />
                </div>

                <div class="card">
                    <span class="card-index">02</span>
                    <h2>Request Book</h2>
                    <p>Send a request to borrow a book from the library.</p>
                    <asp:Button ID="btnRequestBook" runat="server" Text="Request" OnClick="btnRequestBook_Click" />
                </div>

                <div class="card">
                    <span class="card-index">03</span>
                    <h2>My Issued Books</h2>
                    <p>Check which books you currently have issued.</p>
                    <asp:Button ID="btnMyIssuedBooks" runat="server" Text="View Issued" OnClick="btnMyIssuedBooks_Click" />
                </div>
                <div class="card">
                    <span class="card-index">04</span>
                    <h2>Change Password</h2>
                    <p>Change your current password.</p>
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                </div>
            </div>

            <!-- Footer -->
            <div class="footer">
                Library Management System © 2025 | Student Dashboard
            </div>
        </div>
    </form>
</body>
</html>