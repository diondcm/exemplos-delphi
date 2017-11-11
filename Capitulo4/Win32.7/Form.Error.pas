unit Form.Error;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Erro.Custom, Classe.Mensagem;

type
  TfrmError = class(TForm)
    editValor: TEdit;
    buttonProcessaValor: TButton;
    chekAtivarLog: TCheckBox;
    Label1: TLabel;
    buttonSair: TButton;
    procedure buttonProcessaValorClick(Sender: TObject);
    procedure chekAtivarLogClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure buttonSairClick(Sender: TObject);
  private
    FAtivar: Integer;
  protected
    function ConverteValor(pValor: Integer): string; overload;
    function ConverteValor(const pValor: string): Integer; overload;
  public
    { Public declarations }
  end;

var
  frmError: TfrmError;

implementation

{$R *.dfm}

procedure TfrmError.buttonSairClick(Sender: TObject);
begin
  if TMensagem.Confirmacao('Deseja Sair da Aplicação?') then
  begin
    Application.Terminate;
  end;

//  if Application.MessageBox('Deseja Sair da Aplicação?', 'Atenção', MB_OKCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION) = IDYES then
//  begin
//    Application.Terminate;
//  end;
end;

procedure TfrmError.buttonProcessaValorClick(Sender: TObject);
var
  lValor: Integer;
begin
  try
    lValor := ConverteValor(editValor.Text);
    Caption := lValor.ToString;
  except
    on E: EConvertError do
    begin
      ShowMessage('Valor "' + editValor.Text + '" não é um número válido.');
    end;
//    on E: Exception do
//    begin
//
//    end;
  end;
end;

function TfrmError.ConverteValor(pValor: Integer): string;
begin
  Result := IntToStr(pValor);
end;

procedure TfrmError.chekAtivarLogClick(Sender: TObject);
begin
  ECustomError.LogAtivo := chekAtivarLog.Checked;
end;

function TfrmError.ConverteValor(const pValor: string): Integer;
begin
  try
    Result := StrToInt(pValor);
  except
    on E: Exception do
    begin
      raise ECustomError.Create(E);
    end;
  end;
end;

procedure TfrmError.FormClick(Sender: TObject);
begin
  Inc(FAtivar);
  chekAtivarLog.Visible := FAtivar > 5;
end;

end.
