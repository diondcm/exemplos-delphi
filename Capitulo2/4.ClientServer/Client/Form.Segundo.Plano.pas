unit Form.Segundo.Plano;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects;

type
  TfrmSegundoPlano = class(TForm)
    Rectangle1: TRectangle;
    AniIndicator1: TAniIndicator;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    class var FInstancia: TfrmSegundoPlano;
  public
    class procedure Executar(const pMetodo: TProc);
  end;

implementation

{$R *.fmx}

{ TfrmSegundoPlano }

class procedure TfrmSegundoPlano.Executar(const pMetodo: TProc);
begin
  if not Assigned(FInstancia) then
  begin
    FInstancia := TfrmSegundoPlano.Create(Application);
  end;

  FInstancia.AniIndicator1.Enabled := True;
  FInstancia.Show;

  TThread.CreateAnonymousThread(
    procedure
    begin
      try
        pMetodo;
      finally
        TThread.Queue(nil,
          procedure
          begin
            FInstancia.AniIndicator1.Enabled := False;
            FInstancia.Close;
          end);
      end;
    end).Start;
end;

procedure TfrmSegundoPlano.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
    Key := 0;
end;

end.
