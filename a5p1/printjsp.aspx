<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printjsp.aspx.cs" Inherits="a5p1.printjsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select JSP RECORDs</title>
</head>
<body>
    <div>
        <h1> Select JSP RECORDs </h1>
    </div>
    <form action="printjsp.aspx"
          method="post">
        <p>
            <h1> Enter Supplier's S#: </h1>
            <input type="text" name="snum" size="35" />
        </p>
        <p>
            <h1> Enter Part's P#: </h1>
            <input type="text" name="pnum" size="35" />
        </p>
        <p>
            <input type="submit" value="Submit Select" />
        </p>

    </form>


    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="J#" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="J#" HeaderText="J#" ReadOnly="True" SortExpression="J#" />
                <asp:BoundField DataField="JNAME" HeaderText="JNAME" SortExpression="JNAME" />
                <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=mpetros2_spjdatabase;User ID=mpetros2;Password=c00per" SelectCommand="SELECT J.J#,J.JNAME,J.CITY FROM J,SPJ WHERE S#=@SNUM AND P# = @PNUM AND J.J#=SPJ.J#">
            <SelectParameters>
                <asp:FormParameter FormField="snum" Name="SNUM" />
                <asp:FormParameter FormField="pnum" Name="PNUM" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    <a href="mainmenup1.html">Return to main menu</a>
</body>
</html>
