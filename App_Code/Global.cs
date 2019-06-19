using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for Global
/// </summary>
public static class Global
{
   /* Zoliotech Server*/

    public static string ZT_from = "divya@zoliotech.com";//local
    public static string ZT_to = "divya@zoliotech.com";//local
    public static string ZT_cc = "diyaharidas@gmail.com";//local
    public static string ZT_smtp_client = "relay-hosting.secureserver.net";
   // public static string ZT_pdf_path_to_ipad_first_part = "http://www.edugame.co/bclstest/results/";

    /* NP Server*/
    public static string NP_from = "gsd2@np.edu.sg";
    public static string NP_to_last_part = "@connect.np.edu.sg"; //NP_to contains variables //"S" + NPst_id + "@connect.np.edu.sg";   
   // public static string NP_cc = "Othello_DAVE@np.edu.sg";//NP - DAVE
    public static string NP_smtp_client = "mhub.np.edu.sg";
   // public static string NP_pdf_path_to_ipad_first_part_production = "https://hsweb.np.edu.sg/BCLS/results/";
   // public static string NP_pdf_path_to_ipad_first_part_dev = "https://hswebdev.np.edu.sg/BCLS/results/";
   

}
