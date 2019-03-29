object MessageListForm: TMessageListForm
  Left = 634
  Top = 460
  Width = 600
  Height = 400
  Caption = 'Message List'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
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
  object MessageListMemo: TMemo
    Left = 0
    Top = 0
    Width = 592
    Height = 354
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
  object MessageListSaveDialog: TSaveDialog
    DefaultExt = 'log'
    Filter = 'Log Files (*.log)|*.log'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 8
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 96
    Top = 112
  end
end
