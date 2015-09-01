object dlgMainView: TdlgMainView
  Left = 750
  Top = 369
  BorderStyle = bsDialog
  Caption = 'COM Port RW'
  ClientHeight = 272
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object lb1: TLabel
    Left = 40
    Top = 64
    Width = 28
    Height = 14
    Caption = 'Code'
  end
  object btnSend: TButton
    Left = 208
    Top = 56
    Width = 75
    Height = 25
    Action = actSend
    TabOrder = 0
  end
  object edtCode: TEdit
    Left = 80
    Top = 56
    Width = 121
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '100'
  end
  object acttb1: TActionToolBar
    Left = 0
    Top = 0
    Width = 326
    Height = 24
    ActionManager = actmgr1
    Caption = 'acttb1'
    ColorMap.HighlightColor = 15660791
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Spacing = 0
  end
  object memoCPHistory: TMemo
    Left = 40
    Top = 120
    Width = 241
    Height = 129
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object actmgr1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = actExit
            Caption = '&Exit'
          end
          item
            Caption = '-'
          end
          item
            Action = actConfig
          end
          item
            Action = actConnect
            Caption = 'C&onnect'
          end
          item
            Action = actDisconnect
            Caption = '&Disconnect'
          end>
        ActionBar = acttb1
      end>
    Left = 104
    Top = 88
    StyleName = 'XP Style'
    object actExit: TAction
      Caption = 'Exit'
      OnExecute = actExitExecute
    end
    object actConfig: TAction
      Caption = 'Config'
      OnExecute = actConfigExecute
      OnUpdate = actConfigUpdate
    end
    object actConnect: TAction
      Caption = 'Connect'
      OnExecute = actConnectExecute
      OnUpdate = actConnectUpdate
    end
    object actDisconnect: TAction
      Caption = 'Disconnect'
      Enabled = False
      OnExecute = actDisconnectExecute
      OnUpdate = actDisconnectUpdate
    end
    object actSend: TAction
      Caption = 'Send'
      Enabled = False
      OnExecute = actSendExecute
      OnUpdate = actSendUpdate
    end
  end
  object il1: TImageList
    Left = 72
    Top = 88
  end
end
