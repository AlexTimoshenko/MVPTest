object dlgCpConfig: TdlgCpConfig
  Left = 776
  Top = 405
  BorderStyle = bsDialog
  Caption = 'COM Port Config'
  ClientHeight = 141
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object lb1: TLabel
    Left = 40
    Top = 32
    Width = 23
    Height = 14
    Caption = 'Port'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lb2: TLabel
    Left = 40
    Top = 64
    Width = 49
    Height = 14
    Caption = 'Baudrate'
  end
  object cbbPort: TComboBox
    Left = 104
    Top = 24
    Width = 81
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    TabOrder = 0
  end
  object cbbRate: TComboBox
    Left = 104
    Top = 56
    Width = 81
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    TabOrder = 1
  end
  object pnl1: TPanel
    Left = 0
    Top = 100
    Width = 240
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bvl1: TBevel
      Left = 1
      Top = 1
      Width = 238
      Height = 2
      Align = alTop
    end
    object btnOK: TButton
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 48
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
