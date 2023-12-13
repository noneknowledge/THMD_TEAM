
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Data;
using TMDT_Project.Models;
using TMDT_Project.ViewModel;

namespace TMDT_Project.Controllers
{
    public class ProductController : Controller
    {
       
        private readonly Game_DBContext _ctx;

        public ProductController(Game_DBContext context)
        {
             
            _ctx = context;

        }
        public async Task<IActionResult> Index()
        {
            var data = await _ctx.Games.Where(a=>a.IsActive.ToUpper() == "TRUE").Include(a=>a.Dev).Select(a => new GameVM
            {
                Alias = a.Alias,
                GameId = a.GameId,
                GameDes = a.GameDes,
                GameCategories = a.GameCategories,
                GameImages = a.GameImages,
                GameName = a.GameName,
                Price = a.Price,
                Discount = a.Discount,
                StartDis = a.StartDis,
                EndDis = a.EndDis,
                View = a.View,
                Video = a.Video,
                Dev = a.Dev,
                Publisher = a.Publisher,
                DevId = a.DevId,
                PublisherId = a.PublisherId,
                IsActive = a.IsActive,
                Thumbnail = a.Thumbnail,
            }).ToListAsync();
            
            
            return View(data);
        }


        [Route("pd/{id}/{alias}")]
        public async Task<IActionResult> Details(string id)
        {
            var a = await _ctx.Games.Include(a => a.Dev ).Include(a=>a.Publisher).Include(a=>a.GameImages).FirstOrDefaultAsync(a => a.GameId == id);
            var game = new GameVM {
                Alias = a.Alias,
                GameId = a.GameId,
                GameDes = a.GameDes,
                GameCategories = a.GameCategories,
                GameImages = a.GameImages,
                GameName = a.GameName,
                Price = a.Price,
                Discount = a.Discount,
                StartDis = a.StartDis,
                EndDis = a.EndDis,
                View = a.View,
                Video = a.Video,
                Dev = a.Dev,
                Publisher = a.Publisher,
                DevId = a.DevId,
                PublisherId = a.PublisherId,
                IsActive = a.IsActive,
                Thumbnail = a.Thumbnail,
            };
            
            var cate = await _ctx.GameCategories.Where(a=>a.GameId ==game.GameId).Include(a=>a.Cate).ToArrayAsync();
            ViewBag.Cate = cate;

            return View(game);
        }

        [Route("/dev/{id}/{alias}")]
        public async Task<IActionResult> DevGame(string id)
        {
            return View();
        }


        public async Task<IActionResult> Create() {
            ViewData["DevId"] = new SelectList(_ctx.Developers, "DevId", "Developer1");
            ViewBag.Cate = _ctx.Categories;
            return View();
        }



        [HttpPost]
        public async Task<IActionResult> Create(GameInput data)
        {
            //string filename =  await Mytool.UploadFileToS3(data.Thumbnail);
            var game = MyMapper.MapGame(data);
            Game gamemodel = game.Result;

            gamemodel.Price = gamemodel.Price.Value;

            _ctx.Games.Add(gamemodel);
            await _ctx.SaveChangesAsync();
           
            return RedirectToAction("Create");
        }
        
    }
}
