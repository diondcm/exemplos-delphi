unit Form.Intents;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  FMX.Edit, Classe.Intent.Email;

type
  TfrmIntent = class(TForm)
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    gridControles: TGridPanelLayout;
    editDestinatario: TEdit;
    editAssunto: TEdit;
    editTexto: TEdit;
    Layout1: TLayout;
    buttonEnvia: TButton;
    buttonCancelar: TButton;
    procedure buttonVoltarClick(Sender: TObject);
    procedure buttonEnviaClick(Sender: TObject);
    procedure buttonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    class var
      FInstance: TfrmIntent;
  public
    class function GetInstance: TfrmIntent;
  end;

implementation

{$R *.fmx}

procedure TfrmIntent.buttonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIntent.buttonEnviaClick(Sender: TObject);
begin
  TIntentEmail.Enviar(editDestinatario.Text, editAssunto.Text, editTexto.Text);
  Close;
end;

procedure TfrmIntent.buttonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIntent.FormShow(Sender: TObject);
begin
  editDestinatario.Text := '';
  editAssunto.Text := '';
  editTexto.Text := '';
end;

class function TfrmIntent.GetInstance: TfrmIntent;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TfrmIntent.Create(Application);
  end;

  Result := FInstance;
end;

end.
