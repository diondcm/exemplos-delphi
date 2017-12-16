unit Classe.Panel.Obrigatorio;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB, Vcl.DBCtrls,
  Vcl.Graphics;

type
  TPanelObrigatorioCustom = class(TCustomPanel)
  private
    FDataSource: TDataSource;
    FDesenhaObrigatorios: Boolean;
  protected
    procedure CreateParams(var Params: TCreateParams); override;

    function ValidaCamposObrigatorios: string; virtual;

    property DesenhaObrigatorios: Boolean read FDesenhaObrigatorios write FDesenhaObrigatorios;
    property DataSource: TDataSource read FDataSource write FDataSource;
  end;

  TPanelObrigatorio = class(TPanelObrigatorioCustom)
  public
    function ValidaCamposObrigatorios: string; override;
  published
    property DataSource;
    property DesenhaObrigatorios;
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

end.
