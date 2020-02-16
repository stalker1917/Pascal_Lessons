uses GraphABC;
type 
TBatte_Circle = record
  Format : Integer; // Первый,второй или третий размер. 
  Vx : Double; 
  Vy : Integer; // -1 или 1
  X  : Double; 
  Y  : Double; 
end;

const
Width = 1024;
Height = 768;
Scale=1.0; //20 точек - это единица. 
Ground = 600;//Координаты пола
MaxX = 1024;
Length_Enemies = 2;
VelocityScale = 3;
VelocityGamer = 1;

var  //Здесь объявляются переменные
Velocity : array of Integer = (1,2,3,10,0);  //Три вида врагов,пуля,игрок
Size     : array of Integer = (60,40,20,5,20);
AEnemy : array of TBatte_Circle;
Gamer  : TBatte_Circle;
Bullet : TBatte_Circle;
KeyBuf : Integer;
i      : Integer;

//----Здесь идёт математика ,она незименна при любом графическом движке


function Intersect(Circle1,Circle2:TBatte_Circle) : Boolean;
Var Long1,Long2 : Double;
begin
  Long1 := Size[Circle1.Format]+Size[Circle2.Format]; //Cумма радиусов
  Long2 := sqrt(sqr(Circle1.X-Circle2.X)+sqr(Circle1.Y-Circle2.Y)); //Расстояние по теореме пифагора.
  if Long2<Long1 then result := true
                 else result := false;
end;


procedure NextXY(var Batte_Circle:TBatte_Circle);
begin
  Batte_Circle.X :=  Batte_Circle.X + Batte_Circle.VX*VelocityScale;
  Batte_Circle.Y :=  Batte_Circle.Y + Batte_Circle.VY*Velocity[Batte_Circle.Format]*VelocityScale;
  if Batte_Circle.X-Size[Batte_Circle.Format]<=0 then Batte_Circle.VX := abs(Batte_Circle.VX); //Делаем положительную
  if Batte_Circle.Y-Size[Batte_Circle.Format]<=0 then Batte_Circle.VY := 1;
  if Batte_Circle.X+Size[Batte_Circle.Format]>=MaxX then Batte_Circle.VX := -abs(Batte_Circle.VX); //Делаем отрицательную
  if Batte_Circle.Y+Size[Batte_Circle.Format]>=Ground then Batte_Circle.VY := -1;
  if (Batte_Circle.Format=3) and (Batte_Circle.VY=-1) then Batte_Circle.Format:=0; // Если снаряд улетел,удаляем его. 
end;

procedure KeyPress(key:integer);
begin
  KeyBuf := Key;
  if (Key = Vk_Right) and (Round(Gamer.X)<MaxX) then Gamer.X:=Gamer.X+VelocityGamer; 
  if (Key = Vk_Left) and (Gamer.X>0) then Gamer.X:=Gamer.X-VelocityGamer; 
  if (Key = VK_SPACE) and (Bullet.Format=0) then
    begin
      Bullet.Format := 3;
      Bullet.X := Gamer.X;
      Bullet.Y := Gamer.Y+Size[4]*2;
      Bullet.VY := 1;
      Bullet.VX := 0;
    end;
end;

//Здесь идут функции зависящие от нашего графического движка
function XToPixels(x:Double):Integer;
  begin
    result := Round(x*Scale);
  end;
function YToPixels(y:Double):Integer;
  begin
    result := Ground - Round(y*Scale);   //Потому что пикселы идут вниз! 
  end; 

procedure  DrawCircle(Enemy:TBatte_Circle);
begin
  if Enemy.format=0 then exit;
  SetBrushColor(clGreen);
  if Enemy.format>2 then  SetBrushColor(clBlue);
  if Enemy.format>3 then  SetBrushColor(clRed);
  FillCircle(XToPixels(Enemy.X),YToPixels(Enemy.Y),Size[Enemy.Format]);
end;  

procedure OutText(s:String);
begin
  TextOut(100,Ground+40,s); 
end;

procedure DrawGround;
begin
   ClearWindow();
   SetPenColor(clBlack);
   SetBrushColor(clWhite);
   MoveTo(0,Ground);
   LineTo(Width-1,Ground); 
end;

procedure InitWindow;
begin
  SetWindowWidth(Width); //Установить ширину окна
  SetWindowHeight(Height); //Установить высоту окна
end;
 
begin
  InitWindow;
  SetLength(AEnemy,Length_Enemies); //Максимально 2 шара.
    for i := 0 to Length_Enemies-1 do
      begin
        AEnemy[i].Format := 0;
        AEnemy[i].X := Size[AEnemy[i].Format]+Random(Width-2*Size[AEnemy[i].Format]);
        AEnemy[i].Y := Size[AEnemy[i].Format]+Random(Ground-2*Size[AEnemy[i].Format]);
        AEnemy[i].Vx := (Random-0.5)*Velocity[1];
        AEnemy[i].Vy := -1;
      end;
  Gamer.Format := 4; //Игрок
  Gamer.Y := Size[4];
  Gamer.X := MaxX/2;
  AEnemy[0].Format := 1;
  repeat
    DrawGround;
    OutText('Убито 0 врагов');
    onkeydown:= KeyPress;
    for i:=0 to Length_Enemies-1 do 
      begin
        DrawCircle(AEnemy[i]);         
        NextXY(AEnemy[i]); 
        if (AEnemy[i].Format>0) and (Bullet.Format>0) and (Intersect(AEnemy[i],Bullet)) then
          begin
            Bullet.Format := 0;
            inc(AEnemy[i].Format);
            AEnemy[i+1]:=AEnemy[i];
            AEnemy[i].X := AEnemy[i].X - 2*Size[AEnemy[i].Format];
            AEnemy[i].Vx := -(Random)*Velocity[AEnemy[i].Format]/1.5;
            AEnemy[i+1].Vx := - AEnemy[i].Vx; 
          end;
      end;
    DrawCircle(Gamer);
    DrawCircle(Bullet);
    NextXY(Bullet);
    sleep(100);
 
  //Key := ReadKey;
  until (Keybuf =27);
end. 