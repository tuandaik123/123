using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class GioHangController : Controller
    {
        dbBanHangDataContext db = Conect.GetConnect();
        // GET: GioHang
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if(lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"]=lstGioHang;

            }
            return lstGioHang;
        }

        public ActionResult ThemGioHang(int iMaSach,string strURL) {

            Sach sach= db.Saches.SingleOrDefault(n=>n.MaSach == iMaSach);
            if (sach==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.Find(n=>n.iMaSach == iMaSach);
            if(sanpham == null)
            {
                sanpham = new GioHang(iMaSach);
                lstGioHang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoLuong++;
                return Redirect(strURL);
            }
           
        }
        public ActionResult CapNhatGioHang(int iMaSP,FormCollection f)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach==iMaSP);
            if(sach==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n=>n.iMaSach==iMaSP);
            if(sanpham != null)
            {
                sanpham.iSoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaGioHang(int iMaSP)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == iMaSP);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaSach == iMaSP);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n=>n.iMaSach == iMaSP);
                
            }
            if (lstGioHang.Count ==0)
            {
                return RedirectToAction("Index","Home");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult GioHang()
        {
            if (Session["KhachHang"] == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();

            return View(lstGioHang);
        }
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if(lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }
        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if( lstGioHang != null)
            {
                dTongTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return dTongTien;
        }

        public ActionResult GioHangPartial()
        {
            if(TongSoLuong()==0) 
            {
                return PartialView();
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }

        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();

            return View(lstGioHang);
        }
        [HttpPost]
        public ActionResult DatHang()
        {
            // Kiểm tra xem người dùng đã đăng nhập chưa
            if (Session["KhachHang"] == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }

            // Kiểm tra xem giỏ hàng có sản phẩm không
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }

            DonHang ddh = new DonHang();
            KhachHang khhang = (KhachHang)Session["KhachHang"]; // Sử dụng "KhachHang" thay vì "TaiKhoan"
            List<GioHang> gh = LayGioHang();
            ddh.MaKH = khhang.MaKH;
            ddh.NgayDat = DateTime.Now;
            db.DonHangs.InsertOnSubmit(ddh);
            db.SubmitChanges();

            foreach (var item in gh)
            {
                ChiTietDonHang ctdh = new ChiTietDonHang();
                ctdh.MaDonHang = ddh.MaDonHang;
                ctdh.MaSach = item.iMaSach;
                ctdh.SoLuong = item.iSoLuong;
                ctdh.DonGia = (decimal)item.dDonGia;
                db.ChiTietDonHangs.InsertOnSubmit(ctdh);
            }
            db.SubmitChanges();

            TempData["ThongBao"] = "Bạn đã đặt hàng thành công!";

            // Xóa giỏ hàng sau khi đã đặt hàng
            Session["GioHang"] = null;

            return RedirectToAction("Index", "Home");
        }

    }
}