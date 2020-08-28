<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication31.Default" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" 
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.2.Web.WebForms, Version=18.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" 
    Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        var openDashboardExtension;
        var dashboardControl;
        function openDashboard(id) {            
            if (!!openDashboardExtension) {
                openDashboardExtension.loadDashboard(id);
            }
        }
        function onSelectedIndexChanged(s, e) {
            openDashboard(s.GetValue());
        }
        function onBeforeRender(sender) {
            dashboardControl = sender.GetDashboardControl();
            var toolbox = dashboardControl.findExtension('toolbox');

            toolbox.removeMenuItem("create-dashboard");
            toolbox.removeMenuItem("open-dashboard");

            openDashboardExtension = dashboardControl.findExtension("open-dashboard");
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
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" FullscreenMode="true" AllowResize="false" 
            ShowSeparatorImage="false">
            <Panes>
                <dx:SplitterPane Size="300px" ShowCollapseBackwardButton="True" PaneStyle-Border-BorderStyle="None">
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server">
                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" 
                                ClientInstanceName="callbackPanel" Height="100%" OnCallback="ASPxCallbackPanel1_Callback">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxSplitter ID="ASPxSplitter2" runat="server" Height="100%" Width="100%" 
                                            Orientation="Vertical" ShowSeparatorImage="false">
                                            <Panes>
                                                <dx:SplitterPane AutoHeight="true">
                                                    <ContentCollection>
                                                        <dx:SplitterContentControl runat="server">
                                                            <dx:ASPxButton ID="ASPxButtonNew" runat="server" Text="New Dashboard" 
                                                                AutoPostBack="false" Theme="Metropolis">
                                                                <ClientSideEvents Click="onClick" />
                                                            </dx:ASPxButton>
                                                        </dx:SplitterContentControl>
                                                    </ContentCollection>
                                                </dx:SplitterPane>
                                                <dx:SplitterPane>
                                                    <ContentCollection>
                                                        <dx:SplitterContentControl runat="server" >
                                                            <dx:ASPxListBox Theme="Metropolis" ID="ASPxListBox1" runat="server" 
                                                                ClientInstanceName="listBox" AutoPostBack="false" ValueType="System.String" 
                                                                ValueField="ID" TextField="Name" Height="100%" Width="100%">
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
                <dx:SplitterPane >
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server" >
                            <dx:ASPxDashboard ID="ASPxDashboard1" ClientInstanceName="dashboard" 
                                UseDashboardConfigurator="true" runat="server" Height="100%" Width="100%">
                                <ClientSideEvents BeforeRender="onBeforeRender" />
                            </dx:ASPxDashboard>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>
    </form>
</body>
</html>