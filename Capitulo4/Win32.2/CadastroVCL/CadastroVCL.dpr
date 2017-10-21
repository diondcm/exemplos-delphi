program CadastroVCL;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Ajuda in 'Form.Ajuda.pas' {frmAjuda},
  Base.Form in '..\Base\Base.Form.pas' {frmBase},
  Base.Form.Ajuda in '..\Base\Base.Form.Ajuda.pas' {frmBaseAjuda},
  Base.Data in '..\Base\Base.Data.pas' {dmdBase: TDataModule},
  Base.Data.Cadastro in '..\Base\Base.Data.Cadastro.pas' {dmdBaseCadastro: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  TfrmBase.FormAjudaClass := TfrmAjuda.Create(Application);
  TfrmBase.FormAjudaClass := TFrmAjuda;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
