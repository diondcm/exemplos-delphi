program ClassesELookUps;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Classes in 'Form.Classes.pas' {frmClasses},
  Classe.Estoque in 'Classe.Estoque.pas' {dmdEstoque: TDataModule},
  Classe.Estoque.Movimentacao in 'Classe.Estoque.Movimentacao.pas' {dmdMovimentacao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmClasses, frmClasses);

  Application.Run;
end.
