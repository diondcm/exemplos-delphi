unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Classe.ImageViewer, Vcl.Imaging.jpeg, Vcl.StdCtrls, Classe.LateralViewer, Data.DB, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    LateralViewer1: TLateralViewer;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1SpeciesNo: TFloatField;
    ClientDataSet1Category: TStringField;
    ClientDataSet1Common_Name: TStringField;
    ClientDataSet1SpeciesName: TStringField;
    ClientDataSet1Lengthcm: TFloatField;
    ClientDataSet1Length_In: TFloatField;
    ClientDataSet1Notes: TMemoField;
    ClientDataSet1Graphic: TGraphicField;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  LateralViewer1.DataSet := ClientDataSet1;
  LateralViewer1.FieldName := 'Graphic';
  LateralViewer1.CarregaImagensDB;
end;

procedure TfrmPrincipal.CheckBox1Click(Sender: TObject);
begin
//  ImageViewer1.Stretch := CheckBox1.Checked;
//  ImageViewer1.Proportional := not CheckBox1.Checked;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  ImageViewer1.Align := alClient;
//  ImageViewer1.ImagemPrincipal.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\Gray.jpg');

//  ImageViewer1.ImagemEsquerda.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\Aqua.jpg');
//  ImageViewer1.ImagemDireita.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\Gray.jpg');
//  ImageViewer1.ImagemPrincipal.Picture.LoadFromFile('C:\Users\Instrutor01\Downloads\Imagens\delphi2.jpg');
  LateralViewer1.Preview := True;
end;

end.
