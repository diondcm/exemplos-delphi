unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classe.Pessoa, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Generics.Collections, Vcl.Samples.Gauges, Frame.Teste;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    gauge: TGauge;
    Frame11: TFrame1;
    Frame12: TFrame1;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  lPF: TPessoaFisica;
  lPJ: TPessoaJuridica;
begin
//  lSt := TStringList.Create;
//  lSt.Objects[]
//  lSt.KeyNames
//  lSt[] //lSt.Strings[]

  lPF := TPessoaFisica.Create;
  lPF.GetNovoID;
  lPF.Free;


  lPJ := TPessoaJuridica.Create;
  //Caption := lPJ.RazaoSocial;
  //lPJ.RazaoSocial := Caption;
  lPJ.NomeFantasisa := 'Texto @';
  lPJ.Free;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  lList: TList<IVeiculo>;
  lVeic: IVeiculo;
  lStr: string;
begin
  lList := TList<IVeiculo>.Create;

  TPessoaJuridica.Create.Atualiza(
    procedure(pRegistro, pCount: Integer; var pContinua: Boolean)
    begin
      gauge.MaxValue := pCount;
      gauge.Progress := pRegistro;

      Application.ProcessMessages;
      pContinua := Application.Terminated;
    end);


  lList.Add(TAviao.Create);
  lList.Add(TNavio.Create);

  for lVeic in LList do
  begin
    lStr := lStr + Slinebreak + lVeic.GetID;
  end;

  ShowMessage(lStr);


  lList.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
