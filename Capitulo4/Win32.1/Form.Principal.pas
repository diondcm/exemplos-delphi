unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.BioLife, Vcl.ExtCtrls, Generics.Collections, Data.DB,
  Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    memoPropriedades: TMemo;
    panelControles: TPanel;
    panelMamiferoLocal: TPanel;
    buttonCriaObjetos: TButton;
    buttonExibeMamifero: TButton;
    buttonGestacao: TButton;
    editDiasGestacao: TEdit;
    panelLista: TPanel;
    Label1: TLabel;
    editTempoGestacao: TEdit;
    editTempoAmamentacao: TEdit;
    buttonCriarCao: TButton;
    buttonCriarBaleia: TButton;
    buttonCriarMorcego: TButton;
    listBoxMamiferos: TListBox;
    labelTempoGestacaoEmDias: TLabel;
    buttonDeleta: TButton;
    buttonCriaObj: TButton;
    Button3: TButton;
    procedure buttonCriaObjetosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonExibeMamiferoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure buttonGestacaoClick(Sender: TObject);
    procedure buttonCriarCaoClick(Sender: TObject);
    procedure listBoxMamiferosClick(Sender: TObject);
    procedure buttonDeletaClick(Sender: TObject);
    procedure buttonCriaObjClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure buttonCriarBaleiaClick(Sender: TObject);
    procedure buttonCriarMorcegoClick(Sender: TObject);
  private
    FCds: TClientDataSet;

    FMamifero: TMamifero;
    FListaMamiferos: TList<TMamifero>; // TObjectList // Deleta automatico quando Owner
    procedure AdicionaMamifero(pMamifero: TMamifero);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonCriarBaleiaClick(Sender: TObject);
var
  lBaleia: TBaleiaAzul;
  lTempo: string;
  lTempoInt: Integer;
