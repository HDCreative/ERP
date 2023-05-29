﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PosmVNPayService.Core
{
    public class TimeOnline: BaseHandler
    {
        public override object ProcessRequest()
        {
            return (DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)).TotalSeconds;
        }
    }
}