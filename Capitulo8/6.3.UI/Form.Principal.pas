unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    BlurEffect1: TBlurEffect;
    Image1: TImage;
    GlowEffect1: TGlowEffect;
    GlowEffect2: TGlowEffect;
    StyleBook1: TStyleBook;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.SSW3.fmx ANDROID}

end.
