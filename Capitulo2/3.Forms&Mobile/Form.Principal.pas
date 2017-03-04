unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  TfrmPrincipal = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    lblMensagem: TLabel;
    btnLocalizacao: TButton;
    btnCamera: TButton;
    btnAcelerometro: TButton;
    btnMicrofone: TButton;
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure btnCameraClick(Sender: TObject);
    procedure btnAcelerometroClick(Sender: TObject);
    procedure btnMicrofoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Form.Location, Form.Camera, Form.Acelerometro, Form.Microfone;

procedure TfrmPrincipal.btnAcelerometroClick(Sender: TObject);
begin
  TfrmAcelerometro.Create(Self).Show;
end;

procedure TfrmPrincipal.btnCameraClick(Sender: TObject);
begin
  TfrmCamera.Create(Self).Show;
end;

procedure TfrmPrincipal.btnLocalizacaoClick(Sender: TObject);
begin
  TfrmLocation.Create(Self).Show;
end;

procedure TfrmPrincipal.btnMicrofoneClick(Sender: TObject);
//var
//  lFrm: TfrmMicrofone;
begin
  TfrmMicrofone.ShowEx(
    procedure
    begin
      // executado antes
      ShowMessage('Before');
      //Button2.Text := lFrm.Button2.Text + ' Alterado';
    end,
    procedure
    begin
      // executado depois, quando fechar
      ShowMessage('After');
    end);
//  lFrm := TfrmMicrofone.Create(Self);
//  lFrm.Show;
end;

end.
