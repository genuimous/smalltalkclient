object UserSettingsForm: TUserSettingsForm
  Left = 494
  Top = 668
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'User Settings'
  ClientHeight = 137
  ClientWidth = 281
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
  object UserPropsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 89
    Caption = 'User Properties'
    TabOrder = 0
    object UserNameLabel: TLabel
      Left = 16
      Top = 28
      Width = 56
      Height = 13
      Caption = 'User Name:'
    end
    object PasswordLabel: TLabel
      Left = 16
      Top = 52
      Width = 49
      Height = 13
      Caption = 'Password:'
    end
    object UserNameEdit: TEdit
      Left = 128
      Top = 24
      Width = 121
      Height = 21
      MaxLength = 32
      TabOrder = 0
      OnExit = UserNameEditExit
    end
    object PasswordEdit: TEdit
      Left = 128
      Top = 48
      Width = 121
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object CancelButton: TButton
    Left = 198
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object OKButton: TButton
    Left = 118
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 48
    Top = 88
  end
end
