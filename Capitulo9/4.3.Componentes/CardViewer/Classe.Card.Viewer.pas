unit Classe.Card.Viewer;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, System.IOUtils, System.Types;

type
  TSentidoMovimento = (Direita, Esquerda);

  TImageViewer = class(TCustomPanel)
  private
    FSentidoMovimento: TSentidoMovimento;
    FTimer: TTimer;
    FIndiceAtual: Integer;
    FListaImagens: TStringList;
    FImagemPrincipal: TImage;
    FImagemEsquerda: TImage;
    FImagemDireita: TImage;
    FMargemHorizontal: Integer;
    FMargemLateral: Integer;
    FStretch: Boolean;
    FProportional: Boolean;
    FProporcaoPrincipal: Integer;
    FNomePasta: string;
    FProximaImagemEsquerda: TPicture;
    FProximaImagemDireita: TPicture;
    FPresent: Boolean;
    procedure SelecionaImagemEsquerda;
    procedure SelecionaImagemDireita;
    procedure SetNomePasta(const Value: string);
    procedure SetIntervaloEmSegundos(const Value: Cardinal);
    function GetIntervaloEmSegundos: Cardinal;
    procedure SetPresent(const Value: Boolean);
    procedure DoPresent(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Resize; override;
    procedure DoImagemClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DoPrincipalDoubleClick(Sender: TObject);
    property ProporcaoPrincipal: Integer read FProporcaoPrincipal write FProporcaoPrincipal;
    property ProximaImageEsquerda: TPicture read FProximaImagemEsquerda write FProximaImagemEsquerda;
    property ProximaImagemDireita: TPicture read FProximaImagemDireita write FProximaImagemDireita;
  public const
    MARGEM_DEFAULT = 20;
    PROPORCAO_IMAGEM_PADRAO = 8;
    INTERVALO_APRESENTACAO = 8;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Apresentar;
  published
    property Align;
    property Stretch: Boolean read FStretch write FStretch default True;
    property Proportional: Boolean read FProportional write FProportional default False;
    property MargemHorizontal: Integer read FMargemHorizontal write FMargemHorizontal default MARGEM_DEFAULT;
    property MargemLateral: Integer read FMargemLateral write FMargemLateral default MARGEM_DEFAULT;
    property ImagemPrincipal: TImage read FImagemPrincipal write FImagemPrincipal;
    property ImagemEsquerda: TImage read FImagemEsquerda write FImagemEsquerda;
    property ImagemDireita: TImage read FImagemDireita write FImagemDireita;
    property NomePasta: string read FNomePasta write SetNomePasta;
    property Present: Boolean read FPresent write SetPresent default False;
    property IntervaloEmSegundos: Cardinal read GetIntervaloEmSegundos write SetIntervaloEmSegundos default INTERVALO_APRESENTACAO;
    property SentidoMovimento: TSentidoMovimento read FSentidoMovimento write FSentidoMovimento default TSentidoMovimento.Direita;
  end;

implementation

{ TImageViewer }

uses Form.Card.Visualiza.Imagem, Classe.ClassificaImage;

procedure TImageViewer.Apresentar;
begin
  FTimer.Enabled := True;
end;

constructor TImageViewer.Create(AOwner: TComponent);
begin
  inherited;
  FMargemHorizontal := MARGEM_DEFAULT;
  FMargemLateral := MARGEM_DEFAULT;

  FStretch := True;
  FProportional := False;
  FSentidoMovimento := TSentidoMovimento.Direita;

  FProporcaoPrincipal := PROPORCAO_IMAGEM_PADRAO;
  FListaImagens := TStringList.Create;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.OnTimer := DoPresent;
  SetIntervaloEmSegundos(INTERVALO_APRESENTACAO);

  FImagemPrincipal := TImage.Create(Self);
  FImagemPrincipal.Parent := Self;
  FImagemPrincipal.Align := alClient;
  FImagemPrincipal.AlignWithMargins := True;
  FImagemPrincipal.Margins.Left := (Self.Width div FProporcaoPrincipal);
  FImagemPrincipal.Margins.Right := (Self.Width div FProporcaoPrincipal);
  FImagemPrincipal.Margins.Top := FMargemHorizontal;
  FImagemPrincipal.Margins.Bottom := FMargemHorizontal;
  FImagemPrincipal.Proportional := FProportional;
  FImagemPrincipal.Stretch := FStretch;
  FImagemPrincipal.Cursor := crDefault;
  FImagemPrincipal.OnDblClick := DoPrincipalDoubleClick;
  if csDesigning in Self.ComponentState then
  begin
    if FileExists('C:\Users\AquaAluno09\Pictures\background1.jpg') then
    begin
      FImagemPrincipal.Picture.LoadFromFile('C:\Users\AquaAluno09\Pictures\background1.jpg');
    end;
  end;

  FImagemEsquerda := TImage.Create(Self);
  FImagemEsquerda.Parent := Self;
  FImagemEsquerda.Left := 0;
  FImagemEsquerda.Top := FImagemPrincipal.Top + (FMargemHorizontal*2);
  FImagemEsquerda.Width := FImagemPrincipal.Width - FMargemLateral;
  FImagemEsquerda.Proportional := FProportional;
  FImagemEsquerda.Stretch := FStretch;
  FImagemEsquerda.Cursor := crHandPoint;
  FImagemEsquerda.OnMouseDown := DoImagemClick;
  if csDesigning in Self.ComponentState then
  begin
    if FileExists('C:\Users\AquaAluno09\Pictures\background3.jpg') then
    begin
      FImagemEsquerda.Picture.LoadFromFile('C:\Users\AquaAluno09\Pictures\background3.jpg');
    end;
  end;

  FImagemDireita := TImage.Create(Self);
  FImagemDireita.Parent := Self;
  FImagemDireita.Left := FImagemPrincipal.Margins.Left + (FImagemPrincipal.Width div 2);
  FImagemDireita.Top := FImagemPrincipal.Top + (FMargemHorizontal*2);
  FImagemDireita.Width := FImagemPrincipal.Width - FMargemLateral;
  FImagemDireita.Proportional := FProportional;
  FImagemDireita.Stretch := FStretch;
  FImagemDireita.Cursor := crHandPoint;
  FImagemDireita.OnMouseDown := DoImagemClick;
  if csDesigning in Self.ComponentState then
  begin
    if FileExists('C:\Users\AquaAluno09\Pictures\background4.jpg') then
    begin
      FImagemDireita.Picture.LoadFromFile('C:\Users\AquaAluno09\Pictures\background4.jpg');
    end;
  end;

  FProximaImagemEsquerda := TPicture.Create;
  FProximaImagemDireita := TPicture.Create;
end;

procedure TImageViewer.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Caption := '';
  ShowCaption := False;
end;

destructor TImageViewer.Destroy;
begin
  FListaImagens.Free;
  FProximaImagemEsquerda.Free;
  FProximaImagemDireita.Free;
  inherited;
end;

procedure TImageViewer.DoImagemClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender = FImagemEsquerda then
  begin
    SelecionaImagemEsquerda;
  end;

  if Sender = FImagemDireita then
  begin
    SelecionaImagemDireita;
  end;
end;

procedure TImageViewer.DoPresent(Sender: TObject);
begin
  var tmrStatus: Boolean := FTimer.Enabled;
  FTimer.Enabled := False;
  try
    if ((FIndiceAtual + 2) = FListaImagens.Count) then
    begin
      FSentidoMovimento := TSentidoMovimento.Esquerda;
    end else if FIndiceAtual = 0 then
    begin
      FSentidoMovimento := TSentidoMovimento.Direita;
    end;

    case FSentidoMovimento of
      Direita: SelecionaImagemDireita;
      Esquerda: SelecionaImagemEsquerda;
    end;
  finally
    FTimer.Enabled := tmrStatus;
  end;
end;

procedure TImageViewer.DoPrincipalDoubleClick(Sender: TObject);
begin
  TfrmVisualizaCard.VisualizaImagem(TImage(Sender).Picture);
end;

function TImageViewer.GetIntervaloEmSegundos: Cardinal;
begin
  Result := FTimer.Interval div 1000;
end;

procedure TImageViewer.Resize;
begin
  inherited;
  FImagemPrincipal.Margins.Left := (Self.Width div FProporcaoPrincipal);
  FImagemPrincipal.Margins.Right := (Self.Width div FProporcaoPrincipal);
  FImagemPrincipal.Margins.Top := FMargemHorizontal;
  FImagemPrincipal.Margins.Bottom := FMargemHorizontal;

  FImagemDireita.Left := FImagemPrincipal.Margins.Left + (FImagemPrincipal.Width div 2);
  FImagemDireita.Top := FImagemPrincipal.Top + (FMargemHorizontal*2);
  FImagemDireita.Height := FImagemPrincipal.Height - (FMargemHorizontal*4);
  FImagemDireita.Width := FImagemPrincipal.Width - FMargemHorizontal;

  FImagemEsquerda.Left := 0;
  FImagemEsquerda.Top := FImagemPrincipal.Top + (FMargemHorizontal*2);
  FImagemEsquerda.Height := FImagemPrincipal.Height - (FMargemHorizontal*4);
  FImagemEsquerda.Width := FImagemPrincipal.Width - FMargemHorizontal*2;

  FImagemPrincipal.BringToFront;
end;

procedure TImageViewer.SelecionaImagemDireita;
begin
  if FImagemDireita.Picture.Height = 0 then
  begin
    // sem imagem;
    Exit;
  end;

  FProximaImagemEsquerda.Assign(FImagemEsquerda.Picture);
  FImagemEsquerda.Picture.Assign(FImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(FImagemDireita.Picture);
  FImagemDireita.Picture.Assign(FProximaImagemDireita);

  Inc(FIndiceAtual);
  if (FIndiceAtual < FListaImagens.Count) and
    ((FIndiceAtual + 3) < FListaImagens.Count) then
  begin
    var indice: Integer := 1;
    while not FileExists(FListaImagens[FIndiceAtual - indice]) do
    begin
      FListaImagens.Delete(FIndiceAtual - indice);
      Inc(indice);
      if FListaImagens.Count = 0 then
        Exit;
    end;

    if FileExists(FListaImagens[FIndiceAtual - 1]) then
    begin
      FProximaImagemEsquerda.LoadFromFile(FListaImagens[FIndiceAtual - 1]);
    end;

    FProximaImagemDireita.LoadFromFile(FListaImagens[FIndiceAtual + 3]);
  end else begin
    FProximaImagemDireita.Assign(nil);
  end;
end;

procedure TImageViewer.SelecionaImagemEsquerda;
begin
  if FImagemEsquerda.Picture.Height = 0 then
  begin
    // sem imagem;
    Exit;
  end;

  FProximaImagemDireita.Assign(FImagemDireita.Picture);
  FImagemDireita.Picture.Assign(FImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(FImagemEsquerda.Picture);
  FImagemEsquerda.Picture.Assign(FProximaImagemEsquerda);

  Dec(FIndiceAtual);
  if (FIndiceAtual > 0) then
  begin
    var indice: Integer := 1;
    while not FileExists(FListaImagens[FIndiceAtual - indice]) do
    begin
      FListaImagens.Delete(FIndiceAtual - indice);
      Dec(indice);
      if FListaImagens.Count = 0 then
        Exit;
    end;

    if FileExists(FListaImagens[FIndiceAtual - 1]) then
    begin
      var imgGenerica: TGraphic := TClassificaImagem.GetImage(FListaImagens[FIndiceAtual - 1]);
      FProximaImagemEsquerda.Assign(imgGenerica);
      imgGenerica.Free;
    end;
  end else begin
    FProximaImagemEsquerda.Assign(nil);
  end;
end;

procedure TImageViewer.SetIntervaloEmSegundos(const Value: Cardinal);
begin
  FTimer.Interval := Value * 1000;
end;

procedure TImageViewer.SetNomePasta(const Value: string);
begin
  if FNomePasta <> Value then
  begin
    FNomePasta := Value;

    if TDirectory.Exists(FNomePasta) then
    begin
      FIndiceAtual := 0;
      FListaImagens.Clear;
      var listaImagens: TStringDynArray := TDirectory.GetFiles(FNomePasta, '*.jpg');

      for var img: string in listaImagens do
      begin
        FListaImagens.Add(img);
      end;

      var i: Integer := 0;
      while i < 4 do
      begin
        if i >= FListaImagens.Count then
        begin
          Break;
        end;

        case i of
          0:
          begin
            FImagemEsquerda.Picture.LoadFromFile(FListaImagens[i]);
          end;

          1:
          begin
            FImagemPrincipal.Picture.LoadFromFile(FListaImagens[i]);
          end;

          2:
          begin
            FImagemDireita.Picture.LoadFromFile(FListaImagens[i]);
          end;

          3:
          begin
            FProximaImagemDireita.LoadFromFile(FListaImagens[i]);
          end;
        end;

        Inc(i);
      end;
    end;
  end;
end;

procedure TImageViewer.SetPresent(const Value: Boolean);
begin
  FPresent := Value;
  if FPresent then
  begin
    Apresentar;
  end else begin
    FTimer.Enabled := False;
  end;
end;

end.
