unit Form.Cadastro.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.Pessoa, Data.DB, Vcl.ComCtrls;

type
  TfrmCadPessoa = class(TForm)
    Label1: TLabel;
    editCodigo: TDBEdit;
    panelControles: TPanel;
    buttonSalvar: TBitBtn;
    buttonCancelar: TBitBtn;
    dtsPessoa: TDataSource;
    labelNome: TLabel;
    editNome: TDBEdit;
    dateEditDataNascimento: TDateTimePicker;
    Label2: TLabel;
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

{$R *.dfm}

procedure TfrmCadPessoa.buttonCancelarClick(Sender: TObject);
begin
  dmdPessoa.cdsPessoa.Cancel;
end;

procedure TfrmCadPessoa.buttonSalvarClick(Sender: TObject);
begin
  dmdPessoa.cdsPessoa.FieldByName('data_nascimento').AsString := DateToStr(dateEditDataNascimento.Date);
  dmdPessoa.cdsPessoa.Post;
end;

end.
