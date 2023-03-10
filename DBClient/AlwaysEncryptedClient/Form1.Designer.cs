namespace ZeroDowntime
{
    partial class frmZeroDowntime
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtInstance = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtDB = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtUser = new System.Windows.Forms.TextBox();
            this.txtPwd = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.chkEncrypt = new System.Windows.Forms.CheckBox();
            this.lblConnect = new System.Windows.Forms.Label();
            this.btnSearch = new System.Windows.Forms.Button();
            this.btnQuit = new System.Windows.Forms.Button();
            this.txtLog = new System.Windows.Forms.TextBox();
            this.btnStop = new System.Windows.Forms.Button();
            this.btnSplitName = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.txtRandom = new System.Windows.Forms.TextBox();
            this.txtSplit = new System.Windows.Forms.TextBox();
            this.lblRandom = new System.Windows.Forms.Label();
            this.lblSproc = new System.Windows.Forms.Label();
            this.txtSproc = new System.Windows.Forms.TextBox();
            this.grpAppState = new System.Windows.Forms.GroupBox();
            this.lblLastError = new System.Windows.Forms.Label();
            this.txtLastError = new System.Windows.Forms.TextBox();
            this.lblError = new System.Windows.Forms.Label();
            this.txtError = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.btnAudit = new System.Windows.Forms.Button();
            this.txtAudit = new System.Windows.Forms.TextBox();
            this.btnRename = new System.Windows.Forms.Button();
            this.txtRename = new System.Windows.Forms.TextBox();
            this.btnClearError = new System.Windows.Forms.Button();
            this.btnProc = new System.Windows.Forms.Button();
            this.txtProc = new System.Windows.Forms.TextBox();
            this.txtYear = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtStart = new System.Windows.Forms.TextBox();
            this.txtEnd = new System.Windows.Forms.TextBox();
            this.groupBox1.SuspendLayout();
            this.grpAppState.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtInstance
            // 
            this.txtInstance.Location = new System.Drawing.Point(81, 19);
            this.txtInstance.Name = "txtInstance";
            this.txtInstance.Size = new System.Drawing.Size(121, 20);
            this.txtInstance.TabIndex = 80;
            this.txtInstance.Text = ".\\SQL2022";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(17, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 13);
            this.label1.TabIndex = 88;
            this.label1.Text = "Instance";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 54);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 200;
            this.label2.Text = "Database";
            // 
            // txtDB
            // 
            this.txtDB.Location = new System.Drawing.Point(81, 51);
            this.txtDB.Name = "txtDB";
            this.txtDB.Size = new System.Drawing.Size(121, 20);
            this.txtDB.TabIndex = 300;
            this.txtDB.Text = "ZeroDowntime";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(17, 83);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 13);
            this.label3.TabIndex = 400;
            this.label3.Text = "User";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(17, 112);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 13);
            this.label4.TabIndex = 500;
            this.label4.Text = "Password";
            // 
            // txtUser
            // 
            this.txtUser.Location = new System.Drawing.Point(81, 83);
            this.txtUser.Name = "txtUser";
            this.txtUser.Size = new System.Drawing.Size(121, 20);
            this.txtUser.TabIndex = 600;
            this.txtUser.Text = "ClientUser";
            // 
            // txtPwd
            // 
            this.txtPwd.Location = new System.Drawing.Point(81, 112);
            this.txtPwd.Name = "txtPwd";
            this.txtPwd.PasswordChar = '*';
            this.txtPwd.Size = new System.Drawing.Size(121, 20);
            this.txtPwd.TabIndex = 700;
            this.txtPwd.Text = "Demo12#4";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.chkEncrypt);
            this.groupBox1.Controls.Add(this.lblConnect);
            this.groupBox1.Controls.Add(this.txtInstance);
            this.groupBox1.Controls.Add(this.txtPwd);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtUser);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txtDB);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Location = new System.Drawing.Point(796, 19);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(220, 166);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Authentication";
            // 
            // chkEncrypt
            // 
            this.chkEncrypt.AutoSize = true;
            this.chkEncrypt.Checked = true;
            this.chkEncrypt.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkEncrypt.Location = new System.Drawing.Point(81, 140);
            this.chkEncrypt.Name = "chkEncrypt";
            this.chkEncrypt.Size = new System.Drawing.Size(74, 17);
            this.chkEncrypt.TabIndex = 1000;
            this.chkEncrypt.Text = "Encrypted";
            this.chkEncrypt.UseVisualStyleBackColor = true;
            // 
            // lblConnect
            // 
            this.lblConnect.AutoSize = true;
            this.lblConnect.Location = new System.Drawing.Point(11, 140);
            this.lblConnect.Name = "lblConnect";
            this.lblConnect.Size = new System.Drawing.Size(0, 13);
            this.lblConnect.TabIndex = 9;
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(19, 15);
            this.btnSearch.Margin = new System.Windows.Forms.Padding(2);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(122, 26);
            this.btnSearch.TabIndex = 110;
            this.btnSearch.Text = "Start";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // btnQuit
            // 
            this.btnQuit.Location = new System.Drawing.Point(309, 15);
            this.btnQuit.Margin = new System.Windows.Forms.Padding(2);
            this.btnQuit.Name = "btnQuit";
            this.btnQuit.Size = new System.Drawing.Size(119, 23);
            this.btnQuit.TabIndex = 13;
            this.btnQuit.Text = "Quit";
            this.btnQuit.UseVisualStyleBackColor = true;
            this.btnQuit.Click += new System.EventHandler(this.btnQuit_Click);
            // 
            // txtLog
            // 
            this.txtLog.Location = new System.Drawing.Point(15, 196);
            this.txtLog.Multiline = true;
            this.txtLog.Name = "txtLog";
            this.txtLog.Size = new System.Drawing.Size(997, 432);
            this.txtLog.TabIndex = 161;
            // 
            // btnStop
            // 
            this.btnStop.Location = new System.Drawing.Point(175, 15);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(115, 26);
            this.btnStop.TabIndex = 162;
            this.btnStop.Text = "Stop";
            this.btnStop.UseVisualStyleBackColor = true;
            this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
            // 
            // btnSplitName
            // 
            this.btnSplitName.Location = new System.Drawing.Point(327, 67);
            this.btnSplitName.Name = "btnSplitName";
            this.btnSplitName.Size = new System.Drawing.Size(115, 26);
            this.btnSplitName.TabIndex = 163;
            this.btnSplitName.Text = "Split Name";
            this.btnSplitName.UseVisualStyleBackColor = true;
            this.btnSplitName.Click += new System.EventHandler(this.btnSplitName_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(449, 22);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(84, 13);
            this.label5.TabIndex = 164;
            this.label5.Text = "Feature Toggles";
            // 
            // txtRandom
            // 
            this.txtRandom.Location = new System.Drawing.Point(124, 25);
            this.txtRandom.Name = "txtRandom";
            this.txtRandom.Size = new System.Drawing.Size(147, 20);
            this.txtRandom.TabIndex = 165;
            // 
            // txtSplit
            // 
            this.txtSplit.Location = new System.Drawing.Point(452, 72);
            this.txtSplit.Name = "txtSplit";
            this.txtSplit.Size = new System.Drawing.Size(64, 20);
            this.txtSplit.TabIndex = 166;
            // 
            // lblRandom
            // 
            this.lblRandom.AutoSize = true;
            this.lblRandom.Location = new System.Drawing.Point(6, 28);
            this.lblRandom.Name = "lblRandom";
            this.lblRandom.Size = new System.Drawing.Size(87, 13);
            this.lblRandom.TabIndex = 167;
            this.lblRandom.Text = "Random Number";
            // 
            // lblSproc
            // 
            this.lblSproc.AutoSize = true;
            this.lblSproc.Location = new System.Drawing.Point(6, 57);
            this.lblSproc.Name = "lblSproc";
            this.lblSproc.Size = new System.Drawing.Size(90, 13);
            this.lblSproc.TabIndex = 169;
            this.lblSproc.Text = "Stored Procedure";
            // 
            // txtSproc
            // 
            this.txtSproc.Location = new System.Drawing.Point(124, 54);
            this.txtSproc.Name = "txtSproc";
            this.txtSproc.Size = new System.Drawing.Size(147, 20);
            this.txtSproc.TabIndex = 168;
            // 
            // grpAppState
            // 
            this.grpAppState.Controls.Add(this.lblLastError);
            this.grpAppState.Controls.Add(this.txtLastError);
            this.grpAppState.Controls.Add(this.lblError);
            this.grpAppState.Controls.Add(this.txtError);
            this.grpAppState.Controls.Add(this.label7);
            this.grpAppState.Controls.Add(this.lblSproc);
            this.grpAppState.Controls.Add(this.txtRandom);
            this.grpAppState.Controls.Add(this.txtSproc);
            this.grpAppState.Controls.Add(this.lblRandom);
            this.grpAppState.Location = new System.Drawing.Point(19, 57);
            this.grpAppState.Margin = new System.Windows.Forms.Padding(2);
            this.grpAppState.Name = "grpAppState";
            this.grpAppState.Size = new System.Drawing.Size(291, 128);
            this.grpAppState.TabIndex = 1001;
            this.grpAppState.TabStop = false;
            this.grpAppState.Text = "App State";
            // 
            // lblLastError
            // 
            this.lblLastError.AutoSize = true;
            this.lblLastError.Location = new System.Drawing.Point(11, 108);
            this.lblLastError.Name = "lblLastError";
            this.lblLastError.Size = new System.Drawing.Size(52, 13);
            this.lblLastError.TabIndex = 173;
            this.lblLastError.Text = "Last Error";
            // 
            // txtLastError
            // 
            this.txtLastError.Location = new System.Drawing.Point(124, 108);
            this.txtLastError.Name = "txtLastError";
            this.txtLastError.Size = new System.Drawing.Size(147, 20);
            this.txtLastError.TabIndex = 172;
            // 
            // lblError
            // 
            this.lblError.AutoSize = true;
            this.lblError.Location = new System.Drawing.Point(11, 85);
            this.lblError.Name = "lblError";
            this.lblError.Size = new System.Drawing.Size(34, 13);
            this.lblError.TabIndex = 171;
            this.lblError.Text = "Errors";
            // 
            // txtError
            // 
            this.txtError.Location = new System.Drawing.Point(124, 82);
            this.txtError.Name = "txtError";
            this.txtError.Size = new System.Drawing.Size(147, 20);
            this.txtError.TabIndex = 170;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(11, 140);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(0, 13);
            this.label7.TabIndex = 9;
            // 
            // btnAudit
            // 
            this.btnAudit.Location = new System.Drawing.Point(327, 98);
            this.btnAudit.Name = "btnAudit";
            this.btnAudit.Size = new System.Drawing.Size(115, 26);
            this.btnAudit.TabIndex = 1002;
            this.btnAudit.Text = "Add Not Null Column";
            this.btnAudit.UseVisualStyleBackColor = true;
            this.btnAudit.Click += new System.EventHandler(this.btnAudit_Click);
            // 
            // txtAudit
            // 
            this.txtAudit.Location = new System.Drawing.Point(452, 104);
            this.txtAudit.Name = "txtAudit";
            this.txtAudit.Size = new System.Drawing.Size(64, 20);
            this.txtAudit.TabIndex = 1003;
            // 
            // btnRename
            // 
            this.btnRename.Location = new System.Drawing.Point(327, 131);
            this.btnRename.Name = "btnRename";
            this.btnRename.Size = new System.Drawing.Size(115, 26);
            this.btnRename.TabIndex = 1004;
            this.btnRename.Text = "Rename";
            this.btnRename.UseVisualStyleBackColor = true;
            this.btnRename.Click += new System.EventHandler(this.btnRename_Click);
            // 
            // txtRename
            // 
            this.txtRename.Location = new System.Drawing.Point(452, 135);
            this.txtRename.Name = "txtRename";
            this.txtRename.Size = new System.Drawing.Size(64, 20);
            this.txtRename.TabIndex = 1005;
            // 
            // btnClearError
            // 
            this.btnClearError.Location = new System.Drawing.Point(567, 66);
            this.btnClearError.Name = "btnClearError";
            this.btnClearError.Size = new System.Drawing.Size(115, 26);
            this.btnClearError.TabIndex = 1006;
            this.btnClearError.Text = "Clear Errors";
            this.btnClearError.UseVisualStyleBackColor = true;
            this.btnClearError.Click += new System.EventHandler(this.btnClearError_Click_1);
            // 
            // btnProc
            // 
            this.btnProc.Location = new System.Drawing.Point(327, 163);
            this.btnProc.Name = "btnProc";
            this.btnProc.Size = new System.Drawing.Size(115, 26);
            this.btnProc.TabIndex = 1007;
            this.btnProc.Text = "Proc";
            this.btnProc.UseVisualStyleBackColor = true;
            this.btnProc.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // txtProc
            // 
            this.txtProc.Location = new System.Drawing.Point(452, 167);
            this.txtProc.Name = "txtProc";
            this.txtProc.Size = new System.Drawing.Size(101, 20);
            this.txtProc.TabIndex = 1008;
            this.txtProc.Text = "Using Year";
            // 
            // txtYear
            // 
            this.txtYear.Location = new System.Drawing.Point(688, 107);
            this.txtYear.Name = "txtYear";
            this.txtYear.Size = new System.Drawing.Size(72, 20);
            this.txtYear.TabIndex = 1009;
            this.txtYear.Text = "2023";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(620, 111);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(62, 13);
            this.label6.TabIndex = 174;
            this.label6.Text = "Year Param";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(622, 135);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(52, 13);
            this.label8.TabIndex = 1010;
            this.label8.Text = "StartDate";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(622, 159);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(49, 13);
            this.label9.TabIndex = 1011;
            this.label9.Text = "EndDate";
            // 
            // txtStart
            // 
            this.txtStart.Location = new System.Drawing.Point(688, 133);
            this.txtStart.Name = "txtStart";
            this.txtStart.Size = new System.Drawing.Size(72, 20);
            this.txtStart.TabIndex = 1012;
            this.txtStart.Text = "1996/01/01";
            // 
            // txtEnd
            // 
            this.txtEnd.Location = new System.Drawing.Point(688, 159);
            this.txtEnd.Name = "txtEnd";
            this.txtEnd.Size = new System.Drawing.Size(72, 20);
            this.txtEnd.TabIndex = 1013;
            this.txtEnd.Text = "1997/01/01";
            // 
            // frmZeroDowntime
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1025, 640);
            this.Controls.Add(this.txtEnd);
            this.Controls.Add(this.txtStart);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtYear);
            this.Controls.Add(this.txtProc);
            this.Controls.Add(this.btnProc);
            this.Controls.Add(this.btnClearError);
            this.Controls.Add(this.txtRename);
            this.Controls.Add(this.btnRename);
            this.Controls.Add(this.txtAudit);
            this.Controls.Add(this.btnAudit);
            this.Controls.Add(this.grpAppState);
            this.Controls.Add(this.txtSplit);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnSplitName);
            this.Controls.Add(this.btnStop);
            this.Controls.Add(this.txtLog);
            this.Controls.Add(this.btnQuit);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmZeroDowntime";
            this.Text = "ZeroDowntimeClient";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.grpAppState.ResumeLayout(false);
            this.grpAppState.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtInstance;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtDB;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtUser;
        private System.Windows.Forms.TextBox txtPwd;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label lblConnect;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Button btnQuit;
        private System.Windows.Forms.CheckBox chkEncrypt;
        private System.Windows.Forms.TextBox txtLog;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.Button btnSplitName;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtRandom;
        private System.Windows.Forms.TextBox txtSplit;
        private System.Windows.Forms.Label lblRandom;
        private System.Windows.Forms.Label lblSproc;
        private System.Windows.Forms.TextBox txtSproc;
        private System.Windows.Forms.GroupBox grpAppState;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnAudit;
        private System.Windows.Forms.TextBox txtAudit;
        private System.Windows.Forms.Button btnRename;
        private System.Windows.Forms.TextBox txtRename;
        private System.Windows.Forms.TextBox txtError;
        private System.Windows.Forms.Label lblError;
        private System.Windows.Forms.Label lblLastError;
        private System.Windows.Forms.TextBox txtLastError;
        private System.Windows.Forms.Button btnClearError;
        private System.Windows.Forms.Button btnProc;
        private System.Windows.Forms.TextBox txtProc;
        private System.Windows.Forms.TextBox txtYear;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtStart;
        private System.Windows.Forms.TextBox txtEnd;
    }
}

