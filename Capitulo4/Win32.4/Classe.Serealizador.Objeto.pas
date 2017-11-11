unit Classe.Serealizador.Objeto;

interface

uses
  System.Rtti, System.TypInfo, System.Classes, System.SysUtils, System.Generics.Collections,
  System.DateUtils, Classe.Atributo.Arquivo;

type
  TSerealizadorObjeto = class
    class function AsTexto(pObjeto: TObject): string;
  end;

implementation

{ TSerealizadorObjeto }

class function TSerealizadorObjeto.AsTexto(pObjeto: TObject): string;
var
  lDic: TDictionary<Integer, string>;
  lType: TRttiType;
  lField: TRttiField;
  lAttr: TCustomAttribute;
  lAtrData: TAtributoCampoData;
  lValorData: TDateTime;
  lAtrCampo: TAtributoCampo;
  lValorFloat: Extended;
  lValorStr: string;
  lValorInt: Int64;
  i: Integer;
begin
  Result := '';
  lDic := TDictionary<Integer, string>.Create;
  try
    lType := TRttiContext.Create.GetType(pObjeto.ClassInfo);
    for lField in lType.GetDeclaredFields do
    begin
      for lAttr in lField.GetAttributes do
      begin
        if lAttr is TAtributoCampoData  then
        begin
          lAtrData := TAtributoCampoData(lAttr);
          case lField.FieldType.TypeKind of
            tkFloat:
            begin
              lValorData := TDateTime(lField.GetValue(pObjeto).AsVariant);
              if CompareStr(lAtrData.Formatacao, TAtributoCampoData.DATA_PADRAO) = 0 then
              begin
                // lDic.Add(lAtrData.FieldIndex, '"' + lField.Name + '":' + '"' + DateToISO8601(lValorData, False) + '"');

                lDic.Add(lAtrData.FieldIndex, DateToISO8601(lValorData, False));
              end else
                raise Exception.Create('Formato de data: ' + lAtrData.Formatacao + ' não implementado para serealização.');
            end;

            {$REGION 'Fiels possíveis para Data, ainda não implementados'}
            tkUnknown,
            tkInteger,
            tkChar,
            tkEnumeration,
            tkString,
            tkSet,
            tkClass,
            tkMethod,
            tkWChar,
            tkLString,
            tkWString,
            tkVariant,
            tkArray,
            tkRecord,
            tkInterface,
            tkInt64,
            tkDynArray,
            tkUString,
            tkClassRef,
            tkPointer,
            tkProcedure:
              raise Exception.Create('Implementação de tipo data: ' + Ord(lField.FieldType.TypeKind).ToString + ' não implementado.');
            {$ENDREGION}
          end;
        end else if lAttr is TAtributoCampo then
        begin
          lValorStr := '';
          lAtrCampo := TAtributoCampo(lAttr);
          case lField.FieldType.TypeKind of
            tkFloat:
            begin
              lValorFloat := lField.GetValue(pObjeto).AsExtended;// 0,53  >> 0,534 >> 0534 >> 5,34
              lValorStr := StringReplace(StringReplace(FormatFloat('0,.00', lValorFloat), '.', '', []), ',', '', []);
            end;

            tkInt64,
            tkInteger:
            begin
              lValorInt := lField.GetValue(pObjeto).AsInt64;
              lValorStr := lValorInt.ToString;
            end;

            tkChar,
            tkString,
            tkWChar,
            tkUString,
            tkLString,
            tkWString,
            tkVariant:
            begin
              lValorStr := lField.GetValue(pObjeto).AsString;
            end;

            {$REGION 'Fiels possíveis ainda não implementados'}
            tkUnknown,
            tkEnumeration,
            tkSet,
            tkClass,
            tkMethod,
            tkArray,
            tkRecord,
            tkInterface,
            tkDynArray,
            tkClassRef,
            tkPointer,
            tkProcedure:
              raise Exception.Create('Implementação de tipo de field: ' + Ord(lField.FieldType.TypeKind).ToString + ' não implementado.');
            {$ENDREGION}
          end;

          case lAtrCampo.Alinhamento of
            Direita:
              lValorStr := StringOfChar(lAtrCampo.CaracterePreenchimento, lAtrCampo.Tamanho - lValorStr.Length {Se <= 0 então retorna ''}) + lValorStr;
            Esquerda:
              lValorStr := lValorStr + StringOfChar(lAtrCampo.CaracterePreenchimento, lAtrCampo.Tamanho - lValorStr.Length);
          end;

          lDic.Add(lAtrCampo.FieldIndex, lValorStr);
        end;
      end;
    end;

    for i := 1 to lDic.Count do
    begin
      if not lDic.ContainsKey(i) then
      begin
        raise Exception.Create('Chave[' + i.ToString + '] não localizada na lista de Fields.');
      end;

      Result := Result + lDic.Items[i];
    end;
  except
    on E: Exception do
    begin
      lDic.Free;
      raise Exception.Create('Erro ao serealizar:' + sLineBreak + E.QualifiedClassName + ' - ' + E.Message);
    end;
  end;

  lDic.Free;
end;

end.
