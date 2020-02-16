const //Это слово объявляет константы
b1=2;
c1=1;
b2=5;
c2=2;
var  //Здесь объявляются переменные
Discriminant_result : Integer;
Sqrt_Discriminant : Double;
function Solve(b:Integer;d:Double;Number:Integer):Double;
begin
  if Number = 0 then result := (b-d)/2
                else result := (b+d)/2;  
end;
function Discriminant(b:Integer;c:Integer):Integer;
begin//Начало функции
  result := b*b-4*c;
end;//Конец функции. 
begin 
  Writeln('Мы решаем квадратное уравнение: x*x+',b1,'*x+'+c1,'=0');
  Discriminant_result := Discriminant(b1,c1);
  if Discriminant_result>=0 then 
    begin
      Sqrt_Discriminant   := Sqrt(Discriminant_result);
      Writeln('Корень из дискриминанта равен: ',Sqrt_Discriminant);
      if Discriminant_result=0 then Writeln('Решение уравнения: x=',Solve(b1,Discriminant_result,0));     
    end  
  else Writeln('Дискриминант отрицателен! Решений уравнения нет!'); 
end. 