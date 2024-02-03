<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="sendEmail.aspx.cs" Inherits="term3_ali.demo.sendEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
    body {background-color: #555e63;} 
    .auto-style2 {
        background-color: #FFFFFF;
    }
    .auto-style3 {
        color: #000000;
        background-color: #FFFFFF;
    }
    .auto-style4 {
        color: #000000;
        height: 26px;
        background-color: #FFFFFF;
    }
    .auto-style5 {
        height: 26px;
    }
        .auto-style6 {
            background-color: #999999;
        }
    </style>
        <br /><br />      <br /><br />
    <div>
        <asp:Label ID="lblMsg" runat="server" Text="" CssClass="auto-style3"></asp:Label>
    </div>
    <table border="0">
        <tr><td>    </td><td>  </td></tr>
        <tr>
            <td class="auto-style4">From -Email</td>
            <td id="txtSubject" class="auto-style5">
                <asp:TextBox ID="txtSenderEmail" runat="server" Width="450px" OnLoad="lblOutputClear_txtSubject" CssClass="auto-style6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 26px" class="auto-style3">Subject
            </td>
            <td style="height: 26px" id="txtSubject" class="text-center">
                <asp:TextBox ID="txtSubject" runat="server" Width="445px" CssClass="auto-style6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">File Attachments:</td>
            <td>
               <asp:FileUpload ID="fuAttachment" runat="server"   Enabled="true"  
                   AllowMultiple="true" Width="449px" CssClass="auto-style6" /></td>
        </tr>
        <tr>
            <td valign="top" class="auto-style2">Message
            </td>
            <td>
                <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Height="103px" 
                    Width="450px" CssClass="auto-style6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top">&nbsp;</td>
            <td>
             
                <asp:Button ID="btnSendMailViaMailMgr" runat="server" 
                    OnClick="btnSendMailViaMailMgr_Click" Text="Send " />
             
                <asp:Button ID="btnSendViaCode" runat="server"  Text="Send email via Code" OnClick="btnSendViaCode_Click" />
             
            </td>
        </tr>
    </table>

</asp:Content>
