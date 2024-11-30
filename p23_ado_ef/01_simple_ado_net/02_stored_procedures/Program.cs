using Microsoft.Data.SqlClient;
using System.Data;

const string connString = @"Server=.\SQLEXPRESS;Database=p23_portal_db;Trusted_Connection=True;Encrypt=False;";
// const string connStringWithoutPooling = @"Server=.\SQLEXPRESS;Database=p23_portal_db;Trusted_Connection=True;Encrypt=False;Pooling=False";
// const string connStringLocalDB = @"Server=(localdb)\MSSQLLocalDB;Database=p23_ado_net_db;Trusted_Connection=True;Encrypt=False;";

//string procQuery = @"
//        CREATE PROCEDURE uspGetUsersOf2000
//        AS
//        BEGIN
//            SELECT id, email
//            FROM users
//            WHERE YEAR(birthday) = 2000;
//        END
//    ";

//using SqlConnection conn = new SqlConnection(connString);

//try
//{
//    conn.Open();
//    Console.WriteLine("Connection OK");

//    // CreateProcedure();

//    SqlDataReader reader = GetProcReader("uspGetUsersOf2000");
//    RenderResult(reader);
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



string procQuery = @"
    CREATE PROCEDURE uspGetUsersCountByEmailPattern
        @pattern nvarchar(50),
        @count int OUT
    AS
    BEGIN
        SET @count = (
            SELECT COUNT(email)
            FROM users
            WHERE email LIKE @pattern
        );
    END
";

using SqlConnection conn = new SqlConnection(connString);

try
{
    conn.Open();
    Console.WriteLine("Connection OK");

    // CreateProcedure();
    int result = CountByEmails(conn, "a%");
    Console.WriteLine($"Count = {result}");
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

int CountByEmails(SqlConnection conn, string pattern)
{
    string procName = "uspGetUsersCountByEmailPattern";

    SqlCommand cmd = new SqlCommand(procName, conn)
    {
        CommandType = CommandType.StoredProcedure,
    };

    cmd.Parameters.Add(new SqlParameter()
    { 
        ParameterName = "@pattern",
        SqlDbType = SqlDbType.NVarChar,
        Size = 50,
        Value = pattern,
    });

    SqlParameter countPrm = new SqlParameter()
    {
        ParameterName = "@count",
        SqlDbType = SqlDbType.Int,
        Direction = ParameterDirection.Output,
    };

    cmd.Parameters.Add(countPrm);

    cmd.ExecuteNonQuery();

    return (int)countPrm.Value;
}


// ------
void CreateProcedure()
{
    SqlCommand cmd = new SqlCommand(procQuery, conn);
    cmd.ExecuteNonQuery();
}
SqlDataReader GetProcReader(string procName)
{
    SqlCommand cmd = new SqlCommand()
    {
        Connection = conn,
        CommandType = CommandType.StoredProcedure,      // <<< !!!
        CommandText = procName
    };

    return cmd.ExecuteReader();
}
void RenderResult(SqlDataReader reader)
{
    DataTable dt = new DataTable();
    dt.Load(reader);

    int columnsCount = dt.Columns.Count;

    foreach(DataColumn col in dt.Columns)
        Console.Write($"{col.ColumnName}\t\t");
    Console.WriteLine();

    foreach(DataRow row in dt.Rows)
    {
        for(int i = 0; i < columnsCount; ++i)
            Console.Write($"{row[i]}\t\t");
        Console.WriteLine();
    }
}
