unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Relatorios, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ToolButton1Click(Sender: TObject);
begin
  dmdRelatorios.ImprimeMasterGrupo;
end;

procedure TfrmPrincipal.ToolButton2Click(Sender: TObject);
begin
  dmdRelatorios.ImprimeGrafico;
end;

procedure TfrmPrincipal.ToolButton3Click(Sender: TObject);
begin
  //
end;

end.
