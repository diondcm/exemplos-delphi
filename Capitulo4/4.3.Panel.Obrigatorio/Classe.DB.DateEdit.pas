unit Classe.DB.DateEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ComCtrls, Data.DB, Vcl.DBCtrls, Variants;

type
  TDBDateTimePicker = class(TDateTimePicker)
  private
    FMudouOnChange: Boolean;
    FDataLink: TFieldDataLink;
    FEventOnChange: TNotifyEvent;
  protected
    function GetDataSource: TDataSource; virtual;
    procedure SetDataSource(const Value: TDataSource);  virtual;
    function GetDataField: string; virtual;
    procedure SetDataField(const Value: string); virtual;
    procedure DataChange(Sender: TObject); virtual;
    procedure UpdateData(Sender: TObject); virtual;
    procedure OnChangeValue(Sender: TObject); virtual;
    function IsValidDataLink: Boolean; virtual;
    procedure CheckValidDate(Value: TDate); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
  end;

implementation

{ TDBDateTimePicker }

procedure TDBDateTimePicker.CheckValidDate(Value: TDate);
begin
  inherited;

  if not((csReading in ComponentState) or (csLoading in ComponentState)) and (not FMudouOnChange) then
  begin
    FMudouOnChange := True;
    if Assigned(OnChange) then
      FEventOnChange := OnChange;

    OnChange := OnChangeValue;
  end;
end;

constructor TDBDateTimePicker.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;

//  if Assigned(OnChange) then
//    FEventOnChange := OnChange;
//
//  OnChange := OnChangeValue;
end;

procedure TDBDateTimePicker.DataChange(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    if not (VarIsNull(FDataLink.Field.Value) or VarIsEmpty(FDataLink.Field.Value)) then
    begin
      Date := FDataLink.Field.AsDateTime;
    end else begin
      Date := Now;
    end;
  end;
end;

destructor TDBDateTimePicker.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

function TDBDateTimePicker.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBDateTimePicker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBDateTimePicker.IsValidDataLink: Boolean;
begin
  Result := Assigned(FDataLink.DataSource) and Assigned(FDataLink.Field);
end;

procedure TDBDateTimePicker.OnChangeValue(Sender: TObject);
begin
  if not FDataLink.Editing then
  begin
    FDataLink.Edit;
  end;

  FDataLink.Modified;
  FDataLink.UpdateRecord;

  if Assigned(FEventOnChange) then
    FEventOnChange(Sender);
end;

procedure TDBDateTimePicker.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBDateTimePicker.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

procedure TDBDateTimePicker.UpdateData(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    FDataLink.Field.AsDateTime := Date;
  end;
end;

end.
