unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Frame.Pessoa;

type
  TPessoa = class
    type
      TTipoSexo = (Masculino, Feminino);
      TPet = class
        procedure Passear;
      end;
  private
    FSexo: TTipoSexo;
    FPet: TPet;
  public
    property Sexo: TTipoSexo read FSexo write FSexo;
    property Pet: TPet read FPet write FPet;
  end;

  TfrmPrincipal = class(TForm)
    PageControl: TPageControl;
    tabTipos: TTabSheet;
    tabFrames: TTabSheet;
    tabControlEx: TTabSheet;
    buttonPessoa: TButton;
    fraPessoa1: TfraPessoa;
    buttonLimpar: TButton;
    TabControl1: TTabControl;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure buttonPessoaClick(Sender: TObject);
    procedure buttonLimparClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  lClass: TClass;
  lClasses: string;
begin
  lClass := Self.ClassParent;
  while lClass <> nil do
  begin
    lClasses := lClasses + sLineBreak + lClass.ClassName;
    lClass := lClass.ClassParent;
  end;

  ShowMessage(lClasses);
end;

procedure TfrmPrincipal.buttonLimparClick(Sender: TObject);
begin
  fraPessoa1.cdsPessoa.EmptyDataSet;
end;

procedure TfrmPrincipal.buttonPessoaClick(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  lPessoa := TPessoa.Create;
  try
    lPessoa.Pet := TPessoa.TPet.Create;
    lPessoa.Pet.Passear;
    lPessoa.Pet.Free;
  finally
    lPessoa.Free;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  PageControl.ActivePage := tabTipos;
end;

procedure TfrmPrincipal.TabControl1Change(Sender: TObject);
begin

end;

{ TPessoa.TPet }

procedure TPessoa.TPet.Passear;
begin
  ShowMessage('Passeio');
end;

end.
