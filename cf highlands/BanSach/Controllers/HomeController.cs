using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;
using PagedList;
using PagedList.Mvc;

namespace BanSach.Controllers
{
    public class HomeController : Controller
    {
        dbBanHangDataContext db = Conect.GetConnect();

        public ActionResult Index()
        {

            return View();
        }
        public ActionResult Menu(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.Saches.Where(n=>n.Moi==1).OrderBy(n=>n.GiaBan).ToPagedList(pageNumber,pageSize));

            
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KhachHang kh)
        {
            var existingUser = db.KhachHangs.SingleOrDefault(x => x.TaiKhoan == kh.TaiKhoan);
            
            if (string.IsNullOrEmpty(kh.HoTen) || string.IsNullOrEmpty(kh.TaiKhoan) || string.IsNullOrEmpty(kh.MatKhau) || string.IsNullOrEmpty(kh.Email) || string.IsNullOrEmpty(kh.DiaChi) || string.IsNullOrEmpty(kh.DienThoai) || string.IsNullOrEmpty(kh.GioiTinh))
            {
                ModelState.AddModelError("", "Vui lòng điền đầy đủ thông tin bắt buộc.");
                return View(kh);
            }
            else if (kh.NgaySinh == null)
            {
                ModelState.AddModelError("","Vui lòng chọn ngày sinh.");
                return View(kh);
            }
            else if (kh.MatKhau != kh.NhapLaiMatKhau)
            {
                ModelState.AddModelError("", "Mật khẩu không trùng nhau vui lòng nhập lại!");
                return View(kh);
            }

            else
            {
                // Kiểm tra xem tài khoản đã tồn tại trong cơ sở dữ liệu chưa
                
                if(existingUser != null)
                {
                    ModelState.AddModelError("", "Tài khoản đã tồn tại");
                    return View(kh);
                }
                
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
        }


        public ActionResult DangNhap()
        {
           
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(DangNhapModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var khachHangCheck = db.KhachHangs.FirstOrDefault(x => x.TaiKhoan.Equals(model.TaiKhoan) && x.MatKhau.Equals(model.MatKhau));



            var adminCheck = db.Admins.FirstOrDefault(x => x.TaiKhoan.Equals(model.TaiKhoan) && x.MatKhau.Equals(model.MatKhau));

            if (khachHangCheck != null)
            {
                Session["KhachHang"] = khachHangCheck;
                return RedirectToAction("Index", "Home");
            }
            else if (adminCheck != null)
            {
                Session["Admin"] = adminCheck;
                return RedirectToAction("Index", "QuanLySanPham");
            }
            else if (string.IsNullOrWhiteSpace(model.TaiKhoan))
            {
                ViewBag.LoginFail = "Tài khoản không được bỏ trống";
                return View();
            }
            else if (string.IsNullOrWhiteSpace(model.MatKhau))
            {
                ViewBag.LoginFail = "Mật khẩu không được bỏ trống";
                return View();
            }
            else
            {
                ViewBag.LoginFail = "Tài khoản hoặc mật khẩu không đúng";
                return View("DangNhap");
            }
        }

        public class DangNhapModel
        {
            public string TaiKhoan { get; set; }
            public string MatKhau { get; set; }

        }

        public ActionResult DangXuat()
        {
            Session["KhachHang"] = null;
            return RedirectToAction("Index","Home");
        }

        public ActionResult AboutUs()
        {

            return View();
        }

        public ActionResult DatHang()
        {

            return View();
        }

        public PartialViewResult SachMoiPartial()
        {
            var lstSachMoi = db.Saches.Take(3).ToList();
            return PartialView(lstSachMoi);
        }




        public ViewResult ThitTheoChuDe(int MaChuDe = 0)
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
        [HttpGet]
        public ViewResult LienHe()
        {

            return View();
        }

        [HttpPost]
        
        public ActionResult LienHe(LienHe lh)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    // Thêm thông tin liên hệ vào cơ sở dữ liệu
                    db.LienHes.InsertOnSubmit(lh);
                    db.SubmitChanges();

                    // Redirect to a "Thank You" page or another appropriate page
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    // Log the exception for debugging
                    // You can also handle the exception or display an error message to the user
                    ModelState.AddModelError(string.Empty, "Có lỗi xảy ra khi gửi liên hệ. Vui lòng thử lại sau.");
                }
            }

            return View();
        }

        public ActionResult TinTuc() {


            return View();
        }



    }
}