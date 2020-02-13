const //Это слово объявляет константы
b=5;
c=3;
//Здесь мы пишем функции
function Discriminant(k1:Integer;k2:Integer):Double;
begin//Начало функции
  result := sqrt(k1*k1-4*k2);
end;//Конец функции. 
begin 
  Writeln('Мы решаем квадратное уравнение: x*x+',b,'*x+'+c,'=0'); 
  Writeln('Корень из дискриминанта равен: ',Discriminant(b,c));
end. 