unit Classe.GridPlus;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Grids, Vcl.DBGrids, Vcl.Themes, Vcl.Forms,
  Vcl.ComCtrls, Data.DB, Winapi.Windows, Firedac.Comp.DataSet, FireDac.Stan.Intf, Datasnap.DBClient,
  FireDAC.Comp.Client, System.UITypes, ClipBrd;

type
  TBookmarkListLocal = class(TBookmarkList);

  // TODO: Cache => Index calculated fields
  TCustomGridPlus = class(TCustomDBGrid)
  private
    FAutoAjustaColunas: Boolean;
    FStatusBar: TStatusBar;
    FDescTotalRegs: string;
    FCopiaTitle: Boolean;
  protected
    function CreateDataLink: TGridDataLink; override;
    procedure OnUpdateDataLink(Sender: TObject);
    procedure DoGridPlusDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DoTitleClick(Column: TColumn);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AjustaColunas; virtual;
    property DescTotalRegs: string read FDescTotalRegs write FDescTotalRegs;
    property CopiaTitle: Boolean read FCopiaTitle write FCopiaTitle default False;
  end;

  TGridDataLinkPlus = class(TGridDataLink)
  private
    FOnUpdateDataLink: TNotifyEvent;
    procedure DoUpdateDataLink;
  protected
    procedure UpdateData; override;
    procedure ActiveChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure EditingChanged; override;

    procedure DataSetChanged; override;

    property OnUpdateDataLink: TNotifyEvent read FOnUpdateDataLink write FOnUpdateDataLink;
  end;

  TGridPlus = class(TCustomGridPlus)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property Align;
    property DataSource;
    property Options;
  end;

implementation

{ TGridPlus }

class constructor TGridPlus.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TGridPlus, TScrollingStyleHook);
end;

class destructor TGridPlus.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TGridPlus, TScrollingStyleHook);
end;

{ TCustomGridPlus }

procedure TCustomGridPlus.AjustaColunas;
begin
  FAutoAjustaColunas := True;
  Self.InvalidateGrid;
end;

constructor TCustomGridPlus.Create(AOwner: TComponent);
begin
  inherited;
  OnDrawColumnCell := DoGridPlusDrawColumnCell;
  OnTitleClick := DoTitleClick;

  FStatusBar := TStatusBar.Create(Self);
  FStatusBar.Parent := Self;
  FStatusBar.SimplePanel := True;
end;

function TCustomGridPlus.CreateDataLink: TGridDataLink;
begin
  Result := TGridDataLinkPlus.Create(Self);
  (Result as TGridDataLinkPlus).OnUpdateDataLink := OnUpdateDataLink;
end;

procedure TCustomGridPlus.DoGridPlusDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  lWith: Integer;
  i: Integer;
begin
  if FAutoAjustaColunas then
  begin
    FAutoAjustaColunas := False;
    for i := 0 to Self.Columns.Count -1 do
    begin
      Self.Columns[i].Width := 15 + Self.Canvas.TextWidth(Self.Columns[i].Field.DisplayLabel);
    end;
  end;

  lWith := 10 + Self.Canvas.TextWidth(Column.Field.DisplayText);
  if lWith > Column.Width then
  begin
    Column.Width := lWith;
  end;
end;

procedure TCustomGridPlus.DoTitleClick(Column: TColumn);
var
  lFdQry: TFDDataSet;
  lIndexName: string;
  i: Integer;
  lIxd: TFDIndex;
begin
  // Controle old title click

  if Assigned(Column.Field) and Assigned(Column.Field.DataSet) then
  begin
    if Column.Field.DataSet is TFDDataSet then
    begin
      lFdQry := TFDDataSet(Column.Field.DataSet);
      if (lFdQry.IndexFieldNames = Column.FieldName) then
      begin
        lIndexName := '';
        for i := 0 to lFdQry.IndexDefs.Count -1 do
        begin
          if lFdQry.IndexDefs[i].Name = Column.FieldName + 'Desc' then
          begin
            lIndexName := lFdQry.IndexDefs[i].Name;
            Break;
          end;
        end;

        if lIndexName = '' then
        begin
          lIndexName := Column.FieldName + 'Desc';
          lIxd := lFdQry.Indexes.Add;
          lIxd.Name := lIndexName;
          lIxd.Fields := Column.FieldName;
          lIxd.Options := [soDescending];
          lIxd.Active := True;
        end;

        lFdQry.IndexFieldNames := '';
        lFdQry.IndexName := lIndexName;
      end else begin
        lFdQry.IndexName := '';
        lFdQry.IndexFieldNames := Column.FieldName;
      end;
    end else if Column.Field.DataSet is TCustomClientDataSet then
    begin
      // TODO: Client index
    end;
  end else begin
    AjustaColunas;
  end;
