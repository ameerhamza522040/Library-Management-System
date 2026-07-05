using System.Configuration;
using System.Data.SqlClient;

namespace Library_Management_system
{
    public static class Connection
    {
        public static SqlConnection GetConnection()
        {
            string connStr = ConfigurationManager
                .ConnectionStrings["LibraryDBConnectionString1 (Library Management system)"]
                .ConnectionString;

            return new SqlConnection(connStr);
        }
    }
}