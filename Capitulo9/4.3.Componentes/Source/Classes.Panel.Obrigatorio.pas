unit Classes.Panel.Obrigatorio;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Data.DB, Vcl.Dialogs,
  Vcl.DBCtrls, Vcl.Graphics, System.Generics.Collections;

type
  TListaControles = class(TList<TWinControl>);

  TNotificaPanel = procedure (Sender: TObject; Index: Integer) of object;

  TEditConfig = class(TComponent)
  private
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FBevelKind: TBevelKind;
    FBevelWidth: TBevelWidth;
    FColor: TColor;
    procedure PreencheProps(pBevelInner: TBevelCut; pBevelOuter: TBevelCut; pBevelKind: TBevelKind; pBevelWidth: TBevelWidth; pColor:  TColor);
  public
    constructor Create(pControl: TDBEdit); reintroduce; overload;
  published
    property BevelInner: TBevelCut read FBevelInner write FBevelInner;
    property BevelOuter: TBevelCut read FBevelOuter write FBevelOuter;
    property BevelKind: TBevelKind read FBevelKind write FBevelKind;
    property BevelWidth: TBevelWidth read FBevelWidth write FBevelWidth;
    property Color: TColor read FColor write FColor default clRed;
  end;

  TCustomPanelObrigatorio = class(TCustomPanel)
  private const
    CAMPO_OBRIGATORIO = 'Campo %s é obrigatório';
  private
    FListaComps: TDictionary<TControl, TEditConfig>;
    FOldBeforePost: TDataSetNotifyEvent;
    FDataSource: TDataSource;
    FAtivo: Boolean;
    FDesenhaObrigatorios: Boolean;
    FMensagem: string;
    FDestaqueCampoObrigatorio: TEditConfig;
    FNotifica: TNotificaPanel;
    FConfiguraTabOrder: Boolean;
    procedure SetDataSource(const Value: TDataSource);
  protected
    procedure DoConfiguraTabOrder(pListaNaoPreenchidos: TListaControles = nil);
    procedure CreateParams(var Params: TCreateParams); override;
    function GetMensagem: string; virtual;
    function ValidaObrigatorios: string;
    procedure OnBeforePostDts(DataSet: TDataSet);
    property Ativo: Boolean read FAtivo write FAtivo;
    property DataSource: TDataSource read FDataSource write SetDataSource;
    property Mensagem: string read FMensagem write FMensagem;
    property DesenhaObrigatorios: Boolean read FDesenhaObrigatorios write FDesenhaObrigatorios;
    property ConfigEditObrigatorio: TEditConfig read FDestaqueCampoObrigatorio write FDestaqueCampoObrigatorio;
    property ConfiguraTabOrder: Boolean read FConfiguraTabOrder write FConfiguraTabOrder;
    property OnNotifica: TNotificaPanel read FNotifica write FNotifica;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TPanelObrigatorio = class(TCustomPanelObrigatorio)
  published
    property Align;
    property Ativo default True;
    property DataSource;
    property Mensagem;
    property DesenhaObrigatorios;
    property ConfigEditObrigatorio;
    property ConfiguraTabOrder stored FAtivo;
    property OnNotifica;
  end;

implementation

{ TCustomPanelObrigatorio }

