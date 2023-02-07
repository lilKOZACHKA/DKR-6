uses graphabc;
var xx, yy, rad, updown, vstor: real; glubina: integer;

var Levi: Byte;

procedure levy(x, y, a, r: real; k: integer);
begin
  if k > 0 then 
  begin
    r := r * sin(pi / 4);
    levy(x, y, a + pi / 4, r, k - 1);
    levy(x + r * cos(a + pi / 4), y - r * sin(a + pi / 4), a - pi / 4, r, k - 1);
  end 
  else
    line(trunc(x), trunc(y), trunc(x + r * cos(a)), trunc(y - r * sin(a))); 
end;

procedure procRad1;
begin
  ClearWindow;
  rad -= 10;
end;

procedure procYY1;
begin
  ClearWindow;
  yy += 20;
end;

procedure procGlubina1;
begin
  ClearWindow;
  glubina -= 1;
end;

procedure procXX1;
begin
  ClearWindow;
  xx -= 20;
end;

procedure procXX2;
begin
  ClearWindow;
  xx += 20;
end;

procedure procRad2;
begin
  ClearWindow;
  rad += 10;
end;

procedure procYY2;
begin
  ClearWindow;
  yy -= 20;
end;

procedure procGlubina2;
begin
  ClearWindow;
  glubina += 1;
end;

begin
  begin
    xx := 750;
    yy := 450;
    SetWindowSize(1200, 600);
    writeln('Введите масштаб до 450');
    read(rad);
    writeln('Введите глубину до 20');
    read(glubina);
    ClearWindow;
    levy(xx, yy, 0, rad, glubina - 1);
  end; 
  repeat
    TextOut(0, 0, '1 - увеличение масштаба');
    TextOut(0, 15, '2 - уменьшение масштаба');
    TextOut(0, 30,'3 - сдвиг в права');
    TextOut(0, 45,'4 - сдвиг в лево');
    TextOut(0, 60,'5 - сдвиг вверх');
    TextOut(0, 75,'6 - сдвиг вниз');
    TextOut(0, 90,'7 - Увеличение глубины');
    TextOut(0, 105,'8 - Уменьшение глубины');
    ReadLn(Levi);
    case Levi of
      1: procRad1;
      2: procRad2;
      3: procXX1;
      4: procXX2;
      5: procYY1;
      6: procYY2;
      7: procGlubina1;
      8: procGlubina2;
    end;
    levy(xx, yy, 0, rad, glubina - 1);
  until Levi = 0;
end.