unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Sobre.Final, Vcl.Menus,
  Form.Sobre.Herdado, Form.Pesquisa.Categoria, Form.Pesquisa.Produto;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sobre1: TMenuItem;
    SobreHerdado1: TMenuItem;
    Cadastros1: TMenuItem;
    Categoria1: TMenuItem;
    Produtos1: TMenuItem;
    procedure Sobre1Click(Sender: TObject);
    procedure SobreHerdado1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  TfrmPesquisaCategoria.Create(Self).Show;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  TfrmPesquisaProduto.Create(Self).Show;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
  TfrmSobreFinal.Create(Self).ShowModal;
end;

procedure TfrmPrincipal.SobreHerdado1Click(Sender: TObject);
begin
  TfrmSobreHerdado.Create(Self).ShowModal;
end;

end.
