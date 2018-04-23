using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication31 {
    public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            BindListBox();
        }

        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
            ASPxCallbackPanel callbackPanel = (ASPxCallbackPanel)sender;
            Dashboard dashboard = new Dashboard();

            IEditableDashboardStorage storage = DashboardConfigurator.Default.DashboardStorage as IEditableDashboardStorage;
            if (storage != null) {
                string newID = storage.AddDashboard(dashboard.SaveToXDocument(), Guid.NewGuid().ToString());
                BindListBox();
                callbackPanel.JSProperties["cpNew"] = newID;
            }
        }

        void BindListBox() {
            ASPxListBox1.DataSource = DashboardConfigurator.Default.DashboardStorage.GetAvailableDashboardsInfo();
            ASPxListBox1.DataBind();
        }
    }
}