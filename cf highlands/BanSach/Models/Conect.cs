using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.Models
{
    public class Conect
    {
        public dbBanHangDataContext data;
        public static dbBanHangDataContext GetConnect()
        {
            //string connectionString = "Data Source=LAPTOP-ODTA635P\\SQLEXPRESS01;Initial Catalog=QuanLyBanThit;Integrated Security=True";
            string connectionString = "Data Source=SQL8006.site4now.net;Initial Catalog=db_aa20c6_login;User ID=db_aa20c6_login_admin;Password=thuylinh123";
            dbBanHangDataContext dataContext = new dbBanHangDataContext(connectionString);
            return dataContext;
        }
    }
}