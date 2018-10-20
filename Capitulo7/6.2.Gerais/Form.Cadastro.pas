unit Form.Cadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TfrmCadastro = class(TForm)
    ToolBar1: TToolBar;
    ButtonClose: TButton;
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    Edit1: TEdit;
    Label1: TLabel;
    Layout2: TLayout;
    Edit2: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    Edit3: TEdit;
    Label3: TLabel;
    Layout4: TLayout;
    Edit4: TEdit;
    Label4: TLabel;
    Layout5: TLayout;
    Edit5: TEdit;
    Label5: TLabel;
    Layout6: TLayout;
    Edit6: TEdit;
    Label6: TLabel;
    Layout7: TLayout;
    Edit7: TEdit;
    Label7: TLabel;
    Layout8: TLayout;
    Button1: TButton;
    Button2: TButton;
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.fmx}

procedure TfrmCadastro.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.
