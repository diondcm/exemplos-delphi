unit Data.Cliente;

interface

uses
  System.SysUtils, System.Classes, Data.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdCliente = class(TdmdBase)
    qryDadosID: TFDAutoIncField;
    qryDadosNOME: TWideStringField;
    qryDadosSALDO: TBCDField;
    qryDadosCPF: TWideStringField;
    qryDadosCODIGO: TIntegerField;
    qryDadosDATA_NASCIMENTO: TDateField;
    qryDadosRENDA: TBCDField;
    procedure qryDadosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure ValidaValoresDeSaldo(pSaldo: Currency);
    procedure GeraClientes(pQtdClientes: Integer; pDeletaAtuais: Boolean);
  end;

//var
//  dmdCliente: TdmdCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Classe.Pessoa;

{$R *.dfm}

procedure TdmdCliente.GeraClientes(pQtdClientes: Integer; pDeletaAtuais: Boolean);
var
  lPessoa: TPessoa;
begin
  qryDados.DisableControls;
  try
    if pDeletaAtuais then
    begin
     qryDados.Connection.ExecSQL('delete from cliente');
     qryDados.Connection.Commit;
    end;

    lPessoa := TPessoa.Create(True);
    for var i: Integer := 0 to pQtdClientes -1 do
    begin
      qryDados.Append;
      qryDadosNOME.AsString := lPessoa.Nome;
      qryDadosSALDO.AsCurrency := lPessoa.Saldo;
      qryDadosCPF.AsString := lPessoa.CPF;
      qryDadosCODIGO.AsInteger := lPessoa.Codigo;
      qryDadosDATA_NASCIMENTO.AsDateTime := lPessoa.DataNascimento;
      qryDadosRENDA.AsCurrency := lPessoa.Renda;
      try
        qryDados.Post;
      except
        on E: Exception do
        begin
          qryDados.Cancel;
//          raise Exception.Create(E.QualifiedClassName + ' - ' + E.Message);
        end;
      end;

      lPessoa.GeraValoresRandom;
    end;

    lPessoa.Free;
  finally
    qryDados.EnableControls;
  end;
end;

procedure TdmdCliente.qryDadosBeforePost(DataSet: TDataSet);
begin
  inherited;
  ValidaValoresDeSaldo(qryDadosSALDO.AsCurrency);
end;

procedure TdmdCliente.ValidaValoresDeSaldo(pSaldo: Currency);
begin
  if pSaldo = 0 then
    raise Exception.Create('Obrigatorio informar o Saldo maior que zero.');
  if pSaldo < 200 then
  begin
    raise Exception.Create('Saldo deve ser maior que R$ 200,00.');
  end;
  if pSaldo > 20000 then
  begin
    raise Exception.Create('Soldo deve ser menor que R$20.000,00.');
  end;
end;

end.
