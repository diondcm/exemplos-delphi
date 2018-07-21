unit Classe.Cotacao;

interface

uses
  System.Generics.Collections;

type
(*
  "status": "ok",
  "name": "Market Price (USD)",
  "unit": "USD",
  "period": "day",
  "description": "Average USD market price across major bitcoin exchanges.",
  "values": [{
      "x": 1499990400,
      "y": 2190.947833333333,
      "subvalor_obj": { "ID": 2, "data": "teste" }
      "subvalor_list": { "listindex": [], "items": [{"ID": 2, "data": "teste"},{"ID": 4, "data": "teste4"}]}
      "subvalor_arr": [ {"ID": 2, "data": "teste"}, {"ID": 2, "data": "teste"}] }

   ]
*)
  TSubValor = class
  private
    Fdata: string;
    FID: Integer;
  public
    property id: Integer read FID write FID;
    property data: string read Fdata write Fdata;
  end;

  TValor = class
  private
    Fx: Int64;
    Fy: Double;
    Fsubvalor_obj: TSubValor;
    Fsubvalor_list: TList<TSubValor>;
    Fsubvalor_arr: TArray<TSubValor>;
  public
    property x: Int64 read Fx write Fx;
    property y: Double read Fy write Fy;
    property subvalor_obj: TSubValor read Fsubvalor_obj write Fsubvalor_obj;
    property subvalor_list: TList<TSubValor> read Fsubvalor_list write Fsubvalor_list;
    property subvalor_arr: TArray<TSubValor> read Fsubvalor_arr write Fsubvalor_arr;
  end;

  TCotacao = class
  private
    FStatus: string;
    Fname: string;
    FUnit: string;
    Fperiod: string;
    Fdescription: string;
    Fvalues: TArray<TValor>;
  public
    property status: string read Fstatus write Fstatus;
    property name: string read Fname write Fname;
    property &unit: string read FUnit write FUnit;
    property period: string read Fperiod write Fperiod;
    property description: string read Fdescription write Fdescription;
    property values: TArray<TValor> read Fvalues write Fvalues;
  end;

implementation

end.
