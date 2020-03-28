program CotacaoDOS;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Data.Cotacao in 'Data.Cotacao.pas' {dmdCotacao: TDataModule};


var
  lSair: Boolean;
  lValor: string;
begin
  try


    { TODO -oUser -cConsole Main : Insert code here }
    dmdCotacao := TdmdCotacao.Create(nil);
    lSair := False;
    while not lSair do
    begin
      Writeln('============================================');
      Writeln('Ultima contação: ' + dmdCotacao.FCotacaoAtual);

      Writeln('1 - Para Real para Dólar');
      Writeln('2 - Para Dolar para Real');
      Writeln('s - Para Sair');
      Readln(lValor);

      if lValor = '1' then
      begin
        Writeln('Informe o valor em Real: ');
        Readln(lValor);
        Writeln('Valor convertido para Dolar: ' + StrToFloat(lValor) / FloatToStr(StrToFloat(dmdCotacao.FCotacaoAtual)));
        Writeln('Cotação utilizada: ' + dmdCotacao.FCotacaoAtual);

      end else if lValor = '2' then
      begin
        Writeln('Informe o valor em Dolar: ');
        Readln(lValor);
        Writeln('Valor convertido para Real: ' + FloatToStr(StrToFloat(dmdCotacao.FCotacaoAtual) * StrToFloat(lValor)));
        Writeln('Cotação utilizada: ' + dmdCotacao.FCotacaoAtual);

      end else if LowerCase(lValor) = 's' then
      begin
        lSair := True;
      end else begin
        Writeln('Opção invalida: "' + lValor + '"');
      end;
    end;

    dmdCotacao.Free;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
