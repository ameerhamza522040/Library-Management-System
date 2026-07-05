<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuedBooks.aspx.cs" Inherits="Library_Management_system.IssuedBooks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Book</title>
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
            margin: 0;
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

        h3 {
            font-family: 'Fraunces', Georgia, serif;
            font-weight: 500;
            text-align: center;
            color: #2E1F3B !important;
            margin: 46px auto 20px !important;
            font-size: 1.4rem;
        }

        /* Form Card */
        .form-container {
            background: #fff;
            border-radius: 10px;
            border: 1px solid #ece4d8;
            border-top: 3px solid #D9A441;
            box-shadow: 0 10px 30px rgba(46,31,59,0.08);
            padding: 34px 36px;
            width: 95%;
            max-width: 650px;
            margin: 0 auto;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-3px);
            box-shadow: 0 16px 40px rgba(46,31,59,0.12);
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #2E1F3B;
            font-size: 0.92rem;
        }

        select, input[type="date"], input[type="text"] {
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

        select:focus, input:focus {
            border-color: #D9A441;
            box-shadow: 0 0 0 3px rgba(217,164,65,0.18);
            outline: none;
            background: #fff;
        }

        /* Button */
        asp\:Button, button {
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

        asp\:Button:hover, button:hover {
            background: #D9A441;
            color: #2E1F3B;
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(217,164,65,0.35);
        }

        /* Message */
        .message {
            text-align: center;
            margin-top: 18px;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .success { color: #1B4332; }
        .error { color: #7a2020; }

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

        /* Action button inside grid */
        .action-btn {
            width: auto;
            padding: 7px 18px;
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
            box-shadow: none;
        }

        /* ===== Responsive ===== */
        @media (max-width: 700px) {
            .form-container {
                padding: 28px 22px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="page-header">
            <div class="eyebrow">Admin &middot; Control Panel</div>
            <h2>Issue Book to Student</h2>
        </div>

        <div class="form-container">
            <label>Select Student</label>
            <asp:DropDownList ID="ddlStudents" runat="server"></asp:DropDownList>

            <label>Select Book</label>
            <asp:DropDownList ID="ddlBooks" runat="server"></asp:DropDownList>

            <label>Due Date</label>
            <asp:TextBox ID="txtDueDate" runat="server" TextMode="Date"></asp:TextBox>

            <asp:Button ID="btnIssue" runat="server" Text="Issue Book" OnClick="btnIssue_Click" />

            <div class="message">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <h3>Currently Issued Books</h3>

        <asp:GridView ID="GridViewIssued" runat="server" CssClass="grid" AutoGenerateColumns="False"
             Width="100%" style="margin-top:15px;" OnRowDataBound="GridViewIssued_RowDataBound">
          <Columns>
             <asp:BoundField DataField="IssueID" HeaderText="Issue ID" />
             <asp:BoundField DataField="StudentName" HeaderText="Student" />
             <asp:BoundField DataField="Title" HeaderText="Book" />
             <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" DataFormatString="{0:dd-MMM-yyyy}" />
             <asp:BoundField DataField="DueDate" HeaderText="Due Date" DataFormatString="{0:dd-MMM-yyyy}" />
             <asp:BoundField DataField="Status" HeaderText="Status" />
             <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="btnReturn" runat="server" Text="Return"
                    CssClass="action-btn edit-btn"
                    CommandArgument='<%# Eval("IssueID") %>'
                    OnClick="btnReturn_Click"
                    Visible='<%# Eval("Status").ToString() == "Issued" %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    </form>
</body>
</html>