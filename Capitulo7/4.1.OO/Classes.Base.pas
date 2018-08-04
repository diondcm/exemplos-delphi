unit Classes.Base;

interface

type
  IInterfaceBase = interface(IInterface)
  ['{47A2FF1C-0F04-4C48-9150-04E9C76235A0}']
  end;

  TClasseBase = class
  protected
    function GetNovoID: Int64; virtual; abstract;
  end;

implementation

end.
