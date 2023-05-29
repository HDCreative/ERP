using System;
using System.Web;
using Newtonsoft.Json;
using SyngentaAuditService.Entities;
using SyngentaAuditService.BLL;

namespace SyngentaAuditService.Core
{
    public class TimeHandler : BaseHandler
    {
        public override object ProcessRequest()
        {
            return DateTime.Now.ToString("yyyyMMddHHmmss");
        }
    }
}
