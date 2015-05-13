using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YellowPages.Models
{
    public class DisplaySearchResultModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Option { get; set; }
        public string SearchString { get; set; }
        public List<CompanyModel> Companies { get; set; }
        public List<PersonModel> People { get; set; }
        public CompanyModel SelectedCompany { get; set; }


        public DisplaySearchResultModel()
        {
            Companies = new List<CompanyModel>();
            People = new List<PersonModel>();
        }
    }
}