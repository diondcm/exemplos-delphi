unit Data.Base;

interface

uses
  System.SysUtils, System.Classes, Data.Conexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Variants;

type
  TdmdBase = class(TDataModule)
    qryDados: TFDQuery;
    SQLDados: TSQLDataSet;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryDadosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// este não deve ser instanciado
//var
//  dmdBase: TdmdBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdBase.DataModuleCreate(Sender: TObject);
begin
  for var i: Integer := 0 to Self.ComponentCount -1 do
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
  lField: TField;
  lObrigatorio: string;
begin
  for lField in DataSet.Fields do
  begin
    if lField.Required and (lField.IsNull or VarIsEmpty(lField.Value)) then
    begin
      lObrigatorio := lObrigatorio + sLineBreak + lField.DisplayName;
    end;
  end;

  if lObrigatorio <> '' then
  begin
    raise Exception.Create('Campos obrigatórios não informados: ' + lObrigatorio);
  end;
end;

end.
