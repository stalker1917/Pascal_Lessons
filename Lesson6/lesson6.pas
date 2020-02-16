uses GraphABC;
const
Width = 1024;
Height = 768;
a=1;
b=2;
c=-3;
Scale=20; //20 точек - это единица. 

var  //Здесь объявляются переменные
x1,y1:Double;
i,j:Integer;
//----Здесь идёт математика ,она незименна при любом графическом движке
function Square(x:double):Double;
begin
   result := a*x*x+b*x+c; 
end;
//Здесь идут функции зависящие от нашего графического движка
function PixelsToX(Pixels:Integer):Double;
  begin
    result := (Pixels - (Width div 2) + 1)/Scale;
  end;
function YToPixels(y:Double):Integer;
  begin
    result := Height div 2 -1 - Round(y*Scale);   //Потому что пикселы идут вниз! 
  end;  
begin
  SetWindowWidth(Width); //Установить ширину окна
  SetWindowHeight(Height); //Установить высоту окна
  MoveTo(Width div 2 -1, 0); //Установить позицию кисти
  LineTo(Width div 2 -1, Height-1); //Начертить линию
  MoveTo(0,Height div 2 -1);
  LineTo(Width-1, Height div 2 -1);
  SetPenColor(clRed);
  for i := 0 to Width-1 do
    begin
      x1 := PixelsToX(i);
      y1 := Square(x1);
      j := YToPixels(y1);
      if i=0 then MoveTo(i,j)
             else LineTo(i,j);
    end;
end. 