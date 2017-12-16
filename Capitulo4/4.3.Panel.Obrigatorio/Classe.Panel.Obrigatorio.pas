unit Classe.Panel.Obrigatorio;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB;

type
  TPanelObrigatorioCustom = class(TCustomPanel)
  private
    FDataSoure: TDataSource;
  protected
    procedure CreateParams(var Params: TCreateParams); override;




    property DataSource: TDataSource read FDataSoure write FDataSoure;
  end;

  TPanelObrigatorio = class(TPanelObrigatorioCustom)
  published
    property DataSource;
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

end.
