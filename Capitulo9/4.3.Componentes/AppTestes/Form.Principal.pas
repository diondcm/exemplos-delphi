unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Classes.Panel.Obrigatorio, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Classe.DBDateTimePicker, Classe.Card.Viewer, Vcl.Imaging.jpeg,
  Classe.LateralViewer;

type
  TfrmPrincipal = class(TForm)
    memCadastro: TFDMemTable;
    memCadastroid: TIntegerField;
    memCadastroNome: TStringField;
    memCadastroDataCadastro: TDateTimeField;
    dtsCadastro: TDataSource;
    memCadastroSaldo: TCurrencyField;
    memCadastroDataNascimento: TDateField;
    memCadastroRG: TStringField;
    memCadastroCPF: TStringField;
    memCadastroCNPJ: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ImageViewer1: TImageViewer;
    PanelObrigatorio1: TPanelObrigatorio;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBDateTimePiker1: TDBDateTimePiker;
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Timer1: TTimer;
    TabSheet3: TTabSheet;
    LateralViewer1: TLateralViewer;
    Panel2: TPanel;
    Splitter1: TSplitter;
    ImageViewerComLateral: TImageViewer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
begin
  memCadastro.Open;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  ImageViewer1.Align := alClient;
//  ImageViewer1.NomePasta := 'C:\Users\AquaAluno09\Pictures\';
//  ImageViewer1.Apresentar;

  ImageViewerComLateral.NomePasta := 'C:\Users\AquaAluno09\Pictures';
  LateralViewer1.Preview := True;
  LateralViewer1.Diretorio := 'C:\Users\AquaAluno09\Pictures';

//  ImageViewer1.ImagemPrincipal.Picture.LoadFromFile('C:\Users\AquaAluno09\Pictures\background1.jpg');
//  ImageViewer1.ImagemEsquerda.Picture.LoadFromFile('C:\Users\AquaAluno09\Pictures\background3.jpg');
//  ImageViewer1.ImagemDireita.Picture.LoadFromFile('C:\Users\AquaAluno09\Pictures\background4.jpg');
end;

end.
