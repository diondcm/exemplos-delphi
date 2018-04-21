program PalavrasReservadas;

uses
  Vcl.Forms,
  Form.Paravras.Reserv in 'Form.Paravras.Reserv.pas' {frmPalavras},
  Form.Plus in 'Form.Plus.pas' {frmPlus};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPlus, frmPlus);
  Application.CreateForm(TfrmPalavras, frmPalavras);
  Application.Run;
end.
