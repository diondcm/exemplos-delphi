unit Classe.Panel.Obrigatorio;

interface

uses
  System.Sysutils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB, Vcl.DBCtrls,
  Vcl.Graphics, Vcl.Dialogs, System.Generics.Collections;

type
  TEditConfig = class(TComponent)
  private
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FBevelKind: TBevelKind;
    FBevelWidth: TBevelWidth;
    FColor:  TColor;
    procedure PreencheProps(pBevelInner: TBevelCut; pBevelOuter: TBevelCut; pBevelKind: TBevelKind; pBevelWidth: TBevelWidth; pColor:  TColor);
  public
    constructor Create(pControl: TDBEdit); reintroduce; overload;
  published
    property BevelInner: TBevelCut read FBevelInner write FBevelInner;
    property BevelOuter: TBevelCut read FBevelOuter write FBevelOuter;
    property BevelKind: TBevelKind read FBevelKind write FBevelKind;
    property BevelWidth: TBevelWidth read FBevelWidth write FBevelWidth;
    property Color:  TColor read FColor write FColor default clRed;
  end;

  TCustomPanelObrigatorio = class(TCustomPanel)
  private const
    CAMPO_OBRIGATORIO = 'Campo %s é obrigatório';
  private
    FListaComps: TDictionary<TControl, TEditConfig>;
    FDataSource: TDataSource;
    FOldBeforePost: TDataSetNotifyEvent;
    FAtivo: Boolean;
    FMensagem: string;
    FDesenhaObrigatorios: Boolean;
    FDestaqueCampoObrigatorio: TEditConfig;
    procedure SetDataSource(const Value: TDataSource);
  protected
    function GetMensagem: string; virtual;
    procedure OnBeforePostDts(DataSet: TDataSet);
    procedure CreateParams(var Params: TCreateParams); override;
  public
    function ValidaObrigatorios: string;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property DataSource: TDataSource read FDataSource write SetDataSource;
    property Ativo: Boolean read FAtivo write FAtivo default True;
    property ConfigEditObrigatorio: TEditConfig read FDestaqueCampoObrigatorio write FDestaqueCampoObrigatorio;
    property DesenhaObrigatorios: Boolean read FDesenhaObrigatorios write FDesenhaObrigatorios default True;
    property Mensagem: string read FMensagem write FMensagem;
  end;

  TPanelObrigatorio = class(TCustomPanelObrigatorio)
  published
    property Align;
    property DataSource;
    property Ativo;
    property ConfigEditObrigatorio;
    property DesenhaObrigatorios;
    property Mensagem;
  end;


implementation

{ TCustomPanelObrigatorio }

constructor TCustomPanelObrigatorio.Create(AOwner: TComponent);
begin
  inherited;
  FListaComps := TDictionary<TControl, TEditConfig>.Create;

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
  BevelOuter := bvNone;
  AlignWithMargins := True;
  Caption := '';
  ShowCaption := False;

  if Assigned(FDataSource) then
  begin
    // Resolve problema de sincronia no create do Dts
    lDts := FDataSource;
    SetDataSource(nil);
    SetDataSource(lDts);
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
  lMsgObrigatorios := ValidaObrigatorios;
  lCamposValidos := lMsgObrigatorios = ''; // campos estão Ok

  if lCamposValidos then
  begin
    if Assigned(FOldBeforePost) then
    begin
      FOldBeforePost(DataSet);
    end;
  end else begin
    if FAtivo then
    begin
      ShowMessage(lMsgObrigatorios);
    end;

    Abort;
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
end;

{ TEditConfig }

constructor TEditConfig.Create(pControl: TDBEdit);
begin
  inherited Create(pControl);
  PreencheProps(pControl.BevelInner, pControl.BevelOuter, pControl.BevelKind, pControl.BevelWidth, pControl.Color);
end;

procedure TEditConfig.PreencheProps(pBevelInner, pBevelOuter: TBevelCut; pBevelKind: TBevelKind; pBevelWidth: TBevelWidth; pColor: TColor);
begin
  FBevelInner :=  pBevelInner;
  FBevelOuter := pBevelOuter;
  FBevelKind := pBevelKind;
  FBevelWidth := pBevelWidth;
  FColor := pColor;
end;

end.
