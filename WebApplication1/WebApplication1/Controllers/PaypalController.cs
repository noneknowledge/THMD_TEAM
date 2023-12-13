using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Data;
using TMDT_Project.Models;
using TMDT_Project.ViewModel;

namespace TMDT_Project.Controllers
{
    public class PaypalController : Controller
    {
        private readonly Game_DBContext _ctx;
        private readonly PaypalClient _paypalClient;

        public PaypalController(PaypalClient paypalClient, Game_DBContext context)
        {
            _ctx = context;
            _paypalClient = paypalClient;
        }

        public IActionResult Index()
        {
            // ViewBag.ClientId is used to get the Paypal Checkout javascript SDK
            ViewBag.ClientId = _paypalClient.ClientId;
            return View();
        }
        
        [HttpPost]
        public async Task<IActionResult> Order(CancellationToken cancellationToken)
        {
            var uid = User.FindFirst("uid").Value.ToString();
            // Tạo đơn hàng (thông tin lấy từ Session???)
            var items = await _ctx.ShoppingCarts.Where(a => a.Uid == uid).Select(a => new GameVM
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
                DevId = a.Game.DevId,
                PublisherId = a.Game.PublisherId,
                IsActive = a.Game.IsActive,
                Thumbnail = a.Game.Thumbnail,
            }).ToListAsync();
            var tongTien = items.Sum(a => a.CurrPrice).ToString();
            var donViTienTe = "USD";
            // OrderId - mã tham chiếu (duy nhất)
            var orderIdref = "DH" + DateTime.Now.Ticks.ToString();

            try
            {
                // a. Create paypal order
                var response = await _paypalClient.CreateOrder(tongTien, donViTienTe, orderIdref, items);

                return Ok(response);
            }
            catch (Exception e)
            {
                var error = new
                {
                    e.GetBaseException().Message
                };

                return BadRequest(error);
            }
        }

        public async Task<IActionResult> Capture(string orderId, CancellationToken cancellationToken)
        {
            try
            {
                var response = await _paypalClient.CaptureOrder(orderId);

                var reference = response.purchase_units[0].reference_id;

                var uid = User.FindFirst("uid").Value.ToString();
                // Tạo đơn hàng (thông tin lấy từ Session???)
                var items = await _ctx.ShoppingCarts.Where(a => a.Uid == uid).Select(a => new GameVM
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
                    DevId = a.Game.DevId,
                    PublisherId = a.Game.PublisherId,
                    IsActive = a.Game.IsActive,
                    Thumbnail = a.Game.Thumbnail,
                }).ToListAsync();
                var tongTien = items.Sum(a => a.CurrPrice).ToString();

                var order = new Order()
                {
                    OrderId = Guid.NewGuid().ToString(),
                    Uid = uid,
                    OrderDate = DateTime.Now,
                    Amount =  items.Sum(a=>a.CurrPrice),
                    Total = items.Sum(a=>a.CurrPrice),
                };
                foreach (var element in items)
                {
                    var orderDetail = new OrderDetail()
                    {
                        OrderId = order.OrderId,
                        GameId = element.GameId,
                        Prices = element.CurrPrice,

                    };
                    var lib = new Library()
                    {
                        GameId = element.GameId,
                        Uid = uid,
                    };
                    order.OrderDetails.Add(orderDetail);
                    _ctx.Add(lib);
                    
                }
                _ctx.Add(order);
                await _ctx.SaveChangesAsync();

                var data = _ctx.ShoppingCarts.Where(a => a.Uid == uid);
                _ctx.ShoppingCarts.RemoveRange(data);
                await _ctx.SaveChangesAsync();
                

                // Put your logic to save the transaction here
                // You can use the "reference" variable as a transaction key
                // Lưu đơn hàng vô database

                return Ok(response);
            }
            catch (Exception e)
            {
                var error = new
                {
                    e.GetBaseException().Message
                };

                return BadRequest(error);
            }
        }

        public IActionResult Success()
        {
            return View();
        }
    }
}
