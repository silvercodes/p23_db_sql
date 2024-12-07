
using _04_ef_db_first_main.Models;

using Db db = new Db();
db.Groups.Add(new Group() { Title = "P23", Status = 1 });

db.SaveChanges();
