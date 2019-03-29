object AddContactForm: TAddContactForm
  Left = 519
  Top = 346
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contact Adding'
  ClientHeight = 129
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
  object ContactPropsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 81
    Caption = 'Contact Properties'
    TabOrder = 0
    object UserNameLabel: TLabel
      Left = 16
      Top = 24
      Width = 53
      Height = 13
      Caption = 'User Name'
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
  end
  object CancelButton: TButton
    Left = 150
    Top = 96
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object OKButton: TButton
    Left = 70
    Top = 96
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object FormPlacement: TFormPlacement
    Options = [fpPosition]
    Left = 176
    Top = 32
  end
end
