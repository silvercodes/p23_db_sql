using System;
using System.Collections.Generic;

namespace _04_ef_db_first_main.Models;

public partial class Classroom
{
    public int Id { get; set; }

    public short Number { get; set; }

    public string? Title { get; set; }

    public virtual ICollection<Pair> Pairs { get; set; } = new List<Pair>();
}
