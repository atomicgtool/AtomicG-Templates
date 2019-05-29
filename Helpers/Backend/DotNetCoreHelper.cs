
using AtomicG.Core.Models;
using Microsoft.AspNetCore.Html;
using System.Linq;

namespace AtomicG.Helper.BackEnd
{
    public static class DotNetCoreHelper
    {
        public static string GetKeyType(this Entity entity)
        {
            return entity.Fields.FirstOrDefault(c => c.Key).EntityType();
        }

        public static HtmlString GetDtoReturnType(this Field field)
        {
            if (field.Type.ToLower() == "guid")
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode("Guid?"));
            }

            if (field.Type.ToLower() == "date")
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode("DateTime?"));
            }

            if (field.IsBasicType())
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode(field.EntityType()));
            }

            if (field.Type.Contains("[]"))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($"virtual ICollection<{field.EntityType()}Dto>"));
            }

            return new HtmlString(System.Web.HttpUtility.HtmlDecode(field.EntityType() + "Dto"));
        }

        public static HtmlString GetEntityReturnType(this Field field)
        {
            if (field.IsBasicType())
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode(field.EntityType()));
            }

            if (field.Type.Contains("[]"))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($"virtual ICollection<{field.EntityType()}>"));
            }

            return new HtmlString(System.Web.HttpUtility.HtmlDecode(field.EntityType()));
        }

        public static bool IsBasicType(this Field field)
        {
            return field.Type.ToLower() == "number" || field.Type.ToLower() == "boolean" || field.Type.ToLower() == "string" || field.Type.ToLower() == "guid" || field.Type.ToLower() == "date";
        }

        public static string EntityType(this Field field)
        {
            if (field.Type == "guid")
            {
                return "Guid";
            }

            if (field.Type == "string")
            {
                return "string";
            }

            if (field.Type == "boolean")
            {
                return "bool";
            }

            if (field.Type == "number")
            {
                return "int";
            }

            if (field.Type == "date")
            {
                return "DateTime";
            }

            return field.Type.Replace("[]", "").FirstLetterToUpper();
        }
    }
}
