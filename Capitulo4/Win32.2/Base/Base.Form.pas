unit Base.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Base.Form.Ajuda, System.ImageList, Vcl.ImgList;

type
  TfrmBase = class(TForm)
    MainMenu: TMainMenu;
    menuAjuda: TMenuItem;
    menuSobre: TMenuItem;
    ImageList: TImageList;
    procedure menuSobreClick(Sender: TObject);
  private
    class var FFormAjudaClass: TfrmBaseAjudaClass;
  public
    class property FormAjudaClass: TfrmBaseAjudaClass read FFormAjudaClass write FFormAjudaClass;
  end;

//var
//  frmBase: TfrmBase;
// Este form não deve ser instânciado

implementation

{$R *.dfm}

procedure TfrmBase.menuSobreClick(Sender: TObject);
begin
//  FFormAjudaClass := FFormAjudaClass.Create(Application);
//  FFormAjudaClass.Show;

//  TfrmBaseAjuda.Create(Application).Show;

  FFormAjudaClass.Create(Application).Show;
end;

end.
