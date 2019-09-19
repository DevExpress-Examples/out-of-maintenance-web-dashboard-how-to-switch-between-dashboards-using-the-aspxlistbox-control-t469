Imports DevExpress.DashboardCommon
Imports DevExpress.DashboardWeb
Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace WebApplication31
	Partial Public Class [Default]
		Inherits System.Web.UI.Page

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			BindListBox()
		End Sub

		Protected Sub ASPxCallbackPanel1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
			Dim callbackPanel As ASPxCallbackPanel = DirectCast(sender, ASPxCallbackPanel)
			Dim dashboard As New Dashboard()

			Dim storage As IEditableDashboardStorage = TryCast(DashboardConfigurator.Default.DashboardStorage, IEditableDashboardStorage)
			If storage IsNot Nothing Then
				Dim newID As String = storage.AddDashboard(dashboard.SaveToXDocument(), Guid.NewGuid().ToString())
				BindListBox()
				callbackPanel.JSProperties("cpNew") = newID
			End If
		End Sub

		Private Sub BindListBox()
			ASPxListBox1.DataSource = DashboardConfigurator.Default.DashboardStorage.GetAvailableDashboardsInfo()
			ASPxListBox1.DataBind()
		End Sub
	End Class
End Namespace