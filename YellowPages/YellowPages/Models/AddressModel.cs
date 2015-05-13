using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace YellowPages.Models
{
    public class AddressModel
    {
        public int Id { get; set; }
        public string Street { get; set; }
        public string Zip { get; set; }
        public string City { get; set; }
        public int CountryId { get; set; }
        public bool IsHome { get; set; }
    
        public CountryModel Country { get; set; }
      
    }
}
