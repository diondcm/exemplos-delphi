unit Form.Cadastro.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.Usuario;

type
  TfrmUsuario = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    panelGridUsuarios: TCategoryPanel;
    grudUsuarios: TDBGrid;
    dtsUsuarios: TDataSource;
    timerOpen: TTimer;
    procedure FormShow(Sender: TObject);
    procedure timerOpenTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  dtsUsuarios.DataSet := dmdUsuario.qryUsuario;
end;

procedure TfrmUsuario.FormShow(Sender: TObject);
begin
  timerOpen.Enabled := True;
end;

procedure TfrmUsuario.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  dmdUsuario.qryUsuario.Open;
end;

end.
