﻿using System;
using System.Data.Linq.Mapping;

namespace PosmVNPayService.Entities
{
    [Serializable]
     public class POGTargetInfo
    {
        [Column]
        public long SOSId { set; get; }      
        [Column]
        public string ShopId { set; get; }
        [Column]
        public int? TargetValue { set; get; }
    }
}
