object ConnectionSettingsForm: TConnectionSettingsForm
  Left = 583
  Top = 568
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Connection Settings'
  ClientHeight = 185
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ConnectionPropsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 425
    Height = 137
    Caption = 'Connection Properties'
    TabOrder = 0
    object ServerAddressLabel: TLabel
      Left = 16
      Top = 28
      Width = 75
      Height = 13
      Caption = 'Server Address:'
    end
    object ServerPortLabel: TLabel
      Left = 16
      Top = 52
      Width = 56
      Height = 13
      Caption = 'Server Port:'
    end
    object ConnectionTimeoutLabel: TLabel
      Left = 16
      Top = 76
      Width = 95
      Height = 13
      Caption = 'Connectiot Timeout:'
    end
    object RequestTimeoutLabel: TLabel
      Left = 16
      Top = 100
      Width = 84
      Height = 13
      Caption = 'Request Timeout:'
    end
    object ConnectionTimeoutUnitLabel: TLabel
      Left = 272
      Top = 76
      Width = 13
      Height = 13
      Caption = 'ms'
    end
    object RequestTimeoutUnitLabel: TLabel
      Left = 272
      Top = 100
      Width = 13
      Height = 13
      Caption = 'ms'
    end
    object ServerAddressEdit: TEdit
      Left = 208
      Top = 24
      Width = 201
      Height = 21
      MaxLength = 256
      TabOrder = 0
    end
    object ServerPortEdit: TEdit
      Left = 208
      Top = 48
      Width = 57
      Height = 21
      MaxLength = 5
      TabOrder = 1
      OnExit = ServerPortEditExit
    end
    object ConnectionTimeoutEdit: TEdit
      Left = 208
      Top = 72
      Width = 57
      Height = 21
      MaxLength = 6
      TabOrder = 2
      OnExit = ConnectionTimeoutEditExit
    end
    object RequestTimeoutEdit: TEdit
      Left = 208
      Top = 96
      Width = 57
      Height = 21
      MaxLength = 6
      TabOrder = 3
      OnExit = RequestTimeoutEditExit
    end
  end
  object CancelButton: TButton
    Left = 358
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object OKButton: TButton
    Left = 278
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 328
    Top = 80
  end
end
