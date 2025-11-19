object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Delphi 13 Features'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnTernary: TButton
    Left = 48
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Ternary'
    TabOrder = 0
    OnClick = btnTernaryClick
  end
  object btnNameOf: TButton
    Left = 152
    Top = 48
    Width = 75
    Height = 25
    Caption = 'NameOf'
    TabOrder = 1
    OnClick = btnNameOfClick
  end
  object lbValues: TListBox
    Left = 248
    Top = 48
    Width = 313
    Height = 161
    ItemHeight = 15
    TabOrder = 2
  end
  object btnIsNot: TButton
    Left = 48
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Is Not'
    TabOrder = 3
    OnClick = btnIsNotClick
  end
  object btnNotIn: TButton
    Left = 152
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Not In'
    TabOrder = 4
    OnClick = btnNotInClick
  end
  object btnPushPop: TButton
    Left = 48
    Top = 144
    Width = 75
    Height = 25
    Caption = '{$PUSHOPT}'
    TabOrder = 5
    OnClick = btnPushPopClick
  end
  object btnSelf: TButton
    Left = 152
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Rec Self'
    TabOrder = 6
    OnClick = btnSelfClick
  end
  object btnNoReturn: TButton
    Left = 48
    Top = 192
    Width = 75
    Height = 25
    Caption = 'No Return'
    TabOrder = 7
    OnClick = btnNoReturnClick
  end
end
