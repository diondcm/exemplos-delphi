unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.Cores,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListView, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Edit;

type
  TfrmPrincipal = class(TForm)
    ListView1: TListView;
    bindCores: TBindSourceDB;
    NavigatorbindCores: TBindNavigator;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Layout1: TLayout;
    btnConecta: TButton;
    edtValor: TEdit;
    edtDescicao: TEdit;
    RoundRect1: TRoundRect;
    edtID: TEdit;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkPropertyToFieldFillColor2: TLinkPropertyToField;
    LinkControlToField6: TLinkControlToField;
    procedure btnConectaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnConectaClick(Sender: TObject);
//var
//  li: Integer;
begin
  // todo: botão para fechar a qry
  //li := $FF;

  dmdCores.qryCores.Open;
  // UPX - compactador
end;

end.
