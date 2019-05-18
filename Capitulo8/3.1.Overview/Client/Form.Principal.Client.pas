unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ExtCtrls,
  System.DateUtils, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TfrmTesteCargaPrincipal = class(TForm)
    PanelControles: TPanel;
    EditURL: TEdit;
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    MemoLog: TMemo;
    Button2: TButton;
    DBGrid1: TDBGrid;
    dtsPessoa: TDataSource;
    memPessoa: TFDMemTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteCargaPrincipal: TfrmTesteCargaPrincipal;

implementation

{$R *.dfm}

procedure TfrmTesteCargaPrincipal.Button1Click(Sender: TObject);
var
  lURL: string;
begin
  // QueryPerformanceCounter()

  //lURL := EditURL.Text;
//  lURL := 'http://localhost:8080/datasnap/rest/TSMGeral/SetPessoa/{"type":"Classe.Pessoa.TPessoa","id":1,"fields":{"FNome":"Fulano de teste","FID":67257359,"FDataNascimento":36298.5999376042,"FCredito":897460.3175}}';
  //lURL := 'http://localhost:8080/datasnap/rest/TSMGeral/GeraPessoa';
//  lURL := 'http://localhost:8080/datasnap/rest/TSMGeral/GetDataServer';
//  lURL := 'http://localhost:8080/datasnap/rest/TSMGeral/GetListaPessoas';
  lURL := 'http://localhost:8080/datasnap/rest/TSMGeral/GetListaPessoaStr';

  for var i: Integer := 0 to 5 do
  begin
    TThread.CreateAnonymousThread(
      procedure
      var
        lStm: TStream;
        lIdHttp: TIdHTTP;
        lInicio: TTime;
        lTempoExec: Int64;
      begin
        lIdHttp := TIdHTTP.Create(nil);
        lStm := TStringStream.Create;
        try
          lInicio := Now;

          lIdHttp.Get(lURL, lStm);
//          lStm.Position := 0;
//
//          lStr := lStm.DataString;
//          Delete(lStr, 1, 12);
//          Delete(lStr, lStr.Length -3, 3);
//          lStr := StringReplace(lStr, '\', '', [rfReplaceAll]);
//          lStm.Free;
//          lStm := TStringStream.Create(lStr);

          lTempoExec := MilliSecondsBetween(lInicio, Now);
          TThread.Synchronize(nil,
            procedure
            begin
              MemoLog.Lines.Insert(0, TimeToStr(Now) + ' - ' + TStringStream(lStm).DataString + sLineBreak + 'ExecTime: ' + FormatFloat('0.,', lTempoExec) + sLineBreak);
            end);
        except
          on E: Exception do
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                MemoLog.Lines.Insert(0, TimeToStr(Now) + ' - ' + E.QualifiedClassName + ' - ' + E.Message + sLineBreak + 'ExecTime: ' + FormatFloat('0.,', lTempoExec) + sLineBreak);
              end);
          end;
        end;
        lIdHttp.Free;
        lStm.Free;
      end).Start;
  end;
end;

procedure TfrmTesteCargaPrincipal.Button2Click(Sender: TObject);
var
  lURL: string;
  lStm: TStringStream;
  lIdHttp: TIdHTTP;
  lInicio: TTime;
  lTempoExec: Int64;
  lStr: string;
begin
  lURL := 'http://localhost:8080/datasnap/rest/TSMGeral/GetListaPessoaStr';

  lIdHttp := TIdHTTP.Create(nil);
  lStm := TStringStream.Create;
  try
    lInicio := Now;

    lIdHttp.Get(lURL, lStm);
    lStm.Position := 0;

    lStr := lStm.DataString;
    Delete(lStr, 1, 12);
    Delete(lStr, lStr.Length -3, 3);
    lStr := StringReplace(lStr, '\', '', [rfReplaceAll]);
    lStm.Free;
    lStm := TStringStream.Create(lStr);

    memPessoa.Close;
    memPessoa.LoadFromStream(lStm, TFDStorageFormat.sfJSON);

    lTempoExec := MilliSecondsBetween(lInicio, Now);
    MemoLog.Lines.Insert(0, TimeToStr(Now) + ' - ' + TStringStream(lStm).DataString + sLineBreak + 'ExecTime: ' + FormatFloat('0.,', lTempoExec) + sLineBreak);
  except
    on E: Exception do
    begin
      MemoLog.Lines.Insert(0, TimeToStr(Now) + ' - ' + E.QualifiedClassName + ' - ' + E.Message + sLineBreak + 'ExecTime: ' + FormatFloat('0.,', lTempoExec) + sLineBreak);
    end;
  end;
  lIdHttp.Free;
  lStm.Free;
end;

end.
