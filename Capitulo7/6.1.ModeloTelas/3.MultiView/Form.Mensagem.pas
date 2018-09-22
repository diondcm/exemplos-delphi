unit Form.Mensagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.DialogService, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TfrmMensagem = class(TForm)
    LayoutClient: TLayout;
    Label1: TLabel;
    ButtonMensagem: TButton;
    Rectangle1: TRectangle;
    procedure ButtonMensagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmMensagem.ButtonMensagemClick(Sender: TObject);
begin
  TDialogService.MessageDialog('Fechar a tela?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
    TMsgDlgBtn.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes: Close;
      else
        TDialogService.ShowMessage('Ok, continue aqui.');
      end;
    end);
end;

end.
