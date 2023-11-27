using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class QuanLyKhachHangController : Controller
    {
        dbBanHangDataContext db = Conect.GetConnect();
        // GET: QuanLyKhachHang
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("DangNhap", "LoginAdmin");
            }

            return View(db.KhachHangs.ToList());
        }
    }
}