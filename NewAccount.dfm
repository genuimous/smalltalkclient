object NewAccountForm: TNewAccountForm
  Left = 595
  Top = 346
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'New Account Registration'
  ClientHeight = 273
  ClientWidth = 233
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
  object AccountPropsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 225
    Caption = 'Account Properties'
    TabOrder = 0
    object UserNameLabel: TLabel
      Left = 16
      Top = 24
      Width = 53
      Height = 13
      Caption = 'User Name'
    end
    object PasswordLabel: TLabel
      Left = 16
      Top = 72
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Password2Label: TLabel
      Left = 16
      Top = 120
      Width = 101
      Height = 13
      Caption = 'New Password Again'
    end
    object DisplayNameLabel: TLabel
      Left = 16
      Top = 168
      Width = 65
      Height = 13
      Caption = 'Display Name'
    end
    object UserNameEdit: TEdit
      Left = 16
      Top = 40
      Width = 185
      Height = 21
      MaxLength = 32
      TabOrder = 0
      OnExit = UserNameEditExit
    end
    object PasswordEdit: TEdit
      Left = 16
      Top = 88
      Width = 185
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 1
    end
    object Password2Edit: TEdit
      Left = 16
      Top = 136
      Width = 185
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 2
    end
    object DisplayNameEdit: TEdit
      Left = 16
      Top = 184
      Width = 185
      Height = 21
      MaxLength = 128
      TabOrder = 3
    end
  end
  object OKButton: TButton
    Left = 70
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 150
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 32
    Top = 96
  end
end
