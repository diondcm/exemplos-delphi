program Basico2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  PLocalPoint = ^TLocalPoint;
  TLocalPoint = record
    X: Cardinal;
    Y: Cardinal;
    procedure PrintBuffer(const pCaption: string = '');
  end;

procedure PassAsConst(const [Ref] pRec: TLocalPoint);
begin
  PLocalPoint(@pRec).X := 2;
  PLocalPoint(@pRec).Y := 2;
  Writeln(Format('Rec by Ref @%p', [@pRec]));
end;

procedure PassByVal(pRec: TLocalPoint);
begin
  PLocalPoint(@pRec).X := 3333;
  PLocalPoint(@pRec).Y := 4444;
  Writeln(Format('Rec by Val @%p', [@pRec]));
end;

var
  lRec: TLocalPoint;
{ TLocalPoint }

procedure TLocalPoint.PrintBuffer(const pCaption: string);
begin
  Writeln(pCaption);
  Writeln('X: ' + X.ToString);
  Writeln('Y: ' + Y.ToString);
end;

begin
  try
    Writeln(Format('Local Rec @%p', [@lRec]));

    lRec.X := 1;
    lRec.Y := 1;
    lRec.PrintBuffer('Before by Val');
    PassByVal(lRec);
    lRec.PrintBuffer('After by Val');


    lRec.PrintBuffer('Before by Ref');
    PassAsConst(lRec);
    lRec.PrintBuffer('After by Ref');

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
