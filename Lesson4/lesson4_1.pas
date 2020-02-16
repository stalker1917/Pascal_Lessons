const //Это слово объявляет константы
b=2;
c=1;
//Здесь мы пишем функции
function Discriminant(k1:Integer;k2:Integer):Integer;
begin//Начало функции
  result := k1*k1-4*k2;
end;//Конец функции. 
begin 
  Writeln('Мы решаем квадратное уравнение: x*x+',b,'*x+'+c,'=0'); 
  if Discriminant(b,c)>=0 then 
    begin
      Writeln('Корень из дискриминанта равен: ',sqrt(Discriminant(b,c)));
      if Discriminant(b,c)=0 then Writeln('Решение уравнения:');     
    end  
  else Writeln('Дискриминант отрицателен! Решений уравнения нет!'); 
end. 