using System;
using System.Collections.Generic;

namespace _04_ef_db_first_main.Models;

public partial class Teacher
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public virtual ICollection<Pair> Pairs { get; set; } = new List<Pair>();

    public virtual ICollection<Subject> Subjects { get; set; } = new List<Subject>();
}
