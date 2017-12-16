unit Classe.Panel.Obrigatorio;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB, Vcl.DBCtrls,
  Vcl.Graphics, Dialogs, Generics.Collections;

type
  TEditConfig = record
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FBevelKind: TBevelKind;
    FBevelWidth: TBevelWidth;
    FColor:  TColor;
    constructor Create(pBevelInner: TBevelCut; pBevelOuter: TBevelCut; pBevelKind: TBevelKind; pBevelWidth: TBevelWidth; pColor:  TColor);
  end;

  TPanelObrigatorioCustom = class(TCustomPanel)
  private
    // TODO: Implementar dictionary
    FOldOnBeforePost: TDataSetNotifyEvent;
    FDataSource: TDataSource;
    FDesenhaObrigatorios: Boolean;
    procedure SetDataSource(const Value: TDataSource);
  protected
    procedure OnBeforePostDataSet(DataSet: TDataSet);
    procedure CreateParams(var Params: TCreateParams); override;

    function ValidaCamposObrigatorios: string; virtual;

    property DesenhaObrigatorios: Boolean read FDesenhaObrigatorios write FDesenhaObrigatorios;
    property DataSource: TDataSource read FDataSource write SetDataSource;
  end;

  TPanelObrigatorio = class(TPanelObrigatorioCustom)
  public
    function ValidaCamposObrigatorios: string; override;
  published
    property Align;
    property DataSource;
    property DesenhaObrigatorios stored True; // default para Ordinais
  end;


implementation


{ TPanelObrigatorio }

procedure TPanelObrigatorioCustom.CreateParams(var Params: TCreateParams);
begin
  inherited;
  BevelOuter := bvNone;
  Caption := '';
  ShowCaption := False;
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
                TDBEdit(Self.Controls[i]).BevelInner := bvSpace;
                TDBEdit(Self.Controls[i]).BevelOuter := bvRaised;
                TDBEdit(Self.Controls[i]).BevelKind := bkTile;
                TDBEdit(Self.Controls[i]).BevelWidth := 2;
                TDBEdit(Self.Controls[i]).Color := clRed;
              end;
              Result := Result + sLineBreak + 'O campo ' + TDBEdit(Self.Controls[i]).Field.DisplayLabel + ' é obrigatório';// TODO: property mensagem
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

constructor TEditConfig.Create(pBevelInner, pBevelOuter: TBevelCut; pBevelKind: TBevelKind; pBevelWidth: TBevelWidth;
  pColor: TColor);
begin
  FBevelInner :=  pBevelInner;
  FBevelOuter := pBevelOuter;
  FBevelKind := pBevelKind;
  FBevelWidth := pBevelWidth;
  FColor := pColor;
end;

end.
