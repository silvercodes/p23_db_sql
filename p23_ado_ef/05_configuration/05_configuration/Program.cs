using _05_configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Configuration;

//string connString = "Server=(localdb)\\MSSQLLocalDB;Database=p23_ef_connfig_db;Trusted_Connection=True;Encrypt=False;";

//using Db db = new Db(connString);






//string connString = "Server=(localdb)\\MSSQLLocalDB;Database=p23_ef_config_db;Trusted_Connection=True;Encrypt=False;";

//DbContextOptionsBuilder<Db> builder = new DbContextOptionsBuilder<Db>();
//builder.UseSqlServer(connString);
////
////
//DbContextOptions<Db> options = builder.Options;

//using Db db = new Db(options);
//db.Users.AddRange(
//    new User() { Email = "email_1@mail.com", Password = "qwerty"},
//    new User() { Email = "email_2@mail.com", Password = "qwerty"},
//    new User() { Email = "email_3@mail.com", Password = "qwerty"}
//);

//db.SaveChanges();







ConfigurationBuilder confBuilder = new ConfigurationBuilder();
confBuilder.SetBasePath(Directory.GetCurrentDirectory());

confBuilder.AddJsonFile("config.json");
//
//

IConfigurationRoot config = confBuilder.Build();
string? connString = config.GetConnectionString("localdb");

DbContextOptionsBuilder<Db> builder = new DbContextOptionsBuilder<Db>();
builder.UseSqlServer(connString);
//
//
DbContextOptions<Db> options = builder.Options;

using Db db = new Db(options);
db.Users.AddRange(
    new User() { Email = "email_1@mail.com", Password = "qwerty" },
    new User() { Email = "email_2@mail.com", Password = "qwerty" },
    new User() { Email = "email_3@mail.com", Password = "qwerty" }
);

db.SaveChanges();
