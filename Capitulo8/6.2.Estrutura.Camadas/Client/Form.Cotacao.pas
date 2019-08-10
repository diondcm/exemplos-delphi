unit Form.Cotacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation,
  ClientModuleUnit1;

type
  TfrmCotacao = class(TForm)
    ToolBar1: TToolBar;
    ButtonVoltar: TButton;
    Layout1: TLayout;
    Label1: TLabel;
    MemoCotacao: TMemo;
    Button1: TButton;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCotacao: TfrmCotacao;

implementation

{$R *.fmx}

procedure TfrmCotacao.Button1Click(Sender: TObject);
begin
  MemoCotacao.Text := ClientModule1.ServerMethods1Client.ReverseString('fw2dsfge4334343');
end;

procedure TfrmCotacao.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
