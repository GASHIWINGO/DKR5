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
    end;TextColor(Magenta);
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
  randomize;
  var q:integer;
  var b:a;
  assign(inf,'input.txt');rewrite(inf);
  TextColor(blue);
  println('Исходные данные:');
  TextColor(Magenta);
  var r:integer;
  var o:=2;
  var l:=4;
  var c:=7;
  for var i:=1 to N do begin
    r:=i;
    if r>=0 then begin
    if r>100 then r+=o;
    if r mod 3 = 0 then r*=1;
    if (r<50) and (r>4) then r-=l;
    write(inf,r);print(r);end;end;println();close(inf);
  var ch:byte;
  TextColor(blue);
  println('Введите 1 для сортировки данных с помощью алгоритма выбором');
  println('Введите 2 для сортировки данных с помощью быстрого алгоритма');readln(ch);
  q:=DateTime.Now.Second;
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
    0:exit();
  end;close(inf);
  assign(outf,'outfile.txt');
  rewrite(outf);TextColor(Magenta);
  for var i:=1 to N do begin
    write(outf,b[i]);
  end;
  var w:integer;
  w:=DateTime.Now.Second;
  println('Время выполнения программы в секундах:',w-q);
  close(outf);
end.