using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using YellowPages.Models;

namespace YellowPages.Data
{
   
    
        public class CompanyRepository : BaseRepository, IRepository<CompanyModel>
        {
            public CompanyRepository(string connectionString)
                : base(connectionString)
            {
            }

            private CompanyModel ConvertToCompany(IDataReader reader)
            {

                var company = new CompanyModel
                {
                    Id = (int)reader["Id"],
                    AddressId=(int)reader["AddressId"],
                     OfficePhoneNumber=(string)reader["OfficePhoneNumber"],
                  
                    Name = (string)reader["Name"],
                    Description = (string)reader["Description"],
                    Email = (string)reader["Email"],
Logo = reader["Logo"] == DBNull.Value ? "" : reader["Logo"].ToString(),
                }; 
               
                //company.Logo = logo;
              return company;
            }

            private AddressModel ConvertToAddress(IDataReader reader)
            {
                var address = new AddressModel
                {
                    Id = (int)reader["Id"],
                    City = (string)reader["City"],
                    Street = (string)reader["Street"],
                    Zip = (string)reader["Zip"],
                    CountryId = (int)reader["CountryId"],
                    


                };
                return address;
            }

            private CountryModel ConvertToCountry(IDataReader reader)
            {
                var country = new CountryModel
                {
                    Id = (int)reader["Id"],
                    Name = (string)reader["Name"],
                                  };
                return country;
            }

            private PersonModel ConvertToPerson(IDataReader reader)
            {
                var person = new PersonModel
                {
                    //Id = (int)reader["Id"],
                    FirstName = (string)reader["FirstName"],
                    LastName = (string)reader["LastName"],
                };
                return person;
            }

            public List<CompanyModel> GetAll()
            {
                var companies = new List<CompanyModel>();
                string sql = @"Select * from CompanyInfo";
                Action<IDataReader> readCompany = reader =>
                {
                    var company = ConvertToCompany(reader);
                    companies.Add(company);
                };

                ExecuteAnyQuery(sql, readCompany);
                return companies;
            }

            public DisplaySearchResultModel ShowSearchResultsForCompanies(string searchText)
            {
                var companies = new List<CompanyModel>();
                string sql = @"Select * from CompanyInfo 
                                where Name like '%"+@searchText+"%'";
                Action<IDataReader> readCompany = reader =>
                {
                    var company = ConvertToCompany(reader);
                    companies.Add(company);
                };

                ExecuteAnyQuery(sql, readCompany);
               var model= new DisplaySearchResultModel();
              foreach (var item in companies)
	{
		  model.Companies.Add(new CompanyModel {
              Id=item.Id,      
              Name=item.Name,
                     Description=item.Description
                });
	}
              return model;
            }

          public CompanyModel ShowDetailsForCompanies(int id)
            {
                var model = new DisplaySearchResultModel();
                string sql = @"select C.Id, C.Name, Description, OfficePhoneNumber, 
                                C.Email, Logo, C.AddressId, FirstName, LastName  
                                from Company as C
                                inner join People as P
                                on P.CompanyId=C.Id
                                where C.Id=" + id;
                Action<IDataReader> readCompany = reader =>
                {
                    var company = ConvertToCompany(reader);
                   
                   model.SelectedCompany = new CompanyModel
                   {
                       Id = company.Id,
                       Name = company.Name,
                       Description = company.Description,
                       Email = company.Email,
                       OfficePhoneNumber = company.OfficePhoneNumber,
                       Logo=company.Logo,
                        
                   };
                };
              
                ExecuteAnyQuery(sql, readCompany);

                string sql2 = @"select  
                                Street, Zip, City, 
                                 CT.Name, FirstName, LastName,
                                A.Id, A.CountryId
                                from Company as C
                                inner join Address as A
                                 on A.Id=c.AddressId
                                 inner join Country as CT
                                 on CT.Id=a.CountryId
                                inner join People as P
                                on P.CompanyId=C.Id
                                where C.Id=" + id;

                Action<IDataReader> readAddress = reader =>
                {
                    var address = ConvertToAddress(reader);

                    model.SelectedCompany.Address = new AddressModel
                    { 
                        City=address.City,
                         Street=address.Street,
                          Zip=address.Zip,
                           CountryId=address.CountryId,
                        

                    };
                };

                ExecuteAnyQuery(sql2, readAddress);
                string sql3 = @"select  
                                
                                 CT.Name, 
                                A.Id, A.CountryId
                                from Company as C
                                inner join Address as A
                                 on A.Id=c.AddressId
                                 inner join Country as CT
                                 on CT.Id=a.CountryId
                                inner join People as P
                                on P.CompanyId=C.Id
                                where C.Id=" + id;

                Action<IDataReader> readCountry = reader =>
                {
                    var country = ConvertToCountry(reader);

                    model.SelectedCompany.Address.Country = new CountryModel
                    {
                         Name=country.Name
                     
                    };
                };

                ExecuteAnyQuery(sql3, readCountry);
             
                string sql4 = @"select  
                                
                                 FirstName, LastName
                                
                                from Company as C
                                
                                inner join People as P
                                on P.CompanyId=C.Id
                                where C.Id=" + id;

                Action<IDataReader> readPerson = reader =>
                {
                    var person = ConvertToPerson(reader);
                    model.SelectedCompany.People.Add(person);
                 
                   
                };

                ExecuteAnyQuery(sql4, readPerson);

                foreach (var item in model.SelectedCompany.People)
                {
                    model.People.Add(new PersonModel
                    {
                       
                        FirstName = item.FirstName,
                        LastName = item.LastName,
                    });
                }
                

                return model.SelectedCompany;
            }
            
