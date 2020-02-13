procedure InitializeComponent;
    begin
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.progressBar1 := new System.Windows.Forms.ProgressBar();
        self.SuspendLayout();
        // 
        // textBox1
        // 
        self.textBox1.Location := new System.Drawing.Point(12, 12);
        self.textBox1.Multiline := true;
        self.textBox1.Name := 'textBox1';
        self.textBox1.Size := new System.Drawing.Size(333, 230);
        self.textBox1.TabIndex := 0;
        // 
        // progressBar1
        // 
        self.progressBar1.Location := new System.Drawing.Point(12, 264);
        self.progressBar1.Maximum := 6;
        self.progressBar1.Name := 'progressBar1';
        self.progressBar1.Size := new System.Drawing.Size(333, 18);
        self.progressBar1.TabIndex := 1;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(357, 298);
        self.Controls.Add(self.progressBar1);
        self.Controls.Add(self.textBox1);
        self.Name := 'Form1';
        self.Text := 'Тест урока 2';
        self.Load += Form1_Load;
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
