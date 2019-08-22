unit Form.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Generics.Collections;

type
  TfrmBase = class;

  TfrmBaseClose<T: class> = reference to procedure(pFormBase: T);

  TfrmBase = class(TForm)
    ToolBarBase: TToolBar;
    ButtonVoltar: TButton;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOnCloseBase: TfrmBaseClose<TFrmbase>;
  public
    procedure ExibeLikeModal(pEventoOnClose: TfrmBaseClose<TFrmBase>);
  end;

implementation

{$R *.fmx}

procedure TfrmBase.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.ExibeLikeModal(pEventoOnClose: TfrmBaseClose<TFrmBase>);
begin
  FOnCloseBase := pEventoOnClose;
  Self.Show;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnCloseBase) then
  begin
    FOnCloseBase(Self);
  end;
end;

end.
