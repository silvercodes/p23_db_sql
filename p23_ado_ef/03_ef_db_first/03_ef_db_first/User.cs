﻿namespace _03_ef_db_first;

internal class User
{
    public int Id { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public int? Age { get; set; }
}
