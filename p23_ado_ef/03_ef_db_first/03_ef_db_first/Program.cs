using _03_ef_db_first;

using Db db = new Db();

Product p1 = new Product() { Title = "product_1", Description = "descr_1", Price = 100 };
Product p2 = new Product() { Title = "product_2", Description = "descr_2", Price = 200 };
Console.WriteLine(p1);
Console.WriteLine(p2);

db.Products.Add(p1);
db.Products.Add(p2);

db.SaveChanges();

Console.WriteLine(p1);
Console.WriteLine(p2);