end;

procedure TCustomGridPlus.KeyDown(var Key: Word; Shift: TShiftState);
var
  lInfos: string;
  i: Integer;
  j: Integer;
  k: Integer;
begin
  inherited;
  if (not DataLink.Active) or (DataLink.DataSet.IsEmpty) then Exit;

  case Key of
    vkC, VK_INSERT:
    begin
      if ssCtrl in Shift then
      begin
        if (dgMultiSelect in Self.Options) then
        begin
          if Self.SelectedRows.Count > 0 then
          begin
            DataLink.DataSet.DisableControls;
            try
              for i := 0 to Self.SelectedRows.Count -1 do
              begin
                DataLink.DataSet.GotoBookmark(Self.SelectedRows.Items[i]);
                for j := 0 to DataLink.DataSet.Fields.Count -1 do
                begin
                  lInfos := lInfos + DataLink.DataSet.Fields[j].AsString + ';';
                end;
                lInfos := lInfos + sLineBreak;
              end;
            finally
              DataLink.DataSet.EnableControls;
            end;
          end;
        end else if (dgRowSelect in Self.Options) then
        begin
          if Self.SelectedRows.CurrentRowSelected then
          begin
            DataLink.DataSet.DisableControls;
            try
              for i := 0 to Self.SelectedRows.Count -1 do
              begin
                DataLink.DataSet.GotoBookmark(TBookmarkListLocal(Self.SelectedRows).CurrentRow);
                for j := 0 to DataLink.DataSet.Fields.Count -1 do
                begin
                  lInfos := lInfos + DataLink.DataSet.Fields[j].AsString + ';';
                end;
                lInfos := lInfos + sLineBreak;
              end;
            finally
              DataLink.DataSet.EnableControls;
            end;
          end;
        end else begin
          if Assigned(Self.SelectedField) then
          begin
            lInfos := Self.SelectedField.AsString;
          end;
        end;

        if lInfos <> '' then
        begin
          if FCopiaTitle then
          begin
            for k := DataLink.DataSet.Fields.Count -1 downto 0 do
            begin
              lInfos := DataLink.DataSet.Fields[k].DisplayName + ';' + lInfos;
            end;
          end;
        end;

        if lInfos <> '' then
        begin
          Clipboard.AsText := lInfos;
        end;
      end;
    end;
  end;
end;

procedure TCustomGridPlus.OnUpdateDataLink(Sender: TObject);
var
  lAtualRecCount: Integer;
begin
  if Assigned(DataSource) and Assigned(DataSource.DataSet) then
  begin
    if DataLink.DataSet.IsEmpty then
    begin
      FStatusBar.SimpleText := 'Sem registros';
    end else begin
      lAtualRecCount := DataLink.DataSet.RecordCount;
      if DataLink.DataSet.RecNo <> -1 then
      begin
        FStatusBar.SimpleText := IntToStr(DataLink.DataSet.RecNo) + ' de ' + lAtualRecCount.ToString + ' registros';
      end else begin
         if FDescTotalRegs <> '' then
        begin
          FStatusBar.SimpleText := Format(FDescTotalRegs, [lAtualRecCount]);
        end else begin
          FStatusBar.SimpleText := 'Total de registros: ' + lAtualRecCount.ToString;
        end;
      end;
    end;
  end;
end;

{ TGridDataLinkPlus }

procedure TGridDataLinkPlus.ActiveChanged;
begin
  inherited;
  DoUpdateDataLink;
end;

procedure TGridDataLinkPlus.DataSetChanged;
begin
  inherited;
  DoUpdateDataLink;
end;

procedure TGridDataLinkPlus.DataSetScrolled(Distance: Integer);
begin
  inherited;
  DoUpdateDataLink;
end;

procedure TGridDataLinkPlus.DoUpdateDataLink;
begin
  if Assigned(FOnUpdateDataLink) then
  begin
    FOnUpdateDataLink(Self);
  end;
end;

procedure TGridDataLinkPlus.EditingChanged;
begin
  inherited;
  DoUpdateDataLink;
end;

procedure TGridDataLinkPlus.UpdateData;
begin
  inherited;
  DoUpdateDataLink;
end;

end.
