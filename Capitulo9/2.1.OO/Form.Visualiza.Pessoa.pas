unit Form.Visualiza.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Classe.Pessoa,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit;

type
  TfrmVisualizaPessoa = class(TForm)
    ValueListEditor: TValueListEditor;
    Panel1: TPanel;
    buttonClose: TBitBtn;
    procedure buttonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Visualiza(pPessoa: TPessoa);
  end;

var
  frmVisualizaPessoa: TfrmVisualizaPessoa;

implementation

{$R *.dfm}

procedure TfrmVisualizaPessoa.buttonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizaPessoa.Visualiza(pPessoa: TPessoa);
begin
  ValueListEditor.Strings.Text := pPessoa.ToString;

//  ValueListEditor.Strings.Clear;
//  ValueListEditor.Strings.Add(pPessoa.ToString);
//  ValueListEditor.Strings.Add('ID=' + pPessoa.ID.ToString);
//  ValueListEditor.Strings.Add('Nome=' + pPessoa.Nome);
//  ValueListEditor.Strings.Add('Código=' + pPessoa.Codigo.ToString);
//  ValueListEditor.Strings.Add('Data nascimento=' + DateToStr(pPessoa.DataNascimento));
//  ValueListEditor.Strings.Add('Renda=' + FormatCurr('##0.,00', pPessoa.Renda));
//  ValueListEditor.Strings.Add('CPF=' + pPessoa.CPF);
  Self.ShowModal;
end;

end.
