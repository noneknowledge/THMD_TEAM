using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using TMDT_Project.Models;
using WebApplication1.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.ExpireTimeSpan = TimeSpan.FromMinutes(20);
        options.SlidingExpiration = true;
        options.LoginPath = "/Customer/Login";
        options.AccessDeniedPath = "/Forbidden/";
    });

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromSeconds(30);
});

builder.Services.AddDbContext<Game_DBContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("ChuoiKetNoi"));
});

builder.Services.AddAutoMapper(typeof(Program));

builder.Services.AddSingleton(x => new PaypalClient
(
    builder.Configuration["PaypalOptions:ClientId"],
    builder.Configuration["PaypalOptions:ClientSecret"],
    builder.Configuration["PaypalOptions:Mode"]
    ));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
