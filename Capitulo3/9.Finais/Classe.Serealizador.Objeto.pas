unit Classe.Serealizador.Objeto;

interface

uses
  System.SysUtils, System.Generics.Collections, System.RTTI, Classe.Atributo.Campo,
  System.TypInfo;

type
  TSerealizador = class
    class function AsTexto(pObj: TObject): string;
  end;

implementation

{ TSerealizador }

class function TSerealizador.AsTexto(pObj: TObject): string;
var
  lDic: TDictionary<Integer, string>;
  lType: TRttiType;
  lProp: TRttiProperty;
  lAtr: TCustomAttribute;
  lCampo: TAtributoCampo;
  lValorProp: string;
  lValorCampoAlinhado: string;
  i: Integer;
  lCampoPreenchido: Boolean;
  lCTX: TRttiContext;
begin
  Result := '';
  lCTX := TRttiContext.Create;
  lDic := TDictionary<Integer, string>.Create;
  try
    lType := lCTX.GetType(pObj.ClassInfo);
    for lProp in lType.GetProperties do
    begin
      for lAtr in lProp.GetAttributes do
      begin
        if lAtr is TAtributoCampo then
        begin
          lCampoPreenchido := False;
          lCampo := TAtributoCampo(lAtr);
          case lProp.PropertyType.TypeKind of
            tkInteger:
              begin
                lCampoPreenchido := True;
                lValorProp := lProp.GetValue(pObj).AsInteger.ToString;
              end;

            tkString, tkUString:
              begin
                lCampoPreenchido := True;
                lValorProp := lProp.GetValue(pObj).AsString;
              end;

//            tkUnknown: ;
//            tkChar: ;
//            tkEnumeration: ;
//            tkFloat: ;
//            tkSet: ;
//            tkClass: ;
//            tkMethod: ;
//            tkWChar: ;
//            tkLString: ;
//            tkWString: ;
//            tkVariant: ;
//            tkArray: ;
//            tkRecord: ;
//            tkInterface: ;
//            tkInt64: ;
//            tkDynArray: ;
//            tkClassRef: ;
//            tkPointer: ;
//            tkProcedure: ;
          end;

          if (lValorProp = '') and (not lCampoPreenchido) then
          begin
            raise Exception.Create('Propriedade não implementada: ' + lProp.Name + ':' + GetEnumName(System.TypeInfo(TTypeKind), Ord(lProp.PropertyType.TypeKind)));
          end;

          if lCampo.Alinhamento = TAlinhamentoCampo.Direita then
          begin
            lValorCampoAlinhado :=
              StringOfChar(lCampo.CaracterePreenchimento,
                lCampo.Tamanho - lValorProp.Length) + lValorProp;
          end else begin
            lValorCampoAlinhado := lValorProp +
              StringOfChar(lCampo.CaracterePreenchimento,
                lCampo.Tamanho - lValorProp.Length);
          end;

          try
            lDic.Add(lCampo.Posicao, lValorCampoAlinhado);
          except
            on E: EListError do
            begin
              raise Exception.Create('Posição (' + lCampo.Posicao.ToString + ') duplicada na exportação de arquivo.' + sLineBreak + E.Message);
            end;
            on E: Exception do
            begin
              raise;
            end;
          end;
        end;
      end;
    end;

    for i := 0 to lDic.Count -1 do
    begin
      Result := Result + lDic.Items[i];
    end;

  finally
    lDic.Free;
    lCTX.Free;
  end;
end;

end.
