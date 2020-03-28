program CotacaoDOS;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Data.Cotacao in 'Data.Cotacao.pas' {dmdCotacao: TDataModule},
  ITConversorMoeda1 in 'ITConversorMoeda1.pas';

var
  lSair: Boolean;
  lValor: string;
begin
  lSair := False;
  try
    { TODO -oUser -cConsole Main : Insert code here }
    dmdCotacao := TdmdCotacao.Create(nil);
    while not lSair do
    begin
      Writeln('============================================');
      Writeln('Última cotação: ' + GetITConversorMoeda.GetCotacaoAtual);

      Writeln('1 - Para Real para Dólar');
      Writeln('2 - Para Dólar para Real');
      Writeln('s - Para Sair');
      Readln(lValor);

      if lValor = '1' then
      begin
        Writeln('Informe o valor em Real: ');
        Readln(lValor);
        Writeln('Valor convertido para Dólar: ' + dmdCotacao.ConverteRealParaDolar(lValor));
//        Writeln('Valor convertido para Dólar: ' +  FloatToStr(StrToFloat(lValor) / StrToFloat(dmdCotacao.FCotacaoAtual)));
        Writeln('Cotação utilizada: ' + GetITConversorMoeda.GetCotacaoAtual);

      end else if lValor = '2' then
      begin
        Writeln('Informe o valor em Dólar: ');
        Readln(lValor);
        Writeln('Valor convertido para Real: ' + dmdCotacao.ConverteDolarParaReal(lValor));
//        Writeln('Valor convertido para Real: ' + FloatToStr(StrToFloat(dmdCotacao.FCotacaoAtual) * StrToFloat(lValor)));
        Writeln('Cotação utilizada: ' + GetITConversorMoeda.GetCotacaoAtual);

      end else if LowerCase(lValor) = 's' then
      begin
        lSair := True;
      end else begin
        Writeln('Opção inválida: "' + lValor + '"');
      end;
    end;

    dmdCotacao.Free;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  if not lSair then
    Readln;
end.
