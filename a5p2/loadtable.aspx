<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loadtable.aspx.cs" Inherits="a5p2.loadtable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Insert a Batch of records into a table </title>
</head>
<body>
    <h1>Insert a Batch of records into a table</h1>
    <form id="form2" runat="server">
    <div>
            <table border="1">
    <tr>
    <%
    for (int j = 0; j < nfields; j++) {
    %>
    <th>
    <%=fieldnames[j]%>
    </th><%}%>
    </tr>
    <% for (int i = 0; i < nrecs; i++) { %>
    <tr>
    <% for (int k = 0; k < nfields; k++) { %>
    <td>
    <input type="text" name="<%=fieldnames[k]+i%>" size="35"/></td><%}%>
    </tr><%}%>
    </table>
        <input type="hidden" />
    <p><input type="submit" value="Submit"/></p>

    </div>
    </form>
</body>
</html>