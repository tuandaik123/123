using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class ChuDeController : Controller
    {
        // GET: ChuDe

        dbBanHangDataContext db = Conect.GetConnect();





        public ViewResult SachTheoChuDe(int MaChuDe = 0)
        {
            ChuDe cd = db.ChuDes.SingleOrDefault(n => n.MaChuDe == MaChuDe);
            if (cd == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            List<Sach> lstsach = db.Saches.Where(n => n.MaChuDe == MaChuDe).OrderBy(n => n.GiaBan).ToList();

            if (lstsach.Count == 0)
            {
                ViewBag.Sach = "Không có sách nào thuộc chủ đề này";
            }

            // Load danh sách chủ đề cho trang Index
            ViewBag.ChuDes = db.ChuDes.ToList();

            return View(lstsach);
        }


        public ViewResult DanhMucChuDe()
        {

            return View(db.ChuDes.ToList());
        }

    }
}