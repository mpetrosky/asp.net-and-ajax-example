<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajax.aspx.cs" Inherits="a5p4.ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title>AJAX Web Form</title></head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <p><asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="Insert J record"></asp:Label>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>Insert is in progress. Take it easy, we're working on it!</ProgressTemplate>
                </asp:UpdateProgress>
        <p>Enter J#: <asp:TextBox ID="TextBox1" runat="server" Text=""></asp:TextBox></p>
        <p>Enter name: <asp:TextBox ID="TextBox2" runat="server" Text=""></asp:TextBox></p>
        <p>Enter city: <asp:TextBox ID="TextBox3" runat="server" Text=""></asp:TextBox></p>
        <p></p><asp:Button ID="Button1" runat="server" Text="Insert record" OnClick="InsertJ" />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=mpetros2_spjdatabase;User ID=mpetros2;Password=c00per" DeleteCommand="DELETE FROM [J] WHERE [j#] = @column1" InsertCommand="INSERT INTO [J] ([j#], [jname], [city]) VALUES (@column1, @jname, @city)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [J] WHERE (([j#] = @column1) AND ([city] = @city) AND ([jname] = @jname))" UpdateCommand="UPDATE [J] SET [jname] = @jname, [city] = @city WHERE [j#] = @column1">
                    <DeleteParameters>
                        <asp:Parameter Name="column1" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:FormParameter FormField="TextBox1" Name="column1" Type="String" />
                        <asp:FormParameter FormField="TextBox2" Name="jname" Type="String" />
                        <asp:FormParameter FormField="TextBox3" Name="city" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:FormParameter FormField="jnum" Name="column1" Type="String" />
                        <asp:FormParameter FormField="city" Name="city" Type="String" />
                        <asp:FormParameter FormField="jname" Name="jname" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="jname" Type="String" />
                        <asp:Parameter Name="city" Type="String" />
                        <asp:Parameter Name="column1" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </p>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        </p>
        <p>
           
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <p>
                    <asp:Label ID="Label2" runat="server" Text="Delete J record"></asp:Label>
                </p>
                <p>Enter J#: <asp:TextBox ID="TextBox4" runat="server" Text=""></asp:TextBox></p>
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>Delete is in progress, just sit back and relax</ProgressTemplate>
                </asp:UpdateProgress>
                <p>
                    <asp:Button ID="Button2" runat="server" Text="Delete record" OnClick="DeleteJ" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=mpetros2_spjdatabase;User ID=mpetros2;Password=c00per" DeleteCommand="DELETE FROM [J] WHERE [j#] = @column1" InsertCommand="INSERT INTO [J] ([j#], [jname], [city]) VALUES (@column1, @jname, @city)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [J] WHERE ([j#] = @column1)" UpdateCommand="UPDATE [J] SET [jname] = @jname, [city] = @city WHERE [j#] = @column1">
                        <DeleteParameters>
                            <asp:FormParameter FormField="TextBox4" Name="column1" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="column1" Type="String" />
                            <asp:Parameter Name="jname" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:FormParameter FormField="jnum" Name="column1" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="jname" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="column1" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </ContentTemplate>
        </asp:UpdatePanel></p>
        <p><asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
            <asp:Label ID="Label3" runat="server" Text="Update J record"></asp:Label>
                <p>Enter J#: <asp:TextBox ID="TextBox5" runat="server" Text="" ></asp:TextBox></p>
                <p>Enter city: <asp:TextBox ID="TextBox6" runat="server" Text=""></asp:TextBox></p>
                <p><asp:Button ID="Button4" runat="server" Text="Update record" OnClick="UpdateJ"/></p>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=mpetros2_spjdatabase;User ID=mpetros2;Password=c00per" DeleteCommand="DELETE FROM [J] WHERE [j#] = @column1" InsertCommand="INSERT INTO [J] ([j#], [jname], [city]) VALUES (@column1, @jname, @city)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [J] WHERE (([city] = @city) AND ([j#] = @column1))" UpdateCommand="UPDATE [J] SET [city] = @city WHERE [j#] = @column1">
                    <DeleteParameters>
                        <asp:Parameter Name="column1" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="column1" Type="String" />
                        <asp:Parameter Name="jname" Type="String" />
                        <asp:Parameter Name="city" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:FormParameter FormField="city" Name="city" Type="String" />
                        <asp:FormParameter FormField="jnum" Name="column1" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="jname" Type="String" />
                        <asp:FormParameter FormField="TextBox6" Name="city" Type="String" />
                        <asp:FormParameter FormField="TextBox5" Name="column1" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                    <ProgressTemplate>Updating, please be patient</ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel></p>
        <p><asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <p>
                    <asp:Label ID="Label4" runat="server" Text="Print J record"></asp:Label>
                </p>
                <p>
                    Enter J#: <asp:TextBox ID="jnum" runat="server" Text=""></asp:TextBox>
                </p>
                
                <p><asp:Button ID="Button3" runat="server" Text="Display J record" OnClick="SelectJ" /></p>
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="j#" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="j#" HeaderText="j#" ReadOnly="True" SortExpression="j#" />
                            <asp:BoundField DataField="jname" HeaderText="jname" SortExpression="jname" />
                            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        </Columns>
                        </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=mpetros2_spjdatabase;User ID=mpetros2;Password=c00per" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [J] WHERE ([j#] = @column1)">
                    <SelectParameters>
                        <asp:FormParameter FormField="jnum" Name="column1" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel4">
                    <ProgressTemplate>Displaying requested information</ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel></p>
        <script type="text/javascript">
            Sys.Application.add_load(ApplicationLoadHandler)

            function ApplicationLoadHandler(sender, args) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                if (!prm.get_isInAsyncPostBack()) {
                    prm.add_initializeRequest(InitializeRequest);
                    prm.add_endRequest(CompleteRequest);
                }
            }
            // initialize a queue
            var myQueue = new Array();

            function CompleteRequest(sender, args) {
                if (myQueue.length > 0) {// fire correspond event again of the item cached
                    $get(myQueue[0].id).click();
                    Array.removeAt(myQueue, 0);
                }
            }
            function InitializeRequest(sender, args) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                if (prm.get_isInAsyncPostBack()) {// if it's working on another request, cache the current item that cause the request
                    args.set_cancel(true);
                    Array.add(myQueue, args.get_postBackElement());
                }
            }

            if (typeof (Sys) != "undefined") Sys.Application.notifyScriptLoaded();

    </script>

    </form>
</body>
</html>
