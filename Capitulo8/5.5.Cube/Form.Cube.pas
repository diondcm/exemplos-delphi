unit Form.Cube;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fcxExportXLSX, fcxExportCSV, fcxExportDBF, fcxExportHTML, fcxExportBIFF, fcxExportODF, fcxCustomExport, fcxExportXML, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, fcxCustomToolbar, fcxSliceGridToolbar, fcxControl, fcxZone, fcxCustomGrid, fcxSliceGrid, Data.Cube, Data.DB, Data.Win.ADODB,
  frxClass, frxDBSet, frxDesgn, GraphUtil, Menus, ImgList,
  fcxTypes, fcxComponent, fcxRes, fcxDataSource, fcxCube, fcxSlice, fcxPainters,
  fcxGridPainters, fcxCubeGrid,
  fcxChart, fcxCubeGridToolBar, fcxStyles, VclTee.TeeGDIPlus, System.ImageList;

type
  TTreeNodeKind = (tnkGroup, tnkCube, tnkSchema);

  TTreeNodeValue = record
    FileName: string;
    Description: string;
    StateIndex: Integer;
    NodeKind: TTreeNodeKind;
  end;
  PTreeNodeValue = ^TTreeNodeValue;

  TfrmCube = class(TForm)
    fcxXMLExport1: TfcxXMLExport;
    fcxODSExport1: TfcxODSExport;
    fcxBIFFExport1: TfcxBIFFExport;
    fcxHTMLExport1: TfcxHTMLExport;
    fcxDBFExport1: TfcxDBFExport;
    fcxCSVExport1: TfcxCSVExport;
    fcxXLSXExport1: TfcxXLSXExport;
    PageControlGeral: TPageControl;
    TabSlice: TTabSheet;
    TabGrafico: TTabSheet;
    TabGridCube: TTabSheet;
    fcxSliceGrid1: TfcxSliceGrid;
    fcxSliceGridToolbar1: TfcxSliceGridToolbar;
    Panel4: TPanel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Panel3: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    FileOpenDialog: TFileOpenDialog;
    TimerOpenFolder: TTimer;
    Tree: TTreeView;
    Splitter1: TSplitter;
    procedure Button6Click(Sender: TObject);
    procedure TimerOpenFolderTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataPath: string;
    FSkipAdoExamples: Boolean;
    FActiveCube: TTreeNode;
    procedure LoadExamplesTree;
  public
    { Public declarations }
  end;

var
  frmCube: TfrmCube;

implementation

{$R *.dfm}

function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  I,X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;

procedure TfrmCube.Button6Click(Sender: TObject);
var
  Data: PTreeNodeValue;
  AStream: TMemoryStream;
begin
  Data := PTreeNodeValue(FActiveCube.Data);
  if Data^.StateIndex = 22 then
  begin
    Button4.Enabled := True;
    Button5.Enabled := True;
    AStream := TMemoryStream.Create;
    dmdCube.MDSlice.SaveToStream(AStream);
    AStream.Position := 0;
    dmdCube.MDCube.LoadFromFile(FDataPath + 'cubes' + PathDelim + '2_0_append_3.mdc');
    dmdCube.MDSlice.LoadFromStream(AStream);
    AStream.Free
  end
  else
  if Data^.StateIndex = 23 then
  begin
    Button7.Enabled := True;
    Button8.Enabled := True;
    AStream := TMemoryStream.Create;
    dmdCube.MDSlice.SaveToStream(AStream);
    AStream.Position := 0;
    dmdCube.MDCube.LoadFromFile(FDataPath + 'cubes' + PathDelim + '2_0_Year_2004.mdc');
    dmdCube.MDSlice.LoadFromStream(AStream);
    AStream.Free
  end
  else
  begin
    Button4.Enabled := True;
    Button5.Enabled := True;
    TADOQuery(dmdCube.fcxDBDSItems.DataSet).SQL.Text :=
      'SELECT items.orderno, items.partno, items.qty, orders.custno, orders.empno, orders.saledate'#$D#$A+
      'FROM items LEFT OUTER JOIN orders ON items.orderno = orders.orderno where items.orderno < 1100';
    dmdCube.MDCube.Close;
    dmdCube.MDCube.DataSource := dmdCube.Demo;
    dmdCube.MDCube.CubeSource := fccs_DataSource;
    dmdCube.MDCube.Open;
    dmdCube.MDSlice.LoadfromFile(FDataPath + 'cubes' + PathDelim + Data^.FileName);
    dmdCube.MDCube.Caption := Data^.Description;
    dmdCube.MDSlice.XAxisContainer.InsertMeasuresField(0);
  end;
end;

procedure TfrmCube.FormCreate(Sender: TObject);
begin
  TimerOpenFolder.Enabled := True;
end;

procedure TfrmCube.LoadExamplesTree;
var
  AFile: TextFile;
  AOneStr, ANameLang, AValueLang : string;
  LastGroup, LastCube, Node: TTreeNode;
  APos1, APos2, APos3, StateIndex: integer;
  NodeValue: PTreeNodeValue;
