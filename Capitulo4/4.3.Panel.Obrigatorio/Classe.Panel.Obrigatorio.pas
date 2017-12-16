unit Classe.Panel.Obrigatorio;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB, Vcl.DBCtrls,
  Vcl.Graphics, Dialogs, Generics.Collections;

type
  // Todo: TEditConfig = class(TPersistent)
  TEditConfig = class(TComponent)
  private
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FBevelKind: TBevelKind;
    FBevelWidth: TBevelWidth;
    FColor:  TColor;
    procedure PreencheProps(pBevelInner: TBevelCut; pBevelOuter: TBevelCut; pBevelKind: TBevelKind; pBevelWidth: TBevelWidth; pColor:  TColor);
  public
    constructor Create(pControl: TDBEdit); overload;
  published
    property BevelInner: TBevelCut read FBevelInner write FBevelInner;
    property BevelOuter: TBevelCut read FBevelOuter write FBevelOuter;
    property BevelKind: TBevelKind read FBevelKind write FBevelKind;
    property BevelWidth: TBevelWidth read FBevelWidth write FBevelWidth;
    property Color:  TColor read FColor write FColor default clRed;
  end;

  TPanelObrigatorioCustom = class(TCustomPanel)
  private const
    CAMPO_OBRIGATORIO = 'Campo %s é obrigatório';
  private
    FListaComps: TDictionary<TControl, TEditConfig>;

    FOldOnBeforePost: TDataSetNotifyEvent;
    FDataSource: TDataSource;
    FDesenhaObrigatorios: Boolean;
    FMensagem: string;
    FDestaqueCampoObrigatorio: TEditConfig;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetMensagem(const Value: string);
  protected
    function GetMensagem: string; virtual;
    procedure OnBeforePostDataSet(DataSet: TDataSet);
    procedure CreateParams(var Params: TCreateParams); override;

    function ValidaCamposObrigatorios: string; virtual;

    property DesenhaObrigatorios: Boolean read FDesenhaObrigatorios write FDesenhaObrigatorios;
    property DataSource: TDataSource read FDataSource write SetDataSource;

    property DestaqueCampoObrigatorio: TEditConfig read FDestaqueCampoObrigatorio write FDestaqueCampoObrigatorio;
    property Mensagem: string read FMensagem write SetMensagem;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TPanelObrigatorio = class(TPanelObrigatorioCustom)
  public
    function ValidaCamposObrigatorios: string; override;
  published
    property Align;
    property DataSource;
    property DestaqueCampoObrigatorio;
    property DesenhaObrigatorios stored False;
  end;

implementation


{ TPanelObrigatorio }

constructor TPanelObrigatorioCustom.Create(AOwner: TComponent);
begin
  inherited;
  FDesenhaObrigatorios := True;
  FListaComps := TDictionary<TControl, TEditConfig>.Create;
  FDestaqueCampoObrigatorio := TEditConfig.Create(Self);

  FDestaqueCampoObrigatorio.BevelInner := bvSpace;
  FDestaqueCampoObrigatorio.BevelOuter := bvRaised;
  FDestaqueCampoObrigatorio.BevelKind := bkTile;
  FDestaqueCampoObrigatorio.BevelWidth := 2;
  FDestaqueCampoObrigatorio.Color := clRed;
end;

procedure TPanelObrigatorioCustom.CreateParams(var Params: TCreateParams);
begin
  inherited;
  BevelOuter := bvNone;
  Caption := '';
  ShowCaption := False;
end;

destructor TPanelObrigatorioCustom.Destroy;
begin
  FListaComps.Free;
  inherited;
end;

function TPanelObrigatorioCustom.GetMensagem: string;
begin
  Result := FMensagem;
  if FMensagem = '' then
    Result := CAMPO_OBRIGATORIO;
end;

procedure TPanelObrigatorioCustom.OnBeforePostDataSet(DataSet: TDataSet);
var
  lValida: Boolean;
begin
  lValida := True;
  if FDesenhaObrigatorios then
  begin
    lValida := ValidaCamposObrigatorios = '';
  end;

  if lValida then
  begin
    if Assigned(FOldOnBeforePost) then
      FOldOnBeforePost(DataSet);
  end else begin
    Abort;
  end;
end;

procedure TPanelObrigatorioCustom.SetDataSource(const Value: TDataSource);
begin
  if FDataSource <> Value then
  begin
    FDataSource := Value;
    if Assigned(FDataSource) and Assigned(FDataSource.DataSet) then
    begin
      if not (csDesigning in ComponentState) then
      begin
        if Assigned(FDataSource.DataSet.BeforePost) then
        begin
          FOldOnBeforePost := FDataSource.DataSet.BeforePost;
        end else begin
          FOldOnBeforePost := nil;
        end;

        FDataSource.DataSet.BeforePost := OnBeforePostDataSet;
      end;
    end else begin
      FOldOnBeforePost := nil;
    end;
  end;
end;

procedure TPanelObrigatorioCustom.SetMensagem(const Value: string);
begin
  if (Value <> '') and (Pos('%', Value) = 0) then
  begin
    raise Exception.Create('Informe o "%s" para preenchimento dinâmico pelo format.');
  end;

  FMensagem := Value;
end;

function TPanelObrigatorioCustom.ValidaCamposObrigatorios: string;
var
  i: Integer;
begin
  Result := '';
  if Assigned(FDataSource) and Assigned(FDataSource.DataSet) then
  begin
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
end;

{ TPanelObrigatorio }

function TPanelObrigatorio.ValidaCamposObrigatorios: string;
begin
  Result := inherited;
end;

{ TEditConfig }

procedure TEditConfig.PreencheProps(pBevelInner, pBevelOuter: TBevelCut; pBevelKind: TBevelKind; pBevelWidth: TBevelWidth;
  pColor: TColor);
begin
  FBevelInner :=  pBevelInner;
  FBevelOuter := pBevelOuter;
  FBevelKind := pBevelKind;
  FBevelWidth := pBevelWidth;
  FColor := pColor;
end;

constructor TEditConfig.Create(pControl: TDBEdit);
begin
  inherited Create(pControl);
  PreencheProps(pControl.BevelInner, pControl.BevelOuter, pControl.BevelKind, pControl.BevelWidth, pControl.Color);
end;

end.
