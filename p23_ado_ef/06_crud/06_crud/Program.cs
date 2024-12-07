using _06_crud.Models;

#region CREATE
//using Db db = new Db();
//db.Users.AddRange(
//    new User() { Email = "vasia@mail.com", Password = "123123123"},
//    new User() { Email = "petya@mail.com", Password = "123123123"},
//    new User() { Email = "dima@mail.com", Password = "123123123"}
//);

//db.SaveChanges();
#endregion


#region READ
using Db db = new Db();

List<User> users = db.Users.Where(u => u.Id > 2).ToList();
users.ForEach(Console.WriteLine);

#endregion