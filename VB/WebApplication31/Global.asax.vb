Imports DevExpress.DashboardWeb
Imports System
Imports System.Web

Namespace WebApplication31

    Public Class [Global]
        Inherits HttpApplication

        Protected Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
            Dim storage As DashboardFileStorage = New DashboardFileStorage("~/App_Data/Dashboards")
            DashboardConfigurator.[Default].SetDashboardStorage(storage)
        End Sub
    End Class
End Namespace