begin
  lTempo := '';
  if InputQuery('Informar', 'O tempo de submerção: ', lTempo) then
  begin
    if TryStrToInt(lTempo, lTempoInt) then
    begin
      lBaleia := TBaleiaAzul.Create;
      lBaleia.TempoDeSubmercao := lTempoInt;
      lBaleia.DiasDeGestacao := StrToIntDef(editTempoGestacao.Text, 0);
      lBaleia.PeriodoAmamentacao := StrToIntDef(editTempoAmamentacao.Text, 0);

      AdicionaMamifero(lBaleia);
    end else begin
      Application.MessageBox(Pchar('Valor de submerção: ' + lTempo + ' inválido'), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

procedure TfrmPrincipal.buttonCriarCaoClick(Sender: TObject);
var
  lCao: TCao;
  lNome: string;
begin
  if {InputBox()} InputQuery('Informar', 'Informe o nome do cão:', lNome) then
  begin
    lCao := TCao.Create;
    lCao.DiasDeGestacao := StrToInt(editTempoGestacao.Text);
    lCao.PeriodoAmamentacao := StrToInt(editTempoAmamentacao.Text);
    lCao.Nome := lNome;

    AdicionaMamifero(lCao);
  end;
end;

procedure TfrmPrincipal.buttonCriarMorcegoClick(Sender: TObject);
var
  lAlt: string;
  lAltInt: Integer;
  lMorcego: TMorcego;
begin
  if InputQuery('Informar', 'Altura de Voo: ', lAlt) then
  begin
    if TryStrToInt(lAlt, lAltInt) then
    begin
      lMorcego := TMorcego.Create;
      lMorcego.AlturaMaximaVoo := lAltInt;
      lMorcego.DiasDeGestacao := StrToIntDef(editTempoGestacao.Text, 0);
      lMorcego.PeriodoAmamentacao := StrToIntDef(editTempoAmamentacao.Text, 0);

      AdicionaMamifero(lMorcego);
    end else begin
      Application.MessageBox(Pchar('Altura de voo: ' + lAlt + ' inválida'), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

procedure TfrmPrincipal.buttonExibeMamiferoClick(Sender: TObject);
begin
  memoPropriedades.Lines.Add('Nome do mamífero: ' + (FMamifero as TCao).Nome);
  FMamifero.ListaPropriedades(memoPropriedades.Lines);
end;

procedure TfrmPrincipal.buttonGestacaoClick(Sender: TObject);
var
  lCao: TCao;
begin
  lCao := (FMamifero as TCao);
  lCao.DiasDeGestacao := StrToInt(editDiasGestacao.Text);
end;

procedure TfrmPrincipal.AdicionaMamifero(pMamifero: TMamifero);
begin
  FListaMamiferos.Add(pMamifero);
  listBoxMamiferos.Items.AddObject(pMamifero.ClassName, pMamifero)
end;

procedure TfrmPrincipal.buttonDeletaClick(Sender: TObject);
begin
  if listBoxMamiferos.ItemIndex > -1 then
  begin
//    if FListaMamiferos.Contains(listBoxMamiferos.Items.Objects[listBoxMamiferos.ItemIndex] as TMamifero) then
//    begin
//      FListaMamiferos[listBoxMamiferos.Items.Objects[listBoxMamiferos.ItemIndex]] := nil;
//    end;

//    listBoxMamiferos.Items.Objects[listBoxMamiferos.ItemIndex].Free;
    listBoxMamiferos.DeleteSelected;
  end;
end;

procedure TfrmPrincipal.buttonCriaObjClick(Sender: TObject);
begin
  FCds := TClientDataSet.Create(nil{Self}{Application});
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  if Assigned(FCds) then
  begin
    Caption := TimeToStr(Now);
  end;

//  FCds.Free;
//  FCds := nil;

  FreeAndNil(FCds);
end;

procedure TfrmPrincipal.buttonCriaObjetosClick(Sender: TObject);
var
  lMamifero: TMamifero;
  lCao: TCao;
begin
  lMamifero := TMamifero.Create;
  try
    lMamifero.DiasDeGestacao := 0;
    lMamifero.PeriodoAmamentacao := 0;
    lMamifero.ListaPropriedades(memoPropriedades.Lines);
  finally
    lMamifero.Free;
  end;

  lCao := TCao.Create;
  try
    lCao.DiasDeGestacao := 4*30;
    lCao.PeriodoAmamentacao := 6*30;
    lCao.Nome := 'Perro';
    lCao.ListaPropriedades(memoPropriedades.Lines);
  finally
    lCao.Free;
  end;

  (FMamifero as TCao).Nome := 'Marley';
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG }
  //if DebugHook > 0 then // Platform - Windows
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  FMamifero := TCao.Create;
  FListaMamiferos := TList<TMamifero>.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
var
  lM: TObject;
//var
//  i: Integer;
begin
  FMamifero.Free;

//  for i := 0 to listBoxMamiferos.Items.Count -1 do
//  begin
//    listBoxMamiferos.Items.Objects[i].Free;
//  end;
  for lM in FListaMamiferos do
  begin
    lM.Free;
  end;

  FListaMamiferos.Free;
end;

procedure TfrmPrincipal.listBoxMamiferosClick(Sender: TObject);
begin
  if listBoxMamiferos.ItemIndex > -1 then
  begin
    memoPropriedades.Lines.Clear;
    memoPropriedades.Lines.Add(listBoxMamiferos.Items[listBoxMamiferos.ItemIndex]);
    if Assigned(listBoxMamiferos.Items.Objects[listBoxMamiferos.ItemIndex]) then
    begin
      if listBoxMamiferos.Items.Objects[listBoxMamiferos.ItemIndex] is TMamifero then
      begin
        TMamifero(listBoxMamiferos.Items.Objects[listBoxMamiferos.ItemIndex]).ListaPropriedades(memoPropriedades.Lines);
//        (listBoxMamiferos.Items.Objects[listBoxMamiferos.ItemIndex] as TMamifero).ListaPropriedades();
      end;
    end;
  end;
end;

end.
