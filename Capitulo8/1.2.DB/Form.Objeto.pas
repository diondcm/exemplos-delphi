unit Form.Objeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCliente = class
  private
    FID: Integer;
    FNome: string;
    FDataNascimento: TDateTime;
    FCPF: string;
    FDataCadastro: TDateTime;
    FCredito: Currency;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property CPF: string read FCPF write FCPF;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    property Credito: Currency read FCredito write FCredito;
  end;

  TfrmObjeto = class(TForm)
    MemoLog: TMemo;
    PanelControle: TPanel;
    ButtonPrintar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonPrintarClick(Sender: TObject);
  private
    FCliente: TCliente;
  public
    property Cliente: TCliente read FCliente write FCliente;
  end;

var
  frmObjeto: TfrmObjeto;

implementation

{$R *.dfm}

procedure TfrmObjeto.ButtonPrintarClick(Sender: TObject);
begin
  { ORM - Hibernate - Linq }
  MemoLog.Lines.Add('Cliente - ' + TimeToStr(Now));
  MemoLog.Lines.Add('ID: ' + FCliente.ID.ToString { IntToStr(FCliente.ID) });
  MemoLog.Lines.Add('Nome: ' + FCliente.Nome);
  MemoLog.Lines.Add('Data Nascimento: ' + DateToStr(FCliente.DataNascimento));
  MemoLog.Lines.Add('CPF: ' + FCliente.CPF);
  MemoLog.Lines.Add('Data Cadastro: ' + DateTimeToStr(FCliente.DataCadastro));
  MemoLog.Lines.Add('Crédito: ' + CurrToStr(FCliente.Credito));
end;

procedure TfrmObjeto.FormCreate(Sender: TObject);
begin
  FCliente := TCliente.Create;
end;

procedure TfrmObjeto.FormDestroy(Sender: TObject);
begin
  FCliente.Free;
end;

end.
