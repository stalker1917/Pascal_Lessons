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
//const Milord='Милорд, ';
begin
  
  textBox1.AppendText(Milord+'у нас есть '+IntToStr(Money)+' таллеров!'+ #13#10);
  ProgressBar1.Value := ProgressBar1.Value+1;
  if Milord<>'Милорд, ' then 
    begin
      textBox1.AppendText('Ошибка! К вам обращаются "'+Milord+'" ,а надо:"Милорд, "' + #13#10);
      exit;
    end;
  ProgressBar1.Value := ProgressBar1.Value+1;  
  textBox1.AppendText(Milord+We_Have+IntToStr(oil)+Oil_S+#13#10);
  if We_Have<>'у нас есть ' then 
    begin
      textBox1.AppendText('Ошибка! Надо что-то написать после "Милорд, "'+ #13#10);
      exit;
    end;
  textBox1.AppendText(Milord+We_Have+IntToStr(Lumber)+' тонн'+Lumber_S+#13#10);  
  if (Length(Lumber_S)<2) or (Lumber_S[1]<>' ') or (Lumber_S[2]<>'д') then 
     begin
      textBox1.AppendText('Ошибка! Надо написать название товара!'+ #13#10);
      exit;
    end;  
  ProgressBar1.Value := ProgressBar1.Value+1; 
  textBox1.AppendText(Milord+We_Have+IntToStr(Solid)+' тонн твёрдого сырья!'+#13#10);
  if Solid<>(Lumber + Iron) then 
    begin
      textBox1.AppendText('Ошибка! Надо сложить Lumber и Iron'+ #13#10);
      exit;
    end;
  ProgressBar1.Value := ProgressBar1.Value+1;
  textBox1.AppendText(Milord+'стоимость добытой нами нефти составляет '+IntToStr(Oil_Value)+' таллеров!'+#13#10);
  if Oil_Value<>(Oil_Cost*Oil) then 
    begin
      textBox1.AppendText('Ошибка! Надо умножит Oil_Cost и Oil'+ #13#10);
      exit;
    end;
  ProgressBar1.Value := ProgressBar1.Value+1; 
  textBox1.AppendText(Milord_We_Have+IntToStr(Iron)+' тонн железа!'+#13#10);
  if Milord_We_Have<>(Milord+We_Have) then
    begin
      textBox1.AppendText('Ошибка! Надо сложить строки!'+ #13#10);
      exit;
    end;
  ProgressBar1.Value := ProgressBar1.Value+1;
  textBox1.AppendText('Поздравляем! Урок успешно завершён');
end;

end.
