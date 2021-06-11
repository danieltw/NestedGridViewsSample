<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NestedGridViews_Sample02.aspx.cs" Inherits="Web001.NestedGridViews_Sample02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>NestedGridViews Sample</title>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).on("click", "[status*=collapse]", function ()
        {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("status", "expand");
        });

        $(document).on("click", "[status*=expand]", function ()
        {
            $(this).attr("status", "collapse");
            $(this).closest("tr").next().remove();
        });

    </script>

    <style type="text/css">
        table
        {
            margin-top: 5px;
        }

        .table > tbody > tr
        {
            background-color: rgba(255, 255,255,0.45);
        }

            .table > tbody > tr > th
            {
                vertical-align: middle;
                padding: 6px 4px;
                font-size: 10pt;
            }

        .table tbody tr td
        {
            vertical-align: middle;
            padding: 2px 4px;
            font-size: 10pt;
            border-right: 1px solid #f4f4f4;
        }

        .table table tbody tr td a,
        .table table tbody tr td span
        {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        .table table > tbody > tr > td > span
        {
            z-index: 3;
            color: #fff;
            cursor: default;
            background-color: #337ab7;
            border-color: #337ab7;
        }

        .table table > tbody > tr > td:first-child > a,
        .table table > tbody > tr > td:first-child > span
        {
            margin-left: 0;
        }

        .table table > tbody > tr > td > a:hover,
        .table table > tbody > tr > td > span:hover,
        .table table > tbody > tr > td > a:focus,
        .table table > tbody > tr > td > span:focus
        {
            z-index: 2;
            color: #23527c;
            background-color: #eee;
            border-color: #ddd;
        }

        .pagestyle td table tbody tr td
        {
            border-right: none;
            padding-right: 0px;
            padding-left: 0px;
        }

        .pagestyle td table tbody tr:last-child td:first-child
        {
            padding-left: 5px;
        }

        .tableheader
        {
            background: linear-gradient(rgba(210,214,222,1),rgba(210,214,222,1));
            text-shadow: 0 1px 0 #fff;
        }

        .tablefooter
        {
            background-color: rgba(0,26,53,0.3);
        }

        .table-hover > tbody > tr:hover
        {
            background-color: rgba(210,214,220,0.3);
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Nested GridViews Sample - 透過欄位切換</h3>
        </div>
        <asp:GridView ID="gvMain" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" ShowHeaderWhenEmpty="True" Width="100%" OnRowDataBound="gvMain_OnRowDataBound" AllowPaging="True" OnPageIndexChanging="gvMain_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="欄位A">
                    <ItemTemplate>
                        <asp:Label ID="label1" runat="server" Text='<%# Bind("Col01") %>' status="collapse" style="cursor: pointer;"></asp:Label>
                        <asp:Panel ID="pnlSubData" runat="server" Style="display: none">
                            <asp:GridView ID="gvSubData" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" ShowHeaderWhenEmpty="true" Width="99%">
                                <Columns>
                                    <asp:BoundField ItemStyle-Width="150px" DataField="SCol1" HeaderText="子欄位1" />
                                    <asp:BoundField ItemStyle-Width="150px" DataField="SCol2" HeaderText="子欄位2" />
                                    <asp:BoundField HeaderText="" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
                </asp:TemplateField>
               <asp:BoundField DataField="Col02" HeaderText="欄位B">
                    <ItemStyle Width="110px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Col03" HeaderText="欄位C">
                    <ItemStyle Width="90px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Col04" HeaderText="欄位D">
                    <ItemStyle Width="200px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Col05" HeaderText="欄位E">
                    <ItemStyle Width="50px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="" />
            </Columns>
            <FooterStyle CssClass="tablefooter" />
            <EditRowStyle BackColor="#e1e3e9" />
            <HeaderStyle CssClass="tableheader" />
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagestyle" />
        </asp:GridView>
    </form>
</body>
</html>
