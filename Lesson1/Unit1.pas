Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms,Finance;

type
  Form1 = class(Form)
    procedure Form1_Load(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    progressBar1: ProgressBar;
    textBox1: TextBox;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation

procedure Form1.Form1_Load(sender: Object; e: EventArgs);
const Milord='Милорд, ';
begin
  textBox1.AppendText(Milord+'у нас есть'+IntToStr(Money)+' таллеров!'+ #13#10);//Lines.A
  //textBox1.Lines.
  ProgressBar1.Value := ProgressBar1.Value+1;
  if Oil=200 then 
    begin
      textBox1.AppendText(Milord+'у нас ровно '+IntToStr(oil)+' бочек нефти!'+ #13#10);
      ProgressBar1.Value := ProgressBar1.Value+1;
      if Lumber>400 then
        if Lumber<1000 then   
          begin
            textBox1.AppendText(Milord+'у нас нормальное количество древесины!');
            ProgressBar1.Value := ProgressBar1.Value+1;
          end
        else textBox1.AppendText(Milord+'у нас слишком много древесины!')  
      else textBox1.AppendText(Milord+'у нас слишком мало древесины!');   
    end
  else textBox1.AppendText(Milord+'у нас '+IntToStr(oil)+' бочек нефти, а надо 200!');  
end;

end.
