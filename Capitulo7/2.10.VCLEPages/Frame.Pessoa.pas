unit Frame.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfraPessoa = class(TFrame)
    panelPessoa: TPanel;
    panelControles: TPanel;
    buttonCriar: TButton;
    gridPessoas: TDBGrid;
    cdsPessoa: TClientDataSet;
    cdsPessoaCodigo: TIntegerField;
    cdsPessoaNome: TStringField;
    dtsPessoa: TDataSource;
    buttonSalvar: TButton;
    procedure buttonSalvarClick(Sender: TObject);
    procedure buttonCriarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraPessoa.buttonCriarClick(Sender: TObject);
begin
//  // não é no fields
//  cdsPessoa.FieldDefs.Clear;
//  cdsPessoa.FieldDefs.Add('codigo', ftInteger);
//  cdsPessoa.FieldDefs.Add('nome', ftString, 100);
  cdsPessoa.CreateDataSet;
//  cdsPessoa.Open;

  cdsPessoa.Append;
  cdsPessoa.FieldByName('codigo').AsInteger := 1;
  cdsPessoa.FieldByName('nome').AsString := 'Teste';
  cdsPessoa.Post;

  cdsPessoa.Append;
  cdsPessoa.FieldByName('codigo').AsInteger := 2;
  cdsPessoa.FieldByName('nome').AsString := 'Teste2';
  cdsPessoa.Post;
end;

procedure TfraPessoa.buttonSalvarClick(Sender: TObject);
begin
  cdsPessoa.SaveToFile('pessoas.xml', dfXML);
end;

end.
