unit Classe.ClassificaImage;

interface

uses
  System.Classes, System.SysUtils, Vcl.Graphics, GIFImg, PngImage, Vcl.Imaging.jpeg;

type
  TClassificaImagem = class
  private
    class function FindGraphicClass(const Buffer; const BufferSize: Int64;
      out GraphicClass: TGraphicClass): Boolean; overload;
  public
    class function FindGraphicClass(Stream: TStream;
      out GraphicClass: TGraphicClass): Boolean; overload;

    class function GetImage(Stream: TStream): TGraphic; overload;
    class function GetImage(pFile: string): TGraphic; overload;
  end;


implementation

const
  MinGraphicSize = 44; //we may test up to & including the 11th longword

{ TClassificaImagem }

class function TClassificaImagem.FindGraphicClass(const Buffer; const BufferSize: Int64; out GraphicClass: TGraphicClass): Boolean;
var
  LongWords: array[Byte] of LongWord absolute Buffer;
  Words: array[Byte] of Word absolute Buffer;
begin
  GraphicClass := nil;
  Result := False;
  if BufferSize < MinGraphicSize then Exit;
  case Words[0] of
    $4D42: GraphicClass := TBitmap;
    $D8FF: GraphicClass := TJPEGImage;
    $4949: if Words[1] = $002A then GraphicClass := TWicImage; //i.e., TIFF
    $4D4D: if Words[1] = $2A00 then GraphicClass := TWicImage; //i.e., TIFF
  else
    if Int64(Buffer) = $A1A0A0D474E5089 then
      GraphicClass := TPNGImage
    else if LongWords[0] = $9AC6CDD7 then
      GraphicClass := TMetafile
    else if (LongWords[0] = 1) and (LongWords[10] = $464D4520) then
      GraphicClass := TMetafile
    else if StrLComp(PAnsiChar(@Buffer), 'GIF', 3) = 0 then
      GraphicClass := TGIFImage
    else if Words[1] = 1 then
      GraphicClass := TIcon;
  end;
  Result := (GraphicClass <> nil);
end;

class function TClassificaImagem.FindGraphicClass(Stream: TStream; out GraphicClass: TGraphicClass): Boolean;
var
  Buffer: PByte;
  CurPos: Int64;
  BytesRead: Integer;
begin
  if Stream is TCustomMemoryStream then
  begin
    Buffer := TCustomMemoryStream(Stream).Memory;
    CurPos := Stream.Position;
    Inc(Buffer, CurPos);
    Result := FindGraphicClass(Buffer^, Stream.Size - CurPos, GraphicClass);
    Exit;
  end;
  GetMem(Buffer, MinGraphicSize);
  try
    BytesRead := Stream.Read(Buffer^, MinGraphicSize);
    Stream.Seek(-BytesRead, soCurrent);
    Result := FindGraphicClass(Buffer^, BytesRead, GraphicClass);
  finally
    FreeMem(Buffer);
  end;
end;

class function TClassificaImagem.GetImage(pFile: string): TGraphic;
var
  lStm: TStringStream;
begin
  lStm := TStringStream.Create;
  lStm.LoadFromFile(pFile);
  Result := GetImage(lStm);
  lStm.Free;
end;

class function TClassificaImagem.GetImage(Stream: TStream): TGraphic;
var
  lClass: TGraphicClass;
begin
  Result := nil;
  Stream.Position := 0;

  if FindGraphicClass(Stream, lClass) then
  begin
    Result := lClass.Create;
    Result.LoadFromStream(Stream);
  end;
end;

end.
