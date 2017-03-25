unit Classe.Livro;

interface

uses
  Data.DB, System.SysUtils, System.Classes;

type
  TLivro = class//(TObject), informando ou não TObject, é o mesmo comportamento
  private
    FAutor: string;
    FTitulo: string;
    FISBN: string;
    FIdioma: string;
    FID: Integer;
    FDts: TDataSet;
    FOnSetID: TNotifyEvent;
    procedure SetAutor(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetIdioma(const Value: string);
    procedure SetISBN(const Value: string);
    procedure SetTitulo(const Value: string);
    procedure SetDts(const Value: TDataSet);
    procedure SetOnSetID(const Value: TNotifyEvent);
  public
    procedure SaveToDataSet;
    property Dts: TDataSet read FDts write SetDts;
    property OnSetID: TNotifyEvent read FOnSetID write SetOnSetID;
    property ID: Integer read FID write SetID;
    property ISBN: string read FISBN write SetISBN;
    property Titulo: string read FTitulo write SetTitulo;
    property Autor: string read FAutor write SetAutor;
    property Idioma: string read FIdioma write SetIdioma;
  end;

implementation

{ TLivro }

procedure TLivro.SaveToDataSet;
begin
  FDts.Insert;
  FDts.FieldByName('ID').AsInteger := FID;
  FDts.FieldByName('ISBN').AsString := FISBN;
  FDts.FieldByName('Titulo').AsString := FTitulo;
  FDts.FieldByName('Autor').AsString := FAutor;
  FDts.FieldByName('Idioma').AsString := FIdioma;
  FDts.Post;

//    Dts.Fields[0].Value := ''; // Verdade, é mais rápido. -> merece dar manutenção neste fonte
//    Dts.Fields[1].Value := '';
//    Dts.Fields[2].Value := '';
//    Dts.Fields[ID_INDEX].Value := ''; // Talvez mais fácil
end;

procedure TLivro.SetAutor(const Value: string);
begin
  FAutor := Value;
end;

procedure TLivro.SetDts(const Value: TDataSet);
begin
  FDts := Value;
end;

procedure TLivro.SetID(const Value: Integer);
begin
  FID := Value;
  if Assigned(OnSetID) then
  begin
    OnSetID(Self);
  end else begin
    raise Exception.Create('Método de validação de ID, não foi informado.');
  end;
end;

procedure TLivro.SetIdioma(const Value: string);
begin
  FIdioma := Value;
end;

procedure TLivro.SetISBN(const Value: string);
begin
  FISBN := Value;
end;

procedure TLivro.SetOnSetID(const Value: TNotifyEvent);
begin
  FOnSetID := Value;
end;

procedure TLivro.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

end.
