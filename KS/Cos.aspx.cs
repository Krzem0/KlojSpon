using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ExecuteButton_Click(object sender, EventArgs e)
    {
        try
        {
            // create the ProcessStartInfo using "cmd" as the program to be run,
            // and "/c " as the parameters.
            // Incidentally, /c tells cmd that we want it to execute the command that follows,
            // and then exit.
            System.Diagnostics.ProcessStartInfo procStartInfo =
                new System.Diagnostics.ProcessStartInfo("cmd", "dir");

            // The following commands are needed to redirect the standard output.
            // This means that it will be redirected to the Process.StandardOutput StreamReader.
            procStartInfo.RedirectStandardOutput = true;
            procStartInfo.UseShellExecute = false;
            // Do not create the black window.
            procStartInfo.CreateNoWindow = true;
            // Now we create a process, assign its ProcessStartInfo and start it
            System.Diagnostics.Process proc = new System.Diagnostics.Process();
            proc.StartInfo = procStartInfo;
            proc.Start();
            // Get the output into a string
            string result = proc.StandardOutput.ReadToEnd();
            // Display the command output.
            ExecuteLabel.Text = result;
        }
        catch (Exception objException)
        {
            ExecuteLabel.Text = "Nastąpił wyjątek: " + objException.Message;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Testowa test = new Testowa(){Tekst = TextBox1.Text};
        DataClassesDataContext db = new DataClassesDataContext();
        db.Testowas.InsertOnSubmit(test);
        db.SubmitChanges();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        Testowa test = db.Testowas.First();
        if (test!=null)
        {
            TestowyLabel.Text = test.Tekst;

            using (StreamWriter streamWriter = new StreamWriter(Server.MapPath(@"Test.cs")))
            {
                streamWriter.Write(test.Tekst);
            }
        }
    }
}