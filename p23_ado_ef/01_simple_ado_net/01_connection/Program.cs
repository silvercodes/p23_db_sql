using Microsoft.Data.SqlClient;
using System.Data;

const string connString = @"Server=.\SQLEXPRESS;Database=p23_portal_db;Trusted_Connection=True;Encrypt=False;";
const string connStringWithoutPooling = @"Server=.\SQLEXPRESS;Database=p23_portal_db;Trusted_Connection=True;Encrypt=False;Pooling=False";
const string connStringLocalDB = @"Server=(localdb)\MSSQLLocalDB;Database=p23_ado_net_db;Trusted_Connection=True;Encrypt=False;";

#region Connection
//using SqlConnection conn = new SqlConnection(connString);

//try
//{
//	conn.Open();
//    Console.WriteLine("Connection OK");
//    Console.WriteLine(conn.ConnectionString);
//    Console.WriteLine(conn.State);
//    Console.WriteLine(conn.ServerVersion);

//    string query = @"CREATE TABLE roles(
//                        id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
//                        title varchar(50) NOT NULL
//                    );";

//    SqlCommand cmd = new SqlCommand(query, conn);
//    cmd.ExecuteNonQuery();
//}
//catch (Exception ex)
//{
//    Console.WriteLine($"ERROR: {ex.Message}");
//}
//finally
//{
//    if (conn.State == System.Data.ConnectionState.Open)
//    {
//        conn.Close();
//        Console.WriteLine("Connection closed");
//    }
//}

#endregion

#region Connection pooling

//using (SqlConnection conn = new SqlConnection(connString))
//{
//    conn.Open();
//    Console.WriteLine($"id: {conn.ClientConnectionId}");
//}

//using (SqlConnection conn = new SqlConnection(connString))
//{
//    conn.Open();
//    Console.WriteLine($"id: {conn.ClientConnectionId}");
//}

//using (SqlConnection conn = new SqlConnection(connStringWithoutPooling))
//{
//    conn.Open();
//    Console.WriteLine($"id: {conn.ClientConnectionId}");
//}

//using (SqlConnection conn = new SqlConnection(connStringWithoutPooling))
//{
//    conn.Open();
//    Console.WriteLine($"id: {conn.ClientConnectionId}");
//}

//using (SqlConnection conn = new SqlConnection(connStringLocalDB))
//{
//    conn.Open();
//    Console.WriteLine($"id: {conn.ClientConnectionId}");
//}

//using (SqlConnection conn = new SqlConnection(connStringLocalDB))
//{
//    conn.Open();
//    Console.WriteLine($"id: {conn.ClientConnectionId}");
//}

#endregion

#region Command

// === ExecuteNonQuery

//using SqlConnection conn = new SqlConnection(connStringLocalDB);

//try
//{
//    conn.Open();
//    Console.WriteLine("Connection OK");

//    string query = @"CREATE TABLE roles(
//                        id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
//                        title varchar(50) NOT NULL
//                    );";

//    SqlCommand cmd = new SqlCommand()
//    { 
//        Connection = conn,
//        CommandText = query,
//        CommandType = System.Data.CommandType.Text,
//    };

//    cmd.ExecuteNonQuery();

//    conn.ChangeDatabase("p23_test_db");

//    cmd.CommandText = @"CREATE TABLE logs(
//                        id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
//                        date datetime NOT NULL,
//                        message varchar(1024) NOT NULL
//                    );";

//    cmd.ExecuteNonQuery();
//}
//catch (Exception ex)
//{
//    Console.WriteLine($"ERROR: {ex.Message}");
//}
//finally
//{
//    if (conn.State == System.Data.ConnectionState.Open)
//    {
//        conn.Close();
//        Console.WriteLine("Connection closed");
//    }
//}



// === ExecuteReader

using SqlConnection conn = new SqlConnection(connString);

try
{
    conn.Open();
    Console.WriteLine("Connection OK");

    string query = @"SELECT id, email, password FROM users;";

    SqlCommand cmd =  new SqlCommand(query, conn);

    using (SqlDataReader reader = cmd.ExecuteReader())
    {
        Console.WriteLine($"{reader.GetName(0)}\t\t{reader.GetName(1)}\t\t{reader.GetName(2)}");

        while(reader.Read())
        {
            // итерация для отдельной строки (записи)!
            // int id = (int)reader[0];
            // int id = (int)reader["id"];
            // int id = reader.GetInt32("id");
            // int id = (int)reader.GetValue(0);
            int id = reader.GetFieldValue<int>("id");

            string email = reader.GetFieldValue<string>("email");

            string password = reader.GetFieldValue<string>("password");

            Console.WriteLine($"{id}\t\t{email}\t\t{password}");
        }


    }
}
catch (Exception ex)
{
    Console.WriteLine($"ERROR: {ex.Message}");
}
finally
{
    if (conn.State == System.Data.ConnectionState.Open)
    {
        conn.Close();
        Console.WriteLine("Connection closed");
    }
}

// === ExecuteScalar

#endregion


