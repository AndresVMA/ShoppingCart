using System.ComponentModel.DataAnnotations.Schema;

namespace SC.Models
{
    [Table("UserShoppingCart")]
    public class ShoppingCart
    {
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public User User { get; set; }
        public Product Product { get; set; }
        public decimal Quantity { get; set; }
    }
}
