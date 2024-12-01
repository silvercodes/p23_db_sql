using Microsoft.Data.SqlClient;
using System.Data;

const string connString = @"Server=.\SQLEXPRESS;Database=p23_mystat_db;Trusted_Connection=True;Encrypt=False;";


//using SqlConnection conn = new SqlConnection(connString);

////string title = "EF Core";

//string title = "my_title');INSERT INTO subjects (title) VALUES ('admin looser!!!";

//try
//{
//    conn.Open();
//    Console.WriteLine("Connection OK");

//    string query = @$"INSERT INTO subjects (title) VALUES ('{title}')";
//    Console.WriteLine(query);

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






//using SqlConnection conn = new SqlConnection(connString);

////string title = "EF Core";

//string title = "my_title');INSERT INTO subjects (title) VALUES ('admin looser!!!";

//try
//{
//    conn.Open();
//    Console.WriteLine("Connection OK");

//    string query = @$"INSERT INTO subjects (title) VALUES (@title)";

//    SqlCommand cmd = new SqlCommand(query, conn);

//    SqlParameter prm = new SqlParameter("@title", title)
//    {
//        SqlDbType = SqlDbType.NVarChar,
//        Size = 128,
//    };
//    cmd.Parameters.Add(prm);

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






using SqlConnection conn = new SqlConnection(connString);

int number = 203;
string title = "Robotics";

try
{
    conn.Open();
    Console.WriteLine("Connection OK");

    string query = @"
        INSERT INTO classrooms (number, title)
        VALUES (@number, @title);
        SET @last_id = SCOPE_IDENTITY();
    ";

    SqlCommand cmd = new SqlCommand(query, conn);

    cmd.Parameters.Add(new SqlParameter("@number", number)
    {
        SqlDbType = SqlDbType.Int,
    });

    cmd.Parameters.Add(new SqlParameter("@title", SqlDbType.NVarChar)
    {
        Size = 50,
        Value = title
    });

    SqlParameter idPrm = new SqlParameter()
    { 
        ParameterName = "@last_id",
        SqlDbType = SqlDbType.Int,
        Direction = ParameterDirection.Output,
    };
    cmd.Parameters.Add(idPrm);

    cmd.ExecuteNonQuery();

    Console.WriteLine($"last_id = {idPrm.Value}");
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