unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls, Menus, ImgList,
  IdCoderQuotedPrintable, IdCoderXXE, IdCoderUUE, IdCoder, IdCoder3to4,
  IdCoderMIME, IdBaseComponent;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    RichEdit1: TRichEdit;
    XPManifest1: TXPManifest;
    GroupBox1: TGroupBox;
    RichEdit2: TRichEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    IdEncoderUUE1: TIdEncoderUUE;
    IdDecoderUUE1: TIdDecoderUUE;
    IdEncoderXXE1: TIdEncoderXXE;
    IdDecoderXXE1: TIdDecoderXXE;
    IdEncoderQuotedPrintable1: TIdEncoderQuotedPrintable;
    IdDecoderQuotedPrintable1: TIdDecoderQuotedPrintable;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label2: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Button1: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Label5: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    N7: TMenuItem;
    N8: TMenuItem;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Des: integer;

implementation

uses Unit2, Unit3;

{$R *.dfm}

Procedure Resized();
begin
 // Ограничение размеров формы
 if Form1.ClientHeight<200
 then Form1.ClientHeight:=200;
 if Form1.ClientWidth<500
 then Form1.ClientWidth:=500;
 // Расположение групового окна (box) на форме
 Form1.GroupBox1.Top:=0;
 Form1.GroupBox1.Left:=Round(Form1.ClientWidth)-Round(Form1.GroupBox1.Width)-5;
 Form1.GroupBox1.Height:=Round(Form1.ClientHeight)-8;
 // Расположение текстового окна 1 на форме
 Form1.Richedit1.Top:=0+8;
 Form1.Richedit1.Left:=5;
 Form1.Richedit1.Height:=StrToInt(FloatToStr(Round(Form1.ClientHeight/2)))-7;
 Form1.Richedit1.Width:=Round(Form1.GroupBox1.Left)-15;
 // Расположение текстового окна 2 на форме
 Form1.Richedit2.Top:=Round(Form1.RichEdit1.Height)+5;
 Form1.Richedit2.Left:=5;
 Form1.Richedit2.Height:=StrToInt(FloatToStr(Round(Form1.ClientHeight/2)))-7;
 Form1.Richedit2.Width:=Round(Form1.GroupBox1.Left)-15;
 // Расположение PageControl1 на GroupBox1
 Form1.PageControl1.Height:=Form1.ClientHeight-36;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Resized;
 RichEdit1.Clear;
 RichEdit2.Clear;
 Des:=1;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 Resized();
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 if (Application.MessageBox('Вы действительно хотите выйти из программы?','Выход из программы',MB_ICONQUESTION+MB_YESNOCANCEL)=IDYes)
 then Application.Terminate;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 if SaveDialog1.Execute
 then RichEdit1.Lines.SaveToFile(SaveDialog1.FileName+'.cro');
end;


procedure TForm1.N3Click(Sender: TObject);
begin
 if SaveDialog1.Execute
 then RichEdit2.Lines.SaveToFile(SaveDialog1.FileName+'.cro');
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if OpenDialog1.Execute
 then RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 Des:=1;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 Des:=2;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
 Des:=3;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
 Des:=4;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
 Des:=11;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
 Des:=12;
end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
 Des:=13;
end;

procedure TForm1.RadioButton8Click(Sender: TObject);
begin
 Des:=14;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Form2.Show;
 Form2.Update;
 case des of
  1: RichEdit2.Text:=form1.IdEncoderMIME1.Encode(RichEdit1.Text);
  2: RichEdit2.Text:=Form1.IdEncoderUUE1.Encode(RichEdit1.Text);
  3: RichEdit2.Text:=Form1.IdEncoderXXE1.Encode(RichEdit1.Text);
  4: RichEdit2.Text:=Form1.IdEncoderQuotedPrintable1.Encode(RichEdit1.Text);
  11: RichEdit2.Text:=Form1.IdDecoderMIME1.DecodeToString(RichEdit1.Text);
  12: RichEdit2.Text:=Form1.IdDecoderUUE1.DecodeToString(RichEdit1.Text);
  13: RichEdit2.Text:=Form1.IdDecoderXXE1.DecodeToString(RichEdit1.Text);
  14: RichEdit2.Text:=Form1.IdDecoderQuotedPrintable1.DecodeToString(Richedit1.Text)
 end;
 Form2.Label1.Caption:='Выполнено';
 Form2.Hide;
 Form2.Label1.Caption:='Выполняется  кодирование-декодирование. Ждите';
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 Form3.ShowModal;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 at: string;
 im,al,i: integer;
begin
 Form2.Show;
 Form2.ProgressBar1.Visible:=true;
 al:=Length(Form1.Richedit1.Text);
 at:=Form1.Richedit1.text;
 Form2.ProgressBar1.Max:=al;
 for i:=1 to al do
  begin
   at[i]:=chr(ord(at[i])+strtoint(Form1.Edit3.Text));
   Form2.ProgressBar1.Position:=i;
   Form2.Update;
   Sleep(0);
   Form2.ProgressBar1.Update;
  end;
 Form2.ProgressBar1.Position:=al;
 RichEdit2.Text:=at;
 Form2.Label1.Caption:='Выполнено.';
 Form2.ProgressBar1.Visible:=false;
 Form2.Hide;
 Form2.Label1.Caption:='Выполняется  кодирование-декодирование. Ждите...';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 md: PChar;
 um: string;
 sm,m,d: integer;
begin
 sm:=length(Form1.RichEdit1.Text);
 um:=Richedit1.Text;
 Form2.Show;
 Form2.Update;
 Form2.ProgressBar1.Visible:=true;
 Form2.ProgressBar1.Max:=sm;
 for m:=1 to sm do
  begin
   if um[m]=Edit1.Text
   then
    begin
     md:=StrPCopy(md,Edit2.Text);
     um[m]:=chr(ord(';'));
    end;
  end;
end;

end.
