using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Grove_Web
{
    public partial class Site_Mobile : System.Web.UI.MasterPage
    {
        public string _path;
        protected void Page_Load(object sender, EventArgs e)
        {
            _path = HttpContext.Current.Request.Url.AbsolutePath;
        }
        public string path
        {
            get
            {
                return _path;
            }
            set
            {
                this._path = value;
            }
        }
    }
}