using System.Collections.Generic;

namespace AtomicG.Core.Models
{
    public class TemplateModel
    {
        public string ProjectName { get; set; }

        public string Version { get; set; } = "0.0.1";

        public string IntegrateWithFrontend { get; set; }

        public string IntegrateWithBackend { get; set; }

        public List<Entity> Entities { get; set; }
    }
}
