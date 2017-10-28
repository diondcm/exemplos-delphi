unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Base.Form, Data.DB, Datasnap.DBClient, Vcl.ExtCtrls, Vcl.StdCtrls,
  Form.Pesquisa.Country, System.ImageList, Vcl.ImgList, Data.Conexao, Form.Pesquisa.Vendors;

type
  TObjectClass = class
  private
    FFormClass: TFormClass;
  public
    constructor Create(pFormClass: TFormClass);
    property FormClass: TFormClass read FFormClass write FFormClass;
  end;

  TfrmPrincipal = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel12: TPanel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Cadastros1: TMenuItem;
    Pases1: TMenuItem;
    listTabelas: TListBox;
    Representantes1: TMenuItem;
    procedure Pases1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Representantes1Click(Sender: TObject);
    procedure listTabelasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lStl: TStringList;
  lTab: string;
begin
  inherited;
  listTabelas.Clear;

  lStl := TStringList.Create;
  try
    dmdConexao.ADOConnection.GetTableNames(lStl);

    if lStl.Count > 0 then
    begin
      for lTab in lStl do
      begin // ideal que viesse do banco
        if lTab.ToLower = 'vendors' then
        begin

          listTabelas.Items.AddObject(lTab, TObjectClass.Create(TfrmPesquisaVendors)); // .Create(Self)
        end;
      end;
    end else begin
      listTabelas.Items.Add('Não encontradas tabelas.');
    end;
  finally
    lStl.Free;
  end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to listTabelas.Items.Count -1 do
  begin
    listTabelas.Items.Objects[i].Free;
  end;
end;

procedure TfrmPrincipal.listTabelasClick(Sender: TObject);
begin
  inherited;
  if (listTabelas.ItemIndex > -1) then
  begin
    if Assigned(listTabelas.Items.Objects[listTabelas.ItemIndex]) then
    begin
      if listTabelas.Items.Objects[listTabelas.ItemIndex] is TObjectClass then
      begin
        TObjectClass(listTabelas.Items.Objects[listTabelas.ItemIndex]).FormClass.Create(Self).Show;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.Pases1Click(Sender: TObject);
begin
  inherited;
  TfrmPesquisaPaises.Create(Application).Show;
end;

procedure TfrmPrincipal.Representantes1Click(Sender: TObject);
begin
  TfrmPesquisaVendors.Create(Self).Show;
end;

{ TObjectClass }

constructor TObjectClass.Create(pFormClass: TFormClass);
begin
  FFormClass := pFormClass;
end;

end.
