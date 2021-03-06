﻿using SC.DataProvider;
using System.Linq;
using System.Web.Http;
using System.Data.Entity;
namespace SC.Api.Controllers
{
    public class ProductsController : ApiController
    {
        [Route("api/products/{type?}/{isShippable?}")]
        public IHttpActionResult Get()
        {
            using (var client = new ECommerceDbContext())
            {
                var products = client.Products.Include(p => p.ProductType);
                if (products.Any())
                {
                    return Ok(products.ToList());
                }
            }
            return NotFound();
        }
        public IHttpActionResult Get(int id)
        {
            using (var client = new ECommerceDbContext())
            {
                var product = client.Products.Include(p => p.ProductType).SingleOrDefault(p => p.Id == id);
                if (product != null)
                {
                    return Ok(product);
                }
            }
            return NotFound();
        }
    }
}
