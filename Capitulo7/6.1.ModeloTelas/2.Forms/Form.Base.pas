unit Form.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TfrmBase = class;
  TMetodoClose = reference to procedure(Sender: TfrmBase);


  TfrmBase = class(TForm)
    ToolBar1: TToolBar;
    buttonBack: TButton;
    procedure buttonBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOnCloseModal: TMetodoClose;
  public
    procedure ShowLikeModal(pMetodoClose: TMetodoClose = nil);
    property OnCloseModal: TMetodoClose read FOnCloseModal write FOnCloseModal;
  end;

implementation

{$R *.fmx}

{ TfrmBase }

procedure TfrmBase.buttonBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnCloseModal) then
  begin
    FOnCloseModal(Self);
  end;
  Action := TCloseAction.caFree;
end;

procedure TfrmBase.ShowLikeModal(pMetodoClose: TMetodoClose);
begin
  if Assigned(pMetodoClose) then
  begin
    FOnCloseModal := pMetodoClose;
  end;

  Self.Show;
end;

end.
