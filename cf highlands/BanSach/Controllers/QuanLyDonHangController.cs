using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BanSach.Models;
using System.Data.Linq;
namespace BanSach.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        dbBanHangDataContext db = Conect.GetConnect();
        // GET: /QuanLyDonHang/Index
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("DangNhap", "LoginAdmin");
            }

            return View(db.DonHangs.ToList());
        }
        public ActionResult Delete(int MaDonHang)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == MaDonHang);
            
            if (donhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(donhang);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult AcceptDetele(int MaDonHang)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == MaDonHang);

            if (donhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            // Xóa tất cả chi tiết đơn hàng liên quan trước
            var chiTietDonHang = db.ChiTietDonHangs.Where(ct => ct.MaDonHang == MaDonHang).ToList();
            db.ChiTietDonHangs.DeleteAllOnSubmit(chiTietDonHang);

            // Sau đó xóa đơn hàng
            db.DonHangs.DeleteOnSubmit(donhang);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int MaDonHang)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == MaDonHang);

            

            return View(donhang);

        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(DonHang donhang, FormCollection f)
        {
            //Sach sach1 = db.Saches.SingleOrDefault(n => n.MaSach == sach.MaSach);
            //sach1.MoTa = sach.MoTa;
            //db.SaveChanges();
            if (donhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.GetTable<DonHang>().Attach(donhang);

                    // Mark the entity as modified
                    db.Refresh(RefreshMode.KeepCurrentValues, donhang);

                    // Submit changes to the database
                    db.SubmitChanges();
                }
            }
            


            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == id);
            
            if (donhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(donhang);
        }



    }
}
