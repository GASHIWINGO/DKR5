uses CRT;uses System;const N=10;type a = array [1..N] of integer;
var inf,outf:file of integer;

  procedure SellectionSort(var a:a;min,max,ch:integer);
    begin
    var i, j, best_value, best_j: longint;
    for i:=min to max do begin
      best_value:=a[i];
      best_j:=i;
      for j:=i+1 to max do begin
        if ch=1 then begin
          if a[j]>best_value then begin
            best_value:=a[j];
            best_j:=j;
        end;end
        else if ch=2 then begin
          if a[j]<best_value then begin
            best_value:=a[j];
            best_j:=j;
        end;end;
      end;
      a[best_j]:=a[i];
      a[i]:=best_value;
    end;TextColor(blue);
    for var g:=1 to high(a) do print(a[g]);
    end;
    
    procedure sort(var a:a; m, l,k: Integer);
      begin
          var i,j,x,tmp:integer;  
          i := m; 
          j := l; 
          x := a[(m+l) div 2]; 
          if k=1 then begin
            repeat 
              while a[i] > x Do Inc(i); 
              while a[j] < x Do Dec(j); 
              if i <= j then begin 
                  tmp := a[i]; 
                  a[i] := a[j];
                  a[j] := tmp; 
                  Inc(i);
                  Dec(j) 
              end 
          until i > j; 
          end
          else begin
            repeat 
              while a[i] < x Do Inc(i); 
              while a[j] > x Do Dec(j); 
              if i <= j then begin 
                  tmp := a[i]; 
                  a[i] := a[j];
                  a[j] := tmp; 
                  Inc(i);
                  Dec(j) 
              end 
          until i > j; 
          end;
          if m < j then 
              sort(a, m, j,k); 
          if i < l then 
              sort(a, i, l,k) 
      end;
    procedure QuickSort(var a:a;k:integer); 
      begin 
          sort(a,1,n,k) 
      end;
    
begin
  var q:integer;
  var b:a;
  assign(inf,'input.txt');reset(inf);
  TextColor(blue);
  println('Исходные данные:');
  TextColor(Magenta);
  var r:integer;
  while not eof(inf) do begin
    read(inf,r);
    print(r);
  end;println();close(inf);
  var ch:byte;
  TextColor(blue);
  println('Введите 1 для сортировки данных с помощью алгоритма выбором');
  println('Введите 2 для сортировки данных с помощью быстрого алгоритма');TextColor(Magenta);
  println('Введите 0 для завершения программы');readln(ch);
  q:=DateTime.Now.MilliSecond;
  reset(inf);
  case ch of
    1:begin
        var t:=1;
        while not Eof(inf) do begin
          read(inf, b[t]);
          inc(t);end;TextColor(Magenta);
        println('Введите 1 для сортировки данных по убыванию');
        println('Введите 2 для сортировки данных по возрастанию');
        readln(ch);TextColor(blue);
        case ch of 
          1:SellectionSort(b, 1, N,1);
          2:SellectionSort(b, 1, N,2);
        end;
      end;
    2:begin
      var t:=1;
        while not Eof(inf) do begin
          read(inf, b[t]);
          inc(t);end;TextColor(Magenta);
        println('Введите 1 для сортировки данных по убыванию');
        println('Введите 2 для сортировки данных по возрастанию'); 
        readln(ch);TextColor(blue);
        case ch of 
          1:begin QuickSort(b,1);for var i:= 1 to N do 
              Write(b[i], ' ');end;
          2:begin QuickSort(b,2);for var i:= 1 to N do 
              Write(b[i], ' ');end;
        end;
      end;
    0:begin println('Завершение программы');exit();end;
  end;close(inf);
  assign(outf,'outfile.txt');
  rewrite(outf);
  for var i:=1 to N do begin
    write(outf,b[i]);
  end;
  var w:integer;
  w:=DateTime.Now.MilliSecond;
  var p:=abs(w-q);
  println('Время выполнения программы в миллисекундах:',p);
  close(outf);
end.