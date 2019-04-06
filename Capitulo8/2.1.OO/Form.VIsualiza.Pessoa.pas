unit Form.VIsualiza.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmVisualizaPessoa = class(TForm)
    MemoPessoa: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizaPessoa: TfrmVisualizaPessoa;

implementation

{$R *.dfm}

end.
