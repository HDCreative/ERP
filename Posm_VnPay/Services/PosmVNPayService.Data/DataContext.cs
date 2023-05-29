﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PosmVNPayService.Entities;
using System.Data.Linq.Mapping;
using System.Data;
using System.Reflection;
using System.Data.Linq;

namespace PosmVNPayService.Data
{
    public class DataContext : SyngentaAuditService.Data.Base.BaseDataContext
    {

        public Table<LogInfo> Logs { get { return this.GetTable<LogInfo>(); } }
        public Table<EmployeeInfo> Employees { get { return this.GetTable<EmployeeInfo>(); } }
        public Table<ShopInfo> Shops { get { return this.GetTable<ShopInfo>(); } }
        public Table<ProductInfo> Products { get { return this.GetTable<ProductInfo>(); } }
        public Table<AttendanceInfo> Attendances { get { return this.GetTable<AttendanceInfo>(); } }
    }
}