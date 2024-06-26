﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ZeroDowntime
{
    public partial class frmZeroDowntime : Form
    {
        public string strProcedureName = "dbo.GetRandomOrder";
        public int iRunQuery = 0;
        public int iFeatureSplitName = 0;
        public int iAudit = 0;
        public int iRename = 0;
        public int iError = 0;
        public int iProc = 0;

        public frmZeroDowntime()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            txtAudit.Text = "Off";
            txtSplit.Text = "Off";
            txtRename.Text = "Off";
            txtProc.Text = "Using Year";
            txtError.Text = iError.ToString();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            QueryOrders();
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            this.Close();
        }



        private void btnStop_Click(object sender, EventArgs e)
        {
            iRunQuery = 0;
        }
        private void QueryOrders()
        {
            string strMessage;
            string strConnstring = "Data Source=" + this.txtInstance.Text + ";Initial Catalog=" + this.txtDB.Text + "; Integrated Security = False; User ID=" + txtUser.Text + ";Password=" + txtPwd.Text;
            Random rnd = new Random();
            int num = rnd.Next();

            iRunQuery = 1;

            if (chkEncrypt.Checked)
            {
                strConnstring += "; Column Encryption Setting = Enabled";
            }

            //string strConnstring = "Data Source=" + this.txtInstance.Text + ";Initial Catalog=" + this.txtDB.Text + "; Integrated Security = True; Column Encryption Setting = Enabled";
            SqlConnection con = new SqlConnection(strConnstring);

            try
            {
                con.Open();
            }
            catch (Exception ex)
            {
                string strError = "An error occurred getting the data table: " + ex.Message + " " + strConnstring;

                //A simple catch.
                MessageBox.Show(strError);
            }
            strProcedureName = "dbo.GetRandomOrder";

            while (iRunQuery > 0)
            {
                num = rnd.Next(1, 21);
                txtRandom.Text = num.ToString();
                if (num == 20)
                {
                    strProcedureName = "dbo.SalesReport";
                }
                if (num == 19) {
                    strProcedureName = "dbo.AddNewCustomer";
                }
                if ((num >= 14) && (num <= 18))
                {
                    strProcedureName = "dbo.AddNewOrder";
                }
                if (num < 14)
                {
                    strProcedureName = "dbo.GetRandomOrder";
                }
                txtSproc.Text = strProcedureName;
                try
                    {
                    using (SqlCommand cmd = new SqlCommand(strProcedureName, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        if (strProcedureName == "dbo.SalesReport")
                        {
                            switch (iProc)
                            {
                                case 0:
                                    cmd.Parameters.Add("@year", SqlDbType.Int).Value = Convert.ToInt32(txtYear.Text);
                                    break;
                                case 1:
                                    cmd.Parameters.Add("@year", SqlDbType.Int).Value = Convert.ToInt32(txtYear.Text);
                                    cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = DBNull.Value;
                                    cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = DBNull.Value;
                                    break;
                                case 2:
                                    cmd.Parameters.Add("@year", SqlDbType.Int).Value = DBNull.Value;
                                    cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = DateTime.Parse(txtStart.Text);
                                    cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = DateTime.Parse(txtEnd.Text);
                                    break;
                                case 3:
                                    cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = DateTime.Parse(txtStart.Text);
                                    cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = DateTime.Parse(txtEnd.Text);
                                    break;
                            }
                        }
                        //SqlParameter ln = new SqlParameter("@CustomerID", SqlDbType.Int, 32);
                        //ln.Value = txtCustID.Text;
                        //cmd.Parameters.Add(ln);
                        SqlDataReader rdr = cmd.ExecuteReader();

                        // load form table
                        DataTable dataTable = new DataTable();

                        //Load the data from SqlDataReader into the data table.
                        dataTable.Load(rdr);
                        //dgvCustomers.DataSource = dataTable;


                        // add to log
                        strMessage = $"{DateTime.Now.ToString()}: ";
                        switch(strProcedureName)
                        {
                            case "dbo.GetRandomOrder":
                            
                                strMessage += "GetOrder: " + dataTable.Rows[0]["OrderID"].ToString();
                                if (iRename == 0)
                                {
                                    strMessage += " | OrderDate:" + dataTable.Rows[0]["OrderDate"] + " | Cust:";
                                }
                                else
                                {
                                    strMessage += " | OrderedByDate:" + dataTable.Rows[0]["OrderedByDate"] + " | Cust:";
                                }
                                if (iFeatureSplitName == 0)
                                {
                                    strMessage += dataTable.Rows[0]["CustomerName"];
                                }
                                else
                                {
                                    strMessage += dataTable.Rows[0]["FirstName"] + " " + dataTable.Rows[0]["LastName"];
                                }
                                if (iAudit == 1)
                                {
                                    strMessage += " | AuditDate:" + dataTable.Rows[0]["ModifiedDate"];
                                }
                                break;
                            case "dbo.AddNewCustomer":
                                strMessage += "New Cust : ";
                                if (iFeatureSplitName == 0)
                                {
                                    strMessage += dataTable.Rows[0]["CustomerName"];
                                }
                                else
                                {
                                    strMessage += dataTable.Rows[0]["FirstName"] + " " + dataTable.Rows[0]["LastName"];
                                }
                                strMessage += " | " + dataTable.Rows[0]["Addr"];
                                break;
                            case "dbo.AddNewOrder":
                                strMessage += "New Order: ";
                                strMessage += dataTable.Rows[0]["OrderID"];
                                if (iRename == 0)
                                {
                                    strMessage += " | OrderDate: " + dataTable.Rows[0]["OrderDate"];
                                }
                                else
                                {
                                    strMessage += " | OrderedByDate: " + dataTable.Rows[0]["OrderedByDate"];

                                }
                                strMessage += " |  CustID: " + dataTable.Rows[0]["CustomerID"];
                                break;
                            case "dbo.SalesReport":
                                strMessage += "Sale Count: ";
                                strMessage += dataTable.Rows[0]["SaleCount"];
                                break;
                        }

                        txtLog.AppendText(strMessage + Environment.NewLine);

                        }
                    }
                    catch (Exception ex)
                    {
                        iError += 1;
                        txtError.Text = iError.ToString();
                        txtLastError.Text = DateTime.Now.ToString();
                        string strError = "An error occurred running the proc: " + ex.Message;
                        strMessage = $"{DateTime.Now.ToString()}: Error Error Error  " + strProcedureName;
                        txtLog.AppendText(strMessage + Environment.NewLine);
                        //A simple catch.
                        //MessageBox.Show(strError);
                    }
                Application.DoEvents();
                System.Threading.Thread.Sleep(100);
            }
            con.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (iFeatureSplitName == 0)
            {
                iFeatureSplitName = 1;
                txtAudit.Text = "On";
            }
            else
            {
                iFeatureSplitName = 0;
                txtAudit.Text = "Off";
            }

        }

        private void txtRandom_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnSplitName_Click(object sender, EventArgs e)
        {
            if (iFeatureSplitName == 0)
            {
                iFeatureSplitName = 1;
                txtSplit.Text = "On";
            }
            else
            {
                iFeatureSplitName = 0;
                txtSplit.Text = "Off";
            }
        }

        private void btnAudit_Click(object sender, EventArgs e)
        {
            if (iAudit == 0)
            {
                iAudit = 1;
                txtAudit.Text = "On";
            }
            else
            {
                iAudit = 0;
                txtAudit.Text = "Off";
            }

        }

        private void btnRename_Click(object sender, EventArgs e)
        {
            if (iRename == 0)
            {
                iRename = 1;
                txtRename.Text = "On";
            }
            else
            {
                iRename = 0;
                txtRename.Text = "Off";
            }

        }

        private void btnClearError_Click_1(object sender, EventArgs e)
        {
            iError = 0;
            txtLastError.Text = "";
            txtError.Text = iError.ToString();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            switch(iProc)
            {
                case 0:
                    iProc = 1;
                    txtProc.Text = "Prefer Year";
                    break;
                case 1:
                    iProc = 2;
                    txtProc.Text = "Prefer Date";
                    break;
                case 2:
                    iProc = 3;
                    txtProc.Text = "Using Date only";
                    break;
                case 3:
                    iProc = 0;
                    txtProc.Text = "Using Year only";
                    break;
            }
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}
