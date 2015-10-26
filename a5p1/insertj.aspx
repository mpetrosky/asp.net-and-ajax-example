<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertj.aspx.cs" Inherits="a5p1.insertj" %>

<!DOCTYPE html>

<html>
   <head>
      <title> INSERT JOB RECORD </title>
   </head>
   <body>
     <div>
       <h1> INSERT JOB RECORD </h1>
     </div>
     <form runat="server">
       <p>
         <h1> Enter Job's J#: </h1>
           <asp:TextBox id="jnum" size="35" runat="server"/>
       </p>
       <p>
         <h1> Enter Job's Name: </h1>
           <asp:TextBox id="jname" size="35" runat="server"/>
         <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=mpetros2_spjdatabase;User ID=mpetros2;Password=c00per" DeleteCommand="DELETE FROM [J] WHERE [j#] = @column1" InsertCommand="INSERT INTO [J] ([j#], [jname], [city]) VALUES (@jnum, @jname, @city)" SelectCommand="SELECT * FROM [J]" UpdateCommand="UPDATE [J] SET [jname] = @jname, [city] = @city WHERE [j#] = @column1" ProviderName="System.Data.SqlClient">
             <DeleteParameters>
                 <asp:Parameter Name="column1" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:FormParameter Name="jnum" FormField="jnum" />
                 <asp:FormParameter Name="jname" FormField="jname"/>
                 <asp:FormParameter Name="city" FormField="city" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="jname" Type="String" />
                 <asp:Parameter Name="city" Type="String" />
                 <asp:Parameter Name="column1" Type="String" />
             </UpdateParameters>
         </asp:SqlDataSource>
       </p>
       <p>
         <h1> Enter Job's City: </h1>
           <asp:TextBox id="city" size="35" runat="server"/>
       </p>
       <p>
   <asp:Button OnClick="InsertJ" Text="Submit Insert" runat="server"/>
       </p>
  </form>
       <a href="mainmenup1.html">Return to main menu</a>
  </body>
</html>
