unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.OleCtrls,
  SHDocVw, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, mshtml, ActiveX;

type
//  TItemCor = class
//  private
//    FCor: TColor;
//  public
//    constructor Create(ACor: TColor);
//    property Cor: TColor read FCor write FCor;
//  end;

  TfrmPrincipal = class(TForm)
    ListBoxCores: TListBox;
    PanelAddCor: TPanel;
    EditCor: TEdit;
    ButtonAdd: TButton;
    ColorBoxCor: TColorBox;
    PanelCor: TPanel;
    TimerRandomColor: TTimer;
    WebBrowser1: TWebBrowser;
    procedure ButtonAddClick(Sender: TObject);
    procedure EditCorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxCoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerRandomColorTimer(Sender: TObject);
  private
    FListaCores: TDictionary<string, TColor>;
    procedure AdicionaCor(pNome: string; pCor: TColor);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AdicionaCor(pNome: string; pCor: TColor);
begin
  if FListaCores.ContainsKey(pNome) then
  begin
    FListaCores[pNome] := pCor;
  end else begin
    ListBoxCores.Items.Add(pNome);
    FListaCores.Add(pNome, pCor);
  end;
end;

procedure TfrmPrincipal.ButtonAddClick(Sender: TObject);
begin
//  ListBoxCores.Items.AddObject(EditCor.Text, TItemCor.Create(ColorBoxCor.Selected));

  AdicionaCor(EditCor.Text, ColorBoxCor.Selected);
  EditCor.Text := '';
  ColorBoxCor.Selected := clBlack;
end;

procedure TfrmPrincipal.EditCorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonAddClick(Sender);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FListaCores := TDictionary<string, TColor>.Create;

  WebBrowser1.Top := Self.Height + 10;
  WebBrowser1.Left := Self.Width + 10;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FListaCores.Free;
//  for var i: Integer := 0 to ListBoxCores.Items.Count -1 do
//  begin
//    ListBoxCores.Items.Objects[i].Free;
//  end;
end;

procedure TfrmPrincipal.ListBoxCoresClick(Sender: TObject);
begin
  if ListBoxCores.ItemIndex <> -1 then
  begin
    PanelCor.Caption := 'Cor Selecionada: ' + ListBoxCores.Items[ListBoxCores.ItemIndex] ;
    PanelCor.Color := FListaCores[ListBoxCores.Items[ListBoxCores.ItemIndex]];

//    PanelCor.Caption := 'Cor Selecionada: ' + ListBoxCores.Items[ListBoxCores.ItemIndex];
//    PanelCor.Color := TItemCor(ListBoxCores.Items.Objects[ListBoxCores.ItemIndex]).Cor;
  end;
end;

procedure TfrmPrincipal.TimerRandomColorTimer(Sender: TObject);

  procedure buscaCores(const Doc: IDispatch);
  var
    Document: IHTMLDocument2;
    Body: IHTMLElement2;
    Tags: IHTMLElementCollection;
    Tag: IHTMLElement;
    I: Integer;
    lCores: string;
    lPosRGB: Integer;
    lPosE: Integer;
  begin
    if not Supports(Doc, IHTMLDocument2, Document) then
      raise Exception.Create('Invalid HTML document');
    if not Supports(Document.body, IHTMLElement2, Body) then
      raise Exception.Create('Can''t find <body> element');
    Tags := Body.getElementsByTagName('*');
    for I := 0 to Pred(Tags.length) do
    begin
      Tag := Tags.item(I, EmptyParam) as IHTMLElement;
      if pos('reslut', string(Tag.innerHTML)) > 0 then
      begin
        lPosRGB := pos('rgb(', string(Tag.innerHTML));
        lPosE := pos(')&nbsp', string(Tag.innerHTML));
        if lPosRGB > 0 then
        begin
          lCores := Copy(Tag.innerHTML, lPosRGB + 4, lPosE - (lPosRGB + 4));
          var lStl: TStringList := TStringList.Create;
          lStl.Delimiter := ',';
          lStl.DelimitedText := lCores;
          var lRed: Byte := StrToInt(lStl[0]);
          var lGreen: Byte := StrToInt(lStl[1]);
          var lBlue: Byte := StrToInt(lStl[2]);
          var lCor: TColor := RGB(lRed, lGreen, lBlue);

          AdicionaCor('RGB(' + lCores + ')', lCor);
          lStl.Free;
        end;
      end;
    end;
  end;

  procedure Pause(const ADelay: LongWord);
  var
    StartTC: DWORD;
    CurrentTC: Int64;
  begin
    StartTC := GetTickCount;
    repeat
      Application.ProcessMessages;
      CurrentTC := GetTickCount;
      if CurrentTC < StartTC then
        CurrentTC := CurrentTC + High(DWORD);
    until CurrentTC - StartTC >= ADelay;
  end;
begin
  WebBrowser1.Silent := True;
  WebBrowser1.Navigate('https://random-color.net/');
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    Pause(5);

  buscaCores(WebBrowser1.Document);
end;

{ TItemCor }

//constructor TItemCor.Create(ACor: TColor);
//begin
//  FCor := ACor;
//end;

end.
