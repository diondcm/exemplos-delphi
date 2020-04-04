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
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
    Timer1: TTimer;
    Button1: TButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    WebBrowser1: TWebBrowser;
    Button2: TButton;
    Button3: TButton;
    procedure ButtonAddClick(Sender: TObject);
    procedure EditCorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxCoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FListaCores: TDictionary<string, TColor>;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
//var
//  lSrtStm: TStringStream;
begin
//  lSrtStm := TStringStream.Create;
//  IdHTTP1.Get('https://www.gigacalculator.com/randomizers/random-color-generator.php');
//  Memo1.Text := IdHTTP1.ResponseText;
//  WebBrowser1.Navigate('http://www.randomcolour.com/');


//  IdHTTP1.Get('http://www.randomcolour.com/', lSrtStm);
//  Memo1.Text := lSrtStm.DataString;
//  lSrtStm.Free;
end;


function GetWebBrowserHTML(const WebBrowser: TWebBrowser): String;
//var
//  LStream: TStringStream;
//  Stream : IStream;
//  LPersistStreamInit : IPersistStreamInit;
begin
//  if not Assigned(WebBrowser.Document) then exit;
//  LStream := TStringStream.Create('');
//  try
//    LPersistStreamInit := WebBrowser.Document as IPersistStreamInit;
//    Stream := TStreamAdapter.Create(LStream,soReference);
//    LPersistStreamInit.Save(Stream,true);
//    result := LStream.DataString;
//  finally
//    LStream.Free();
//  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
//var
//  Doc : IHtmlDocument2;
begin
//  Memo1.Text := GetWebBrowserHTML(WebBrowser1);
//   Doc := WebBrowser1.Document as IHtmlDocument2;
//   Memo1.Lines.Text := Doc.body.innerHTML;
end;


//function GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
//var
//  Document: IHTMLDocument2;     // IHTMLDocument2 interface of Doc
//  Body: IHTMLElement2;          // document body element
//  Tags: IHTMLElementCollection; // all tags in document body
//  Tag: IHTMLElement;            // a tag in document body
//  I: Integer;                   // loops thru tags in document body
//begin
//  Result := nil;
//  // Check for valid document: require IHTMLDocument2 interface to it
//  if not Supports(Doc, IHTMLDocument2, Document) then
//    raise Exception.Create('Invalid HTML document');
//  // Check for valid body element: require IHTMLElement2 interface to it
//  if not Supports(Document.body, IHTMLElement2, Body) then
//    raise Exception.Create('Can''t find <body> element');
//  // Get all tags in body element ('*' => any tag name)
//  Tags := Body.getElementsByTagName('*');
//  // Scan through all tags in body
//  for I := 0 to Pred(Tags.length) do
//  begin
//    // Get reference to a tag
//    Tag := Tags.item(I, EmptyParam) as IHTMLElement;
//    // Check tag's id and return it if id matches
//    if AnsiSameText(Tag.id, Id) then
//    begin
//      Result := Tag;
//      Break;
//    end;
//  end;
//end;
procedure TfrmPrincipal.Button3Click(Sender: TObject);
//var
//  Elem: IHTMLElement;
begin
// Elem := GetElementById(WebBrowser1.Document, 'bgcolor') as IHTMLElement;
//  if Assigned(Elem) then
//    ShowMessage(
//      'Tag name = <' + Elem.tagName + '>'#10 +
//      'Tag id = ' + Elem.id + #10 +
//      'Tag innerHTML = "' + Elem.innerHTML + '"'
//    );
end;

procedure TfrmPrincipal.ButtonAddClick(Sender: TObject);
begin
//  ListBoxCores.Items.AddObject(EditCor.Text, TItemCor.Create(ColorBoxCor.Selected));

  if FListaCores.ContainsKey(EditCor.Text) then
  begin
    FListaCores[EditCor.Text] := ColorBoxCor.Selected;
  end else begin
    ListBoxCores.Items.Add(EditCor.Text);
    FListaCores.Add(EditCor.Text, ColorBoxCor.Selected);
  end;

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

{ TItemCor }

//constructor TItemCor.Create(ACor: TColor);
//begin
//  FCor := ACor;
//end;

end.
