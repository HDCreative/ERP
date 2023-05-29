﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using PosmVNPayService.Entities;


namespace PosmVNPayService.Data
{
    public class LogsContext : DAUltility.DataContext
    {
        public Table<LogInfo> Logs { get { return this.GetTable<LogInfo>(); } }
    }
}
