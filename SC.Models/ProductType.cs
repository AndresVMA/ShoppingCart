using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace SC.Models
{
    [Table("ProductTypes")]
    public class ProductType
    {
        public int Id { get; set; }
        public string Type { get; set; }
        //public ICollection<Product> Products { get; set; }
    }
}
