using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using BanSach.Models;
using PagedList;
using PagedList.Mvc;

namespace BanSach.Controllers
{
    public class GiamGiaController : Controller
    {
        dbBanHangDataContext db = Conect.GetConnect();
        // GET: GiamGia
        public ActionResult Menu(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Saches.Where(n => n.Moi == 1).OrderBy(n => n.GiaBan).ToPagedList(pageNumber, pageSize));

        }
    }
}