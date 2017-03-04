unit Form.Layout2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  System.Rtti, FMX.Grid.Style, Data.Bind.GenData, Data.Bind.Controls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Fmx.Bind.Navigator,
  Data.Bind.ObjectScope, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid;

type
  TfrmLayout2 = class(TForm)
    lytPrincipal: TLayout;
    StringGrid1: TStringGrid;
    PrototypeBindSource1: TPrototypeBindSource;
    NavigatorPrototypeBindSource1: TBindNavigator;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
