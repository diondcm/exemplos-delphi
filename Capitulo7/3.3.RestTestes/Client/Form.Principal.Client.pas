unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ClientModuleUnit1;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled := CheckBox1.Checked;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := TimeToStr(Now) + '    :: ' +
    IntToStr(ClientModule1.ServerMethods1Client.GetCountInstances) + '   :: ' +
    IntToStr(ClientModule1.ServerMethods1Client.GetTotalCountInstances);
end;

end.
