unit Form.Base.Mobile;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TfrmBaseMobile = class(TForm)
    LayoutPrincipal: TLayout;
    VertScrollBox: TVertScrollBox;
    TimerOpen: TTimer;
    procedure FormShow(Sender: TObject);
    procedure TimerOpenTimer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure InicializaForm; virtual;
  end;

implementation

{$R *.fmx}

procedure TfrmBaseMobile.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmBaseMobile.InicializaForm;
begin
  // Implementado nos filhos;
end;

procedure TfrmBaseMobile.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;
  InicializaForm;
end;

end.
