object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Merger'
  ClientHeight = 190
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button3: TButton
    Left = 136
    Top = 89
    Width = 113
    Height = 25
    Caption = 'Load && merge'
    TabOrder = 0
    OnClick = Button3Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 64
    Width = 105
    Height = 97
    Caption = 'Result'
    TabOrder = 1
    object Button2: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 16
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 152
    Top = 8
  end
end
