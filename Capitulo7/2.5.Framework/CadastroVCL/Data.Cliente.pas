unit Data.Cliente;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB, Data.Conexao;

type
  [TAtributoGerador('ID_CLIENTE', 'GEN_CLIENTE')]
  TdmdCliente = class(TdmdBaseCadastro)
    qryCliente: TFDQuery;
    ADOQuery1: TADOQuery;
    qryClienteID_CLIENTE: TIntegerField;
    qryClienteCODIGO: TIntegerField;
    qryClienteNOME: TStringField;
    qryClienteDATA_CADASTRO: TSQLTimeStampField;
    qryClienteSALDO_DISPONIVEL: TBCDField;
    procedure DataModuleCreate(Sender: TObject);

  private
  protected
    procedure AtribuiSQL; override;

  public

    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdCliente.AtribuiSQL;
begin
  inherited;
  qryCliente.SQL.Text := FSQL.Text;
end;

procedure TdmdCliente.DataModuleCreate(Sender: TObject);
begin
  inherited;
  DataSet := qryCliente;
  FSQL.Text := qryCliente.SQL.Text;

  // DataSet := adoQuery;
end;

end.
