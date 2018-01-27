unit Form.Tabs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.Layouts, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Gestures, System.Actions, FMX.ActnList;

type
  TfrmTabs = class(TForm)
    TabControl: TTabControl;
    tabPesquisa: TTabItem;
    tabCadastro: TTabItem;
    Edit1: TEdit;
    buttonPesquisa: TButton;
    Layout1: TLayout;
    Layout2: TLayout;
    GestureManager: TGestureManager;
    ActionList: TActionList;
    actPesquisar: TAction;
    actCadastrar: TAction;
    Layout3: TLayout;
    buttonCancelar: TButton;
    buttonSalvar: TButton;
    Layout4: TLayout;
    Edit2: TEdit;
    Layout5: TLayout;
    Layout6: TLayout;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure actPesquisarExecute(Sender: TObject);
    procedure actCadastrarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabs: TfrmTabs;

implementation

{$R *.fmx}

procedure TfrmTabs.actCadastrarExecute(Sender: TObject);
begin
  TabControl.ActiveTab := tabPesquisa;
end;

procedure TfrmTabs.actPesquisarExecute(Sender: TObject);
begin
  TabControl.ActiveTab := tabCadastro;
end;

procedure TfrmTabs.FormCreate(Sender: TObject);
begin
//  TabControl.TabPosition :=  TTabPosition.PlatformDefault;

//  {$IFDEF IOS}
//     TabControl.TabPosition :=  TTabPosition.Bottom;
//  {$ENDIF}
//
//  {$IFDEF ANDROID}
//     TabControl.TabPosition :=  TTabPosition.Top;
//  {$ENDIF}
end;

end.
