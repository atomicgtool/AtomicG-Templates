using Pluralize.NET.Core;

namespace AtomicG.Helper
{
    public static class StringHelper
    {
        public static string FirstLetterToUpper(this string str)
        {
            if (str == null)
            {
                return null;
            }

            if (str.Length > 1)
            {
                return char.ToUpper(str[0]) + str.Substring(1);
            }

            return str.ToUpper();
        }

        public static string Pluralize(this string str)
        {
            return new Pluralizer().Pluralize(str);
        }

        public static string Singularize(this string str)
        {
            return new Pluralizer().Singularize(str);
        }
    }
}
