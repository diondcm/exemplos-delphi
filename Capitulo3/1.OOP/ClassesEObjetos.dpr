program ClassesEObjetos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Vcl.Graphics,
  Classe.Veiculo in 'Classe.Veiculo.pas';


  procedure ListaInfos(pVeiculo: TVeiculo);
  begin
    Writeln(format(pVeiculo.ClassName + ': $%p', [@pVeiculo]));
    pVeiculo.ExibeInfos;
  end;

var
  lCarro: TCarro;
  lCaminhao: TCaminhao;
  lClasse: TClasseNaoUtilizada;
begin
  ReportMemoryLeaksOnShutdown := True;

  try
//    TVeiculo.FRenavam := '5453';

    lCarro := TCarro.CreateComPlaca('ABC-1234');
    try
//      lCarro.TotaRodas := 2;
//      Write(lCarro.TotaRodas);
      try
        raise Exception.Create('Error Message');

      except
        on E: Exception do
        begin
//          Writeln('Deu algum erro, nem sei qual!');
          //Writeln('Deu erro de conexção.');

          Writeln(format('Exceção silenciada, pode ser a conexção. Msg: %s',  [E.Message]));
//          raise;
        end;
      end;
      lCarro.Cor := clRed;
  //    lCarro.FRenavam := '54487';
      ListaInfos(lCarro);
    finally
      // Halt
      lCarro.Free;
    end;


//    Writeln(format('Carro: $%p', [@lCarro]));
//    lCarro.ExibeInfos;

//    lCaminhao := TCaminhao.CreateComPlaca('CBA-5534');
//    lCaminhao.LimiteCarga := 10000;
//    ListaInfos(lCaminhao);
//    lCaminhao.Free;

//    Writeln(format('Caminhao: $%p', [@lCaminhao]));
//    lCaminhao.ExibeInfos;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
