using SC.Models;
using System.Data.Entity;

namespace SC.DataProvider
{
    public class ECommerceDbContext : DbContext
    {
        public ECommerceDbContext()
            :base("ECommerceDatabase")
        {

        }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductType> ProductTypes { get; set; }
        public DbSet<ProductStock> ProductStocks { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>()
                .HasRequired(p => p.ProductType)
                .WithMany()
                .HasForeignKey(p => p.TypeId);
            modelBuilder.Entity<ProductStock>()
                .HasRequired(s => s.Product)
                .WithRequiredPrincipal();
                
        }
    }
}
