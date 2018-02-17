unit Data.Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, ClientModuleUnit;

type
  TdmdDados = class(TDataModule)
    qryDados: TFDQuery;
    memDados: TFDMemTable;
  private
    { Private declarations }
  private
    class var
      FInstance: TdmdDados;
  public
    class function GetInstance: TdmdDados;

    function GetTabelas: string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses FMX.Forms;

{ TdmdDados }

class function TdmdDados.GetInstance: TdmdDados;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TdmdDados.Create(Application);
  end;

  Result := FInstance;
end;

function TdmdDados.GetTabelas: string;
begin
  Result:= ClientModule.GetDadosClient.GetListaTabelas;
end;

end.
