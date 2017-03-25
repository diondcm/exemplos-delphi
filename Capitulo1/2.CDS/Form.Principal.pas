unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Classe.Livro;

type
  TfrmPrincipal = class(TForm)
    dbgLivros: TDBGrid;
    dtsLivros: TDataSource;
    cdsLivros: TClientDataSet;
    OpenDialog: TOpenDialog;
    pnlDados: TPanel;
    btnSalvar: TButton;
    cdsLivrosID: TIntegerField;
    cdsLivrosISBN: TStringField;
    cdsLivrosTitulo: TStringField;
    cdsLivrosAutor: TStringField;
    cdsLivrosIdioma: TStringField;
    dbnLivros: TDBNavigator;
    btnCriarClasse: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCriarClasseClick(Sender: TObject);
  private const
    ARQ_LIVROS = 'Livros.xml';
  private
    procedure ValidarSetID(pLivro: TObject);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCriarClasseClick(Sender: TObject);
var
  lLivro: TLivro;
begin
  lLivro := TLivro.Create;

  lLivro.Dts := cdsLivros;
  lLivro.OnSetID := ValidarSetID;

//  try finally-- próximas aulas
  lLivro.ID := 3;
  lLivro.ISBN := '324543253245';
  lLivro.Titulo := 'Memórias de Bras Cubas';
  lLivro.Autor := 'Machado de Assis';
  lLivro.Idioma := 'Português';

  lLivro.SaveToDataSet;

  lLivro.Free;

//  FDts.First;
//  while (not FDts.Eof) do
//  begin
//    if (FDts.FieldByName('ID').AsInteger = Value) then
//    begin
//      raise Exception.Create('ID de livro já cadastrado.');
//    end;
//    FDts.Next;
//  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if FileExists(ARQ_LIVROS) then
  begin
    cdsLivros.LoadFromFile(ARQ_LIVROS);
  end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  cdsLivros.SaveToFile(ARQ_LIVROS, dfXML);
end;

procedure TfrmPrincipal.ValidarSetID(pLivro: TObject);
begin
  cdsLivros.SetKey;
  cdsLivros.FieldByName('ID').AsInteger := (pLivro as TLivro).ID;
  if cdsLivros.GotoKey then
  begin
    raise Exception.Create('Livro já cadastrado');
  end;
end;

end.
