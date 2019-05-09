using System.Collections.Generic;

namespace AtomicG.Core.Models
{
    public class TemplateModel
    {
        public string ProjectName { get; set; }

        public bool IsSolution { get; set; }

        public List<Entity> Entities { get; set; }
    }
}
