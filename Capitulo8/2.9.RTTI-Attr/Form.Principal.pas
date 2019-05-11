unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Rtti;

type
  {$region 'Attributos'}

  TAtributoDescricao = class(TCustomAttribute)
  private
    FDescricao: string;
  public
    constructor Create(pDescicao: string);
    property Descricao: string read FDescricao;
  end;


  TAtribtoTabela = class(TCustomAttribute)
  private
    FNomeTabela: string;
    FNomeSchema: string;
  public
    constructor Create(pNomeSchema, pNomeTabela: string);
    property NomeTabela: string read FNomeTabela;
    property NomeSchema: string read FNomeSchema;
  end;

  TAtributoCampo = class(TCustomAttribute)
  private
    FNomeCampo: string;
  public
    constructor Create(pNomeCampo: string);
    property NomeCampo: string read FNomeCampo;
  end;
  {$endregion}

  {$region 'Classes'}

  [TAtributoDescricao('Pessoas'), TAtribtoTabela('aluaDelphi', 'TB_PESSOA')]
  TPessoa = class
  private
    FNome: string;
    FID: Integer;
  public
    [TAtributoCampo('NOME_PESSOA')]
    property Nome: string read FNome write FNome;
    [TAtributoCampo('IDPESSOA')]
    property ID: Integer read FID write FID;
  end;

  [TAtribtoTabela('', 'CIDADE')]
  TCidade = class
  private
    FNomeCidade: string;
    FCodCidade: Integer;
  public
    [TAtributoCampo('Nome_Cidade')]
    property NomeCidade: string read FNomeCidade write FNomeCidade;
    [TAtributoCampo('cod_Cidade')]
    property CodCidade: Integer read FCodCidade write FCodCidade;
  end;

  {$endregion}


  TLocalControl = class(TControl);

  TfrmPincipal = class(TForm)
    ButtonGeraSQL: TButton;
    Button1: TButton;
    ComboBoxSelClasse: TComboBox;
    Button2: TButton;
    MemoLog: TMemo;
    procedure ButtonGeraSQLClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FObjEmFoco: TObject;
    procedure GeraSQL(pClasse: TClass);
  public
    { Public declarations }
  end;

var
  frmPincipal: TfrmPincipal;

implementation

{$R *.dfm}

{ TAtribtoTabela }

constructor TAtribtoTabela.Create(pNomeSchema, pNomeTabela: string);
begin
  FNomeSchema := pNomeSchema;
  FNomeTabela := pNomeTabela;
end;

{ TAtributoCampo }

constructor TAtributoCampo.Create(pNomeCampo: string);
begin
  FNomeCampo := pNomeCampo;
end;

procedure TfrmPincipal.Button1Click(Sender: TObject);
var
  lClass: TClass;
  lObj: TObject;
begin
  lClass := nil;
  case ComboBoxSelClasse.ItemIndex of
    0: lClass := TPessoa;
    1: lClass := TCidade;
  end;

  if Assigned(lClass) then
  begin
    lObj := lClass.Create;
    ShowMessage(lObj.ClassName);
    lObj.Free;
  end;
end;

procedure TfrmPincipal.Button2Click(Sender: TObject);
var
  lType: TRttiType;
  lProp: TRttiProperty;
  lObjInspecionado: TObject;

  function GetPropval(pProp: TRttiProperty; pInstance: TObject): string;
  begin
    Result := '';
    case pProp.PropertyType.TypeKind of
      tkUString, tkWChar, tkLString, tkWString, tkChar, tkString:
      begin
        Result := pProp.GetValue(pInstance).AsString;
      end;

      tkInteger:
      begin
        Result := IntToStr(pProp.GetValue(pInstance).AsInteger);
      end;

      tkUnknown: ;
      tkEnumeration: ;
      tkFloat: ;
      tkSet: ;
      tkClass: ;
      tkMethod: ;
      tkVariant: ;
      tkArray: ;
      tkRecord: ;
      tkInterface: ;
      tkInt64: ;
      tkDynArray: ;

      tkClassRef: ;
      tkPointer: ;
      tkProcedure: ;
      tkMRecord: ;
    end;
  end;

begin
  MemoLog.Lines.Clear;

  // lObjInspecionado := Sender;

  if not Assigned(FObjEmFoco) then
  begin
    Exit;
  end;

  lObjInspecionado := FObjEmFoco;

  lType := TRttiContext.Create.GetType(lObjInspecionado.ClassInfo);

  for lProp in lType.GetProperties do
  begin
    MemoLog.Lines.Insert(0, lProp.Name + '=' +  GetPropVal(lProp, lObjInspecionado));
  end;
end;

procedure TfrmPincipal.ButtonGeraSQLClick(Sender: TObject);
begin
  case ComboBoxSelClasse.ItemIndex of
    0:
    begin
      GeraSQL(TPessoa);
    end;

    1:
    begin
      GeraSQL(TCidade);
    end;

  else
    ShowMessage('Nenhuma classe selecionada.');

  end;
end;

procedure TfrmPincipal.FormCreate(Sender: TObject);
begin
  for var i: Integer := 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i] is TControl then
    begin
      TLocalControl(Self.Components[i]).OnMouseEnter := FormMouseEnter;
    end;
  end;
end;

procedure TfrmPincipal.FormMouseEnter(Sender: TObject);
begin
  FObjEmFoco := Sender;
end;

{ TAtributoDescricao }

constructor TAtributoDescricao.Create(pDescicao: string);
begin
  FDescricao := pDescicao;
end;

procedure TfrmPincipal.GeraSQL(pClasse: TClass);
var
  lType: TRttiType;
  lAttr: TCustomAttribute;
  lTabela, lSchema, lCampo, lSQL: string;
begin
  lType := TRttiContext.Create.GetType(pClasse);  //TCidade); //TPessoa); // para objetos: obj.ClassInfo
  for lAttr in lType.GetAttributes do
  begin
    if lAttr is TAtribtoTabela then
    begin
      lTabela := TAtribtoTabela(lAttr).NomeTabela;
      lSchema := TAtribtoTabela(lAttr).NomeSchema;
    end;
  end;

  for var lProp: TRttiProperty in lType.GetProperties do
  begin
    for lAttr in lProp.GetAttributes do
    begin
      if lAttr is TAtributoCampo then
      begin
        lCampo := lCampo + ', ' + TAtributoCampo(lAttr).NomeCampo;
      end;
    end;
  end;

  if (lTabela <> '') and (lCampo <> '') then
  begin
    ///  select id, nome from schema.tabela
    ///

    lSQL := 'select ';

    Delete(lCampo, 1, 1);
    lSQL := lSQL + lCampo + ' from ';

    if lSchema <> '' then
    begin
      lSQL := lSQL + lSchema + '.' + lTabela
    end else begin
      lSQL := lSQL + lTabela;
    end;

    ShowMessage(lSQL);
  end;
end;

end.
