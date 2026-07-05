<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="Library_Management_system.ViewBooks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Books | Library Management System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* ====== Global Reset & Typography ====== */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        html, body { height: 100%; }
        body {
            font-family: 'Inter', "Segoe UI", Arial, sans-serif;
            background-image: url('Images/uog1.jfif');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #ffffff;
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* translucent page overlay to keep your existing background */
        .overlay {
            background: linear-gradient(180deg, rgba(10,22,17,0.7) 0%, rgba(8,18,14,0.85) 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* ====== Navbar ====== */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            backdrop-filter: blur(8px);
            background: rgba(255,255,255,0.03);
            border-bottom: 1px solid rgba(201, 162, 39, 0.25);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .brand .logo {
            width: 46px;
            height: 46px;
            border-radius: 10px;
            background: linear-gradient(135deg,#4CAF78,#1B4332);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 600;
            box-shadow: 0 6px 18px rgba(0,0,0,0.5);
        }

        .brand h1 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            font-size: 1.25rem;
            color: #EFC96D;
            letter-spacing: 0.4px;
            text-shadow: none;
        }

        .nav-actions {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .back-btn {
            padding: 8px 18px;
            border-radius: 8px;
            border: 1px solid rgba(255,82,82,0.14);
            background: rgba(255,82,82,0.06);
            color: #ffb3b3;
            font-weight: 600;
            cursor: pointer;
            transition: all .25s ease;
        }
        .back-btn:hover { background: rgba(255,82,82,0.18); color: #fff; transform: translateY(-3px); box-shadow: 0 8px 20px rgba(255,82,82,0.12); }

        /* ====== Page content wrapper ====== */
        .content {
            flex: 1;
            padding: 48px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 28px;
        }

        .page-title {
            width: 100%;
            max-width: 1100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .page-title h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            color: #EFC96D;
            font-size: 1.6rem;
            text-shadow: none;
        }

        /* ====== Search bar ====== */
        .search-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .search-box input[type="text"] {
            padding: 12px 14px;
            width: 340px;
            border-radius: 10px 0 0 10px;
            border: 1px solid rgba(255,255,255,0.06);
            outline: none;
            background: rgba(255,255,255,0.03);
            color: #fff;
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
        }

        .search-box input[type="text"]::placeholder { color: rgba(255,255,255,0.65); }

        .search-box input[type="submit"], .search-box input[type="button"], .search-btn {
            padding: 12px 18px;
            border-radius: 0 10px 10px 0;
            border: none;
            cursor: pointer;
            background: linear-gradient(90deg,#4CAF78,#1B4332);
            color: #fff;
            font-family: 'Inter', sans-serif;
            font-weight: 700;
            box-shadow: 0 8px 22px rgba(76,175,120,0.25);
            transition: transform .18s ease, box-shadow .18s ease;
        }
        .search-box input[type="submit"]:hover, .search-btn:hover { transform: translateY(-3px); box-shadow: 0 14px 30px rgba(76,175,120,0.35); }

        /* ====== Grid container (glass card) ====== */
        .grid-container {
            width: 100%;
            max-width: 1100px;
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(10px);
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.55);
            border: 1px solid rgba(201, 162, 39, 0.18);
        }

        /* Grid/table styles */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .gridview th, .gridview td {
            padding: 12px 14px;
            text-align: left;
            color: #f7f7f7;
            font-family: 'Inter', sans-serif;
            font-size: 0.98rem;
            border-bottom: 1px solid rgba(255,255,255,0.04);
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .gridview thead th {
            color: #C9A227;
            font-weight: 700;
            background: rgba(255,255,255,0.02);
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }

        .gridview tbody tr:hover {
            background: rgba(76,175,120,0.08);
            transform: translateY(-1px);
        }

        .footer {
            text-align: center;
            padding: 16px;
            color: #b9ccc0;
            font-family: 'Inter', sans-serif;
            font-size: 0.85rem;
            background: rgba(0,0,0,0.3);
            border-top: 1px solid rgba(201,162,39,0.2);
        }

        /* responsive adjustments */
        @media (max-width: 900px) {
            .search-box input[type="text"] { width: 220px; }
            .page-title { flex-direction: column; align-items: flex-start; gap: 12px; }
            .gridview th, .gridview td { font-size: 0.9rem; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay">
            <!-- NAV -->
            <div class="navbar">
                <div class="brand">
                    <div class="logo">L</div>
                    <h1>Library Management</h1>
                </div>
            </div>

            <!-- MAIN CONTENT -->
            <div class="content">
                <div class="page-title">
                    <h2>📚 Available Books in Library</h2>

                    <div class="search-box">
                        <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search by Title or Author"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click" />
                    </div>
                </div>

                <div class="grid-container">
                    <!-- keep GridView markup intact (no ID or field changes) -->
                    <asp:GridView ID="GridView1" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="BookId" HeaderText="Book ID" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Author" HeaderText="Author" />
                            <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                            <asp:BoundField DataField="TotalCopies" HeaderText="Total Copies" />
                            <asp:BoundField DataField="AvailableCopies" HeaderText="Available Copies" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- FOOTER -->
            <div class="footer">
                Library Management System © 2025 | Books
            </div>
        </div>
    </form>
</body>
</html>