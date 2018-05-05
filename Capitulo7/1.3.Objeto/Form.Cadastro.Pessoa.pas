unit Form.Cadastro.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Classe.Pessoa,
  Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmCadastroPessoa = class(TForm)
    memoLog: TMemo;
    PopupMenu: TPopupMenu;
    ExibePessoa1: TMenuItem;
    panelControles: TPanel;
    editNome: TEdit;
    labelNome: TLabel;
    labelID: TLabel;
    editCPF: TMaskEdit;
    labelCPF: TLabel;
    buttonSalvaPessoa: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Teste(Sender: TObject);
    procedure buttonSalvaPessoaClick(Sender: TObject);
    procedure ExibePessoa1Click(Sender: TObject);
  private
    FPessoa: TPessoa;
    procedure LoadPessoa(pPessoa: TPessoa);
    procedure UnLoadPessoa(pPessoa: TPessoa);
  public
    procedure SetPessoa(pPessoa: TPessoa); deprecated 'Utilizar metodo Y na unit X';
  end;

var
  frmCadastroPessoa: TfrmCadastroPessoa;

implementation

{$R *.dfm}

{ TfrmCadastroPessoa }

procedure TfrmCadastroPessoa.buttonSalvaPessoaClick(Sender: TObject);
begin
  UnLoadPessoa(FPessoa);
//  ShowMessage('Pessoa salva com sucesso.');
  Caption := TimeToStr(Now);
end;

procedure TfrmCadastroPessoa.ExibePessoa1Click(Sender: TObject);
begin
  memoLog.Lines.Add('');
  memoLog.Lines.Add(FPessoa.ToString);
end;

procedure TfrmCadastroPessoa.FormCreate(Sender: TObject);
begin
   {$Warnings OFF}
   {$Warnings ON}

//   {$WARNING  'Teste'}

   {$WARN SYMBOL_PLATFORM OFF}

  memoLog.Visible := (DebugHook > 0);
   {$WARN SYMBOL_PLATFORM ON}
  SetPessoa(nil);
end;

procedure TfrmCadastroPessoa.LoadPessoa(pPessoa: TPessoa);
begin
  editNome.Text := pPessoa.Nome;
  labelID.Caption := Format('ID: %d', [pPessoa.ID]);
  editCPF.Text := pPessoa.CPF;
end;

procedure TfrmCadastroPessoa.SetPessoa(pPessoa: TPessoa);
begin
  if Assigned(pPessoa) then
  begin
    FPessoa := pPessoa;
  end else begin
    FPessoa := TPessoa.Create;
  end;
  LoadPessoa(FPessoa);
end;

procedure TfrmCadastroPessoa.UnLoadPessoa(pPessoa: TPessoa);
begin
  pPessoa.Nome := editNome.Text;
  pPessoa.CPFFormatado := editCPF.Text;
end;

procedure TfrmCadastroPessoa.Teste(Sender: TObject);
begin
  //
end;

end.
