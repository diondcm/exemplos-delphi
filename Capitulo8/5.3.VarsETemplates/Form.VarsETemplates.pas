unit Form.VarsETemplates;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.VarsETemplates, Vcl.StdCtrls, Form.Selecao.Parametros;

type
  TfrmVarsETemp = class(TForm)
    ButtonVarsETemplates: TButton;
    procedure ButtonVarsETemplatesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVarsETemp: TfrmVarsETemp;

implementation

{$R *.dfm}

procedure TfrmVarsETemp.ButtonVarsETemplatesClick(Sender: TObject);
var
  lPar: TParametroRel;
  lSQL: string;
begin
//  dmdVarsETemplate.qryVendas.Close;
//  dmdVarsETemplate.qryVendas.Open;
//
//  dmdVarsETemplate.frxReportVars.ShowReport;

  lPar := TParametroRel.Create(
    'Data de venda',
    Now,
    'DATA',
    True);

  lSQL := frmParametros.SolicitaParametro(lPar);
  dmdVarsETemplate.ExibeListaVendas('Cliente = 15', lSQL);
end;

end.