procedure TCustomPanelObrigatorio.DoConfiguraTabOrder(pListaNaoPreenchidos: TListaControles);
begin
  var listaTops: TList<Integer> := TList<Integer>.Create;
  var listaFinal: TList<TWinControl> := TList<TWinControl>.Create;
  var listaCompsTops: TDictionary<Integer, TWinControl> := TDictionary<Integer, TWinControl>.Create;

  for var i: Integer := 0 to Self.ControlCount - 1 do
  begin
    if (Self.Controls[i] is TWinControl) then
    begin
      if not listaCompsTops.ContainsKey(Self.Controls[i].Top) then
      begin
        listaTops.Add(Self.Controls[i].Top);
        listaCompsTops.Add(Self.Controls[i].Top, Self.Controls[i] as TWinControl);
      end;
    end;
  end;

  listaTops.Sort;

  var count: integer := 0;
  for var top: Integer in listaTops do
  begin
    if (listaCompsTops[top] is TWinControl) then
    begin
      TWinControl(listaCompsTops[top]).TabOrder := count;
      listaFinal.Add(listaCompsTops[top]);
    end;
    Inc(count);
  end;

  if Assigned(pListaNaoPreenchidos) then
  begin
    var primeiroCtrl: TWinControl := nil;
    var primeiroIndex: Integer := listaFinal.Count;
    for var ctrl: TWinControl in pListaNaoPreenchidos do
    begin
      if primeiroIndex > listaFinal.IndexOf(ctrl) then
      begin
        primeiroIndex := listaFinal.IndexOf(ctrl);
        primeiroCtrl := ctrl;
      end;

      listaFinal.Move(listaFinal.IndexOf(ctrl), listaFinal.Count -1);
    end;

    var index: integer := 0;
    for var controle: TWinControl in listaFinal do
    begin
      controle.TabOrder := index;
      Inc(index);
    end;

    if Assigned(primeiroCtrl) and primeiroCtrl.CanFocus then
    begin
      primeiroCtrl.SetFocus;
    end;
  end;

  listaFinal.Free;
  listaCompsTops.Free;
  listaTops.Free;
end;

constructor TCustomPanelObrigatorio.Create(AOwner: TComponent);
begin
  inherited;
  FListaComps := TDictionary<TControl, TEditConfig>.Create;

  if not(csDesigning in ComponentState) then
  begin
    if Assigned(FNotifica) then
    begin
      FNotifica(Self, -1);
    end;
  end;

  FDestaqueCampoObrigatorio := TEditConfig.Create(Self);

  FDestaqueCampoObrigatorio.BevelInner := bvSpace;
  FDestaqueCampoObrigatorio.BevelOuter := bvRaised;
  FDestaqueCampoObrigatorio.BevelKind := bkTile;
  FDestaqueCampoObrigatorio.BevelWidth := 2;
  FDestaqueCampoObrigatorio.Color := clRed;

  FAtivo := True;
  FDesenhaObrigatorios := True;
end;

procedure TCustomPanelObrigatorio.CreateParams(var Params: TCreateParams);
var
  lDts: TDataSource;
begin
  inherited;
//  Caption := '';
//  ShowCaption := False;
  Alignment := taRightJustify;
  BevelOuter := bvNone;
  AlignWithMargins := True;

  if Assigned(FDataSource) then
  begin
    // Resolve problema de sincronia no create do Dts
    lDts := FDataSource;
    SetDataSource(nil);
    SetDataSource(lDts);
  end;

  if FConfiguraTabOrder then
  begin
    DoConfiguraTabOrder;
  end;
end;

destructor TCustomPanelObrigatorio.Destroy;
begin
  FListaComps.Free;
  inherited;
end;

function TCustomPanelObrigatorio.GetMensagem: string;
begin
  Result := FMensagem;
  if FMensagem = '' then
    Result := CAMPO_OBRIGATORIO;
end;

procedure TCustomPanelObrigatorio.OnBeforePostDts(DataSet: TDataSet);
var
  lCamposValidos: Boolean;
  lMsgObrigatorios: string;
begin
  if FAtivo then
  begin
    lMsgObrigatorios := ValidaObrigatorios;
    lCamposValidos := lMsgObrigatorios = ''; // campos estão Ok

    if lCamposValidos then
    begin
      if Assigned(FOldBeforePost) then
      begin
        FOldBeforePost(DataSet);
      end;
    end else begin
      ShowMessage(lMsgObrigatorios);
      Abort;
    end;
  end else begin
    if Assigned(FOldBeforePost) then
    begin
      FOldBeforePost(DataSet);
    end;
  end;
end;

