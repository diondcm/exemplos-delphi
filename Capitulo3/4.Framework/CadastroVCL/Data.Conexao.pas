unit Data.Conexao;

interface

uses
  System.SysUtils, System.Classes, Base.Data, Data.DB, Data.SqlExpr,
  System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TdmdConexao = class(TdmdBase)
    imlBase: TImageList;
    SQLConnection: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdConexao: TdmdConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
