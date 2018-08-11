unit Classe.DB.DateEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ComCtrls, Data.DB, Vcl.DBCtrls, Variants;

type
  TCustomDBDateTime = class(TDateTimePicker)
  private
    FDataLink: TFieldDataLink;
    FMudouOnChange: Boolean;
    FSobre: string;
  protected
    function GetDataSource: TDataSource; virtual;
    procedure SetDataSource(const Value: TDataSource);  virtual;
    function GetDataField: string; virtual;
    procedure SetDataField(const Value: string); virtual;
    procedure DoDataChange(Sender: TObject); virtual;
    procedure DoUpdateData(Sender: TObject); virtual;
    procedure OnChangeValue(Sender: TObject); virtual;
    function IsValidDataLink: Boolean; virtual;
    procedure CheckValidDate(Value: TDate); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property Sobre: string read FSobre write FSobre;
  end;

  TDBDateTime = class(TCustomDBDateTime)
  published
    property DataSource;
    property DataField;
    property Sobre;
  end;

  { Exemplo para ORM, já num DM }
  TPessoa = class
  private
    // FQry, Um data link para cada field
    FDataLink: TFieldDataLink;
  protected
    function IsValidDataLink: Boolean; virtual;
    procedure DoDataChange(Sender: TObject); virtual;
    procedure DoUpdateData(Sender: TObject); virtual;
    function GetDataCadastro: TDatetime;
    procedure SetDataCadastro(const Value: TDatetime);
    { TODO }
//    function GetDataField: string;
//    function GetDataSource: TDataSource;
//    procedure SetDataField(const Value: string);
//    procedure SetDataSource(const Value: TDataSource);
  public
    property DataCadastro: TDatetime read GetDataCadastro write SetDataCadastro;
//    property DataSource: TDataSource read GetDataSource write SetDataSource;
//    property DataField: string read GetDataField write SetDataField;
  end;

implementation

{ TCustomDBDateTime }

procedure TCustomDBDateTime.CheckValidDate(Value: TDate);
begin
  inherited;
  if not ((csReading in ComponentState) or (csLoading in ComponentState)) and (not FMudouOnChange) then
  begin
    FMudouOnChange := False;

//    if Assigned(OnChange) then
//      FEventOnChange := OnChange;
//
//    OnChange := OnChangeValue;
  end;

end;

constructor TCustomDBDateTime.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DoDataChange;
  FDataLink.OnUpdateData := DoUpdateData;

  OnChange := OnChangeValue;
end;

procedure TCustomDBDateTime.DoDataChange(Sender: TObject);
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

destructor TCustomDBDateTime.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

function TCustomDBDateTime.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TCustomDBDateTime.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TCustomDBDateTime.IsValidDataLink: Boolean;
begin
  Result := Assigned(FDataLink.DataSource) and Assigned(FDataLink.Field);
end;

procedure TCustomDBDateTime.OnChangeValue(Sender: TObject);
begin
  if not FDataLink.Editing then
  begin
    FDataLink.Edit;
  end;

  FDataLink.Modified;
  FDataLink.UpdateRecord;

//  if Assigned(FEventOnChange) then
//  begin
//    FEventOnChange(Sender);
//  end;
end;

procedure TCustomDBDateTime.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TCustomDBDateTime.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

procedure TCustomDBDateTime.DoUpdateData(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    FDataLink.Field.AsDateTime := Date;
  end;
end;

{ TPessoa }

procedure TPessoa.DoDataChange(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    if not (VarIsNull(FDataLink.Field.Value) or VarIsEmpty(FDataLink.Field.Value)) then
    begin
      // Não necessitamos alterar, mas aki colocamos as validações
      // FDataLink.Field.AsDateTime;
    end;
  end;
end;

procedure TPessoa.DoUpdateData(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    FDataLink.Field.AsDateTime := Date;
  end;
end;

function TPessoa.GetDataCadastro: TDatetime;
begin
  Result := FDataLink.Field.AsDateTime;
end;

function TPessoa.IsValidDataLink: Boolean;
begin
  Result := Assigned(FDataLink.DataSource) and Assigned(FDataLink.Field);
end;

procedure TPessoa.SetDataCadastro(const Value: TDatetime);
begin
  FDataLink.Field.AsDateTime := Value;
end;

end.
