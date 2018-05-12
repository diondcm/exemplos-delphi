unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, Classe.Empresa, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    buttonInstanciaEmpresa: TButton;
    memoLog: TMemo;
    buttonSelecionaIndustriaCalcado: TButton;
    procedure buttonInstanciaEmpresaClick(Sender: TObject);
    procedure buttonSelecionaIndustriaCalcadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.buttonInstanciaEmpresaClick(Sender: TObject);
var
  lFrig: TFrigorifico;
  lIndC: TIndustriaCalcado;
begin
  lFrig := TFrigorifico.Create;
  lFrig.CNPJ := '00.000.000/0000-00';
  lFrig.RazaoSocial := 'MarFrig';
  lFrig.CapacidadeAbates := 200;
  memoLog.Lines.Add('');
  memoLog.Lines.Add(lFrig.ToString);

  THolding.Instancia.ListaEmpresa.Add(lFrig);
  //lFrig.Free;

  lIndC := TIndustriaCalcado.Create;
  lIndC.CNPJ := '11.111.111/1111-99';
  lIndC.RazaoSocial := 'Grendene';
  lIndC.VendeExportacao := False;
  memoLog.Lines.Add('');
  memoLog.Lines.Add(lIndC.ToString);

  THolding.Instancia.ListaEmpresa.Add(lIndC);
  //lIndC.Free;
end;

procedure TfrmPrincipal.buttonSelecionaIndustriaCalcadoClick(Sender: TObject);
var
  lEmpresa: TEmpresa;
begin
  memoLog.Lines.Clear;
  for lEmpresa in THolding.Instancia.ListaEmpresa do
  begin
    if lEmpresa is TIndustriaCalcado then
    begin
      memoLog.Lines.Add(lEmpresa.ToString);
    end;
  end;
end;

end.
