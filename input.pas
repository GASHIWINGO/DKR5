const N=10;
begin
  var inf:file of integer;
  assign(inf, 'input.txt');rewrite(inf);
  var r:integer;
  println('Введите',N,'чисел');
  for var i:=1 to N do begin
    r:=readinteger();
    write(inf,r);
  end;
  close(inf);
end.