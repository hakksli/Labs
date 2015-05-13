using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace YellowPages.Data
{
    public class BaseRepository
    {
        protected string ConnectionString { get; private set; }

		public BaseRepository(string connectionName)
		{
			GetConnection(connectionName);
		}

		private void GetConnection(string connectionName)
		{
			if (connectionName == null) throw new ArgumentNullException("connectionName");
			var conStr = ConfigurationManager.ConnectionStrings[connectionName];
			if (conStr == null)
				throw new ConfigurationErrorsException(string.Format("Failed to find connection string named '{0}' in app/web.config.", connectionName));
			ConnectionString = conStr.ConnectionString;
		}

		protected void ExecuteNoneQuery(string sql)
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				connection.Open();

				using (var command = connection.CreateCommand())
				{
					command.CommandText = sql;
					command.ExecuteNonQuery();
				}
			}
		}

		protected void ExecuteAnyQuery(string sql, Action<IDataReader> whileRead)
		{
			using (var connection = new SqlConnection(ConnectionString))
			{
				connection.Open();

				using (var command = connection.CreateCommand())
				{
					command.CommandText = sql;

					using (var reader = command.ExecuteReader())
					{
						while (reader.Read())
						{
							whileRead(reader);
						}
					}
				}
			}
		}
    }
}