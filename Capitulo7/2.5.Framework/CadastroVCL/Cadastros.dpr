program Cadastros;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Base.Form in '..\Base\Base.Form.pas' {frmBase},
  Base.Data.Imagens in '..\Base\Base.Data.Imagens.pas' {dmdImagens: TDataModule},
  Base.Data.Cadastro in '..\Base\Base.Data.Cadastro.pas' {dmdBaseCadastro: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdImagens, dmdImagens);
//  Application.CreateForm(TdmdBaseCadastro, dmdBaseCadastro);
  //  Application.CreateForm(TfrmBase, frmBase);
  Application.Run;
end.
