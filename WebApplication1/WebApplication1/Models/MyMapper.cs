using WebApplication1.Data;
using TMDT_Project.ViewModel;

namespace TMDT_Project.Models
{
    public static class MyMapper
    {
        public static async Task<Game> MapGame(GameInput Imodel)
        {
            string[] cates = null;
            if (Imodel.Categories!=null)
            {
                 cates = Imodel.Categories.Split(',');
            }
           
            
            var game = new Game();
            game.GameId = Guid.NewGuid().ToString();
            game.StartDis = Imodel.StartDis;
            game.EndDis = Imodel.EndDis;
            game.Discount = Imodel.Discount;
            game.View = Imodel.View ==null ? 1: Imodel.View;
            game.Alias = Imodel.Alias;
            game.DevId = Imodel.DevId;
            game.PublisherId = Imodel.PublisherId;
            game.Price = Imodel.Price;
            game.ReleaseDate = Imodel.ReleaseDate;
            game.IsActive = "true";
            game.GameName = Imodel.GameName;
            game.GameDes = Imodel.GameDes;
            game.Video= Imodel.Video;
            foreach (var c in cates)
            {
                var newGameCate = new GameCategory();
                newGameCate.GameId = game.GameId;
                newGameCate.CateId = c;
                game.GameCategories.Add(newGameCate);
            }

            game.Thumbnail = await Mytool.UploadFileToS3(Imodel.Thumbnail);
            foreach (var image in Imodel.Images)
            {
                var imgGame = new GameImage();
                imgGame.GameId = game.GameId;
                imgGame.ImageId = Guid.NewGuid().ToString();
                imgGame.ImageName = await Mytool.UploadFileToS3(image);
                game.GameImages.Add(imgGame);
            }





            return game;
        }
    }
}
