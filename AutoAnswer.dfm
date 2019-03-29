object AutoAnswerForm: TAutoAnswerForm
  Left = 370
  Top = 184
  Width = 870
  Height = 640
  Caption = 'AutoAnswerForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ActionPanel: TPanel
    Left = 0
    Top = 572
    Width = 862
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonsPanel: TPanel
      Left = 692
      Top = 0
      Width = 170
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object CancelButton: TButton
        Left = 86
        Top = 8
        Width = 75
        Height = 25
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 1
      end
      object OKButton: TButton
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Caption = 'OK'
        Default = True
        TabOrder = 0
      end
    end
  end
end
