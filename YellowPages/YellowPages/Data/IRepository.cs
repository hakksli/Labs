using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YellowPages.Data
{
    public interface IRepository<T> where T : class
    {
        List<T> GetAll();
        T Get(int id);
        int Create(T model);
        void Update(T model);
        void Delete(int id);
    }
}