unit Base.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Base.Data.Imagens;

type
  TfrmBase = class(TForm)
    MainMenu: TMainMenu;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmBase: TfrmBase;

implementation

{$R *.dfm}

procedure TfrmBase.Sobre1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

end.
