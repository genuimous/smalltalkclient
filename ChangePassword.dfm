object ChangePasswordForm: TChangePasswordForm
  Left = 650
  Top = 310
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Password Changing'
  ClientHeight = 225
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
  object PasswordPropsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 177
    Caption = 'Password Properties'
    TabOrder = 0
    object CurrentPasswordLabel: TLabel
      Left = 16
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Current Password'
    end
    object NewPasswordLabel: TLabel
      Left = 16
      Top = 72
      Width = 71
      Height = 13
      Caption = 'New Password'
    end
    object NewPassword2Label: TLabel
      Left = 16
      Top = 120
      Width = 101
      Height = 13
      Caption = 'New Password Again'
    end
    object CurrentPasswordEdit: TEdit
      Left = 16
      Top = 40
      Width = 185
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 0
    end
    object NewPasswordEdit: TEdit
      Left = 16
      Top = 88
      Width = 185
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 1
    end
    object NewPassword2Edit: TEdit
      Left = 16
      Top = 136
      Width = 185
      Height = 21
      MaxLength = 32
      PasswordChar = '*'
      TabOrder = 2
    end
  end
  object OKButton: TButton
    Left = 70
    Top = 192
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 150
    Top = 192
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 112
    Top = 128
  end
end
