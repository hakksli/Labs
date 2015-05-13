using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YellowPages.Models
{
    public class CompanyModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int AddressId { get; set; }
        public string Description { get; set; }
        public string OfficePhoneNumber { get; set; }
        public string Email { get; set; }
        public string Logo { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public AddressModel Address { get; set; }
        public List<PersonModel> People { get; set; }
        public List<ProductModel> Products { get; set; }

        public CompanyModel()
        {
            People = new List<PersonModel>();
            Products = new List<ProductModel>();
        }
    }
}