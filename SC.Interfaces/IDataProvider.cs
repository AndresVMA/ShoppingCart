using SC.Models;
using System.Data.Entity;

namespace SC.Interfaces
{
    public interface IDataProvider
    {
        DbSet<Product> Products { get; set; }
        DbSet<ProductType> ProductTypes { get; set; }
    }
}
