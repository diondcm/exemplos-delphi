unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Generics.Collections;

type
  TCorPanel = class
  private
    FNome: string;
    FCor: TColor;
  public
    constructor Create(ANome: string; ACor: TColor);
    property Nome: string read FNome write FNome;
    property Cor: TColor read FCor write FCor;
  end;

  TfrmGenerics = class(TForm)
    PanelCor: TPanel;
    PanelControle: TPanel;
    ButtonAlterar: TButton;
    ListBoxCores: TListBox;
    ColorBoxCores: TColorBox;
    EditNomeCor: TEdit;
    ButtonArrays: TButton;
    Button2: TButton;
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ListBoxCoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonArraysClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FListaCores: TDictionary<string, TColor>;
  public
    { Public declarations }
  end;

var
  frmGenerics: TfrmGenerics;

implementation

{$R *.dfm}

procedure TfrmGenerics.Button2Click(Sender: TObject);
// TObjectList
var
  lList: TList<string>;
  lStr: string;
begin
  lList := TList<string>.Create;
  lList.Add('Teste');
  lList.Add('Outro teste');
  lList.Add('Mais um teste');

  ListBoxCores.Items.AddStrings(lList.ToArray);

  for lStr in lList do
  begin
    ListBoxCores.Items.Add(lStr);
  end;

  lList.Free;

//  Button2.Click;
//  Button2Click(Sender);
end;

procedure TfrmGenerics.ButtonAlterarClick(Sender: TObject);
//var
//  lCorPanel: TCorPanel;
begin
//  lCorPanel := TCorPanel.Create;
//  lCorPanel.Color  := ColorBoxCores.Selected;
//  lCorPanel.Nome := EditNomeCor.Text;
//  ListBoxCores.Items.AddObject(EditNomeCor.Text, lCorPanel);

//  ListBoxCores.Items.AddObject(EditNomeCor.Text, TCorPanel.Create(EditNomeCor.Text, ColorBoxCores.Selected));

  // ListBoxCores.Items.Add(IntToStr(ColorBoxCores.Selected)); // nope! Fail
//  EditNomeCor.Clear;

  //PanelCor.Color := clYellow;

  if FListaCores.ContainsKey(EditNomeCor.Text) or (EditNomeCor.Text = '') then
  begin
    Application.MessageBox('Cor já cadastrada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;

  FListaCores.Add(EditNomeCor.Text, ColorBoxCores.Selected);
  ListBoxCores.Items.Add(EditNomeCor.Text);
end;

{ TCorPanel }

constructor TCorPanel.Create(ANome: string; ACor: TColor);
begin
  FNome := ANome;
  FCor := ACor;
end;

procedure TfrmGenerics.ButtonArraysClick(Sender: TObject);
type
  TIntArr = array [0..5] of Integer;

var
  lIntArr: array [0..(1+4)] of Integer;
  lIntArr2: array [0..0] of Integer;
  lIntArr3: array of Integer;

  lIntArrx2: array of array of Integer;
  lIntArrx3: array of array of array of Integer;
  lIntArrx4: array of array of array of array of Integer;

//  function GetArr: array [0..5] of Integer;
  function GetArr: TIntArr;
  begin

  end;

begin
  lIntArr[0] := 2345345;
  lIntArr[4] := 2345345;
  lIntArr[5] := 432432;

//  SetLength(lIntArr, 10);  // não pode aterar o tamanho em runtime

//  SetLength(lIntArr2, 1);
  lIntArr2[0] := 0;

  SetLength(lIntArr3, 3);
end;

procedure TfrmGenerics.FormCreate(Sender: TObject);
begin
  FListaCores := TDictionary<string, TColor>.Create;
end;

procedure TfrmGenerics.FormDestroy(Sender: TObject);
begin
  FListaCores.Free;
end;

procedure TfrmGenerics.ListBoxCoresClick(Sender: TObject);
var
  lNomeCor: string;
//var
//  lObjCorPanel: TObject;
begin
//  if ListBoxCores.ItemIndex <> -1 then
//  begin
//    lObjCorPanel := ListBoxCores.Items.Objects[ListBoxCores.ItemIndex];
//    if Assigned(lObjCorPanel) then
//    begin
//      PanelCor.Caption := TCorPanel(lObjCorPanel).Nome;
//      PanelCor.Color := TCorPanel(lObjCorPanel).Cor;
//    end;
//  end;

  if (FListaCores.Count > 0) then
  begin
    if ListBoxCores.ItemIndex <> -1 then
    begin
      lNomeCor := ListBoxCores.Items[ListBoxCores.ItemIndex];
      if FListaCores.ContainsKey(lNomeCor) then
      begin
        PanelCor.Caption := lNomeCor;
        PanelCor.Color := FListaCores[lNomeCor];
      end;
    end;
  end;
end;

end.
