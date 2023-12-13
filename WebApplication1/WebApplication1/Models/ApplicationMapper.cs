

using AutoMapper;
using WebApplication1.Data;
using TMDT_Project.ViewModel;

namespace TMDT_Project.Models
{
    public class ApplicationMapper: Profile
    {
        public ApplicationMapper() {
            CreateMap<RegisterVM, Client>().ReverseMap();
        }
    }
}
