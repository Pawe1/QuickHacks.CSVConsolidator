unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FDictionary: TDictionary<string, string>;
    r: TStringReader;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDictionary.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Writer: TStreamWriter;
  Element: TPair<string, string>;
  Line: string;
begin
  Writer := TStreamWriter.Create('result.txt');
  try
    Writer.BaseStream.Seek(0, soFromBeginning);

    for Element in FDictionary.ToArray do
    begin
      Line := Format('%s'#9'%s', [Element.Key, Element.Value]);
      Writer.WriteLine(Line);
    end;

  finally
    Writer.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Reader: TStreamReader;
  Line: string;
begin
  if not OpenDialog1.Execute then
    Exit;

  Reader := TStreamReader.Create(OpenDialog1.FileName);
  try
    Reader.BaseStream.Seek(0, soFromBeginning);
    with TStringList.Create do
      try

        while not Reader.EndOfStream do
        begin
          Line := Reader.ReadLine;
          CommaText := StringReplace(Line, #9, ',', [rfReplaceAll]);
          if FDictionary.ContainsKey(Strings[0]) then
          begin
            if not Strings[1].IsEmpty then
              FDictionary.Items[Strings[0]] := Strings[1];
          end
          else
          begin
            if not Strings[1].IsEmpty then
              FDictionary.Add(Strings[0], Strings[1]);
          end;
        end;

      finally
        Free;
      end;
  finally
    Reader.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDictionary := TDictionary<string, string>.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FDictionary.Free;
end;

end.
