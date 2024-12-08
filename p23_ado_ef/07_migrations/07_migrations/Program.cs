using _07_migrations;

using Db db = new Db();

//db.Users.AddRange(
//    new User() { Email = "aaa@mail.com", Password = "123", Age = 23},    
//    new User() { Email = "bbb@mail.com", Password = "123", Age = 34},    
//    new User() { Email = "ccc@mail.com", Password = "123", Age = 21}   
//);

//db.SaveChanges();


List<User> users = db.Users.ToList();
users.ForEach(u => u.Status = 1);

db.SaveChanges();