            //public CompanyModel Get(int id)
            //{
            //    CompanyModel CompanyModel = null;
            //    using (SqlConnection connection = new SqlConnection(ConnectionString))
            //    {
            //        using (SqlCommand command = new SqlCommand("MakeCompanyInfoLessEr", connection))
            //        {
            //            command.CommandType = CommandType.StoredProcedure;
            //            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            //            connection.Open();

            //            using (var reader = command.ExecuteReader())
            //            {
            //                while (reader.Read())
            //                {
            //                    CompanyModel = ConvertToCompany(reader);
            //                }
            //            }
            //        }
            //    }

            //    return CompanyModel;
            //}

//            private void AddAddressToCompany(CompanyModel company)
//            {
//                using (var connection = new SqlConnection(ConnectionString))
//                {
//                    connection.Open();

//                    using (var command = connection.CreateCommand())
//                    {
//                        command.CommandText = @"SELECT Name
//											FROM Genre
//											inner join CompanyModelGenre as MG
//											on MG.GenreId=Genre.Id
//											where MG.CompanyModelId=@fimId";
//                        command.Parameters.AddWithValue("@fimId", company.Id);

//                        using (var reader = command.ExecuteReader())
//                        {
//                            while (reader.Read())
//                            {
//                                company..Add(reader["Name"].ToString());
//                            }
//                        }
//                    }
//                }
//            }

            //public int Create(CompanyModel model)
            //{
            //    int id = -1;

            //    using (SqlConnection connection = new SqlConnection(ConnectionString))
            //    {
            //        using (SqlCommand command = new SqlCommand("CreateCompany", connection))
            //        {
            //            command.CommandType = CommandType.StoredProcedure;
            //            command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //            command.Parameters.Add("@title", SqlDbType.NVarChar).Value = model.Title;
            //            command.Parameters.Add("@ageLimit", SqlDbType.Int).Value = model.AgeLimit;

            //            connection.Open();
            //            command.ExecuteNonQuery();
            //            id = (int)command.Parameters["@id"].Value;
            //        }
            //    }
            //    return id;
            //}

            //public void Update(CompanyModel model)
            //{
            //    var sql = @"update Company set Name = '" + model.Name + "', AgeLimit=" + model..AgeLimit + "where CompanyModel.Id= " + model.Id;
            //    ExecuteNoneQuery(sql);
            //}

            //public void Delete(int id)
            //{
            //    var sql = @"Delete from CompanyModel where CompanyModel.Id=" + id;
            //    ExecuteNoneQuery(sql);
            //}


            public CompanyModel Get(int id)
            {
                throw new NotImplementedException();
            }

            public int Create(CompanyModel model)
            {
                throw new NotImplementedException();
            }

            public void Update(CompanyModel model)
            {
                throw new NotImplementedException();
            }

            public void Delete(int id)
            {
                throw new NotImplementedException();
            }
        }
    }
