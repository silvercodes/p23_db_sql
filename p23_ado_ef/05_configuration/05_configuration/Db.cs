using Microsoft.EntityFrameworkCore;

namespace _05_configuration;

internal class Db: DbContext
{
    public string ConnString { get; set; }
    public DbSet<User> Users { get; set; }
    public DbSet<Role> Roles { get; set; }

    #region Simple case
    //public Db(string connString)
    //{
    //    ConnString = connString;

    //    Database.EnsureDeleted();
    //    Database.EnsureCreated();
    //}

    //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    //{
    //    optionsBuilder.UseSqlServer(ConnString);
    //}
    #endregion

    public Db(DbContextOptions<Db> options) 
        : base(options)
    {
        Database.EnsureDeleted();
        Database.EnsureCreated();
    }

}
