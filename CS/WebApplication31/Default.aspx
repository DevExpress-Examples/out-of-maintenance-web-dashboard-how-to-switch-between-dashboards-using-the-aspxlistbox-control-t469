<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication31.Default" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v16.2.Web, Version=16.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        var openDashboardExtension;
        function openDashboard(id) {
            if (!!openDashboardExtension) {
                openDashboardExtension.loadDashboardById(id);
            }
        }
        function onSelectedIndexChanged(s, e) {
            openDashboard(s.GetValue());
        }
        function onDashboardInit(s, e) {
            openDashboardExtension = dashboard.dashboardDesigner.findExtension("dxdde-open");
        }
        function onClick(s, e) {
            callbackPanel.PerformCallback();
        }
        function onEndCallback(s, e) {
            listBox.SetValue(s.cpNew);
            openDashboard(s.cpNew);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" FullscreenMode="true" AllowResize="false" ShowSeparatorImage="false">
            <Panes>
                <dx:SplitterPane Size="300px" ShowCollapseBackwardButton="True" PaneStyle-Border-BorderStyle="None">
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server">
                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="callbackPanel" Height="100%" OnCallback="ASPxCallbackPanel1_Callback">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxSplitter ID="ASPxSplitter2" runat="server" Height="100%" Width="100%" Orientation="Vertical" ShowSeparatorImage="false">
                                            <Panes>
                                                <dx:SplitterPane AutoHeight="true">
                                                    <ContentCollection>
                                                        <dx:SplitterContentControl runat="server">
                                                            <dx:ASPxButton ID="ASPxButtonNew" runat="server" Text="New Dashboard" AutoPostBack="false">
                                                                <ClientSideEvents Click="onClick" />
                                                            </dx:ASPxButton>
                                                        </dx:SplitterContentControl>
                                                    </ContentCollection>
                                                </dx:SplitterPane>
                                                <dx:SplitterPane>
                                                    <ContentCollection>
                                                        <dx:SplitterContentControl runat="server">
                                                            <dx:ASPxListBox ID="ASPxListBox1" runat="server" ClientInstanceName="listBox" AutoPostBack="false" ValueType="System.String" ValueField="ID" TextField="Name" Height="100%" Width="100%">
                                                                <ClientSideEvents SelectedIndexChanged="onSelectedIndexChanged" />
                                                            </dx:ASPxListBox>
                                                        </dx:SplitterContentControl>
                                                    </ContentCollection>
                                                </dx:SplitterPane>
                                            </Panes>
                                            <Styles>
                                                <Pane Border-BorderWidth="0" />
                                            </Styles>
                                        </dx:ASPxSplitter>
                                    </dx:PanelContent>
                                </PanelCollection>
                                <ClientSideEvents EndCallback="onEndCallback" />
                            </dx:ASPxCallbackPanel>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane>
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server">
                            <dx:ASPxDashboard ID="ASPxDashboard1" ClientInstanceName="dashboard" UseDashboardConfigurator="true" AllowCreateNewDashboard="false" AllowOpenDashboard="false" Width="100%" Height="100%" runat="server">
                                <ClientSideEvents Init="onDashboardInit" />
                            </dx:ASPxDashboard>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>
    </form>
</body>
</html>
