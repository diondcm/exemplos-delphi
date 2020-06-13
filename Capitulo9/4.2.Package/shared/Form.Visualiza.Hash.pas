unit Form.Visualiza.Hash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmVisualizaHash = class(TForm)
    PanelControles: TPanel;
    ButtonOk: TButton;
    PanelHash: TPanel;
    StaticTextHash: TStaticText;
    procedure ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetHash(pHs: string);
    class procedure Executa(pHash: string);
  end;

//var
//  frmVisualizaHash: TfrmVisualizaHash;

implementation

{$R *.dfm}

{ TfrmVisualizaHash }

procedure TfrmVisualizaHash.ButtonOkClick(Sender: TObject);
begin
  Close;
end;

class procedure TfrmVisualizaHash.Executa(pHash: string);
begin
  var lfrm : TfrmVisualizaHash := TfrmVisualizaHash.Create(nil);

  lfrm.SetHash(pHash);
  lfrm.ShowModal;

  lfrm.Free;
end;

procedure TfrmVisualizaHash.SetHash(pHs: string);
begin
  StaticTextHash.Caption := pHs;
end;

initialization
  RegisterClass(TfrmVisualizaHash);

finalization
  UnRegisterClass(TfrmVisualizaHash);

end.
