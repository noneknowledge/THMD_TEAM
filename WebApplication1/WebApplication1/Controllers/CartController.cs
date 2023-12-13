using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net.WebSockets;
using WebApplication1.Data;
using TMDT_Project.Models;
using TMDT_Project.ViewModel;
//using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TMDT_Project.Controllers
{
    public class CartController : Controller
    {
        private readonly PaypalClient _paypal;
        private readonly Game_DBContext _ctx;

        public CartController(PaypalClient paypal, Game_DBContext context)
        {
            _paypal = paypal;
            _ctx = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [Authorize]
        public async Task<IActionResult> CustomerCart()
        {
            ViewBag.ClientId = _paypal.ClientId;
            var id = User.FindFirst("uid").Value.ToString();
            var data = await _ctx.ShoppingCarts.Where(a => a.Uid == id).Select(a => new GameVM
            {
                Alias = a.Game.Alias,
                GameId = a.Game.GameId,
                GameDes = a.Game.GameDes,
                GameCategories = a.Game.GameCategories,
                GameImages = a.Game.GameImages,
                GameName = a.Game.GameName,
                Price = a.Game.Price,
                Discount = a.Game.Discount,
                StartDis = a.Game.StartDis,
                EndDis = a.Game.EndDis,
                View = a.Game.View,
                Video = a.Game.Video,
                Dev = a.Game.Dev,
                Publisher = a.Game.Publisher,
                DevId =     a.Game.DevId,
                PublisherId = a.Game.PublisherId,
                IsActive = a.Game.IsActive,
                Thumbnail = a.Game.Thumbnail,
            }).ToListAsync();

            return View(data);
        }
        public IActionResult success() { 
            return View();
        }

        public async Task<string> AddToCart(string gameid)
        {
            if (User.Identity.IsAuthenticated)
            {
                var data = await _ctx.Games.FirstOrDefaultAsync(a => a.GameId == gameid);
                if (data != null)
                {
                    var UID = User.Claims.FirstOrDefault(a => a.Type == "uid")?.Value.ToString();
                    var sanpham = await _ctx.ShoppingCarts.FirstOrDefaultAsync(a=> a.Uid == UID && a.GameId == gameid);
                    if(sanpham != null)
                    {
                        return "sản phẩm đã có sản trong giỏ hàng";
                    }
                    
                    var item = new ShoppingCart
                    {
                        GameId = data.GameId,
                        Uid = UID,
                    };

                    _ctx.Add(item);
                    await _ctx.SaveChangesAsync();

                    var tenGame = "Đã thêm thành công " + data.GameName + " vào giỏ hàng";
                    return tenGame;
                }
                return "Đã xảy ra lỗi vui lòng thử lại";
            }
            return "Vui lòng đăng nhập để sử dụng tính năng này";

        }





        //[Authorize]
        //public async Task<IActionResult> AddToCart(string gameid)
        //{
           
           
        //        var data = await _ctx.Games.FirstOrDefaultAsync(a => a.GameId == gameid);
        //        if (data != null)
        //        {
        //            var UID = User.Claims.FirstOrDefault(a=>a.Type == "uid")?.Value.ToString();
        //            var item = new ShoppingCart
        //            {
        //                GameId = data.GameId,
        //                Uid = UID,
        //            };

        //            _ctx.Add(item);
        //            _ctx.SaveChanges();
        //            ViewBag.ThongBaoThem = "Đã thêm thành công.";
        //            return Redirect("/pd/" + data.GameId + "/" + data.Alias);
        //        }
        //        ViewBag.ThongBaoThem = "Đã xảy ra lỗi vui lòng thử lại";
        //        return RedirectToAction("Index","Product");
            
            
        //}

        public async Task<IActionResult> RemoveFromCart()
        {
            return View();
        }
    }
}
