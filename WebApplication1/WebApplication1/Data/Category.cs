using System;
using System.Collections.Generic;

namespace WebApplication1.Data
{
    public partial class Category
    {
        public Category()
        {
            GameCategories = new HashSet<GameCategory>();
        }

        public string CateId { get; set; } = null!;
        public string? CateName { get; set; }
        public string CateDes { get; set; } = null!;
        public string? Alias { get; set; }

        public virtual ICollection<GameCategory> GameCategories { get; set; }
    }
}
