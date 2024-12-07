using System;
using System.Collections.Generic;

namespace _06_crud.Models;

public partial class User
{
    public int Id { get; set; }

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public override string ToString()
    {
        return $"{Id} {Email} {Password}";
    }
}
