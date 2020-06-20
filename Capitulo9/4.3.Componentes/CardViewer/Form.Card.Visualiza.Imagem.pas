unit Form.Card.Visualiza.Imagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmVisualizaCard = class(TForm)
    ImageVisualiza: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure VisualizaImagem(pPic: TPicture);
  end;

implementation

{$R *.dfm}

{ TfrmVisualiza }

procedure TfrmVisualizaCard.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

class procedure TfrmVisualizaCard.VisualizaImagem(pPic: TPicture);
var
  lFrm: TfrmVisualizaCard;
begin
  lFrm := TfrmVisualizaCard.Create(nil);
  try
    lFrm.ImageVisualiza.Picture.Assign(pPic);
    lFrm.ShowModal;
  finally
    lFrm.Free;
  end;
end;

end.
