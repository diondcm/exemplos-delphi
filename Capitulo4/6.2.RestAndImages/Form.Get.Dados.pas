unit Form.Get.Dados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox, FMX.Layouts;

type
  TfrmGetDados = class(TForm)
    LayoutTabelas: TLayout;
    ComboTabelas: TComboBox;
    ListView1: TListView;
  private
    { Private declarations }
  private
      class var
      FInstance: TfrmGetDados;
  public
    class function GetInstance: TfrmGetDados;
  end;


implementation

{$R *.fmx}

{ TfrmGetClientes }

class function TfrmGetDados.GetInstance: TfrmGetDados;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TfrmGetDados.Create(Application);
  end;

  Result := FInstance;
end;

end.
