using AtomicG.Core.Models;
using Microsoft.AspNetCore.Html;
using System.Collections.Generic;
using System.Linq;

namespace AtomicG.Helper.Frontend
{
    public static class AngularHelper
    {
        public static string GetKeyName(this Entity entity)
        {
            return entity.Fields.FirstOrDefault(c => c.Key).Name;
        }

        public static string GetKeyType(this Entity entity)
        {
            return entity.Fields.FirstOrDefault(c => c.Key).EntityType();
        }

        public static bool HasMuchRelations(this Entity entity)
        {
            return entity.Fields.Any(c => !c.IsBasicType() && c.Type.Contains("[]"));
        }

        public static List<Field> GetMuchRelations(this Entity entity)
        {
            return entity.Fields.FindAll(c => !c.IsBasicType() && c.Type.Contains("[]"));
        }

        public static bool HasOneRelations(this Entity entity)
        {
            return entity.Fields.Any(c => !c.IsBasicType() && !string.IsNullOrWhiteSpace(c.Show) && !c.Type.Contains("[]"));
        }

        public static List<Field> GetOneRelations(this Entity entity)
        {
            return entity.Fields.FindAll(c => !c.IsBasicType() && !string.IsNullOrWhiteSpace(c.Show) && !c.Type.Contains("[]"));
        }

        public static HtmlString GetPipeOrShow(this Field field)
        {
            if (field.IsBasicType())
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode(string.Empty));
            }

            if (!string.IsNullOrWhiteSpace(field.Show) && field.Type.Contains("[]"))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($" | joinComma:'{field.Show}'"));
            }

            if (!string.IsNullOrWhiteSpace(field.Show))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($".{field.Show}"));
            }

            return new HtmlString(System.Web.HttpUtility.HtmlDecode(string.Empty));
        }

        public static HtmlString GetDefaultValue(this Field field)
        {
            if (field.IsBasicType())
            {
                if (field.EntityType() == "Date")
                {
                    return new HtmlString(System.Web.HttpUtility.HtmlDecode("new Date()"));
                }

                return new HtmlString(System.Web.HttpUtility.HtmlDecode("''"));
            }

            if (field.Type.Contains("[]"))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($"{field.EntityType().FirstLetterToUpper()}['']"));
            }


            return new HtmlString(System.Web.HttpUtility.HtmlDecode($"new {field.EntityType().FirstLetterToUpper()}()"));
        }

        public static HtmlString GetCreateInitForm(this Field field)
        {
            if (field.IsBasicType())
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode(field.Required ? "['', Validators.required]" : "['']"));
            }

            if (field.Type.Contains("[]"))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($"this.add{field.Name.FirstLetterToUpper()}Checkboxes()"));
            }

            return new HtmlString(System.Web.HttpUtility.HtmlDecode($"this.add{field.Name.FirstLetterToUpper()}Combobox()"));
        }

        public static HtmlString GetUpdateInitForm(this Field field, string entityName)
        {
            if (field.IsBasicType())
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode(field.Required ? "['', Validators.required]" : "['']"));
            }

            if (field.Type.Contains("[]"))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($"this.add{field.Name.FirstLetterToUpper()}Checkboxes({entityName})"));
            }

            return new HtmlString(System.Web.HttpUtility.HtmlDecode($"this.add{field.Name.FirstLetterToUpper()}Combobox({entityName})"));
        }

        public static bool IsBasicType(this Field field)
        {
            return field.Type.ToLower() == "number" || field.Type.ToLower() == "boolean" || field.Type.ToLower() == "string" || field.Type.ToLower() == "guid" || field.Type.ToLower() == "date";
        }
        
        public static string EntityType(this Field field)
        {
            if (field.Type.ToLower() == "guid")
            {
                return "string";
            }

            if (field.Type.ToLower() == "string")
            {
                return "string";
            }

            if (field.Type.ToLower() == "boolean")
            {
                return "boolean";
            }

            if (field.Type.ToLower() == "number")
            {
                return "number";
            }

            if (field.Type.ToLower() == "date")
            {
                return "Date";
            }

            return field.Type.Replace("[]", "").FirstLetterToUpper();
        }

        public static string GetReturnType(this Field field)
        {
            if (field.Type.ToLower() == "guid")
            {
                return "string";
            }

            if (field.Type.ToLower() == "string")
            {
                return "string";
            }

            if (field.Type.ToLower() == "boolean")
            {
                return "boolean";
            }

            if (field.Type.ToLower() == "number")
            {
                return "number";
            }

            if (field.Type.ToLower() == "date")
            {
                return "Date";
            }

            return field.Type.FirstLetterToUpper();
        }    
    }
}
