unit Classe.ImageViewer;

interface

uses
  WinApi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, Form.Visualiza.Imagem;

const
  MARGEM_DEFAULT = 20;

type
  TImageViewer = class(TPanel)
  private
    FMargemLateral: Integer;
    FMargemHorizontal: Integer;
    FImagemPrincipal: TImage;
    FImagemEsquerda: TImage;
    FImagemDireita: TImage;
    FStretch: Boolean;
    FProportional: Boolean;
    procedure SetProportional(const Value: Boolean);
    procedure SetStretch(const Value: Boolean);
    procedure SelecionaEsquerda;
    procedure SelecionaDireita;
  protected
//    procedure OnKeyDownPanel(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
//    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
//    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure Resize; override;
    procedure ImageClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DblClickImagPrincipal(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property MargemLateral: Integer read FMargemLateral write FMargemLateral default MARGEM_DEFAULT;
    property MargemHorizontal: Integer read FMargemHorizontal write FMargemHorizontal default MARGEM_DEFAULT;
    property ImagemPrincipal: TImage read FImagemPrincipal write FImagemPrincipal;
    property ImagemEsquerda: TImage read FImagemEsquerda write FImagemEsquerda;
    property ImagemDireita: TImage read FImagemDireita write FImagemDireita;
    property Stretch: Boolean read FStretch write SetStretch default True;
    property Proportional: Boolean read FProportional write SetProportional default False;
  end;

implementation

{ TImageViewer }

constructor TImageViewer.Create(AOwner: TComponent);
begin
  inherited;
  FMargemLateral := MARGEM_DEFAULT;
  FMargemHorizontal := MARGEM_DEFAULT;
//  TabStop := True;
//  Self.OnKeyDown := OnKeyDownPanel;

  FImagemPrincipal := TImage.Create(Self);
  FImagemPrincipal.Parent := Self;
  FImagemPrincipal.Align := alClient;
  FImagemPrincipal.AlignWithMargins := True;
  FImagemPrincipal.Margins.Left := (Self.Width div 4);
  FImagemPrincipal.Margins.Right := (Self.Width div 4);
  FImagemPrincipal.Margins.Top := FMargemHorizontal;
  FImagemPrincipal.Margins.Bottom := FMargemHorizontal;
//  FImagemPrincipal.OnMouseDown := ImageClick;
  FImagemPrincipal.Proportional := False;
  FImagemPrincipal.Stretch := True;
  FImagemPrincipal.OnDblClick := DblClickImagPrincipal;
  if (csDesigning in ComponentState) then
  begin
    FImagemPrincipal.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\delphi2.jpg');
  end;

  FImagemDireita := TImage.Create(Self);
  FImagemDireita.Parent := Self;
  FImagemDireita.Left := FImagemPrincipal.Margins.Left + (FImagemPrincipal.Width div 2);
  FImagemDireita.Top := FImagemPrincipal.Top + FMargemHorizontal;
  FImagemDireita.Width := FImagemPrincipal.Width - FMargemLateral;
  FImagemDireita.Proportional := False;
  FImagemDireita.Stretch := True;
  FImagemDireita.OnMouseDown := ImageClick;
  FImagemDireita.Cursor := crHandPoint;
  if (csDesigning in ComponentState) then
  begin
    FImagemDireita.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\Gray.jpg');
//  FImagemDireita.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\delphi2.jpg');
  end;

  FImagemEsquerda := TImage.Create(Self);
  FImagemEsquerda.Parent := Self;
  FImagemEsquerda.Left := FMargemLateral;
  FImagemEsquerda.Top := FImagemPrincipal.Top + FMargemHorizontal;
  FImagemEsquerda.Width := FImagemPrincipal.Width - FMargemLateral;
  FImagemEsquerda.Proportional := False;
  FImagemEsquerda.Stretch := True;
  FImagemEsquerda.OnMouseDown := ImageClick;
  FImagemEsquerda.Cursor := crHandPoint;
  if (csDesigning in ComponentState) then
  begin
    FImagemEsquerda.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\Aqua.jpg');
//  FImageEsquerda.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\delphi2.jpg');
  end;
end;

procedure TImageViewer.SelecionaDireita;
var
  lPic: TPicture;
begin
  lPic := TPicture.Create;
  lPic.Assign(FImagemDireita.Picture);
  FImagemDireita.Picture.Assign(FImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(lPic);
  lPic.Free;
end;

procedure TImageViewer.SelecionaEsquerda;
var
  lPic: TPicture;
begin
  lPic := TPicture.Create;
  lPic.Assign(FImagemEsquerda.Picture);
  FImagemEsquerda.Picture.Assign(FImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(lPic);
  lPic.Free;
end;

procedure TImageViewer.DblClickImagPrincipal(Sender: TObject);
begin
  TfrmVisualiza.VisualizaImagem(FImagemPrincipal.Picture);
end;

procedure TImageViewer.ImageClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender = FImagemEsquerda) then
  begin
    SelecionaEsquerda;
  end;

  if (Sender = FImagemDireita) then
  begin
    SelecionaDireita;
  end;
end;

//procedure TImageViewer.KeyDown(var Key: Word; Shift: TShiftState);
//begin
//  inherited;
//  if Key = VK_RETURN then
//  begin
//    TfrmVisualiza.VisualizaImagem(FImagemPrincipal.Picture);
//  end else if Key = VK_RIGHT then
//  begin
//    SelecionaDireita;
//  end else if Key = VK_LEFT then
//  begin
//    SelecionaEsquerda;
//  end;
//end;

//procedure TImageViewer.OnKeyDownPanel(Sender: TObject; var Key: Word; Shift: TShiftState);
//begin
//  if Key = VK_RETURN then
//  begin
//    TfrmVisualiza.VisualizaImagem(FImagemPrincipal.Picture);
//  end else if Key = VK_RIGHT then
//  begin
//    SelecionaDireita;
//  end else if Key = VK_LEFT then
//  begin
//    SelecionaEsquerda;
//  end;
//end;

procedure TImageViewer.Resize;
begin
  inherited;
  FImagemPrincipal.Margins.Left := (Self.Width div 4);
  FImagemPrincipal.Margins.Right := (Self.Width div 4);
  FImagemPrincipal.Margins.Top := FMargemHorizontal;
  FImagemPrincipal.Margins.Bottom := FMargemHorizontal;

  FImagemDireita.Left := FImagemPrincipal.Margins.Left + (FImagemPrincipal.Width div 2);
  FImagemDireita.Top := FImagemPrincipal.Top + FMargemHorizontal;
  FImagemDireita.Height := FImagemPrincipal.Height - (FMargemHorizontal*2);
  FImagemDireita.Width := FImagemPrincipal.Width - FMargemLateral;

  FImagemEsquerda.Left := FMargemLateral;
  FImagemEsquerda.Top := FImagemPrincipal.Top + FMargemHorizontal;
  FImagemEsquerda.Height := FImagemPrincipal.Height - (FMargemHorizontal*2);
  FImagemEsquerda.Width := FImagemPrincipal.Width - FMargemLateral;

  FImagemPrincipal.BringToFront;
end;

procedure TImageViewer.SetProportional(const Value: Boolean);
begin
  FProportional := Value;
  FImagemPrincipal.Proportional := FProportional;
  FImagemEsquerda.Proportional := FProportional;
  FImagemDireita.Proportional := FProportional;
end;

procedure TImageViewer.SetStretch(const Value: Boolean);
begin
  FStretch := Value;
  FImagemPrincipal.Stretch := FStretch;
  FImagemEsquerda.Stretch := FStretch;
  FImagemDireita.Stretch := FStretch;
end;


//procedure TImageViewer.WMGetDlgCode(var Message: TWMGetDlgCode);
//begin
//  Message.Result := DLGC_WANTALLKEYS or DLGC_WANTARROWS;
//  if TabStop then Message.Result := DLGC_WANTALLKEYS or DLGC_WANTARROWS
//  else Message.Result := 0;
//end;

//procedure TImageViewer.WMKeyDown(var Message: TWMKeyDown);
//begin
//  DoKeyDown(Message);
//end;

end.
