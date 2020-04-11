unit Data.Pessoa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Classe.Pessoa, FireDAC.Stan.StorageJSON;

type
  TdmdPessoa = class(TDataModule)
    memPessoa: TFDMemTable;
    memPessoaID: TIntegerField;
    memPessoaCodigo: TIntegerField;
    memPessoaNome: TStringField;
    memPessoaCPF: TStringField;
    memPessoaDataNascimento: TDateField;
    memPessoaRenda: TCurrencyField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdPessoa: TdmdPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
