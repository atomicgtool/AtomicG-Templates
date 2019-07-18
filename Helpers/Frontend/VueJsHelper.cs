using AtomicG.Core.Models;
using Microsoft.AspNetCore.Html;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AtomicG.Helper.Frontend
{
    public static class VueJsHelper
    {
        public static HtmlString GetVueJsPipeOrShow(this Field field)
        {
            if (field.IsBasicType())
            {
                if (field.EntityType() == "Date")
                {
                    return new HtmlString(System.Web.HttpUtility.HtmlDecode($" | formatDate('YYYY-MM-DD')"));
                }

                return new HtmlString(System.Web.HttpUtility.HtmlDecode(string.Empty));
            }

            if (!string.IsNullOrWhiteSpace(field.Show) && field.Type.Contains("[]"))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($" | joinComma('{field.Show}')"));
            }

            if (!string.IsNullOrWhiteSpace(field.Show))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode($".{field.Show}"));
            }

            return new HtmlString(System.Web.HttpUtility.HtmlDecode(string.Empty));
        }

        public static HtmlString GetValidationCondition(this Entity entity)
        {
            if (!entity.Fields.Any(f => f.Required))
            {
                return new HtmlString(System.Web.HttpUtility.HtmlDecode("return true"));
            }

            var validCondition = new StringBuilder("return ");
            var isFirst = true;
            foreach (var field in entity.Fields.Where(f => f.Required))
            {
                if (isFirst)
                {
                    validCondition.Append($"this.{entity.Name}.{field.Name}");
                    isFirst = false;
                }
                else
                {
                    validCondition.Append($" && this.{entity.Name}.{field.Name}");
                }
            }

            return new HtmlString(System.Web.HttpUtility.HtmlDecode(validCondition.ToString()));
        }
    }
}
