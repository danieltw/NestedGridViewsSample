using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web001
{
    public partial class NestedGridViews_Sample02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvMain.DataSource = GetMainData();
                gvMain.DataBind();
            }

        }

        protected void gvMain_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gvSubData = e.Row.FindControl("gvSubData") as GridView;
                gvSubData.DataSource = GetSubData(e.Row.Cells[1].Text);
                gvSubData.DataBind();
            }
        }

        protected void gvMain_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMain.DataSource = GetMainData();
            gvMain.DataBind();

            gvMain.PageIndex = e.NewPageIndex;
            DataBind();
        }

        private static DataTable GetMainData()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Col01");
            dt.Columns.Add("Col02");
            dt.Columns.Add("Col03");
            dt.Columns.Add("Col04");
            dt.Columns.Add("Col05");

            Random _rnd = new Random((int)DateTime.Now.Ticks);

            for (int i = 1; i < 27; i++)
            {
                dt.Rows.Add(new object[] { i.ToString(), string.Format("{0}{1}", "Data", i.ToString("00")), (_rnd.Next(1, 10) * _rnd.Next(11, 25)).ToString(), i % 3 == 0 ? "是" : "否", (_rnd.Next(1, 10) * _rnd.Next(40, 60) * _rnd.Next(15, 25)).ToString() });
            }

            return dt;
        }

        private static DataTable GetSubData(string IndexText)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("SCol1");
            dt.Columns.Add("SCol2");

            for (int i = 1; i < 6; i++)
            {
                dt.Rows.Add(new object[] { IndexText, string.Format("{0}_{1}", IndexText, i.ToString()) });
            }
            return dt;
        }
    }
}