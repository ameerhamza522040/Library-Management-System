<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyIssuedBooks.aspx.cs" Inherits="Library_Management_system.MyIssuedBooks" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Issued Books</title>
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
            font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
            background: #FBF8F2;
            color: #2B2B2B;
            min-height: 100vh;
            padding: 0 0 60px;
        }

        .page-header {
            background: #1B4332;
            padding: 34px 20px 30px;
            text-align: center;
            border-bottom: 3px solid #C9A227;
            margin-bottom: 40px;
        }

        .page-header .eyebrow {
            font-size: 0.68rem;
            letter-spacing: 0.24em;
            text-transform: uppercase;
            color: #C9A227;
            font-weight: 600;
            margin-bottom: 8px;
        }

        h2 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            color: #fff;
            font-size: 2rem;
            text-shadow: none;
            margin: 0;
        }

        /* === GridView Table Styling === */
        .grid {
            border-collapse: separate;
            border-spacing: 0;
            width: 95%;
            max-width: 1000px;
            margin: 0 auto;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(27,67,50,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .grid:hover {
            transform: translateY(-3px);
            box-shadow: 0 16px 40px rgba(27,67,50,0.14);
        }
        .grid th {
            background: #1B4332;
            color: #EFC96D;
            padding: 15px 10px;
            font-size: 0.85rem;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            font-weight: 600;
        }
        .grid td {
            padding: 14px 10px;
            text-align: center;
            font-size: 0.95rem;
            border-bottom: 1px solid #f0ece2;
            transition: background 0.25s ease;
            color: #2B2B2B;
        }
        .grid tr:nth-child(even) {
            background: #FBF8F2;
        }
        .grid tr:hover td {
            background: #eaf5ee;
        }
        .empty-message, td.empty-message {
            color: #7a2020;
            font-size: 1rem;
            padding: 30px 10px !important;
            text-align: center;
            font-weight: 600;
            background: #fff !important;
        }

        /* === Responsive Table === */
        @media (max-width: 768px) {
            .grid th, .grid td {
                padding: 12px 8px;
                font-size: 0.85rem;
            }
            h2 {
                font-size: 1.6rem;
            }
        }
        @media (max-width: 480px) {
            .grid {
                width: 100%;
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="page-header">
            <div class="eyebrow">Member &middot; My Account</div>
            <h2>My Issued Books</h2>
        </div>

        <asp:GridView ID="GridViewIssuedBooks" 
                      runat="server" 
                      CssClass="grid" 
                      AutoGenerateColumns="False" 
                      DataKeyNames="IssueID"
                      EmptyDataText="No issued books found.">
            <Columns>
                <asp:BoundField DataField="IssueID" HeaderText="Issue ID" ReadOnly="True" />
                <asp:BoundField DataField="BookTitle" HeaderText="Book Title" />
                <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="DueDate" HeaderText="Due Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>