using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_certificate : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results
        string path = RootFolderName + "/2016/certificates/10085648J/10085648JCertificate.pdf";
        if (path != string.Empty)
        {
            WebClient User = new WebClient();
            Byte[] FileBuffer = User.DownloadData(path);
            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }

        }
    }
}