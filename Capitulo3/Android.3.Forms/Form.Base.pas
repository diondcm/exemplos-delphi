unit Form.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmBase = class;
  TMetodo = reference to procedure(Sender: TfrmBase);

  TfrmBase = class(TForm)
    ToolBar1: TToolBar;
    btnBack: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBackClick(Sender: TObject);
  private
    FOnCloseModal: TMetodo;
  public
    procedure ShowLikeModal(const pMetodoClose: TMetodo = nil);
    property OnCloseModal: TMetodo read FOnCloseModal write FOnCloseModal;
  end;

implementation

{$R *.fmx}

{ TfrmBase }

procedure TfrmBase.btnBackClick(Sender: TObject);
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

procedure TfrmBase.ShowLikeModal(const pMetodoClose: TMetodo);
begin
  if Assigned(pMetodoClose) then
  begin
    FOnCloseModal := pMetodoClose;
  end;

  Self.Show;
end;

end.
