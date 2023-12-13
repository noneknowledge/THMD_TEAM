namespace TMDT_Project.ViewModel
{
    public class CartVM
    {
        public string GameId { get; set; } = null!;

        public string Uid { get; set; } = null!;

        public string? Des { get; set; }

        public int? Discount { get; set; }

        public DateOnly? StartDis { get; set; }

        public DateOnly? EndDis { get; set; }
        public double? Price { get; set; }

        public string? Thumbnail { get; set; }
        public string? Alias { get; set; }
        public int? Sales
        {
            get
            {
                if (StartDis < DateOnly.FromDateTime(DateTime.Now) && DateOnly.FromDateTime(DateTime.Now) < EndDis) { return Discount; }
                else if (StartDis == null && DateOnly.FromDateTime(DateTime.Now) < EndDis) return Discount;
                else if (StartDis < DateOnly.FromDateTime(DateTime.Now) && EndDis == null) return Discount;
                return 0;
            }
        }
        public double? CurrPrice
        {
            get
            {
                return Price - Price * Sales / 100;
            }
        }



    }
}
