unit Classe.DateDB;

interface

uses
  System.Classes, System.SysUtils, System.Variants, Vcl.ComCtrls, Vcl.DBCtrls, Data.DB, Vcl.Dialogs;

type
  TDBDateTimePiker = class(TDateTimePicker)
  private
//    FDateField: string;
//    FDataSource: TDataSource;
    FDataLink: TFieldDataLink;
    FSobre: string;
    FMudouOnChange: Boolean;

    function GetDataSource: TDataSource;
    function GetDataField: string;

    procedure SetDataSource(const Value: TDataSource);
    procedure SetDataField(const Value: string);

    procedure DoDataChange(Sender: TObject);
    procedure DoUpdateData(Sender: TObject);
    procedure DoChangeValue(Sender: TObject);

    procedure DoDblClick(Sender: TObject);

  protected
    function IsVaslidDataLink: Boolean; virtual;
    procedure CheckValidDate(Date: TDate); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property Sobre: string read FSobre write FSobre;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;


implementation

{ TDBDateTimePiker }

procedure TDBDateTimePiker.CheckValidDate(Date: TDate);
begin
  inherited;
  if not ((csReading in ComponentState) or (csLoading in ComponentState)) and (not FMudouOnChange) then
  begin
    FMudouOnChange := False;
  end;
end;

constructor TDBDateTimePiker.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DoDataChange;
  FDataLink.OnUpdateData := DoUpdateData;

  OnChange := DoChangeValue;
  OnDblClick := DoDblClick;
end;

destructor TDBDateTimePiker.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

function TDBDateTimePiker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBDateTimePiker.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBDateTimePiker.IsVaslidDataLink: Boolean;
begin
  Result := Assigned(FDataLink.DataSource) and Assigned(FDataLink.Field);
end;

procedure TDBDateTimePiker.DoChangeValue(Sender: TObject);
begin
  if not FDataLink.Editing then
  begin
    FDataLink.Edit;
  end;

  FDataLink.Modified;
  FDataLink.UpdateRecord;
end;

procedure TDBDateTimePiker.DoDataChange(Sender: TObject);
begin
  if IsVaslidDataLink then
  begin
    if (FDataLink.Field.IsNull or VarIsEmpty(FDataLink.Field.Value)) then
    begin
      Date := Now;
    end else begin
      Date := FDataLink.Field.AsDateTime;
    end;
  end;
end;

procedure TDBDateTimePiker.DoDblClick(Sender: TObject);
begin
  ShowMessage('Teste');   // N OK
end;

procedure TDBDateTimePiker.DoUpdateData(Sender: TObject);
begin
  if IsVaslidDataLink then
  begin
    FDataLink.Field.AsDateTime := Date;
  end;
end;

procedure TDBDateTimePiker.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

procedure TDBDateTimePiker.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

end.
