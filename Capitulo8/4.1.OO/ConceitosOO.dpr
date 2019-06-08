program ConceitosOO;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classe.Veiculos in 'Classe.Veiculos.pas',
  Classe.Memo.Helper in 'Classe.Memo.Helper.pas',
  Classe.Escritorio in 'Classe.Escritorio.pas',
  Classe.Base in 'Classe.Base.pas',
  Classe.Patrimonio in 'Classe.Patrimonio.pas',
  Frame.Cliente in 'Frame.Cliente.pas' {fraCliente: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
