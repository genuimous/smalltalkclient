object ChangeDisplayNameForm: TChangeDisplayNameForm
  Left = 650
  Top = 376
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Display Name Changing'
  ClientHeight = 177
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
  object DisplayNamePropsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 129
    Caption = 'Display Name Properties'
    TabOrder = 0
    object CurrentPasswordLabel: TLabel
      Left = 16
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Current Password'
    end
    object NewDisplayNameLabel: TLabel
      Left = 16
      Top = 72
      Width = 90
      Height = 13
      Caption = 'New Display Name'
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
    object NewDisplayNameEdit: TEdit
      Left = 16
      Top = 88
      Width = 185
      Height = 21
      MaxLength = 32
      TabOrder = 1
    end
  end
  object OKButton: TButton
    Left = 70
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 150
    Top = 144
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 104
    Top = 56
  end
end
