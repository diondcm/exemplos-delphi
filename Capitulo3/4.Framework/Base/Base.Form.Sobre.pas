unit Base.Form.Sobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmBaseSobre = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmBaseSobre: TfrmBaseSobre;

implementation

{$R *.dfm}

procedure TfrmBaseSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
