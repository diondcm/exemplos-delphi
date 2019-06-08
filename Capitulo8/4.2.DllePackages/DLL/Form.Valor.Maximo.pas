unit Form.Valor.Maximo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmValoMax = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditValor1: TEdit;
    EditValor2: TEdit;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmValoMax: TfrmValoMax;

  function ExibeFormValMax: Boolean; stdcall;

exports
  ExibeFormValMax;


implementation

{$R *.dfm}


function ExibeFormValMax: Boolean;
begin
  var lFrm: TfrmValoMax := TfrmValoMax.Create(nil);
  Result := lFrm.ShowModal = mrOk;
  lfrm.Free;
end;

end.
