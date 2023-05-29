using System;
using System.Web;
using Newtonsoft.Json;
using MutosiService.Entities;
using MutosiService.BLL;

namespace MutosiService.Core
{
    public class TimeHandler : BaseHandler
    {
        public override object ProcessRequest()
        {
            return DateTime.Now.ToString("yyyyMMddHHmmss");
        }
    }
}
