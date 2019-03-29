object LogForm: TLogForm
  Left = 361
  Top = 215
  Width = 870
  Height = 640
  Caption = 'Log'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LogMemo: TMemo
    Left = 0
    Top = 0
    Width = 862
    Height = 594
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 8
    object FileMI: TMenuItem
      Caption = 'File'
      object SaveMI: TMenuItem
        Caption = 'Save...'
        OnClick = SaveMIClick
      end
      object ClearMI: TMenuItem
        Caption = 'Clear'
        OnClick = ClearMIClick
      end
    end
  end
  object LogSaveDialog: TSaveDialog
    DefaultExt = 'log'
    Filter = 'Log Files (*.log)|*.log'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 8
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 152
    Top = 160
  end
end