procedure TCustomPanelObrigatorio.SetDataSource(const Value: TDataSource);
begin
  if FDataSource <> Value then
  begin
    FDataSource := Value;
    FOldBeforePost := nil;

    if Assigned(FDataSource) and Assigned(FDataSource.DataSet) then
    begin
      if not(csDesigning in ComponentState) then
      begin
        if Assigned(FDataSource.DataSet.BeforePost) then
        begin
          FOldBeforePost := FDataSource.DataSet.BeforePost;
        end;

        FDataSource.DataSet.BeforePost := OnBeforePostDts
      end;
    end;
  end;
end;

function TCustomPanelObrigatorio.ValidaObrigatorios: string;
var
  i: Integer;
begin
  Result := '';

  var listCompsNaoPreenchidos: TListaControles := TListaControles.Create;

  if FDataSource.DataSet.FieldCount > 0 then
  begin
    for i := 0 to Self.ControlCount  -1 do
    begin
      if Self.Controls[i].GetTextLen = 0 then
      begin
        if Self.Controls[i] is TDBEdit then
        begin
          if TDBEdit(Self.Controls[i]).Field.Required then
          begin
            if FConfiguraTabOrder then
            begin
              listCompsNaoPreenchidos.Add(TDBEdit(Self.Controls[i]));
            end;

            if FDesenhaObrigatorios then
            begin
              if not FListaComps.ContainsKey(Self.Controls[i]) then
              begin
                FListaComps.Add(Self.Controls[i], TEditConfig.Create(TDBEdit(Self.Controls[i])));
              end;

              TDBEdit(Self.Controls[i]).BevelInner := FDestaqueCampoObrigatorio.BevelInner;
              TDBEdit(Self.Controls[i]).BevelOuter := FDestaqueCampoObrigatorio.FBevelOuter;
              TDBEdit(Self.Controls[i]).BevelKind := FDestaqueCampoObrigatorio.BevelKind;
              TDBEdit(Self.Controls[i]).BevelWidth := FDestaqueCampoObrigatorio.BevelWidth;
              TDBEdit(Self.Controls[i]).Color := FDestaqueCampoObrigatorio.Color;
            end;
            Result := Result + sLineBreak + Format(GetMensagem, [TDBEdit(Self.Controls[i]).Field.DisplayLabel]);
          end;
        end;
      end else begin
        if FDesenhaObrigatorios and FListaComps.ContainsKey(Self.Controls[i]) then
        begin
          if Self.Controls[i] is TDBEdit then
          begin
            TDBEdit(Self.Controls[i]).BevelInner := FListaComps[Self.Controls[i]].FBevelInner;
            TDBEdit(Self.Controls[i]).BevelOuter := FListaComps[Self.Controls[i]].FBevelOuter;
            TDBEdit(Self.Controls[i]).BevelKind := FListaComps[Self.Controls[i]].FBevelKind;
            TDBEdit(Self.Controls[i]).BevelWidth := FListaComps[Self.Controls[i]].FBevelWidth;
            TDBEdit(Self.Controls[i]).Color := FListaComps[Self.Controls[i]].FColor;

            FListaComps.Remove(Self.Controls[i]);
          end;
        end;
      end;
    end;
  end;

  if FConfiguraTabOrder then
  begin
    DoConfiguraTabOrder(listCompsNaoPreenchidos);
  end;

  listCompsNaoPreenchidos.Free;
end;

{ TEditConfig }

constructor TEditConfig.Create(pControl: TDBEdit);
begin
  inherited Create(pControl);
  PreencheProps(pControl.BevelInner, pControl.BevelOuter, pControl.BevelKind, pControl.BevelWidth, pControl.Color);
end;

procedure TEditConfig.PreencheProps(pBevelInner, pBevelOuter: TBevelCut;
  pBevelKind: TBevelKind; pBevelWidth: TBevelWidth; pColor: TColor);
begin
  FBevelInner :=  pBevelInner;
  FBevelOuter := pBevelOuter;
  FBevelKind := pBevelKind;
  FBevelWidth := pBevelWidth;
  FColor := pColor;
end;

end.
