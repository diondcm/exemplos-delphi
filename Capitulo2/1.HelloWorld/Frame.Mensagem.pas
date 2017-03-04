unit Frame.Mensagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TfraMensagem = class(TFrame)
    lblMensagem: TLabel;
  private
    function GetMensagem: string;
    procedure SetMensagem(const Value: string);
    function GetCorTexto: TAlphaColor;
    procedure SetCorTexto(const Value: TAlphaColor);
  public
    property Mensagem: string read GetMensagem write SetMensagem;
    property CorTexto: TAlphaColor read GetCorTexto write SetCorTexto;
  end;

implementation

{$R *.fmx}

{ TfraMensagem }

function TfraMensagem.GetCorTexto: TAlphaColor;
begin
  // todo: multiplas cores e gestures
  Result := lblMensagem.TextSettings.FontColor;
end;

function TfraMensagem.GetMensagem: string;
begin

  Result := lblMensagem.Text;
end;

procedure TfraMensagem.SetCorTexto(const Value: TAlphaColor);
begin
  lblMensagem.TextSettings.FontColor := Value;
end;

procedure TfraMensagem.SetMensagem(const Value: string);
begin
  lblMensagem.Text := Value;
end;

end.
