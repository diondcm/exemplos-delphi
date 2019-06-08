unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Classe.Veiculos, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Classe.Memo.Helper, Classe.Patrimonio, Classe.Escritorio, Classe.Base, Frame.Cliente;

type
  TfrmPrincipal = class(TForm)
    PanelControles: TPanel;
    ButtonClasses: TButton;
    MemoLog: TMemo;
    ComboBoxVeiculos: TComboBox;
    LabelVeiculo: TLabel;
    ButtonPatromonio: TButton;
    Panel1: TPanel;
    fraCliente1: TfraCliente;
    Label2: TLabel;
    Label4: TLabel;
    procedure ButtonClassesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonPatromonioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonClassesClick(Sender: TObject);
var
  lVeiculo: TVeiculo;
begin
  if ComboBoxVeiculos.ItemIndex = 0 then
  begin
    lVeiculo := TCarro.Create;
  end else if ComboBoxVeiculos.ItemIndex = 1 then
  begin
    lVeiculo := TNavio.Create;
  end else begin
    raise Exception.Create('Informe o veículo');
  end;

  lVeiculo.GravarLog :=
    procedure(pMsg: string)
    begin
      //MemoLog.Lines.Insert(0, pMsg);
      MemoLog.Add2(pMsg);
    end;

  lVeiculo.Ligar;
  lVeiculo.ExecutarRota;

//  lVeiculo.DataFabricacao := Now + 1;

  if lVeiculo is TCarro then
  begin
    TCarro(lVeiculo).AlteraData(Now + 1);
  end;

  lVeiculo.Free;
end;

procedure TfrmPrincipal.ButtonPatromonioClick(Sender: TObject);
var
  lLista: TListaPatrimonio;
begin
  lLista := TListaPatrimonio.Create;

  lLista.Add(TCarro.Create);
  lLista.Add(TNavio.Create);
  lLista.Add(TNoteBook.Create);
  lLista.Add(TMesa.Create);

  ShowMessage('Total: ' + FormatCurr('0.,00', lLista.GetValorTotal));

  lLista.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
end;

end.
