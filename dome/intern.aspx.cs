using finalyproject.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace finalyproject.dome
{
    public partial class intern : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }




        protected void btninsert_Click(object sender, EventArgs e)
        {

            if (txtrefNo.Text=="")
            {
                Response.Write("<script> alert('plz enter RefNO...'); </script");
            }
            CRUD myCrud = new CRUD();
            string mySql = @"insert employes (refNo,fname,lname,age,phone,salary)
                values (@refNo,@fname,@lname,@age,@phone,@salary)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@refno", txtrefNo.Text);
            myPara.Add("@fName", txtFname.Text);
            myPara.Add("@lName", txtLname.Text);
            myPara.Add("@age", txtAge.Text);
            myPara.Add("@phone", txtPhone.Text);
            myPara.Add("@salary", (txtSalary.Text));
        
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if 
                (rtn >= 1)
            {
                lbloutbut.Text = "Operation Successful!";
            }
            else
            {
                lbloutbut.Text = "Operation Failed!";
                gvcontact();
            }



        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"update employes set refno=@refno,fName=@fName,lName=@lName,age=@age,phone=@phone,salary=@salary
                                where employesid = @employesid";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@employesid", int.Parse(txtEmployesid.Text));
            myPara.Add("@fName", txtFname.Text);
            myPara.Add("@lName", txtLname.Text);
            myPara.Add("@age", txtAge.Text);
            myPara.Add("@phone", txtPhone.Text);
            myPara.Add("@refno", txtrefNo.Text);
            myPara.Add("@salary", txtSalary.Text);

            // you can use this code or 
            // myPara.Add("@countryId", int.Parse(ddlCountry.SelectedValue)); // you can use this code
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            { lbloutbut.Text = "Operation Successfull!"; }
            else
            { lbloutbut.Text = "Operation Failed"; }
            gvcontact();
        }
           
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"delete employes 
                                where employesid = @employesid";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@employesid", int.Parse(txtEmployesid.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            { lbloutbut.Text = "Operation Successfull!"; }
            else
            { lbloutbut.Text = "Operation Failed"; }
            gvcontact();
        }

        protected void txtGetdata_Click(object sender, EventArgs e)
        {
            gvcontact();

        }
        protected void gvcontact()
        {
            CRUD myCrud = new CRUD();
            String mysql = @"select * from employes";
            SqlDataReader dr = myCrud.getDrPassSql(mysql);
            gvintern.DataSource = dr;
            gvintern.DataBind();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {

        }


        protected void btnExpoertToExcel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel(gvintern);
        }
        public static void ExportGridToExcel(GridView myGv) // working 1
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Charset = "";
            string FileName = "ExportedReport_" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            myGv.GridLines = GridLines.Both;
            myGv.HeaderStyle.Font.Bold = true;
            myGv.RenderControl(htmltextwrtter);
            HttpContext.Current.Response.Write(strwritter.ToString());
            HttpContext.Current.Response.End();
        }

        protected void gvintern_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void populateForm_Click(object sender, EventArgs e)
        {
            int PK = int.Parse((sender as LinkButton).CommandArgument);
            //lblOuput.Text = PK.ToString();

            string mySql = @"  select employesid,refNo,fname,lname,age,phone,salary from employes 
                    where employesid=@employesid";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@employesid", PK);
            CRUD myCrud = new CRUD();
            using (SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara))
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        String empId = dr["employesid"].ToString();
                        String refNo = dr["refNo"].ToString();
                        String fname = dr["fname"].ToString();
                        String lname = dr["lname"].ToString();
                        String age = dr["age"].ToString();
                        String phone = dr["phone"].ToString();
                        String salary = dr["salary"].ToString();
                        //lblOuput.Text = empId + employee+ depId;
                        txtEmployesid.Text = empId;
                        txtrefNo.Text = refNo;
                        txtFname.Text = fname;
                        txtLname.Text = lname;
                        txtAge.Text = age;
                        txtPhone.Text = phone;
                        txtSalary.Text = salary;
                    }
                }
            }
        }

    }


}