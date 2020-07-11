unit Form.Filtros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.ComCtrls;

type
  TfrmFiltros = class(TForm)
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
    PanelControles: TPanel;
    ButtonFiltro: TButton;
    ButtonCancelar: TButton;
    PanelFIltro1: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    CheckBoxData: TCheckBox;
    Label1: TLabel;
    MonthCalendar1: TMonthCalendar;
    MonthCalendar2: TMonthCalendar;
    Label2: TLabel;
    Label3: TLabel;
    CheckBoxCodigo: TCheckBox;
    Label4: TLabel;
    EditCodCliente: TEdit;
    CheckBoxNome: TCheckBox;
    Label5: TLabel;
    EditNomeCliente: TEdit;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltros: TfrmFiltros;

implementation

{$R *.dfm}

procedure TfrmFiltros.ButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiltros.ButtonFiltroClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
