
namespace TMDT_Project.ViewModel
{
    public class GameInput
    {
        public string? GameId { get; set; }

        public string? GameName { get; set; }

        public string? GameDes { get; set; }

        public double? Price { get; set; }

        public IFormFile Thumbnail { get; set; }
        public IFormFileCollection Images { get; set; }
        public string Categories { get; set; }

        public string? Video { get; set; }

        public string? DevId { get; set; }

        public string? PublisherId { get; set; }

        public DateTime? ReleaseDate { get; set; }

        public int? View { get; set; }

        public string? IsActive { get; set; }

        public int? Discount { get; set; }

        public DateTime? StartDis { get; set; }

        public DateTime? EndDis { get; set; }
        public string? Alias { get; set; }

    }
    
}
