unit Form.Cadastro.Paises;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Edit, Data.Paises, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Controls, Fmx.Bind.Navigator;

type
  TfrmCadPaises = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    Layout2: TLayout;
    buttonSalvar: TButton;
    buttonCancelar: TButton;
    editCode: TEdit;
    editName: TEdit;
    editCapital: TEdit;
    editArea: TEdit;
    editPopulation: TEdit;
    editContinent: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    NavigatorBindSourceDB1: TBindNavigator;
    procedure FormShow(Sender: TObject);
    procedure buttonSalvarClick(Sender: TObject);
    procedure buttonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPaises: TfrmCadPaises;

implementation

{$R *.fmx}

procedure TfrmCadPaises.buttonCancelarClick(Sender: TObject);
begin
  dmdPaises.qryDBPaises.Cancel;
  Close;
end;

procedure TfrmCadPaises.buttonSalvarClick(Sender: TObject);
begin
  dmdPaises.qryDBPaises.Post;
  Close;
end;

procedure TfrmCadPaises.FormShow(Sender: TObject);
begin
  dmdPaises.Carregar;
end;

end.
