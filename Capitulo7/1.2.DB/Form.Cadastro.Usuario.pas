unit Form.Cadastro.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.Usuario, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmUsuario = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    panelGridUsuarios: TCategoryPanel;
    grudUsuarios: TDBGrid;
    dtsUsuarios: TDataSource;
    timerOpen: TTimer;
    DBNavigator1: TDBNavigator;
    panalCadastroUsuario: TCategoryPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
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
  /// <>
  ///
  ///
  ///
end;

procedure TfrmUsuario.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  dmdUsuario.qryUsuario.Open;
end;

end.
