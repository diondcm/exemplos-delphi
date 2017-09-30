unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, uConversorMoeda;

type
  TfrmPrincipal = class(TForm)
    editValor: TEdit;
    buttonDolarParaReal: TButton;
    buttonRealParaDolar: TButton;
    panelResultado: TPanel;
    labelResultado: TLabel;
    procedure buttonRealParaDolarClick(Sender: TObject);
    procedure buttonDolarParaRealClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.buttonDolarParaRealClick(Sender: TObject);
begin
  labelResultado.Text := TConversorMoeda.DolarParaReal(editValor.Text);
  
end;

procedure TfrmPrincipal.buttonRealParaDolarClick(Sender: TObject);
begin
  labelResultado.Text := TConversorMoeda.RealParaDolar(editValor.Text);
end;

end.
