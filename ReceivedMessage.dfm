object ReceivedMessageForm: TReceivedMessageForm
  Left = 692
  Top = 379
  Width = 300
  Height = 200
  Caption = 'ReceivedMessageForm'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MessageTextMemo: TMemo
    Left = 0
    Top = 0
    Width = 292
    Height = 113
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
  end
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
    object ReplyButton: TButton
      Left = 129
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Reply'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = ReplyButtonClick
    end
    object CloseButton: TButton
      Left = 209
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 1
    end
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
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 40
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
