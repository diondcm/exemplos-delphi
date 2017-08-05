unit Classe.Lista.Configuracao;

interface

uses
  System.Generics.Collections, Data.Geral, Classe.Configuracao;

type
  TListaConfiguracao = class
    class function GetConfigs: TDictionary<string, TConfiguracao>; static;
  private class var
    FInstance: TDictionary<string, TConfiguracao>;
  public
    class destructor Destroy;

    class procedure CarregaConfigs;
    class procedure SalvaConfigs;

    class property Configs: TDictionary<string, TConfiguracao> read GetConfigs;
  end;

implementation

{ TConfiguracao }

class procedure TListaConfiguracao.CarregaConfigs;
var
  lConfig: TConfiguracao;
begin
  dmDados.qryConfig.Open;
  dmDados.qryConfig.First;
  while not dmDados.qryConfig.Eof do
  begin
    lConfig := TConfiguracao.Create;
    lConfig.ID := dmDados.qryConfigID.AsInteger;
    lConfig.Descricao := dmDados.qryConfigDESCRICAO_CONFIG.AsString;
    lConfig.NomeConfig := dmDados.qryConfigNOME_CONFIG.AsString;
    lConfig.ValorConfig := dmDados.qryConfigVALOR_CONFIG.AsString;
    lConfig.Usuario := dmDados.qryConfigUSUARIO.AsString;
    lConfig.Empresa := dmDados.qryConfigEMPRESA.AsString;

    GetConfigs.Add(lConfig.NomeConfig, lConfig);

    dmDados.qryConfig.Next;
  end;
end;

class destructor TListaConfiguracao.Destroy;
var
  lConfig: TConfiguracao;
begin
  if Assigned(FInstance) then
  begin
    for lConfig in FInstance.Values do
    begin
      lConfig.Free;
    end;
  end;

  FInstance.Free;
end;

class function TListaConfiguracao.GetConfigs: TDictionary<string, TConfiguracao>;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TDictionary<string, TConfiguracao>.Create;
    CarregaConfigs;
  end;

  Result := FInstance;
end;

class procedure TListaConfiguracao.SalvaConfigs;
var
  lConfig: TPair<string, TConfiguracao>;
begin
  for lConfig in GetConfigs do
  begin
    if dmDados.qryConfig.FindKey([lConfig.Key]) then
    begin
      dmDados.qryConfig.Edit;
    end else begin
      dmDados.qryConfig.Append;
    end;

    dmDados.qryConfigDESCRICAO_CONFIG.AsString := lConfig.Value.Descricao;
    dmDados.qryConfigNOME_CONFIG.AsString := lConfig.Value.NomeConfig;
    dmDados.qryConfigVALOR_CONFIG.AsString := lConfig.Value.ValorConfig;
    dmDados.qryConfigUSUARIO.AsString := lConfig.Value.Usuario;
    dmDados.qryConfigEMPRESA.AsString := lConfig.Value.Empresa;

    dmDados.qryConfig.Post;
  end;
end;

end.
