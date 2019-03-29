object NewMessageForm: TNewMessageForm
  Left = 602
  Top = 460
  Width = 300
  Height = 200
  Caption = 'NewMessageForm'
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
  PixelsPerInch = 96
  TextHeight = 13
  object ActionPanel: TPanel
    Left = 0
    Top = 113
    Width = 292
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      292
      41)
    object CharCountLabel: TLabel
      Left = 7
      Top = 14
      Width = 6
      Height = 13
      Caption = '0'
    end
    object CancelButton: TButton
      Left = 209
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object OKButton: TButton
      Left = 129
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 1
    end
  end
  object MessageTextMemo: TMemo
    Left = 0
    Top = 0
    Width = 292
    Height = 113
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
    OnChange = MessageTextMemoChange
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 8
    object FileMI: TMenuItem
      Caption = 'File'
      object OpenMI: TMenuItem
        Caption = 'Open...'
        OnClick = OpenMIClick
      end
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
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 40
    Top = 8
  end
  object MessageTextOpenDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 104
    Top = 8
  end
  object MessageTextSaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text Files (*.txt)|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 72
    Top = 8
  end
end
