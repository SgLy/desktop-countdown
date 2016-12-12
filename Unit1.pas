unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    Refresh1: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Refresh;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label1.Left := 0;
  Label1.top := 0;
  Label1.Font.Name := 'Impact';
  Label1.Font.Size := 220;
  Label1.Font.Color := $000E1044;
  Form1.BorderStyle := BSNONE;
  Form1.TransparentColor := true;
  Form1.TransparentColorValue := Form1.Color;
  Refresh;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  style: integer;

begin
  style := GetWindowLong(Handle, GWL_EXSTYLE);
  SetWindowLong(Handle, GWL_EXSTYLE, style and (not WS_EX_APPWINDOW));
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TForm1.Refresh;
var
  day: longint;

begin
  // 2015.6.7 == 42162
  // 2016.6.7 == 42528
  // 2017.6.7 == 42893
  day := 42893 - trunc(now);
  Label1.Caption := IntToStr(day div 10) + IntToStr(day mod 10);
  Form1.ClientHeight := Label1.Height;
  Form1.ClientWidth := Label1.Width;
  // Optimized constant for 1024x768 screen and special wallpaper
  Form1.Left := 629 + (450 - Form1.Width) div 2;
  Form1.top := 250;
end;

procedure TForm1.Refresh1Click(Sender: TObject);
begin
  Refresh;
end;

end.
