unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Form.ClassOf, Vcl.ExtCtrls, Form.Threads;

type
  TfrmPrincipal = class(TForm)
    buttonClasse: TButton;
    timerOpen: TTimer;
    buttonThreads: TButton;
    buttonCidades: TButton;
    procedure buttonClasseClick(Sender: TObject);
    procedure timerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buttonThreadsClick(Sender: TObject);
    procedure buttonCidadesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Form.Cidades;

procedure TfrmPrincipal.buttonCidadesClick(Sender: TObject);
begin
  frmCidades.Show;
end;

procedure TfrmPrincipal.buttonClasseClick(Sender: TObject);
begin
  frmClassOf.Show;
end;

procedure TfrmPrincipal.buttonThreadsClick(Sender: TObject);
begin
  frmThreads.Show;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  timerOpen.Enabled := True;
end;

procedure TfrmPrincipal.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  buttonCidades.Click;
end;

end.
