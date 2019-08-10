unit Form.Valor.Maximo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TfrmValoMax = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditValor1: TEdit;
    EditValor2: TEdit;
    Button1: TButton;
    FDConnection1: TFDConnection;
    procedure FDConnection1Error(ASender, AInitiator: TObject; var AException: Exception);
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

procedure TfrmValoMax.FDConnection1Error(ASender, AInitiator: TObject; var AException: Exception);
begin
//  FDFireBirdCon.OnError
end;

end.
