using System.ComponentModel.DataAnnotations.Schema;

namespace _09_attr_fluent;

// [Table("clients")]
internal class User
{
    public int Id { get; set; }
    // [Column("user_email")]
    public string Email { get; set; }
    public int? Age { get; set; }
    public Role? Role { get; set; }
    //[NotMapped]
    public string Token { get; set; } = string.Empty;
}
