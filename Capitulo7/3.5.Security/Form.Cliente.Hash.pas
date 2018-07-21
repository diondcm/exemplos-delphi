unit Form.Cliente.Hash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Hash, System.netencoding, Vcl.ExtCtrls,
  Rest.JSON, System.Generics.Collections, Classe.Cotacao;

type
  TfrmHash = class(TForm)
    panelHash: TPanel;
    memoLog: TMemo;
    editTexto: TEdit;
    panelJSON: TPanel;
    memoJson: TMemo;
    memObj: TMemo;
    buttonToObj: TButton;
    buttonToJson: TButton;  procedure editTextoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure buttonToObjClick(Sender: TObject);
    procedure buttonToJsonClick(Sender: TObject);
  private
    FCotacao: TCotacao;
    function GeraHash(const pTexto: string): string;
  public
    { Public declarations }
  end;

var
  frmHash: TfrmHash;

implementation

{$R *.dfm}

procedure TfrmHash.buttonToJsonClick(Sender: TObject);
begin
  FCotacao := TCotacao.Create;
  SetLength(FCotacao.fvalues, 1);
  FCotacao.values[0] := TValor.Create;
  FCotacao.values[0].Fsubvalor_obj := TSubValor.Create;
  FCotacao.values[0].Fsubvalor_list := TList<TSubValor>.Create;
  SetLength(FCotacao.values[0].Fsubvalor_arr, 1);
  FCotacao.values[0].Fsubvalor_arr[0] := TSubValor.Create;

//  FCotacao.values := TList<TValor>.Create;
//  FCotacao.values.Add(TValor.Create);

  if Assigned(FCotacao) then
  begin
    memoJson.Text := TJson.ObjectToJsonString(FCotacao);
  end;
end;

procedure TfrmHash.buttonToObjClick(Sender: TObject);
var
  lVal: TValor;
begin
  FCotacao := TJson.JsonToObject<TCotacao>(memoJson.Text);
  memObj.Lines.Add('Status: ' + FCotacao.status);
  memObj.Lines.Add('Unit: ' + FCotacao.&unit);
  memObj.Lines.Add('Valores: ' + Length(FCotacao.values).ToString);
  for lVal in FCotacao.values do
  begin
    memObj.Lines.Add(' Val x: ' + lVal.x.ToString + ' y: ' + lVal.y.ToString);
  end;

end;

procedure TfrmHash.editTextoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    memoLog.Lines.Add(GeraHash(editTexto.Text));
  end;

end;

function TfrmHash.GeraHash(const pTexto: string): string;
begin
  Result := THashMD5.GetHashString(pTexto);
  Result := THashSHA1.GetHashString(pTexto);

end;

end.
