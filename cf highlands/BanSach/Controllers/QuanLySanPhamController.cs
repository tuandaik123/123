using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Linq;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;
using PagedList;
using PagedList.Mvc;

namespace BanSach.Controllers
{
    public class QuanLySanPhamController : Controller
    {
        dbBanHangDataContext db = Conect.GetConnect();
        // GET: QuanLySanPham
        public ActionResult Index(int? page)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("DangNhap", "LoginAdmin");
            }
            int pageNumber = (page ?? 1);
            int pageSize = 10;

            return View(db.Saches.ToList().OrderBy(n=>n.MaSach).ToPagedList(pageNumber,pageSize));
        }

        [HttpGet]
        public ActionResult ThemMoi() 
        {
            ViewBag.MaChuDe = new SelectList(db.ChuDes.ToList().OrderBy(n=>n.TenChuDe),"MaChuDe","TenChuDe");
            
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemMoi(Sach sach, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaChuDe = new SelectList(db.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaChuDe", "TenChuDe");
           
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Chọn hình ảnh";
                return View();
            }
            else
            { 
                    if (ModelState.IsValid)
                    {
                    var fileName = Path.GetFileName(fileUpload.FileName);

                    var path = Path.Combine(Server.MapPath("~/HinhAnhSp"), fileName);
                    {
                        fileUpload.SaveAs(path);
                    }
                    sach.AnhBia = fileUpload.FileName;
                    db.Saches.InsertOnSubmit(sach);
                    db.SubmitChanges();
                }
            }
            return RedirectToAction("Index");
        }

        public ActionResult Details(int id)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == id);
            ViewBag.MaSach = sach.MaSach;
            if(sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }
        public ActionResult Delete(int id) 
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == id);
            ViewBag.MaSach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }

        [HttpPost,ActionName("Delete")]
        public ActionResult AcceptDetele(int id)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == id);
            ViewBag.MaSach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.Saches.DeleteOnSubmit(sach);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int MaSach)
        {
            Sach sach = db.Saches.SingleOrDefault(n=>n.MaSach == MaSach);
            
            ViewBag.MaChuDe = new SelectList(db.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaChuDe", "TenChuDe");
            
            return View(sach);
            
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Sach sach)
        {
            //Sach sach1 = db.Saches.SingleOrDefault(n => n.MaSach == sach.MaSach);
            //sach1.MoTa = sach.MoTa;
            //db.SaveChanges();
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            else {
                if (ModelState.IsValid)
                {
                    db.GetTable<Sach>().Attach(sach);

                    // Mark the entity as modified
                    db.Refresh(RefreshMode.KeepCurrentValues, sach);

                    // Submit changes to the database
                    db.SubmitChanges();
                }
            }
            ViewBag.MaChuDe = new SelectList(db.ChuDes.ToList().OrderBy(n => n.TenChuDe), "MaChuDe", "TenChuDe");
            
            
            return RedirectToAction("Index");
        }
    }

}
