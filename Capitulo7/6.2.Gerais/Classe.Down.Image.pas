unit Classe.Down.Image;

interface

uses Form.Download.Images, System.Classes, System.Threading, System.SysUtils, FMX.DialogService;

type
  TDownImage = class
    class procedure CarregaImagem(pFrmDown: TfrmDownloadImage; const pURLImagem: string);
//    class constructor Create;
  end;

implementation


{ TDownImage }

class procedure TDownImage.CarregaImagem(pFrmDown: TfrmDownloadImage; const pURLImagem: string);
var
  lBytes: TBytesStream;
begin
  ITask(
    TTask.Create(
      procedure
      begin
      lBytes := TBytesStream.Create;
      try
        pFrmDown.idHTTP.Get(pURLImagem, lBytes);

        TThread.Queue(nil,
          procedure
          begin
            pFrmDown.ImagePrincipal.BitMap.LoadFromStream(lBytes);
            lBytes.Free;
          end);

      except
        on E: Exception do
        begin
          TThread.Queue(nil,
            procedure
            begin
              lBytes.Free;
              TDialogService.ShowMessage('Erro ao realizar download: ' + sLineBreak +
                E.QualifiedClassName + ' - ' + E.Message);
            end);
        end;
      end;
//      lBytes.Free;
    end
  )).Start;
end;

//class constructor TDownImage.Create;
//begin
//  TfrmDownloadImage.FCarregaImagem := TDownImage.CarregaImagem;
//end;

initialization
  TfrmDownloadImage.FCarregaImagem := TDownImage.CarregaImagem;


end.
