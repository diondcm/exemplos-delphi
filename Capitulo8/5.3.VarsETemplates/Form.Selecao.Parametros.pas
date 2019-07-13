unit Form.Selecao.Parametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TParametroRel = record
    Descricao: string;
    Default: Variant;
    Field: string;
    Ativo: Boolean;
    Valor: Variant;
    constructor Create(pDescricao: string; pDefault: Variant; pField: string; pAtivo: Boolean);
  end;

  TfrmParametros = class(TForm)
    PanelParametros: TPanel;
    Panel2: TPanel;
    PanelBaseData: TPanel;
    CheckBoxBaseData: TCheckBox;
    dtpDataIni: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    LabelAh: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    function SolicitaParametro(pPar: TParametroRel): string;
  end;

var
  frmParametros: TfrmParametros;

implementation

{$R *.dfm}

{ TfrmParametros }

function TfrmParametros.SolicitaParametro(pPar: TParametroRel): string;
var
  lPanelParam: TPanel;
  lCheck: TCheckBox;
  lDtp: TDateTimePicker;
begin
  lPanelParam := TPanel.Create(Self);
  lPanelParam.Parent := PanelParametros;
  lPanelParam.Align := alTop;
  lPanelParam.Height := PanelBaseData.Height;

  lCheck := TCheckBox.Create(Application);
  lCheck.AlignWithMargins := True;
  lCheck.Align := CheckBoxBaseData.Align;
  lCheck.Margins.Left := CheckBoxBaseData.Margins.Left;
  lCheck.Height := CheckBoxBaseData.Height;
  lCheck.Caption := pPar.Descricao;
  lCheck.Checked := pPar.Ativo;
  lCheck.Parent := lPanelParam;

  lDtp := TDateTimePicker.Create(Self);
  lDtp.Align := dtpDataIni.Align;
  lDtp.AlignWithMargins := dtpDataIni.AlignWithMargins;
  lDtp.Margins.Assign(dtpDataIni.Margins);
  lDtp.Width := dtpDataIni.Width;
  lDtp.Parent := lPanelParam;

{
  object dtpDataIni: TDateTimePicker
    Left = 164
    Top = 8
    Width = 121
    Height = 21
    Date = 43659.000000000000000000
    Time = 0.713334780091827300
    TabOrder = 1
  end
  object LabelAh: TLabel
    Left = 300
    Top = 13
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object dtpDataFim: TDateTimePicker
    Left = 312
    Top = 8
    Width = 121
    Height = 21
    Date = 43659.000000000000000000
    Time = 0.713334780091827300
    TabOrder = 2
  end
end
}

  if Self.ShowModal = mrOk then
  begin
    Result := ' AND ' + pPar.Field + ' beetwen ' + QuotedStr(DateToStr(pPar.Valor)) +' and ' + QuotedStr(DateToStr(pPar.Valor));
  end;
end;

{ TParametroRel }

constructor TParametroRel.Create(pDescricao: string; pDefault: Variant; pField: string; pAtivo: Boolean);
begin
  Descricao := pDescricao;
  Default := pDefault;
  Field := pField;
  Ativo := pAtivo;
end;

end.
