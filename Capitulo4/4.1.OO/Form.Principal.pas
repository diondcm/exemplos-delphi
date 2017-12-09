unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Classes.Pessoa,
  Classe.Base;

type
  TfrmPrinciapal = class(TForm)
    memoLog: TMemo;
    buttonPessoa: TBitBtn;
    Dependente1: TDependente;
    procedure buttonPessoaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinciapal: TfrmPrinciapal;

implementation

{$R *.dfm}

procedure TfrmPrinciapal.buttonPessoaClick(Sender: TObject);
var
  lPes: TPessoaFisica;
begin
//  TDepedente.TNivelDependente.Filho;

  //Self.FActive := False;
  lPes := TDependente.Create(Self);
  try
    memoLog.Lines.Add(lPes.ToString);
  finally
//    lPes.Free;
  end;
end;

end.

