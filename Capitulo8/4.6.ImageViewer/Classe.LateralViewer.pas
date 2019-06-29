unit Classe.LateralViewer;

interface

uses
  WinApi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Graphics, Vcl.Dialogs, Vcl.Forms, IoUtils, Form.Visualiza.Imagem,
  Data.DB, Classe.ClassificaImage;

const
  MINIMIZAR = '>>';
  MAXIMIZAR = '<<';
  MAX_SIZE = 220;

type
  TLateralViewer = class(TPanel)
  private
    FFlow: TFlowPanel;
    FLabelTitulo: TLabel;
    FDiretorio: string;
    FSelectFolder: TFileOpenDialog;
    FScrollBox: TScrollBox;
    FPreview: Boolean;
    FDataSet: TDataSet;
    FFieldName: string;
    procedure LabelTituloClick(Sender: TObject);
    procedure LabelTituloDblClick(Sender: TObject);
    procedure SetDiretorio(const Value: string);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure OnImageClick(Sender:  TObject);
  public
    constructor Create(AOwner: TComponent); override;

    procedure CarregaImagensDB;

    property Diretorio: string read FDiretorio write SetDiretorio;
    property Preview: Boolean read FPreview write FPreview default False;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property FieldName: string read FFieldName write FFieldName;
  end;


implementation

{ TLateralViewer }

procedure TLateralViewer.CarregaImagensDB;
var
  lImagem: TImage;
  lStm: TStringStream;
begin
  if not Assigned(FDataSet) then
  begin
    raise Exception.Create('Informe o Dataset');
  end;

  if (FDataSet.IsEmpty) then
  begin
    raise Exception.Create('Dataset fechado ou vazio');
  end;

  if FieldName = '' then
  begin
    raise Exception.Create('o nome do field');
  end;

  FDataSet.DisableControls;
  try
    FDataSet.First;
    while not FDataSet.Eof do
    begin
      lImagem := TImage.Create(Self);
      lImagem.AlignWithMargins := True;
      lImagem.Parent := FFlow;
      lImagem.Stretch := True;
      lImagem.OnClick := OnImageClick;

      if FDataSet.FieldByName('Graphic') is TGraphicField then
      begin

        lImagem.Picture.Assign(TGraphicField(FDataSet.FieldByName('Graphic')));

      end else if FDataSet.FieldByName('Graphic') is TBlobField then
      begin
        lStm := TStringStream.Create;
        TBlobField(FDataSet.FieldByName('Graphic')).SaveToStream(lStm);
        lImagem.Picture.LoadFromStream(lStm);
        lStm.Free;
      end;

      FFlow.Height := FFlow.Height + lImagem.Height + (lImagem.Margins.Top + lImagem.Margins.Bottom);
      FDataSet.Next;
    end;

  finally
    FDataSet.EnableControls;
  end;
end;

constructor TLateralViewer.Create(AOwner: TComponent);
begin
  inherited;
  Self.Width := 160;
  Self.Align := alLeft;

  FScrollBox := TScrollBox.Create(Self);
  FScrollBox.Parent := Self;
  FScrollBox.Align := alClient;
  FScrollBox.OnDblClick := LabelTituloDblClick;

  FFlow := TFlowPanel.Create(Self);
  FFlow.Parent := FScrollBox;
  FFlow.OnDblClick := LabelTituloDblClick;
  FFlow.AlignWithMargins := True;
  FFlow.Width := FScrollBox.Width - 20;
  FFlow.Height := 50;
  FFlow.Top := 3;
  FFlow.Left := 3;

  FLabelTitulo := TLabel.Create(Self);
  FLabelTitulo.Align := alLeft;
  FLabelTitulo.AutoSize := False;
  FLabelTitulo.Caption := MINIMIZAR;
  FLabelTitulo.Width := 16;
  FLabelTitulo.OnClick := LabelTituloClick;
  FLabelTitulo.OnDblClick := LabelTituloDblClick;
  FLabelTitulo.Parent := Self;

  FSelectFolder := TFileOpenDialog.Create(Self);
  FSelectFolder.OkButtonLabel := 'Selecionar Pasta';
  FSelectFolder.Options := [fdoPickFolders];
end;

procedure TLateralViewer.CreateParams(var Params: TCreateParams);
begin
  inherited;
  ShowCaption := False;
end;

procedure TLateralViewer.LabelTituloClick(Sender: TObject);
begin
  if Self.Width = MAX_SIZE then
  begin
    Self.Width := 17;
    FLabelTitulo.Caption := '<<';
    FFlow.Visible := False;
  end else begin
    Self.Width := MAX_SIZE;
    FLabelTitulo.Caption := '>>';
    FFlow.Visible := True;
  end;
end;

procedure TLateralViewer.LabelTituloDblClick(Sender: TObject);
begin
  if FSelectFolder.Execute then
  begin
    SetDiretorio(FSelectFolder.FileName);
  end;
end;

procedure TLateralViewer.OnImageClick(Sender: TObject);
begin
  if Sender is TImage then
  begin
    if FPreview then
    begin
      TfrmVisualiza.VisualizaImagem(TImage(Sender).Picture);
    end;
  end;
end;

procedure TLateralViewer.SetDiretorio(const Value: string);
var
  i: Integer;
  lMinHeight: Integer;
  lListaFiles: TArray<string>;
  lFile: string;
  lImagem: TImage;
  lInstancia: TGraphic;
begin
  if FDiretorio <> Value then
  begin
    FDiretorio := Value;

    lMinHeight := 0;
    for i := FFlow.ControlCount -1 downto 0 do
    begin
      lMinHeight := FFlow.Controls[i].Height;
      FFlow.Controls[i].Free;
    end;

    FFlow.Height := lMinHeight;

    lListaFiles := TDirectory.GetFiles(FDiretorio);
    for lFile in lListaFiles do
    begin
      lInstancia := TClassificaImagem.GetImage(lFile);
      lImagem := TImage.Create(Self);
      lImagem.AlignWithMargins := True;
      lImagem.Parent := FFlow;
      lImagem.Stretch := True;
      lImagem.Picture.Assign(lInstancia);
      lInstancia.Free;;


//      if ExtractFileExt(lFile) = '.jpg' then
//      begin
//        lImagem := TImage.Create(Self);
//        lImagem.AlignWithMargins := True;
//        lImagem.Parent := FFlow;
//        lImagem.Stretch := True;
//        lImagem.Picture.LoadFromFile(lFile);
//        lImagem.OnClick := OnImageClick;
//      end;
       FFlow.Height := FFlow.Height + lImagem.Height + (lImagem.Margins.Top + lImagem.Margins.Bottom);
    end;
  end;
end;

end.
