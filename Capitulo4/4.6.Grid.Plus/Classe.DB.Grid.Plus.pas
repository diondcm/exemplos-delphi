unit Classe.DB.Grid.Plus;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Themes, Vcl.Forms, Vcl.Graphics, Winapi.Windows, Data.DB, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf;

type
  TDBGridPlus = class(TCustomDBGrid)
  strict private
    class constructor Create;
    class destructor Destroy;
  private
    FStatus: TStatusBar;
    FActionUpdate: TBasicAction;
    FRowCountOld: Integer;
    FOldOnTitleClick: TDBGridClickEvent;
    FImgChecked: Vcl.Graphics.TBitmap;
    FImgUnChecked: Vcl.Graphics.TBitmap;
  protected
    procedure OnUpdateLink(Sender: TObject);
    procedure DBGridPlusDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridPlusDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    function CreateDataLink: TGridDataLink; override;

    procedure Loaded; override;
    procedure DoOnTitleClick(Column: TColumn);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property DataSource;
  end;

  TGridDataLinkPlus = class(TGridDataLink)
  private
    FOnUpdateDataLink: TNotifyEvent;
    procedure DoUpdateDataLink;
  protected
    procedure UpdateData; override;
    procedure ActiveChanged; override;
    property OnUpdateDataLink: TNotifyEvent read FOnUpdateDataLink write FOnUpdateDataLink;
  end;

implementation


{ TDBGridPlus }

constructor TDBGridPlus.Create(AOwner: TComponent);
begin
  inherited;

  /// todo: adicionar resource
  FImgChecked := Vcl.Graphics.TBitmap.Create;
  if FileExists('C:\Users\Aluno\Downloads\checked.bmp') then
  begin
    FImgChecked.LoadFromFile('C:\Users\Aluno\Downloads\checked.bmp');
  end;

  FImgUnChecked := Vcl.Graphics.TBitmap.Create;
  if FileExists('C:\Users\Aluno\Downloads\unchecked.bmp') then
  begin
    FImgUnChecked.LoadFromFile('C:\Users\Aluno\Downloads\unchecked.bmp');
  end;

  FStatus := TStatusBar.Create(Self);
  FStatus.Parent := Self;
  FStatus.SimplePanel := True;
end;

function TDBGridPlus.CreateDataLink: TGridDataLink;
begin
  Result := TGridDataLinkPlus.Create(Self);
  (Result as TGridDataLinkPlus).OnUpdateDataLink := OnUpdateLink;
end;

class constructor TDBGridPlus.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TDBGridPlus, TScrollingStyleHook);
end;

procedure TDBGridPlus.DBGridPlusDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bmpWidth: Integer;
  fixRect: TRect;
begin
  if Assigned(Self.DataSource) and Assigned(Self.DataSource.DataSet) then
  begin
    fixRect := Rect;
    if Odd(Self.DataSource.DataSet.RecNo) then
    begin
      Self.Canvas.Brush.Color := clSilver;
    end else begin
      Self.Canvas.Brush.Color := clWindow;
    end;

    if Column.Field is TBooleanField then
    begin
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;

      if not(Column.Field.IsNull) and Column.Field.AsBoolean then
      begin
        Self.Canvas.StretchDraw(fixRect, FImgChecked);
      end else begin
        Self.Canvas.StretchDraw(fixRect, FImgUnChecked);
      end;

      fixRect := Rect;
      fixRect.Left := fixRect.Left + bmpWidth;
    end;
  end;
  Self.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
end;

procedure TDBGridPlus.DBGridPlusDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  if not (Field is TBooleanField) then
    Self.DefaultDrawDataCell(Rect, Field, State);
end;

destructor TDBGridPlus.Destroy;
begin
  FImgChecked.Free;
  FImgUnChecked.Free;
  inherited;
end;

procedure TDBGridPlus.DoOnTitleClick(Column: TColumn);
var
  lFdQry: TFDDataSet;
  i: Integer;
  lIndexName: string;
  lIdx: TIndexDef;
  lIxd: TFDIndex;
begin
  if Assigned(FOldOnTitleClick) and (@FOldOnTitleClick <> @TDBGridPlus.DoOnTitleClick) then
  begin
    FOldOnTitleClick(Column)
  end;

  if Assigned(Column.Field) and Assigned(Column.Field.DataSet) then
  begin
    if (Column.Field.DataSet is TFDDataSet) then
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
    end;
  end;
end;

procedure TDBGridPlus.Loaded;
begin
  inherited;
  OnDrawColumnCell := DBGridPlusDrawColumnCell;
//  OnDrawDataCell := DBGridPlusDrawDataCell;

  FOldOnTitleClick := OnTitleClick;
  OnTitleClick := DoOnTitleClick;
end;

class destructor TDBGridPlus.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TDBGridPlus, TScrollingStyleHook);
end;

procedure TDBGridPlus.OnUpdateLink(Sender: TObject);
begin
  if Assigned(DataSource) and Assigned(DataSource.DataSet) then
  begin
    if FRowCountOld <> DataLink.DataSet.RecordCount then
    begin
      FRowCountOld := DataLink.DataSet.RecordCount;
      FStatus.SimpleText := 'Total de registros: ' + FRowCountOld.ToString;
    end;
  end;
end;

{ TGridDataLinkPlus }

procedure TGridDataLinkPlus.ActiveChanged;
begin
  inherited;
  DoUpdateDataLink;
end;

procedure TGridDataLinkPlus.DoUpdateDataLink;
begin
  if Assigned(FOnUpdateDataLink) then
    FOnUpdateDataLink(Self);
end;

procedure TGridDataLinkPlus.UpdateData;
begin
  inherited;
  DoUpdateDataLink;
end;

end.
