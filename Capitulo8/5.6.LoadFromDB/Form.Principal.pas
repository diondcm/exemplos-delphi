unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Load.FromDB, Vcl.StdCtrls, Vcl.Buttons, Data.DB;

type
  TfrmPrincipal = class(TForm)
    buttonRelatorio: TBitBtn;
    ButtonSalvarRel: TButton;
    procedure buttonRelatorioClick(Sender: TObject);
    procedure ButtonSalvarRelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonRelatorioClick(Sender: TObject);
begin
  dmdLoadFromDB.GeraRelatorioEmployee;
end;

procedure TfrmPrincipal.ButtonSalvarRelClick(Sender: TObject);
begin
  dmdLoadFromDB.qryRelatorios.Filter := '';
  dmdLoadFromDB.qryRelatorios.Filtered := False;
  dmdLoadFromDB.qryRelatorios.Close;
  dmdLoadFromDB.qryRelatorios.Open;

  if dmdLoadFromDB.qryRelatorios.IsEmpty then
  begin
    dmdLoadFromDB.qryRelatorios.Append;
  end else begin
    dmdLoadFromDB.qryRelatorios.Filter := 'DESCRICAO=' + QuotedStr('EMPLOYEE');
    if dmdLoadFromDB.qryRelatorios.IsEmpty then
    begin
      dmdLoadFromDB.qryRelatorios.Append;
    end else begin
      dmdLoadFromDB.qryRelatorios.Edit;
    end;
  end;

  if dmdLoadFromDB.qryRelatorios.State in dseditmodes then
  begin
    dmdLoadFromDB.qryRelatorios.FieldByName('DESCRICAO').AsString := 'EMPLOYEE';
    (dmdLoadFromDB.qryRelatorios.FieldByName('REL') as TBlobField).LoadFromFile('D:\Aqua\exemplos-delphi\Reports\FromDB.fr3');
    dmdLoadFromDB.qryRelatorios.Post;
  end;
end;

end.
