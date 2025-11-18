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
  object lbNames: TListBox
    Left = 248
    Top = 48
    Width = 313
    Height = 161
    ItemHeight = 15
    TabOrder = 2
  end
  object btnIsNot: TButton
    Left = 48
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Is Not'
    TabOrder = 3
    OnClick = btnIsNotClick
  end
  object btnNotIn: TButton
    Left = 152
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Not In'
    TabOrder = 4
    OnClick = btnNotInClick
  end
end
