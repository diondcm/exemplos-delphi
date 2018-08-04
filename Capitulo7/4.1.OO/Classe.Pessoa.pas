unit Classe.Pessoa;

interface

uses Classes.Base, WinAPI.Windows, Generics.Collections;

type
  TOnAtualizaReg = reference to procedure (pRegistro, pCount: Integer; var pContinua: Boolean);
  
  TPessoa = class(TClasseBase)
  protected
    // VMT - Vitual Method Table
    function GetNovoID: Int64; override; abstract;
  end;


  TPessoaFisica = class(TPessoa)
  public
    function GetNovoID: Int64; override;
  end;

  TEmpresa = class(TClasseBase)
    type
      TSubEmpresa = class(TClasseBase)
        function GetCNPJ: string;
      end;
  end;

  TFuncionario = class(TPessoa)

  end;

  TPessoaJuridica = class(TPessoa)
  private
    FFuncionarios: TArray<TFuncionario>;
    FRazaoSocial: string;
    FNomeFantasia: string;
    function GetNomeFantasisa: string;
    procedure SetNomeFantasisa(const Value: string);
    function GetFuncionarios(Index: Integer): TFuncionario;
    procedure SetFuncionarios(Index: Integer; const Value: TFuncionario);
  protected
    function GetNovoID: Int64; override;
  public
    CodigoPessoa: Integer;
    procedure Atualiza(pOnUpdate: TOnAtualizaReg);    

    property RazaoSocial: string read FRazaoSocial{ write FRazaoSocial};

    property NomeFantasisa: string read GetNomeFantasisa write SetNomeFantasisa;
    property Funcionarios[Index: Integer]: TFuncionario read GetFuncionarios write SetFuncionarios; default;
  end;

  TLocalizacao = class

  end;


  // Todo: linguagens de prog
  IVeiculo = interface(IInterfaceBase)
  ['{FB24B211-5922-4312-B6A4-63EA3FB1AEC2}']
//    FIdentificacao: string;
    function GetID: string;
    function GetLocalizacao: TLocalizacao;
    procedure Locomover(pDestino: TList<TLocalizacao>);
    property PosicaoAtual: TLocalizacao read GetLocalizacao;
  end;

//  TVeiculo = class
//
//  end;
  TNaval = class(TInterfacedObject)

  end;

  TTerrestre = class(TClasseBase)

  end;

  TAviao = class(TInterfacedObject, IVeiculo)
  public
    function GetID: string;
    function GetLocalizacao: TLocalizacao;
    procedure Locomover(pDestino: TList<TLocalizacao>);
  end;

  TNavio = class(TNaval, IVeiculo)
  public
    function GetID: string;
    function GetLocalizacao: TLocalizacao;
    procedure Locomover(pDestino: TList<TLocalizacao>);
  end;

  TInterfacedObjectLocal = class(System.TInterfacedObject);

  TTrem = class(TTerrestre, IVeiculo)
  private
    FInterfacedObj: TInterfacedObjectLocal;
  public
    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    { IVeiculo }
    function GetID: string;
    function GetLocalizacao: TLocalizacao;
    procedure Locomover(pDestino: TList<TLocalizacao>);
  end;


implementation

uses
  System.SysUtils;

{ TPessoaFisica }

function TPessoaFisica.GetNovoID: Int64;
begin
  Result := GetTickCount64;
end;

{ TEmpresa.TSubEmpresa }

function TEmpresa.TSubEmpresa.GetCNPJ: string;
begin
  Result := '';
end;

{ TPessoaJuridica }

procedure TPessoaJuridica.Atualiza(pOnUpdate: TOnAtualizaReg);
var
  i: Integer;
  lContinua: Boolean;
begin
  for i := 0 to 100000 do
  begin
    pOnUpdate(i, 100000, lContinua);
    if not lContinua then
    begin
      Break;
    end;    
  end;

end;

function TPessoaJuridica.GetFuncionarios(Index: Integer): TFuncionario;
begin
  Result := FFuncionarios[Index];
end;

function TPessoaJuridica.GetNomeFantasisa: string;
begin
  Result := FNomeFantasia;
end;

function TPessoaJuridica.GetNovoID: Int64;
begin
  Result := 0;
end;

procedure TPessoaJuridica.SetFuncionarios(Index: Integer; const Value: TFuncionario);
begin
  // Apenas exemplo: neste caso teria que controlar o tamanho do array;
  FFuncionarios[Index] := Value;
end;

procedure TPessoaJuridica.SetNomeFantasisa(const Value: string);
begin
  if Pos('@', Value) > 0 then
  begin
    raise Exception.Create('  ''@'' não é um caractere válido para Nome Fantasia: ' + Value);
  end;

  FNomeFantasia := Value;
end;

{ TAviao }

function TAviao.GetID: string;
begin
  Result := ClassName;
end;

function TAviao.GetLocalizacao: TLocalizacao;
begin
  Result := nil;
end;

procedure TAviao.Locomover(pDestino: TList<TLocalizacao>);
begin

end;

{ TNavio }

function TNavio.GetID: string;
begin
  Result := ClassName;
end;

function TNavio.GetLocalizacao: TLocalizacao;
begin
  Result := nil;
end;

procedure TNavio.Locomover(pDestino: TList<TLocalizacao>);
begin

end;

{ TTrem }

function TTrem.GetID: string;
begin
  Result := ClassName;
end;

function TTrem.GetLocalizacao: TLocalizacao;
begin
  Result := nil;
end;

procedure TTrem.Locomover(pDestino: TList<TLocalizacao>);
begin

end;

function TTrem.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  Result := FInterfacedObj.QueryInterface(IID, Obj);
end;

function TTrem._AddRef: Integer;
begin
  Result := FInterfacedObj._AddRef;
end;

function TTrem._Release: Integer;
begin
  Result := FInterfacedObj._Release;
  //Obj ATUAL SAI DE MEMÓRIA
end;

end.
