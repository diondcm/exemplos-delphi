unit Form.Base.Detalhe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TfrmBaseDetalhe = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmBaseDetalhe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.cafree;
end;

end.
