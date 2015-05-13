using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YellowPages.Data;
using YellowPages.Models;

namespace YellowPages.Controllers
{

    public class HomeController : Controller
    {
        private CompanyRepository companyRepo;
        
        public HomeController()
        {
            companyRepo = new CompanyRepository("GulaDB");
           
        }

        public ActionResult Index()
        {
            return View(new DisplaySearchResultModel());
        }

        public ActionResult SearchRequest(string option, string SearchString)
        {
            if (option == "company")
            {
             var results=   companyRepo.ShowSearchResultsForCompanies(SearchString);
                return PartialView("_SearchResults", results);
            }
            return RedirectToAction("Index");
        }

        public ActionResult CompanyDetails(int id)
        {
            var results = companyRepo.ShowDetailsForCompanies(id);
            return PartialView("_DetailedResults", results);
        }
        public ActionResult GetAllCompanies()
        {
            var companies = companyRepo.GetAll().ToList();
            return View(companies);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}