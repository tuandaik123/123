using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace BanSach.Models
{
    public class GioHang
    {
        // private int iMaSP;

        // public int IMaSP { get => iMaSP; set => iMaSP = value; }
        dbBanHangDataContext db = Conect.GetConnect();

        public int iMaSach {  get; set; }

        public string sTenGiay {  get; set; }

        public string sAnhBia { get; set; }

        public double dDonGia { get; set; }

        public int iSoLuong { get; set;}

        public double ThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }

        public GioHang(int MaSach)
        {
            iMaSach = MaSach;
            Sach sach = db.Saches.Single(n=>n.MaSach == iMaSach);
            sTenGiay = sach.TenGiay;
            sAnhBia = sach.AnhBia;
            dDonGia = double.Parse(sach.GiaBan.ToString());
            iSoLuong = 1;
        }

    }
}