unit Form.Plus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.RTTI, System.Generics.Collections;

type
  TNotificaUsuario = reference to procedure(const pMsg: string);


  TLancamento = class
  private
    FValor: Currency;
    FData: TDateTime;
  public
    constructor Create(const pValor: Currency; const pData: TDateTime);
    property Valor: Currency read FValor write FValor;
    property Data: TDateTime read FData write FData;
  end;

  TMov = class
  end;

  TMesMovimentacoes = class
  private
    FValorToal: Currency;
    FMesRef: Integer;
    FMovimentacoes: TMov;
  published
    property ValorToal: Currency read FValorToal write FValorToal;
    property MesRef: Integer read FMesRef write FMesRef;
    property Movimentacoes: TMov read FMovimentacoes write FMovimentacoes;
  end;

  TExibeUnit = class(TCustomAttribute)
  private
    FNomeUnit: string;
  public
    constructor Create(pNomeUnit: string);
    property NomeUnit: string read FNomeUnit;
  end;

  TComponentes = class(TCustomAttribute)
  private
    FNomeComp: string;
  public
    constructor Create(pNome: string);
    property NomeComp: string read FNomeComp;
  end;

  [TExibeUnit('Form.Plus')]
  TfrmPlus = class(TForm)
    [TComponentes('buttonLeAtributos')]
    buttonLeAtributos: TButton;
    [TComponentes('memoLog')]
    memoLog: TMemo;
    buttonGenerics: TButton;
    buttonMetodosA: TButton;
    buttonServico: TButton;
    buttonInterface: TButton;
    procedure buttonLeAtributosClick(Sender: TObject);
    procedure buttonGenericsClick(Sender: TObject);
    procedure buttonMetodosAClick(Sender: TObject);
    procedure buttonServicoClick(Sender: TObject);
    procedure buttonInterfaceClick(Sender: TObject);
  private
    { Private declarations }
    FNotificUsuario: TNotificaUsuario;
    procedure TrataArray(var [Ref] pArr: array of const);
    procedure ExecutaDeterminadoProcesso(const pMetodoNotifica: TNotificaUsuario);
//    procedure TrataArrayP(pArr: Pointer); // @Arr[0]
  public
    { Public declarations }
  end;

var
  frmPlus: TfrmPlus;

implementation

{$R *.dfm}

procedure TfrmPlus.buttonGenericsClick(Sender: TObject);
var
  lList: TList;
  lListaLancamento: TList<TLancamento>;
begin
//  try
//    O/I - Api
//    RaiseLastOSError
//  except
//
//  end;
   //lArr := lArr2

  // Pre - Generics
  lList := TList.Create;
  lList.Add(TLancamento.Create(0, Now));
//  TLancamento(lList[0]).Valor;
//  lListO := TObjectList.Create;
//  lList).Add(TLancamento.Create(0, Now));
//  TLancamento(lList)[0]).Valor;

  // >> Collections
  // >> Codificando a própria lista

  // Pos - Generics
//  lListaLancamento := TList<TLancamento>.Create;
//  lListaLancamento.Add(TLancamento.Create(0, Now));
//  lListaLancamento.Add(TMov.Create);
//  lListaLancamento[0].Valor

//  TObjectList<TLancamento>
//  TDictionary<TKey,TValue>
end;

procedure TfrmPlus.buttonInterfaceClick(Sender: TObject);
begin
  if not Assigned(FNotificUsuario) then
    raise Exception.Create('Configure a notificação');

  ExecutaDeterminadoProcesso(FNotificUsuario);
end;

procedure TfrmPlus.buttonLeAtributosClick(Sender: TObject);
var
  lType: TRttiType;
  lProp: TRttiProperty;
  lAtr: TCustomAttribute;
  lValorProp: string;
  lValorCampoAlinhado: string;
  i: Integer;
  lCampoPreenchido: Boolean;
  lCTX: TRttiContext;
  lField: TRttiField;
begin
  lCTX := TRttiContext.Create;
  try
    lType := lCTX.GetType(Self.ClassInfo);
    for lAtr in lType.GetAttributes do
    begin
//      if lAtr is TCustomAttribute then
//      begin
        if lAtr is TExibeUnit then
        begin
          memoLog.Lines.Add('Unit: ' + TExibeUnit(lAtr).NomeUnit);
        end;
//      end;
    end;

//    for lProp in lType.GetProperties do
//    begin
//      memoLog.Lines.Add(lProp.Name);
//    end;

    memoLog.Lines.Add(sLineBreak + 'Fields' + sLineBreak);
    for lField in lType.GetFields do
    begin
      if (CompareStr(lField.Name.ToLower, 'buttonleatributos') = 0) or
        (CompareStr(lField.Name.ToLower, 'memolog') = 0) then
      begin
        for lAtr in lField.GetAttributes do
        begin
          if lAtr is TComponentes then
          begin
            memoLog.Lines.Add('Comp: ' + TComponentes(lAtr).NomeComp);
          end;
        end;

        //memoLog.Lines.Add(lField.Name);
      end;
    end;
  finally
    lCTX.Free;
  end;
end;

procedure TfrmPlus.buttonMetodosAClick(Sender: TObject);
var
  lNU: TNotificaUsuario;
begin
  lNU :=
    procedure (const pMsg: string)
    begin
      ShowMessage(pMsg);
    end;

  lNU('Teste');
  FNotificUsuario := lNU;
end;

procedure TfrmPlus.buttonServicoClick(Sender: TObject);
begin
  ExecutaDeterminadoProcesso(
    procedure (const pMsg: string)
    begin
      Caption := 'Serviço: ' + pMsg;
    end);
end;

procedure TfrmPlus.ExecutaDeterminadoProcesso(
  const pMetodoNotifica: TNotificaUsuario);
begin
  // Faz algo
  pMetodoNotifica('Realizai a tarefa ou deu erro');
end;

procedure TfrmPlus.TrataArray(var pArr: array of const);
begin

end;

{ TExibeUnit }

constructor TExibeUnit.Create(pNomeUnit: string);
begin
  FNomeUnit := pNomeUnit;
end;

{ TComponentes }

constructor TComponentes.Create(pNome: string);
begin
  FNomeComp := pNome;
end;

{ TLancamento }

constructor TLancamento.Create(const pValor: Currency; const pData: TDateTime);
begin
  FValor := pValor;
  FData := pData;
end;

end.
