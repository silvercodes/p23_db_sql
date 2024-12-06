using Microsoft.EntityFrameworkCore;

namespace _03_ef_db_first
{
    internal class Db: DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Product> Products { get; set; }

        public Db()
        {
            Database.EnsureDeleted();
            Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder builder)
        {
            builder.UseSqlServer(@"Server=(localdb)\MSSQLLocalDB;Database=p23_ef_codefirst_db;Trusted_Connection=True;Encrypt=False;");
        }
    }
}
