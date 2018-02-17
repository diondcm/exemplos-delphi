unit Form.Get.Dados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox, FMX.Layouts, Data.Dados, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Grid.Style, Fmx.Bind.Grid, Data.Bind.Grid,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmGetDados = class(TForm)
    LayoutTabelas: TLayout;
    ComboTabelas: TComboBox;
    ListViewDados: TListView;
    TimerGetTabelas: TTimer;
    BindSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    GridDebug: TGrid;
    LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
    procedure TimerGetTabelasTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboTabelasChange(Sender: TObject);
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

procedure TfrmGetDados.ComboTabelasChange(Sender: TObject);
begin
  if ComboTabelas.ItemIndex > -1 then
  begin
    LinkListControlToField1.FillHeaderFieldName := '';
    LinkListControlToField1.FieldName := '';

    TdmdDados.GetInstance.CarregaTabela(ComboTabelas.Items[ComboTabelas.ItemIndex],
      procedure // Ok
      begin
        LinkListControlToField1.FillHeaderFieldName := TdmdDados.GetInstance.memDados.Fields[0].FieldName;
        LinkListControlToField1.FieldName := TdmdDados.GetInstance.memDados.Fields[1].FieldName;

        BindSourceDB.DataSet := TdmdDados.GetInstance.memDados;

        LinkListControlToField1.Active := True;
      end,

      procedure // Erro
      begin
        ShowMessage('Algo deu errado');
      end);
  end;



//  if ComboTabelas.ItemIndex > -1 then
//  begin
//    LinkListControlToField1.FillHeaderFieldName := '';
//    LinkListControlToField1.FieldName := '';
//
//    TdmdDados.GetInstance.CarregaTabela(ComboTabelas.Items[ComboTabelas.ItemIndex]);
//
//    LinkListControlToField1.FillHeaderFieldName := TdmdDados.GetInstance.memDados.Fields[0].FieldName;
//    LinkListControlToField1.FieldName := TdmdDados.GetInstance.memDados.Fields[1].FieldName;
//
//    BindSourceDB.DataSet := TdmdDados.GetInstance.memDados;
//
//    LinkListControlToField1.Active := True;
//  end;
end;

procedure TfrmGetDados.FormShow(Sender: TObject);
begin
  TimerGetTabelas.Enabled := True;
end;

class function TfrmGetDados.GetInstance: TfrmGetDados;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TfrmGetDados.Create(Application);
  end;

  Result := FInstance;
end;

procedure TfrmGetDados.TimerGetTabelasTimer(Sender: TObject);
begin
  TimerGetTabelas.Enabled := False;
  ComboTabelas.Items.Text := TdmdDados.GetInstance.GetTabelas;
  ComboTabelas.Enabled := ComboTabelas.Items.Count > 0;
end;

end.
