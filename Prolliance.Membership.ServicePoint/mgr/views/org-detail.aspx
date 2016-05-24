﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="org-detail.aspx.cs" Inherits="Prolliance.Membership.ServicePoint.Mgr.Views.OrgDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>组织详细</title>
    <link href="../static/view.css" rel="stylesheet" />
    <style>
           #nav { padding: 0px; background: #eee; margin: 0px; border-bottom: solid 1px #ccc; border-top: solid 1px #ccc; }
        #nav li { display: inline-block; padding: 10px; position: relative; }
        #nav li a { display: inline-block; width: 100%; height: 100%; cursor: pointer; }
        #nav li.selected { background: #d5d5d5 !important; }  
        
    </style>
</head>
<body>
    <form id="aspForm" runat="server">
        <div class="dialog-header">
                <ul id="nav">
            <li id="app" runat="server" class="selected"><a  id="userbaseInfo">组织基本</a></li>
            <li id="role"  runat="server"><a id="userextension">扩展信息</a></li>
        </ul>
           <%-- <div class="view">组织详细</div>--%>
        </div>
        <div id="basepanel" class="dialog-content">
            <div class="view">
                <table class="table">
                    <tr>
                        <th>编码</th>
                        <td>
                            <asp:TextBox ID="ctl_Code" MaxLength="32" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>类型</th>
                        <td>
                            <asp:TextBox ID="ctl_type" MaxLength="32" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>名称</th>
                        <td>
                            <asp:TextBox ID="ctl_Name" MaxLength="32" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>全称</th>
                        <td>
                            <asp:TextBox ID="ctl_FullName" MaxLength="32" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>状态</th>
                        <td>
                            <asp:RadioButtonList ID="ctl_IsActive" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Selected="True" Value="True">启用</asp:ListItem>
                                <asp:ListItem Value="False">禁用</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
          <div id="extensionPanel" class="dialog-content">
         <div class="view" id="tableArea" runat="server">
               <table class="table">
                     <thead>
                        <tr>
                            <th >扩展字段名称</th>
                            <th>值</th>
                 
                         
                        </tr>
                    </thead>
                    <tbody class="sortable-list">
                        <asp:Repeater ID="dataList" runat="server" >
                            <ItemTemplate>
                                <tr>
                                    <th><asp:TextBox ID="_key" BorderStyle="None" BackColor="#f3f3f3" ReadOnly="True" Text=<%#Eval("Key")%> runat="server"></asp:TextBox></th>
                                    <td>
                                        <asp:TextBox ID="_extensionVal" Text=<%#Eval("Value")%> runat="server"></asp:TextBox>
                              
                                    </td>
                                   
                                   <%-- <td id="opArea" runat="server" data-auth="[{TargetCode:'app',Code:'manifest'},{TargetCode:'app',Code:'edit'},{TargetCode:'app',Code:'view'},{TargetCode:'app',Code:'delete'}]">
                                        <asp:LinkButton ID="manifest" CommandName="manifest" CommandArgument='<%# Eval("Id") %>' runat="server" data-auth="[{TargetCode:'app',Code:'manifest'}]">功能清单</asp:LinkButton>
                                      
                                    </td>--%>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                 
         </div>   
        </div>
        <div class="dialog-footer">
            <div class="view">
                <asp:Button ID="save" runat="server" data-auth="[{TargetCode:'organization',Code:'new'},{TargetCode:'organization',Code:'edit'}]" Text="保存" OnClick="save_Click" />
            </div>
        </div>
             <script src="../static/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#basepanel").css("display", "block");
            $("#extensionPanel").css("display", "none");
            $("#userbaseInfo").click(function () {
                $("#basepanel").css("display", "block");
                $("#extensionPanel").css("display", "none");
                $("#userbaseInfo").parent().addClass("selected");
                $("#userextension").parent().removeClass("selected");
            });
            $("#userextension").click(function () {
                $("#basepanel").css("display", "none");
                $("#extensionPanel").css("display", "block");
                $("#userbaseInfo").parent().removeClass("selected");
                $("#userextension").parent().addClass("selected");
            });
        })
    </script>
    </form>
</body>
</html>
