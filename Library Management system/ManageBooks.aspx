<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBooks.aspx.cs" Inherits="Library_Management_system.ManageBooks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Books</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: #FBF8F2;
            padding: 0 0 60px;
            min-height: 100vh;
        }

        .page-header {
            background: #2E1F3B;
            padding: 34px 20px 30px;
            text-align: center;
            border-bottom: 3px solid #D9A441;
            margin-bottom: 40px;
        }

        .page-header .eyebrow {
            font-size: 0.68rem;
            letter-spacing: 0.24em;
            text-transform: uppercase;
            color: #D9A441;
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

        /* Message label */
        #<%= lblMessage.ClientID %> {
            display: block;
            max-width: 650px;
            margin: -20px auto 25px;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .success {
            color: #1B4332;
            background: rgba(27,67,50,0.08);
            border: 1px solid rgba(27,67,50,0.25);
        }
        .error {
            color: #7a2020;
            background: rgba(122,32,32,0.08);
            border: 1px solid rgba(122,32,32,0.25);
        }

        /* Form Container */
        .form-container {
            max-width: 650px;
            background: #fff;
            padding: 34px 36px;
            margin: 0 auto 46px;
            border-radius: 10px;
            border: 1px solid #ece4d8;
            border-top: 3px solid #D9A441;
            box-shadow: 0 10px 30px rgba(46,31,59,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-3px);
            box-shadow: 0 16px 40px rgba(46,31,59,0.12);
        }

        .form-container label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #2E1F3B;
            font-size: 0.92rem;
        }

        .form-container input {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #d8d0c2;
            font-family: 'Inter', sans-serif;
            font-size: 1rem;
            background: #FBF8F2;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container input:focus {
            border: 1.5px solid #D9A441;
            box-shadow: 0 0 0 3px rgba(217,164,65,0.18);
            outline: none;
            background: #fff;
        }

        /* Buttons */
        .form-container button, asp\:Button {
            width: 100%;
            padding: 14px 0;
            border: none;
            border-radius: 30px;
            background: #2E1F3B;
            color: #fff;
            font-family: 'Inter', sans-serif;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            letter-spacing: 0.3px;
        }

        .form-container button:hover, asp\:Button:hover {
            background: #D9A441;
            color: #2E1F3B;
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(217,164,65,0.35);
        }

        /* GridView */
        .grid {
            border-collapse: separate;
            border-spacing: 0;
            width: 95%;
            max-width: 1100px;
            margin: auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(46,31,59,0.08);
            overflow: hidden;
        }

        .grid th {
            background: #2E1F3B;
            color: #EFC96D;
            padding: 15px;
            text-align: center;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            font-weight: 600;
        }

        .grid td {
            padding: 14px 15px;
            text-align: center;
            border-bottom: 1px solid #f0ece2;
            font-size: 0.92rem;
            color: #2B2B2B;
        }

        .grid tr:nth-child(even) {
            background: #FBF8F2;
        }

        .grid tr:hover {
            background: #f5ecd8;
            transition: background 0.25s ease;
        }

        /* Action Buttons */
        .action-btn {
            padding: 7px 16px;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            font-size: 0.85rem;
        }

        .edit-btn {
            background: transparent;
            border: 1.5px solid #D9A441;
            color: #a5791f;
        }

        .edit-btn:hover {
            background: #D9A441;
            color: #2E1F3B;
            transform: scale(1.05);
        }

        .delete-btn {
            background: transparent;
            border: 1.5px solid #c0392b;
            color: #c0392b;
        }

        .delete-btn:hover {
            background: #c0392b;
            color: #fff;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

        <div class="page-header">
            <div class="eyebrow">Admin &middot; Control Panel</div>
            <h2>Manage Books</h2>
        </div>

        <asp:Label ID="lblMessage" runat="server" />

        <div class="form-container">
            <asp:HiddenField ID="hfBookID" runat="server" />
            <label>Book Title</label>
            <asp:TextBox ID="txtTitle" runat="server" />
            <label>Author</label>
            <asp:TextBox ID="txtAuthor" runat="server" />
            <label>ISBN</label>
            <asp:TextBox ID="txtISBN" runat="server" />
            <label>Total Copies</label>
            <asp:TextBox ID="txtTotalCopies" runat="server" />
            <label>Available Copies</label>
            <asp:TextBox ID="txtAvailableCopies" runat="server" />
            <asp:Button ID="btnSave" runat="server" Text="Add / Update Book" OnClick="btnSave_Click" />
        </div>

        <asp:GridView ID="GridViewBooks" runat="server" CssClass="grid" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewBooks_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Title" HeaderText="Book Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField DataField="TotalCopies" HeaderText="Total Copies" />
                <asp:BoundField DataField="AvailableCopies" HeaderText="Available Copies" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="action-btn edit-btn" CommandArgument='<%# Eval("BookID") %>' OnClick="btnEdit_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="action-btn delete-btn" CommandArgument='<%# Eval("BookID") %>' OnClick="btnDelete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </form>
</body>
</html>