unit Data.Base;

interface

uses
  System.SysUtils, System.Classes, Data.Conexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Variants;

type
  TdmdBase = class(TDataModule)
    qryDados: TFDQuery;
    sqlDados: TSQLDataSet;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryDadosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// Não vai ser utilizada
//var
//  dmdBase: TdmdBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdBase.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i] is TFDQuery then
    begin
      TFDQuery(Self.Components[i]).Connection := dmdConexao.FDConnection;
    end;
    if Self.Components[i] is TSQLDataSet then
    begin
      TSQLDataSet(Self.Components[i]).SQLConnection := dmdConexao.SQLConnection;
    end;
  end;
end;

procedure TdmdBase.qryDadosBeforePost(DataSet: TDataSet);
var
  lFileld: TField;
  lObrigatorio: string;
begin
  for lFileld in DataSet.Fields do
  begin
    if lFileld.Required and (lFileld.IsNull or VarIsEmpty(lFileld.Value)) then
    begin
      lObrigatorio := lObrigatorio + sLineBreak + lFileld.DisplayLabel;
    end;
  end;

  if lObrigatorio <> '' then
  begin
    raise Exception.Create('Campos obrigatórios não informados: ' + lObrigatorio);
  end;
end;

end.
