﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SyngentaAuditService.Core
{
    public class ActionResult
    {
        public Type Type { get; set; }
        public object Content { get; set; }
    }
}