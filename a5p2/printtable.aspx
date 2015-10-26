<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printtable.aspx.cs" Inherits="a5p2.printtable" %>

<!DOCTYPE html>

<html>
<head>
    <title>General Retrieval</title>
</head>
<body>
    <div>
        <h1>
            GENERAL RETRIEVAL
        </h1>
    </div>
    <form id="form1" runat="server">
    <div>
        <p>
        <asp:GridView ID="GridView1" runat="server" Height="164px" Width="245px" >
        </asp:GridView>
        
       </p> 
        <h1>
            Enter database name:
        </h1>
        <asp:TextBox ID="databasename" size="35" runat="server" />
        <br />
        
        <h1>
            Enter Username:
        </h1>
        <asp:TextBox ID="username" size="35" runat="server" />
        <br />
        <h1>
            Enter Password:
        </h1>
        <asp:TextBox ID="password" TextMode="Password" size="35" runat="server" />
        <br />

        <h1>
            Enter Table Name:
        </h1>
        <asp:TextBox ID="tablename" size="35" runat="server" />
        <br />
        <p>
            <asp:Button ID="Button1" OnClick="GeneralR" Text="Submit Retrieval" runat="server" />
        </p>
       
    </div>
    </form>
 
</body>
</html>