begin
//  NewInDemo.Clear;
  AssignFile(AFile, FDataPath + fcxResources.Get('dmConf'));
  Reset(AFile);
  try
    LastGroup := nil;
    LastCube := nil;
    Tree.Items.BeginUpdate;
    while not Eof(AFile) do
    begin
      Readln(AFile, AOneStr);
      if Trim(AOneStr) = '' then
        Continue;
      if Copy(AOneStr, 1, 4) = 'GROU' then
      begin
        Node := Tree.Items.AddChild(nil, StringToControl(Trim(copy(AOneStr, 7, Length(AOneStr)))));
        Node.SelectedIndex := 0;
        Node.ImageIndex := 0;
        New(NodeValue);
        NodeValue^.FileName := '';
        NodeValue^.Description := '';
        NodeValue^.NodeKind := tnkGroup;
        NodeValue^.StateIndex := -1;
        Node.Data := NodeValue;
        LastGroup := Node;
      end
      else
      if copy(AOneStr, 1, 4) = 'CUBE' then
      begin
        APos1 := PosEx(';', AOneStr, 1);
        if APos1 = 0 then continue;
        APos2 := PosEx(';', AOneStr, APos1+1);
        if APos2 = 0 then continue;
        APos3 := PosEx(';', AOneStr, APos2+1);
        if APos3 = 0 then continue;

        StateIndex := StrToInt(trim(copy(AOneStr, 6, APos1 - 6)));
        if FSkipAdoExamples and (StateIndex in [2, 12]) then
          Continue;
        Node := Tree.Items.AddChild(LastGroup, StringToControl(trim(copy(AOneStr, APos2 + 1, APos3 - APos2 - 1))));
        Node.ImageIndex := 1;
        Node.SelectedIndex := 1;
        New(NodeValue);
        NodeValue^.FileName := trim(copy(AOneStr, APos1 + 1, APos2 - APos1 - 1));
        NodeValue^.Description := trim(copy(AOneStr, APos3 + 1, Length(AOneStr)));
        NodeValue^.StateIndex := StateIndex;
        NodeValue^.NodeKind := tnkCube;
        Node.Data := NodeValue;
        LastCube := Node;
      end
      else
      if (copy(AOneStr, 1, 4) = 'SCHE') then
      begin
        APos1 := PosEx(';', AOneStr, 1);
        if APos1 = 0 then continue;
        APos2 := PosEx(';', AOneStr, APos1+1);
        if APos2 = 0 then continue;
        APos3 := PosEx(';', AOneStr, APos2+1);
        if APos3 = 0 then continue;

        Node := Tree.Items.AddChild(LastCube, StringToControl(trim(copy(AOneStr, APos2 + 1, APos3 - APos2 - 1))));
        Node.ImageIndex := 2;
        Node.SelectedIndex := 2;
        New(NodeValue);
        NodeValue^.FileName := trim(copy(AOneStr, APos1 + 1, APos2 - APos1 - 1));
        NodeValue^.Description := trim(copy(AOneStr, APos3 + 1, Length(AOneStr)));
        NodeValue^.StateIndex := StrToInt(trim(copy(AOneStr, 8, APos1 - 8)));
        NodeValue^.NodeKind := tnkSchema;
        Node.Data := NodeValue;
      end
      else
      if copy(AOneStr, 1, 4) = 'LANG' then
      begin
        APos1 := PosEx('=', AOneStr, 1);
        if APos1 = 0 then continue;
        ANameLang := trim(copy(AOneStr, 6, APos1 - 6));
        AValueLang := trim(copy(AOneStr, APos1 + 1, Length(AOneStr)));
{
        if ANameLang = 'FIELDSORDER' then
          lbFieldListOrder.Caption := AValueLang
        else if ANameLang = 'USECHARTEVENT' then
          UseChartEvent.Caption := AValueLang;
}
      end
      else
      if copy(AOneStr, 1, 9) = 'NEWINDEMO' then
      begin
//        if NotesSheet.Caption = '' then
//          NotesSheet.Caption := StringToControl(trim(copy(AOneStr, 11, Length(AOneStr))))
//        else
//          NewInDemo.Lines.Add(StringToControl(trim(copy(AOneStr, 11, Length(AOneStr)))));
      end
      else
        Continue;
    end;
  finally
    Tree.Items.EndUpdate;
    CloseFile(AFile);
  end;
end;

procedure TfrmCube.TimerOpenFolderTimer(Sender: TObject);
begin
  TimerOpenFolder.Enabled := False;
  FileOpenDialog.FileName := 'D:\Aqua\exemplos-delphi\Arqs\Cube';
  if FileOpenDialog.Execute then
  begin
    FDataPath := FileOpenDialog.FileName;
    dmdCube.DataPath := FDataPath;
    Caption := Caption + ' - "' + FDataPath + '"';


    dmdCube.CreateReportObjects;
    LoadExamplesTree;
//    SliceGridSheet.Caption := fcxResources.Get('dmCrossTbl');
//    SliceGrid1.Caption := fcxResources.Get('dmCrossTbl');
//    ChartSheet.Caption := fcxResources.Get('dmChart');
//    CubeGridSheet.Caption := fcxResources.Get('dmSourceTbl');

  end else begin
    Application.Terminate;
  end;
end;

end.
