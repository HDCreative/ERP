using System;
using System.Data.Linq.Mapping;

namespace MutosiService.Entities
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
