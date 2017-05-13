unit Form.Exportador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Exportador.Arquivo,
  Classe.Serealizador.Objeto;

type
  TfrmExportador = class(TForm)
    memLinhas: TMemo;
    btnSerealiza: TButton;
    procedure btnSerealizaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportador: TfrmExportador;

implementation

{$R *.dfm}

procedure TfrmExportador.btnSerealizaClick(Sender: TObject);
var
  lHeader: THeader;
  lStl: TStringList;
begin
  lStl := TStringList.Create;
  try
    lHeader := THeader.Create;
    try
      lHeader.Identificador := 'H';
      lHeader.CodEmpresa := 25;
      lHeader.NomeEmpresa := 'AquaOil & Gas';
      lHeader.CodBanco := 341;
      lHeader.CodAgencia := 1345;
      lHeader.CodConta := 45687;

      lStl.Add(TSerealizador.AsTexto(lHeader)); // Cuidar o Encouding
    finally
      lHeader.Free;
    end;

    //lStl.SaveToFile('CNAB.txt');// , TEncoding.ANSI
    memLinhas.Text := lStl.Text;
  finally
    lStl.Free;
  end;
end;

end.
