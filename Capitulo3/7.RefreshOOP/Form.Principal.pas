unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TPessoa = class
  private
    FNome: string;
    FCodigo: Integer;
  public
    constructor Create;
    property Nome: string read FNome write FNome;
    property Codigo: Integer read FCodigo write FCodigo;
  end;

  TForm4 = class(TForm)
    btnAlocar: TButton;
    btnCria: TButton;
    edtNome: TEdit;
    btnShowNome: TButton;
    btnFreeAndNil: TButton;
    btnVarLocal: TButton;
    procedure btnAlocarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCriaClick(Sender: TObject);
    procedure btnShowNomeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFreeAndNilClick(Sender: TObject);
    procedure btnVarLocalClick(Sender: TObject);
  private
    FPes: TPessoa;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.btnAlocarClick(Sender: TObject);
var
  lPessoa: TPessoa;
  lOutraPessoa: TPessoa;
  lCodigo: Integer;
begin
  lCodigo := 0;
  lPessoa := nil;
  if Assigned(lPessoa) then
    lPessoa.Codigo := 10;

  if Pointer(0) <> nil then
    raise Exception.Create('Como poderia?');

    
  lPessoa := TPessoa.Create;

//  lCodigo := Integer(lPessoa); Apenas educativo, não usar na prática
  
  lPessoa.Nome := 'Pedro';


  lPessoa.Codigo := lCodigo;
  lPessoa.Free;

//  lPessoa := TPessoa.Create;
  lPessoa := TPessoa.Create;

//  TPessoa(lCodigo).Nome := 'Teste'; Apenas educativo, não usar na prática

  lPessoa.Nome := 'Augusto';
  lPessoa.Free;

//  Caption := lPessoa.Nome;
//  lPessoa.Nome := 'Teste';

  lOutraPessoa := TPessoa.Create;
  lOutraPessoa.Nome := 'João';
  lOutraPessoa.Free;
end;

procedure TForm4.btnCriaClick(Sender: TObject);
begin
  if not Assigned(FPes) then  
  begin
    FPes := TPessoa.Create;    
  end;

  FPes.Nome := edtNome.Text;

end;

procedure TForm4.btnFreeAndNilClick(Sender: TObject);
var
  lCodigo: Integer;
begin
//  FPes.Free;
//  FPes := nil;
  
  FreeAndNil(FPes);

  lCodigo := Integer(FPes);
  Caption := lCodigo.ToString;
end;

procedure TForm4.btnShowNomeClick(Sender: TObject);
begin
  FPes.Nome := FPes.Nome + ' - Ok';
  ShowMessage(FPes.Nome);
end;

procedure TForm4.btnVarLocalClick(Sender: TObject);
var
  lPes: TPessoa;
begin
  lPes := TPessoa.Create;
  lPes.Free;  
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
  // FPes.Free;
end;

{ TPessoa }

constructor TPessoa.Create;
begin
  FCodigo := 10;
end;

end.
