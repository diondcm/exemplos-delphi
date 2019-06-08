unit Classe.Memo.Helper;

interface

uses
  Vcl.StdCtrls;

type
  TMemoHelper = class helper for TMemo
    procedure Add2(pMsg: string);
  end;



implementation

{ TMemoHelper }

procedure TMemoHelper.Add2(pMsg: string);
begin
  Self.Lines.Insert(0, pMsg + sLineBreak);
end;

end.
