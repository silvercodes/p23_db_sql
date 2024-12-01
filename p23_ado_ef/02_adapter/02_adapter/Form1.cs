using Microsoft.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Diagnostics;

namespace _02_adapter
{
    public partial class Form1 : Form
    {
        private string connString = string.Empty;
        private SqlConnection conn;
        private DataSet ds;
        private SqlDataAdapter adapter;

        public Form1()
        {
            InitializeComponent();

            connString = ConfigurationManager
                .ConnectionStrings["express"]
                .ConnectionString;

            conn = new SqlConnection(connString);
            ds = new DataSet();
        }

        private void btnExec_Click(object sender, EventArgs e)
        {
            dgvMain.DataSource = null;
            Update();

            adapter = new SqlDataAdapter(txtQuery.Text, conn);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);     // Добавит недостающие команды

            Debug.WriteLine(builder.GetInsertCommand().CommandText);
            Debug.WriteLine(builder.GetUpdateCommand().CommandText);
            Debug.WriteLine(builder.GetDeleteCommand().CommandText);

            /*
                INSERT INTO [users] ([email], [nickname], [password], [birthday], [deleted_at]) VALUES (@p1, @p2, @p3, @p4, @p5)
                UPDATE [users] SET [email] = @p1, [nickname] = @p2, [password] = @p3, [birthday] = @p4, [deleted_at] = @p5 WHERE (([id] = @p6) AND ([email] = @p7) AND ([nickname] = @p8) AND ([password] = @p9) AND ([birthday] = @p10) AND ((@p11 = 1 AND [deleted_at] IS NULL) OR ([deleted_at] = @p12)))
                DELETE FROM [users] WHERE (([id] = @p1) AND ([email] = @p2) AND ([nickname] = @p3) AND ([password] = @p4) AND ([birthday] = @p5) AND ((@p6 = 1 AND [deleted_at] IS NULL) OR ([deleted_at] = @p7)))
            */

            ModifyUpdateCommand();

            adapter.Fill(ds);
            dgvMain.DataSource = ds.Tables[0];
        }

        private void btnSync_Click(object sender, EventArgs e)
        {
            adapter.Update(ds.Tables[0]);
        }

        private void ModifyUpdateCommand()
        {
            string query = @"
                UPDATE users
                SET nickname = @p_nickname, birthday = @p_birthday
                WHERE id = @p_id;
            ";
            SqlCommand cmd = new SqlCommand(query, conn);
            //
            //

            adapter.UpdateCommand = cmd;
        }
    }
}
