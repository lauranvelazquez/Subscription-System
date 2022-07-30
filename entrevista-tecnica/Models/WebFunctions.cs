using System;

public class ValidateFunctions
{
    public bool IsNotNull(string data)
    {
        if(data.Length != 0)
        { 
            return true; 
        }
        return false;
    }

    public bool IsEmail(string e)
    {
        if (e.Contains("@") && e.Contains("."))
        {
            return true;
        }
        return false;
    }


    public bool ValidateForm(string name, string ln, string ad, string tel, string em, string user, string pass)
    {
        if (IsNotNull(name) && IsNotNull(ln) && IsNotNull(ad) && IsNotNull(tel) && IsNotNull(user) && IsNotNull(pass) && IsEmail(em))
        {
            return true;
        }
        return false;
    }


    public bool ValidateSearch(string td, string doc)
    {
        if(IsNotNull(td) && IsNotNull(doc))
        {
            return true;
        }
        return false;
    }

}