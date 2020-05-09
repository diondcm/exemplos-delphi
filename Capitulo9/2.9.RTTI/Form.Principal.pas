unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus, Vcl.Imaging.pngimage;

type
  TLocalControl = class(Vcl.Controls.TControl);

  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Image1: TImage;
    PopupMenuStyle: TPopupMenu;
    Customizar1: TMenuItem;
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure Customizar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    const
      ARQ_CONFIG = 'arq_config.txt';
    procedure HabilitaCustomizacao(pHabilita: Boolean);
    procedure LoadConfig;
    procedure SaveConfig;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Customizar1Click(Sender: TObject);
begin
  Customizar1.Checked := not Customizar1.Checked;
  HabilitaCustomizacao(Customizar1.Checked);

  if not Customizar1.Checked then
  begin
    SaveConfig;
  end;
end;

procedure TForm1.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Source is TControl then
  begin
    TControl(Source).Left := X;
    TControl(Source).Top := Y;
  end;
end;

procedure TForm1.FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TControl;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  LoadConfig;
end;

procedure TForm1.HabilitaCustomizacao(pHabilita: Boolean);
var
  lDragMode: TDragMode;
begin
  if pHabilita then
  begin
    lDragMode := TDragMode.dmAutomatic;
  end else begin
    lDragMode := TDragMode.dmManual;
  end;

  for var i: Integer := 0 to Self.ControlCount -1 do
  begin
    if not (Self.Controls[i] is TPanel) then
    begin
      TLocalControl(Self.Controls[i]).DragMode := lDragMode;
    end;
  end;
end;

procedure TForm1.LoadConfig;
var
  lLeft: Integer;
  lTop: Integer;
begin
  if FileExists(ARQ_CONFIG) then
  begin
    var lStl: TStringList := TStringList.Create;
    lStl.LoadFromFile(ARQ_CONFIG);

    for var i: Integer := 0 to Self.ControlCount -1 do
    begin
      lLeft := StrToIntDef(lStl.Values[Self.Controls[i].Name + '_LEFT'], -1);
      if lLeft <> -1 then
      begin
        Self.Controls[i].Left := lLeft;
      end;

      lTop := StrToIntDef(lStl.Values[Self.Controls[i].Name + '_TOP'], -1);
      if lTop <> -1 then
      begin
        Self.Controls[i].Top := lTop;
      end;

    end;


    lStl.Free;
  end;
end;

procedure TForm1.Panel1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Source is TLabel) and (State = dsDragEnter) then
    (Source as TLabel).EndDrag(False);
end;

procedure TForm1.SaveConfig;
begin
  var lStl: TStringList := TStringList.Create;

  for var i: Integer := 0 to Self.ControlCount -1 do
  begin
    lStl.Add(Self.Controls[i].Name + '_LEFT=' + IntToStr(Self.Controls[i].Left));
    lStl.Add(Self.Controls[i].Name + '_TOP=' + IntToStr(Self.Controls[i].Top));
  end;

  lStl.SaveToFile(ARQ_CONFIG);

  lStl.Free;
end;

end.
