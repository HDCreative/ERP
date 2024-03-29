﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VNPay_Web.Report
{
    public partial class SellOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                btnFilter_Click(sender, e);
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("STT", typeof(int));
            dt.Columns.Add("EmployeeName", typeof(string));
            dt.Columns.Add("ShopName", typeof(string));
            dt.Columns.Add("ShopAddress", typeof(string));
            dt.Columns.Add("SellDate", typeof(string));
            dt.Columns.Add("ManagerName", typeof(string));
            dt.Columns.Add("VisitResult", typeof(string));
            dt.Columns.Add("TiepCanTC", typeof(int));
            dt.Columns.Add("VisitType", typeof(string));

            for (int i = 1; i <= 10; i++)
            {
                DataRow dr = dt.NewRow();
                dr["STT"] = i;
                dr["EmployeeName"] = "Nhân viên " + i.ToString();
                dr["ShopName"] = "ShopName	 " + i.ToString();
                dr["ShopAddress"] = "175 Hòa Bình, Phường Hiệp Tân, Quận tân Phú, TP.HCM	 " + i.ToString();
                dr["SellDate"] = "16/12/2022";
                dr["ManagerName"] = "Quản lý " + i.ToString();
                dr["VisitResult"] = i == 3 ? "KTC - Đóng cửa do Covid" : "Thành công";
                dr["TiepCanTC"] = "4";
                dr["VisitType"] = i == 1 ? "Mở mới cửa hàng" : "Chăm sóc cửa hàng";
                dt.Rows.Add(dr);
            }
            gvSellOut.DataSource = dt;
            gvSellOut.DataBind();

            gvSellOut.Rows[0].FindControl("imgNew").Visible = true;

            Toastr.SucessToast("Thành công");
        }

        protected void btnExport1111_Click(object sender, EventArgs e)
        {

        }

        protected void img_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton image = sender as ImageButton;
            GridViewRow gr = image.NamingContainer as GridViewRow;
            Literal ltrImage = gr.FindControl("ltrImage") as Literal;
            Repeater rptDetails = gr.FindControl("rptDetails") as Repeater;
            Panel pnGrid = gr.FindControl("pnGrid") as Panel;

            if (image.CommandName == "Show")
            {
                image.ImageUrl = "~/images/minus.png";
                pnGrid.Visible = true;
                image.CommandName = "Hide";

                DataTable dt = new DataTable();
                dt.Columns.Add("STT", typeof(int));
                dt.Columns.Add("ProductName", typeof(string));
                dt.Columns.Add("Quantỉy", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("Amount", typeof(string));


                for (int i = 1; i <= 50; i++)
                {
                    DataRow dr = dt.NewRow();
                    dr["STT"] = i;
                    dr["ProductName"] = "Sản phẩm " + i.ToString();
                    dr["Quantỉy"] = i.ToString();
                    dr["Price"] = "156.000đ ";
                    dr["Amount"] = "156.000đ ";
                    dt.Rows.Add(dr);
                }
                rptDetails.DataSource = dt;
                rptDetails.DataBind();
                // ltrSlider.Text = "<iframe src='ImageDetailaspx.aspx?AuditID=" + AuditID + "' frameborder='0' scrolling='yes' width='645px' height='540px'></iframe>";
                //ltrImage.Text = "<iframe src='ReportPhoto.aspx?ResultId=1' frameborder='0' frameborder='0' scrolling='yes' width='650px' height='500px'></iframe>";
            }
            else if (image.CommandName == "Hide")
            {
                image.CommandName = "Show";
                pnGrid.Visible = false;
                image.ImageUrl = "~/images/plus.png";
            }
        }

        protected void lbKPI_Click(object sender, EventArgs e)
        {
            LinkButton lk = (LinkButton)sender;
            GridViewRow gr = lk.NamingContainer as GridViewRow;
            Panel plAtt = (Panel)gr.FindControl("plAtt"); LinkButton lbAtt = (LinkButton)gr.FindControl("lbAtt");
            Panel pnSO = (Panel)gr.FindControl("pnSO"); LinkButton lbSO = (LinkButton)gr.FindControl("lbSO");
            Panel plSURVEY = (Panel)gr.FindControl("plSURVEY"); LinkButton lbSURVEY = (LinkButton)gr.FindControl("lbSURVEY");
            if (lk.CommandName == "ATT")
            {
                plAtt.Visible = true; lbAtt.CssClass = "nav-link active";
                pnSO.Visible = false; lbSO.CssClass = "nav-link";
                plSURVEY.Visible = false; lbSURVEY.CssClass = "nav-link";
            }
            if (lk.CommandName == "SO")
            {
                plAtt.Visible = false; lbAtt.CssClass = "nav-link";
                pnSO.Visible = true; lbSO.CssClass = "nav-link active";
                plSURVEY.Visible = false; lbSURVEY.CssClass = "nav-link";
            }
            if (lk.CommandName == "SURVEY")
            {
                plAtt.Visible = false; lbAtt.CssClass = "nav-link";
                pnSO.Visible = false; lbSO.CssClass = "nav-link";
                plSURVEY.Visible = true; lbSURVEY.CssClass = "nav-link active";
            }
        }
    }
}