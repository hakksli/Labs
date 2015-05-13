using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace YellowPages.Models
{
    public class ProductModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }

        public virtual List<CompanyModel> Companies { get; set; }

        public ProductModel()
        {
            Companies = new List<CompanyModel>();
        }
    }
}
