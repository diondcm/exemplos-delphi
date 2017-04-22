unit Base.Data;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmdBase = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdBase: TdmdBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
