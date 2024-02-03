<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="intern.aspx.cs" Inherits="finalyproject.dome.intern"
    
    EnableEventValidation="false" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<style>
    body {background-color: #555e63;;} 
</style>
    <p style="background-color: #CCCCCC; color: #000000; font-size: xx-large;">&nbsp;</p>
    <p style="background-color: #CCCCCC; color: #000000; font-size: xx-large;">Employee Mangament System</p>
    <table class="nav-justified" style="margin-bottom: 145px; height: 524px;">
        <tr>
            <td colspan="2" style="height: 34px; background-color: #CCCCCC">
                <asp:Label ID="lbloutbut" runat="server" style="color: #000000; background-color: #CCCCCC;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 149px; color: #FF0000; height: 33px; background-color: #CCCCCC">&nbsp;&nbsp;&nbsp; <span style="color: #000000">employesid</span></td>
            <td style="height: 33px; background-color: #CCCCCC">
                <asp:TextBox ID="txtEmployesid" runat="server" style="color: #000000; background-color: #CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 149px; color: #FF0000; background-color: #CCCCCC; height: 34px;">&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: #000000">refNo</span></td>
            <td style="background-color: #CCCCCC; height: 34px;">
                <asp:TextBox ID="txtrefNo" runat="server" style="background-color: #CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 149px; color: #FF0000; background-color: #CCCCCC; height: 34px;">&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: #000000">fname</span></td>
            <td style="background-color: #CCCCCC; height: 34px;">
                <asp:TextBox ID="txtFname" runat="server" style="background-color: #CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 149px; color: #FF0000; background-color: #CCCCCC; height: 34px;">&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: #000000">lname</span></td>
            <td style="background-color: #CCCCCC; height: 34px;">
                <asp:TextBox ID="txtLname" runat="server" style="background-color: #CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 34px; width: 149px; color: #FF0000; background-color: #CCCCCC">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: #000000">age</span></td>
            <td style="height: 34px; background-color: #CCCCCC">
                <asp:TextBox ID="txtAge" runat="server" style="background-color: #CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 149px; height: 33px; color: #FF0000; background-color: #CCCCCC">&nbsp;&nbsp;&nbsp; <span style="color: #000000">phone</span></td>
            <td style="height: 33px; background-color: #CCCCCC">
                <asp:TextBox ID="txtPhone" runat="server" style="background-color: #CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 149px; color: #FF0000; background-color: #CCCCCC; height: 34px;">&nbsp;&nbsp;&nbsp; <span style="color: #000000">salary</span></td>
            <td style="background-color: #CCCCCC; height: 34px;">
                <asp:TextBox ID="txtSalary" runat="server" style="background-color: #CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 149px; background-color: #CCCCCC">&nbsp;</td>
            <td style="background-color: #CCCCCC">
                <asp:Button ID="btninsert" runat="server" OnClick="btninsert_Click" style="color: #000000; background-color: #CCCCCC;" Text="Insert" Height="29px" />

    <asp:GridView ID="gvintern" 
        cssclass="table table-bordered table-condensed table-responsive table-hover"
        runat="server" OnSelectedIndexChanged="gvintern_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="employesid" >
        <Alternatingrowstyle  BackColor="white"/>
        
        <Columns>
               <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Employee ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnUpdate_Click" runat="server"  
                                        CommandArgument='<%# Bind("employesid") %>' OnClick="populateForm_Click"
                                        Text='<%# Eval("employesid")  %>'></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:TemplateField>

           
            <asp:BoundField DataField="refNo" HeaderText="refNo" SortExpression="refNo" />
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
            <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="salary" HeaderText="salary" SortExpression="salary" />
        </Columns>
        <HeaderStyle Backcolor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White"/>
        <RowStyle backcolor="#f5f5f5"/>
        <SelectedRowStyle BackColor="#669999" font-Bold="true" ForeColor="White"/>



    </asp:GridView>


                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" style="color: #000000; background-color: #CCCCCC;" Text="Update" />
                <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete"
                    OnClientClick="return confirm('Are you Sure  you want to Delete ?')" style="color: #000000; background-color: #CCCCCC" />
                    
                <asp:Button ID="txtGetdata" runat="server" OnClick="txtGetdata_Click" Text="Getdata" style="color: #000000; background-color: #CCCCCC" />

                <asp:Button ID="btnExpoertToExcel" runat="server" OnClick="btnExpoertToExcel_Click" Text="ExpoertToExcel" style="color: #000000; background-color: #CCCCCC" />


            </td>
        </tr>
    </table>
    <br style="background-color: #CCCCCC"/>

    
</asp:Content>


