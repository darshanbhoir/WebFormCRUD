<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="WebFormCRUD.StudentInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table class="nav-justified">
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text="Student Information"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 234px">
                <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextName" runat="server" Width="174px"></asp:TextBox>
            </td>
            <td colspan="2" rowspan="9">
                <asp:GridView ID="GridViewStudent" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="SqlDataSource1" Width="640px" OnSelectedIndexChanged="GridViewStudent_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                        <asp:BoundField DataField="Student_Name" HeaderText="Student_Name" SortExpression="Student_Name" />
                        <asp:BoundField DataField="Student_email" HeaderText="Student_email" SortExpression="Student_email" />
                        <asp:BoundField DataField="Student_gender" HeaderText="Student_gender" SortExpression="Student_gender" />
                        <asp:BoundField DataField="Student_BirthDate" HeaderText="Student_BirthDate" SortExpression="Student_BirthDate" DataFormatString="{0:MM/dd/yyyy}" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentInfo %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 234px">
                <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextEmail" runat="server" Width="173px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 234px">
                <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="Gender" runat="server">
                    <asp:ListItem>Choose any</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Not to specify</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 234px">
                <asp:Label ID="Label5" runat="server" Text="Date of Birth"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DOB" runat="server" Width="169px" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 234px">&nbsp;</td>
            <td>
                <asp:CheckBox ID="CheckBoxAgree" runat="server" Text="Yes, I agree" />
                <asp:Label ID="LabelMessage" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 234px">
                <asp:Label ID="StudID" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 234px">&nbsp;</td>
            <td>
                <asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 234px">&nbsp;</td>
            <td>
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel Operation" Width="180px" OnClick="ButtonCancel_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 234px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 234px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 234px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>
