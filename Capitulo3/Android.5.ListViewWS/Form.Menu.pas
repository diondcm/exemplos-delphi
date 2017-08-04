unit Form.Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, Form.Principal, Form.Imagem;

type
  TfrmMenu = class(TForm)
    Layout1: TLayout;
    btnListView: TButton;
    btnImg: TButton;
    lblCentro: TLabel;
    procedure btnListViewClick(Sender: TObject);
    procedure btnImgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.fmx}

procedure TfrmMenu.btnImgClick(Sender: TObject);
begin
  frmImagem.Show;
end;

procedure TfrmMenu.btnListViewClick(Sender: TObject);
begin
  frmPrincipal.Show;
end;

end.
