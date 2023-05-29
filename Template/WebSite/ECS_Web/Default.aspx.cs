using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECS_Web
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlmt.Items.Add(new ListItem { Text = "Tổ 1", Value = "1" });
                ddlmt.Items.Add(new ListItem { Text = "Tổ 2", Value = "2" });
                ddlmt.Items.Add(new ListItem { Text = "Tổ 3", Value = "3" });
                ddlmt.Items.Add(new ListItem { Text = "Tổ 4", Value = "4" });
                txtToDate.Text = "28/11/2021";
            }    
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            Thread.Sleep(3000);
            lbMessage.Text = ddl1.SelectedValue + "/" + hdlChooseDisplay.Value + "/" + txtFromDate.Text;
            Toastr.SucessToast("Tìm kiếm thành công.");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "smodel", "<script>$(document).ready(function () {$('#modal-lg').modal('show');   }); </script>", false);
        }

        protected void txtSaveUDetail_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "smodel", "<script>$(document).ready(function () {$('#modal-lg').modal('hide');   }); </script>", false);
        }
    }
}