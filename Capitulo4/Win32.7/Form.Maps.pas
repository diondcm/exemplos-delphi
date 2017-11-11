unit Form.Maps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls, WinApi.ActiveX, MSHTML,
  Vcl.Buttons;

///  URLS Alternativas:
///  https://github.com/hgourvest/dcef3
///  https://sourceforge.net/projects/gmlibrary/

type
  TfrmMaps = class(TForm)
    panelControles: TPanel;
    WebBrowser: TWebBrowser;
    editURL: TEdit;
    labelEndereco: TLabel;
    memEndereco: TMemo;
    labelLatitude: TLabel;
    editLatitude: TEdit;
    labelLongitude: TLabel;
    editLongitude: TEdit;
    buttonGoToLatLong: TButton;
    checkTraffic: TCheckBox;
    checkBicycling: TCheckBox;
    checkStreatView: TCheckBox;
    buttonGoTo: TBitBtn;
    buttonClear: TBitBtn;
    procedure editURLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure buttonGoToClick(Sender: TObject);
    procedure checkTrafficClick(Sender: TObject);
    procedure checkBicyclingClick(Sender: TObject);
    procedure checkStreatViewClick(Sender: TObject);
    procedure buttonClearClick(Sender: TObject);
    procedure buttonGoToLatLongClick(Sender: TObject);
  private
    FHTMLWindow: IHTMLWindow2;
    procedure NavegarPara(const pURL: string);
  public
    { Public declarations }
  end;

var
  frmMaps: TfrmMaps;

implementation

var
  HTMLStr: AnsiString =
'<html> '+
'<head> '+
'<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" /> '+
'<script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3&sensor=true"></script> '+
'<script type="text/javascript"> '+
''+
''+
'  var geocoder; '+
'  var map;  '+
'  var trafficLayer;'+
'  var bikeLayer;'+
'  var markersArray = [];'+
''+
''+
'  function initialize() { '+
'    geocoder = new google.maps.Geocoder();'+
'    var latlng = new google.maps.LatLng(40.714776,-74.019213); '+
'    var myOptions = { '+
'      zoom: 13, '+
'      center: latlng, '+
'      mapTypeId: google.maps.MapTypeId.ROADMAP '+
'    }; '+
'    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); '+
'    trafficLayer = new google.maps.TrafficLayer();'+
'    bikeLayer = new google.maps.BicyclingLayer();'+
'    map.set("streetViewControl", false);'+
'  } '+
''+
''+
'  function codeAddress(address) { '+
'    if (geocoder) {'+
'      geocoder.geocode( { address: address}, function(results, status) { '+
'        if (status == google.maps.GeocoderStatus.OK) {'+
'          map.setCenter(results[0].geometry.location);'+
'          PutMarker(results[0].geometry.location.lat(), results[0].geometry.location.lng(), results[0].geometry.location.lat()+","+results[0].geometry.location.lng());'+
'        } else {'+
'          alert("Geocode was not successful for the following reason: " + status);'+
'        }'+
'      });'+
'    }'+
'  }'+
''+
''+
'  function GotoLatLng(Lat, Lang) { '+
'   var latlng = new google.maps.LatLng(Lat,Lang);'+
'   map.setCenter(latlng);'+
'   PutMarker(Lat, Lang, Lat+","+Lang);'+
'  }'+
''+
''+
'function ClearMarkers() {  '+
'  if (markersArray) {        '+
'    for (i in markersArray) {  '+
'      markersArray[i].setMap(null); '+
'    } '+
'  } '+
'}  '+
''+
'  function PutMarker(Lat, Lang, Msg) { '+
'   var latlng = new google.maps.LatLng(Lat,Lang);'+
'   var marker = new google.maps.Marker({'+
'      position: latlng, '+
'      map: map,'+
'      title: Msg+" ("+Lat+","+Lang+")"'+
'  });'+
' markersArray.push(marker); '+
'  }'+
''+
''+
'  function TrafficOn()   { trafficLayer.setMap(map); }'+
''+
'  function TrafficOff()  { trafficLayer.setMap(null); }'+
''+''+
'  function BicyclingOn() { bikeLayer.setMap(map); }'+
''+
'  function BicyclingOff(){ bikeLayer.setMap(null);}'+
''+
'  function StreetViewOn() { map.set("streetViewControl", true); }'+
''+
'  function StreetViewOff() { map.set("streetViewControl", false); }'+
''+
''+'</script> '+
'</head> '+
'<body onload="initialize()"> '+
'  <div id="map_canvas" style="width:100%; height:100%"></div> '+
'</body> '+
'</html> ';

{$R *.dfm}

procedure TfrmMaps.buttonClearClick(Sender: TObject);
begin
  FHTMLWindow.execScript('ClearMarkers()', 'JavaScript');
end;

procedure TfrmMaps.buttonGoToClick(Sender: TObject);
begin
  FHTMLWindow.execScript(Format('codeAddress(%s)', [QuotedStr(StringReplace(memEndereco.Text, sLineBreak, '', [rfReplaceAll]))]), 'JavaScript');
end;

procedure TfrmMaps.buttonGoToLatLongClick(Sender: TObject);
begin
  FHTMLWindow.execScript(Format('GotoLatLgn(%s,%s)', [editLatitude.Text, EditLongitude.Text]), 'JavaScript');
end;

procedure TfrmMaps.checkBicyclingClick(Sender: TObject);
begin
  if checkBicycling.Checked then
    FHTMLWindow.execScript('BicyclingOn()', 'JavaScript')
  else
    FHTMLWindow.execScript('BicyclingOff()', 'JavaScript');
end;

procedure TfrmMaps.checkStreatViewClick(Sender: TObject);
begin
  if checkStreatView.Checked then
    FHTMLWindow.execScript('StreetViewOn()', 'JavaScript')
  else
    FHTMLWindow.execScript('StreetViewOff()', 'JavaScript');
end;

procedure TfrmMaps.checkTrafficClick(Sender: TObject);
begin
  if checkTraffic.Checked then
    FHTMLWindow.execScript('TrafficOn()', 'JavaScript')
  else
    FHTMLWindow.execScript('TrafficOff()', 'JavaScript');
end;

procedure TfrmMaps.editURLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    NavegarPara(editURL.Text);
  end;
end;

procedure TfrmMaps.FormCreate(Sender: TObject);
var
  lStm: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  if Assigned(WebBrowser.Document) then
  begin
    lStm := TMemoryStream.Create;
    try
      lStm.Write(Pointer(HTMLStr)^, Length(HTMLStr));
      lStm.Position := 0;
      WebBrowser.Silent := True;
      (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(lStm));
    finally
      lStm.Free;
    end;

    FHTMLWindow := (WebBrowser.Document as IHTMLDocument2).parentWindow;
  end;
end;

procedure TfrmMaps.NavegarPara(const pURL: string);
begin
  WebBrowser.Navigate(pURL);
end;

end.
