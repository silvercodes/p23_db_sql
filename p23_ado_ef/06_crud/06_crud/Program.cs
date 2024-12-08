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
//using Db db = new Db();

////List<User> users = db.Users.Where(u => u.Id > 2).ToList();
////users.ForEach(Console.WriteLine);

//IQueryable<User> users = db.Users.Where(u => u.Id > 2);
//foreach(User user in users)
//    Console.WriteLine(user);

#endregion

#region UPDATE
//using Db db = new Db();

//User? user = db.Users.FirstOrDefault(u => u.Id == 4);

//if (user is not null)
//{
//    user.Email = "aaabbbccc@mail.com";
//    user.Password = "qwertyxxx";

//    db.SaveChanges();
//}



//User? user = null;

//using (Db db = new Db())
//{
//    user = db.Users.FirstOrDefault(u => u.Id == 4);
//}

////
////
//user.Email = "ttt@mail.com";
//using (Db db = new Db())
//{
//    db.Update(user);
//    db.SaveChanges();
//}

#endregion

#region DELETE

//using Db db = new Db();
//User? user = db.Users.FirstOrDefault<User>(u => u.Id == 4);

//if (user is not null)
//    db.Users.Remove(user);

//db.SaveChanges();

#endregion
