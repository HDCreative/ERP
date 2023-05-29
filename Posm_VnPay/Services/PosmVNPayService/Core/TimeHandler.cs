using System;
using System.Web;
using Newtonsoft.Json;
using PosmVNPayService.Entities;
using PosmVNPayService.BLL;

namespace PosmVNPayService.Core
{
    public class TimeHandler : BaseHandler
    {
        public override object ProcessRequest()
        {
            return DateTime.Now.ToString("yyyyMMddHHmmss");
        }
    }
}
