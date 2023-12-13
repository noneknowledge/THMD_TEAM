using AutoMapper;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using WebApplication1.Data;
using TMDT_Project.Models;
using TMDT_Project.ViewModel;
using System.Net.Mail;
using System.Net;

namespace TMDT_Project.Controllers
{
    
    public class CustomerController : Controller
    {
        private readonly Game_DBContext _ctx;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment _envi;

        public CustomerController(Game_DBContext context, IMapper mapper, IWebHostEnvironment envi)
        {
            _ctx = context;
            _mapper = mapper;
            _envi = envi;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> LoginAsync(string username, string password)
        {
            var kh = _ctx.Clients.SingleOrDefault(p => p.UserName == username && p.IsActive.ToUpper() == "TRUE" && p.IsHide.ToUpper() == "FALSE");
            if (kh == null)
            {
                ViewBag.ThongBao = "User này không tồn tại hoặc chưa kích hoặc hoặc bị khóa";
                return View();
            }

            if (kh.PassWord != password.ToSHA512Hash(kh.RandomKey))
            {
                ViewBag.ThongBao = "Đăng nhập không thành công";
                return View();
            }

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, kh.UserName),
                new Claim("FullName", kh.FullName),
                new Claim("uid", kh.Uid),
                new Claim("Email", kh.Email),
                new Claim("PhoneNumber", kh.Phone)
            };

            var claimsIdentity = new ClaimsIdentity(
            claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var claimPrincipal = new ClaimsPrincipal(claimsIdentity);

            await HttpContext.SignInAsync(claimPrincipal);

            return Redirect("/Home/Index");
            
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return Redirect("/");
        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM vm)
        {
            var user = await _ctx.Clients.FirstOrDefaultAsync(a => a.UserName == vm.UserName);
            if (user != null) {
                 

                ViewBag.ThongBao = "Tài khoản đã tồn tại";
                return View();
            }
            try
            {
                
                vm.IsActive = "false";
                vm.IsHide = "false";
                var khachhang = _mapper.Map<Client>(vm);
                khachhang.Uid = Guid.NewGuid().ToString(); 
                khachhang.RandomKey = Mytool.GetRandom();
                khachhang.PassWord = vm.PassWord.ToSHA512Hash(khachhang.RandomKey);
                //{ HttpContext.Request.Protocol}
                string hostname = $"{HttpContext.Request.Host}";
                string url = "http://"+hostname + "/Customer/Confirm/" + khachhang.Uid;
                string  subject = "Vui lòng xác thực email";
                sendConfirmMail(khachhang.Email, subject, url, khachhang.FullName);

                _ctx.Add(khachhang);
                await _ctx.SaveChangesAsync();
                return View("_emailConfirm","Xác thực email");


            }
            catch
            {
                return View();
            }
            
        }
        [HttpGet("/Customer/Confirm/{uid}")]
        public IActionResult Confirm(string uid)
        {
            var user = _ctx.Clients.FirstOrDefault(a => a.Uid == uid);
            if (user != null)
            {
                user.IsActive = "true";
            }
            _ctx.SaveChanges();
            return RedirectToAction("Login");
        }


        
        public string Email
        {
            get { return "maildungchomucdichhoc@gmail.com"; }
        }
        public string password
        {
            get { return "guip jatn yaxg qdjd"; }
        }
        public async void sendConfirmMail(string emailAddress, string subject, string url, string name)
        {
            try
            {

                //MailMessage mail = new MailMessage();
                //mail.To.Add(emailAddress);
                //mail.From = new MailAddress(Email);
                //mail.Subject = subject;

                string FilePath = _envi.WebRootPath + Path.DirectorySeparatorChar.ToString() + "Email" +
                    Path.DirectorySeparatorChar.ToString() + "confirm_template.html";
                string body = "";
                using (StreamReader str = new StreamReader(FilePath))
                {
                    body = str.ReadToEnd();
                };

                string messageBody = body.Replace("{{{0}}}", subject);
                messageBody = messageBody.Replace("{{{1}}}", url);
                messageBody = messageBody.Replace("{{{2}}}", name);

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(Email);
                    mail.To.Add(emailAddress);
                    mail.Subject = subject;
                    mail.Body = messageBody;
                    mail.IsBodyHtml = true;
                   

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new NetworkCredential(Email, password);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                }

                //{0}: subject;
                //{1}: url
                //{2}: url
                //{3}: url
                //{4}: name

                //string messageBody = string.Format(body, subject, url, url, url, name);
                


                //string body = Server.HtmlEncode(str.ReadToEnd());

                //mail.IsBodyHtml = true;
                //mail.Body = messageBody;
                //var smtpClient = new SmtpClient("smtp.gmail.com", 587)
                //{
                //    EnableSsl = true,
                   
                //    Credentials = new NetworkCredential(Email, password),
                    
                //};
                //smtpClient.Send(mail);
                

            }
            catch
            {
                throw new Exception();
            }
        }



    }
}
