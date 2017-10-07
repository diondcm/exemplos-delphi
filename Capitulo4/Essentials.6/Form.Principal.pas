unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, Data.Paises,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Form.Cadastro.Paises, Form.Consulta.Paises;

type
  TfrmPrincipal = class(TForm)
    buttonCadastroPaises: TButton;
    TimerOpenDataSet: TTimer;
    buttonConsultaPaises: TButton;
    procedure buttonCadastroPaisesClick(Sender: TObject);
    procedure TimerOpenDataSetTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buttonConsultaPaisesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.buttonCadastroPaisesClick(Sender: TObject);
begin
  frmCadPaises.Show;
end;

procedure TfrmPrincipal.buttonConsultaPaisesClick(Sender: TObject);
begin
  frmConsultaPaises.Show;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TimerOpenDataSet.Enabled := True;
end;

procedure TfrmPrincipal.TimerOpenDataSetTimer(Sender: TObject);
begin
  TimerOpenDataSet.Enabled := False;
  dmdPaises.qryDBPaises.Open;
end;

end.
