using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace YellowPages.Models
{
   public class PersonModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Nullable<int> CompanyId { get; set; }
        public int AddressId { get; set; }
        public string MobilePhoneNumber { get; set; }
        public string Email { get; set; }

        public AddressModel Address { get; set; }
        public CompanyModel Company { get; set; }
    }
}
