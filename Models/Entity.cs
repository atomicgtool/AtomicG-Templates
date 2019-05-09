using System.Collections.Generic;

namespace AtomicG.Core.Models
{
    public class Entity
    {
        public string ProjectName { get; set; }

        public string Name { get; set; }

        public List<Field> Fields { get; set; }        
    }
}