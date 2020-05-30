unit Classe.Transaction.Blockchain;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TOutputsDTO = class
  private
    FScript: string;
    FScript_Type: string;
    FSpent_By: string;
    FValue: Int64;
  published
    property Script: string read FScript write FScript;
    property Script_Type: string read FScript_Type write FScript_Type;
    property Spent_By: string read FSpent_By write FSpent_By;
    property Value: Int64 read FValue write FValue;
  end;
  
  TInputsDTO = class
  private
    FAge: Integer;
    FOutput_Index: Integer;
    FOutput_Value: Integer;
    FPrev_Hash: string;
    FScript: string;
    FScript_Type: string;
    FSequence: Int64;
  published
    property Age: Integer read FAge write FAge;
    property Output_Index: Integer read FOutput_Index write FOutput_Index;
    property Output_Value: Integer read FOutput_Value write FOutput_Value;
    property Prev_Hash: string read FPrev_Hash write FPrev_Hash;
    property Script: string read FScript write FScript;
    property Script_Type: string read FScript_Type write FScript_Type;
    property Sequence: Int64 read FSequence write FSequence;
  end;
  
  TRootDTO = class(TJsonDTO)
  private
    FBlock_Hash: string;
    FBlock_Height: Integer;
    FBlock_Index: Integer;
    FConfidence: Integer;
    FConfirmations: Integer;
    FConfirmed: string;
    FDouble_Spend: Boolean;
    FFees: Integer;
    FHash: string;
    [JSONName('inputs')]
    FInputsArray: TArray<TInputsDTO>;
    [GenericListReflect]
    FInputs: TObjectList<TInputsDTO>;
    [JSONName('outputs')]
    FOutputsArray: TArray<TOutputsDTO>;
    [GenericListReflect]
    FOutputs: TObjectList<TOutputsDTO>;
    FPreference: string;
    FReceived: string;
    FSize: Integer;
    FTotal: Int64;
    FVer: Integer;
    FVin_Sz: Integer;
    FVout_Sz: Integer;
    function GetInputs: TObjectList<TInputsDTO>;
    function GetOutputs: TObjectList<TOutputsDTO>;
  published
    property Block_Hash: string read FBlock_Hash write FBlock_Hash;
    property Block_Height: Integer read FBlock_Height write FBlock_Height;
    property Block_Index: Integer read FBlock_Index write FBlock_Index;
    property Confidence: Integer read FConfidence write FConfidence;
    property Confirmations: Integer read FConfirmations write FConfirmations;
    property Confirmed: string read FConfirmed write FConfirmed;
    property Double_Spend: Boolean read FDouble_Spend write FDouble_Spend;
    property Fees: Integer read FFees write FFees;
    property Hash: string read FHash write FHash;
    property Inputs: TObjectList<TInputsDTO> read GetInputs;
    property Outputs: TObjectList<TOutputsDTO> read GetOutputs;
    property Preference: string read FPreference write FPreference;
    property Received: string read FReceived write FReceived;
    property Size: Integer read FSize write FSize;
    property Total: Int64 read FTotal write FTotal;
    property Ver: Integer read FVer write FVer;
    property Vin_Sz: Integer read FVin_Sz write FVin_Sz;
    property Vout_Sz: Integer read FVout_Sz write FVout_Sz;
    destructor Destroy; override;
  end;
  
implementation

{ TRootDTO }

destructor TRootDTO.Destroy;
begin
  GetInputs.Free;
  GetOutputs.Free;
  inherited;
end;

function TRootDTO.GetInputs: TObjectList<TInputsDTO>;
begin
  if not Assigned(FInputs) then
  begin
    FInputs := TObjectList<TInputsDTO>.Create;
    FInputs.AddRange(FInputsArray);
  end;
  Result := FInputs;
end;

function TRootDTO.GetOutputs: TObjectList<TOutputsDTO>;
begin
  if not Assigned(FOutputs) then
  begin
    FOutputs := TObjectList<TOutputsDTO>.Create;
    FOutputs.AddRange(FOutputsArray);
  end;
  Result := FOutputs;
end;

end.
