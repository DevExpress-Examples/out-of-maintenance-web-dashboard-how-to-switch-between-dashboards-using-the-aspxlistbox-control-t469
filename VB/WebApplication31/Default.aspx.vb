Imports DevExpress.DashboardCommon
Imports DevExpress.DashboardWeb
Imports DevExpress.Web
Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace WebApplication31

    Public Partial Class [Default]
        Inherits Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            BindListBox()
        End Sub

        Protected Sub ASPxCallbackPanel1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
            Dim callbackPanel As ASPxCallbackPanel = CType(sender, ASPxCallbackPanel)
            Dim dashboard As Dashboard = New Dashboard()
            Dim storage As IEditableDashboardStorage = TryCast(DashboardConfigurator.[Default].DashboardStorage, IEditableDashboardStorage)
            If storage IsNot Nothing Then
                Dim newID As String = storage.AddDashboard(dashboard.SaveToXDocument(), Guid.NewGuid().ToString())
                BindListBox()
                callbackPanel.JSProperties("cpNew") = newID
            End If
        End Sub

        Private Sub BindListBox()
            ASPxListBox1.DataSource = DashboardConfigurator.[Default].DashboardStorage.GetAvailableDashboardsInfo()
            ASPxListBox1.DataBind()
        End Sub
    End Class
End Namespace
