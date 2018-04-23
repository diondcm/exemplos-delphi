unit Frame.Dialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.DialogService,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts;

type
  TfraDialogs = class(TFrame)
    Layout1: TLayout;
    buttonDialogs: TButton;
    procedure buttonDialogsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfraDialogs.buttonDialogsClick(Sender: TObject);
begin
//  if Messagediag = mrYes then
//  begin
    /// Coisas acontecem aqui
//  end;

  TDialogService.MessageDialog('Confirme ou cancele!', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbYes], TMsgDlgBtn.mbYes, 0,
    procedure (const AResult: TModalResult)
    begin
      case AResult of
        mrYes: TDialogService.ShowMessage('Informou Yes'); // Coisas acontecem aqui
      end;
    end);
end;

end.
