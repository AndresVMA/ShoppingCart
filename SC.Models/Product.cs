using System.ComponentModel.DataAnnotations.Schema;

namespace SC.Models
{
    [Table("Products")]
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsShippable { get; set; }
        public bool IsDownloadable { get; set; }
        public int TypeId { get; set; }
        [ForeignKey("TypeId")]
        public virtual ProductType ProductType { get; set; }
    }
}
