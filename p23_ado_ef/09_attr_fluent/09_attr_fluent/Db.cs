using Microsoft.EntityFrameworkCore;

namespace _09_attr_fluent;

internal class Db: DbContext
{
    public DbSet<User> Users { get; set; }
    // public DbSet<Role> Roles { get; set; }
    public Db()
    {
        Database.EnsureDeleted();
        Database.EnsureCreated();
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=p23_fluent_db;Trusted_Connection=True;Encrypt=False;");
    }

    protected override void OnModelCreating(ModelBuilder mb)
    {
        // mb.Entity<Role>();

        // mb.Ignore<Role>();

        // mb.Entity<User>().Ignore(u => u.Token);

        // mb.Entity<User>().ToTable("clients");

        mb.Entity<User>()
            .Property(u => u.Email)
            .HasColumnName("user_email");
    }
}
