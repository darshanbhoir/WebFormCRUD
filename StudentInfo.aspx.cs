using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormCRUD
{
    public partial class StudentInfo : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;

        public void DataLoad()
        {
            if(Page.IsPostBack)
            {
                GridViewStudent.DataBind();
            }
        }
        public void ClearAllData()
        {
            TextName.Text = "";
            TextEmail.Text = "";
            DOB.Text = DateTime.Today.Date.ToString();
            Gender.SelectedValue = Gender.Items[0].ToString();
            CheckBoxAgree.Checked= false;
            LabelMessage.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            StudID.Text = GridViewStudent.SelectedRow.Cells[1].Text; 
            TextName.Text = GridViewStudent.SelectedRow.Cells[2].Text;
            TextEmail.Text = GridViewStudent.SelectedRow.Cells[3].Text;
            Gender.Text= GridViewStudent.SelectedRow.Cells[4].Text;
            DOB.Text= GridViewStudent.SelectedRow.Cells[5].Text;
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if(TextName.Text != "" && TextEmail.Text != "" && CheckBoxAgree.Checked)
            {
                using(con=new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("INSERT INTO Student (Student_Name, Student_email, Student_Gender, Student_BirthDate) VALUES (@Student_Name, @Student_email, @Student_Gender, @Student_BirthDate)", con);

                    cmd.Parameters.AddWithValue("@Student_Name",TextName.Text);
                    cmd.Parameters.AddWithValue("@Student_email", TextEmail.Text);
                    cmd.Parameters.AddWithValue("@Student_Gender", Gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Student_BirthDate", DOB.Text);
                    cmd.ExecuteNonQuery();

                    DataLoad();
                    ClearAllData();
                }
            }
            else
            {
                LabelMessage.Text = "Fill All Details";
            }
        }
        

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (TextName.Text != "" && TextEmail.Text != "" && CheckBoxAgree.Checked)
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE Student SET Student_Name=@Student_Name, Student_email=@Student_email, Student_Gender=@Student_Gender, Student_BirthDate=@Student_BirthDate WHERE Student_Id=@Student_Id", con);

                    cmd.Parameters.AddWithValue("@Student_Name", TextName.Text);
                    cmd.Parameters.AddWithValue("@Student_email", TextEmail.Text);
                    cmd.Parameters.AddWithValue("@Student_Gender", Gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Student_BirthDate", DOB.Text);
                    cmd.Parameters.AddWithValue("@Student_Id", StudID.Text);
                    cmd.ExecuteNonQuery();

                    DataLoad();
                    ClearAllData();
                }
            }
            else
            {
                LabelMessage.Text = "Fill All Details";
            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("DELETE FROM Student WHERE Student_Id=@Student_Id", con);

                cmd.Parameters.AddWithValue("@Student_Id", StudID.Text);

                cmd.ExecuteNonQuery();

                DataLoad();
                ClearAllData();
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            ClearAllData();
        }
    }
}