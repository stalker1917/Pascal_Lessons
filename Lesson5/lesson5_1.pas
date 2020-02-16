var  //Здесь объявляются переменные
b_arr : array of Integer =(2,6,1);
c_arr : array of Integer =(1,2,3);
Discriminant_result : Integer;
Sqrt_Discriminant : Double;
i:Integer;
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
  for i:=0 to 2 do
    begin
      Writeln('Мы решаем квадратное уравнение: x*x+',b_arr[i],'*x+'+c_arr[i],'=0');
      Discriminant_result := Discriminant(b_arr[i],c_arr[i]);
      if Discriminant_result>=0 then 
        begin
          Sqrt_Discriminant   := Sqrt(Discriminant_result);
          Writeln('Корень из дискриминанта равен: ',Sqrt_Discriminant);
          if Discriminant_result=0 then Writeln('Решение уравнения: x=',Solve(b_arr[i],Discriminant_result,0));     
        end  
      else Writeln('Дискриминант отрицателен! Решений уравнения нет!'); 
    end;
end. 