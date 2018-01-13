program FastGerais;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  From.Base.Relatorio in 'From.Base.Relatorio.pas' {frmBaseRelatorio},
  Form.Relatorio.Filho in 'Form.Relatorio.Filho.pas' {frmListaProdutos},
  Data.Produtos in 'Data.Produtos.pas' {dmdProdutos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmListaProdutos, frmListaProdutos);
  Application.CreateForm(TdmdProdutos, dmdProdutos);
  Application.Run;
end.
