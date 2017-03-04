unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  System.ImageList, FMX.ImgList, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TfrmPrincipal = class(TForm)
    lsbControles: TListBox;
    Layout1: TLayout;
    lytPrincipal: TLayout;
    ToolBar1: TToolBar;
    Button1: TButton;
    ImageList1: TImageList;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
  private
    FFormAtivo: TForm;
    procedure OpenForm(AForm: TComponentClass);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Form.Layout1, Form.Layout2;

{ TfrmPrincipal }

procedure TfrmPrincipal.ListBoxItem1Click(Sender: TObject);
begin
  OpenForm(TfrmLayout1);
end;

procedure TfrmPrincipal.ListBoxItem2Click(Sender: TObject);
begin
  OpenForm(TfrmLayout2);
end;

procedure TfrmPrincipal.OpenForm(AForm: TComponentClass);
var
  i: Integer;
begin
  if (Assigned(FFormAtivo) and (FFormAtivo.ClassName <> AForm.ClassName)) or
    (FFormAtivo = nil) {not Assigned(FFormAtivo)} then
  begin
    for i := lytPrincipal.ControlsCount -1 downto 0 do
    begin
      lytPrincipal.RemoveObject(lytPrincipal.Controls[i]);
    end;

    FFormAtivo.DisposeOf;
    FFormAtivo := nil;
    // just the same
    // FreeAndNil(FFormAtivo)

    Application.CreateForm(AForm, FFormAtivo);
    
    //lytPrincipal.Parent := FFormAtivo; não orienentado;
    lytPrincipal.AddObject(TLayout(FFormAtivo.FindComponent('lytPrincipal')));  
  end;

end;

end.
