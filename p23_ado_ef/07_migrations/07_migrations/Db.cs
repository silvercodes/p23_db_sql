using Microsoft.EntityFrameworkCore;

namespace _07_migrations;

internal class Db: DbContext
{
    public DbSet<User> Users { get; set; }

    public Db()
    {

    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=p23_ef_migrations_db;Trusted_Connection=True;Encrypt=False;");
    }

}
