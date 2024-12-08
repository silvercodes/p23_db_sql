
User user = new User("a@mail.com");
Console.WriteLine(user.ValidateEmail());

[AttributeUsage(AttributeTargets.Class)]
class EmailValidationAttribute: Attribute
{
    public int Length { get; }
    public EmailValidationAttribute(int length)
    {
        Length = length;
    }
}

[EmailValidation(5)]
class User
{
    public string Email { get; set; }
    public User(string email)
    {
        Email = email;
    }
    public bool ValidateEmail()
    {
        Type type = typeof(User);
        object[] attributes = type.GetCustomAttributes(false);

        foreach (object o in attributes)
        {
            if (o is EmailValidationAttribute eva)
            {
                if (Email.Length < eva.Length)
                    return false;
            }
        }

        return true;
    }
}
