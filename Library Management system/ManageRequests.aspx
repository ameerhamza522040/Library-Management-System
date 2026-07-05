<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRequests.aspx.cs" Inherits="Library_Management_system.ManageRequests" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Book Requests</title>
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
            margin: 0;
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
            margin: 0;
        }

        .message {
            text-align: center;
            font-weight: 600;
            font-size: 0.9rem;
            max-width: 650px;
            margin: -20px auto 25px;
            padding: 12px 20px;
            border-radius: 8px;
        }

        .message:empty {
            display: none;
            margin: 0;
            padding: 0;
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

        /* GridView */
        .grid {
            width: 95%;
            max-width: 1100px;
            border-collapse: separate;
            border-spacing: 0;
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
            border: none;
            border-radius: 30px;
            color: #fff;
            font-family: 'Inter', sans-serif;
            font-weight: 600;
            font-size: 0.85rem;
            cursor: pointer;
            margin: 2px;
            transition: all 0.3s ease;
        }

        .approve-btn {
            background: #1B4332;
        }
        .approve-btn:hover {
            background: #235c42;
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(27,67,50,0.3);
        }

        .reject-btn {
            background: #7a2020;
        }
        .reject-btn:hover {
            background: #9c2a2a;
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(122,32,32,0.3);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="page-header">
            <div class="eyebrow">Admin &middot; Control Panel</div>
            <h2>Manage Book Requests</h2>
        </div>

        <div class="message">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>

        <asp:GridView ID="GridViewRequests" runat="server" CssClass="grid" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="RequestID" HeaderText="ID" />
                <asp:BoundField DataField="StudentName" HeaderText="Student" />
                <asp:BoundField DataField="StudentEmail" HeaderText="Email" />
                <asp:BoundField DataField="BookTitle" HeaderText="Requested Book" />
                <asp:BoundField DataField="RequestDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="action-btn approve-btn"
                            CommandArgument='<%# Eval("RequestID") %>' OnClick="btnApprove_Click"
                            Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                        <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="action-btn reject-btn"
                            CommandArgument='<%# Eval("RequestID") %>' OnClick="btnReject_Click"
                            Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>