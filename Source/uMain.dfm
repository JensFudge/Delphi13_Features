object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Delphi 13 Features'
  ClientHeight = 472
  ClientWidth = 624
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 31
  CustomTitleBar.StyleColors = True
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = clWhite
  CustomTitleBar.ForegroundColor = 65793
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = 65793
  CustomTitleBar.ButtonBackgroundColor = clWhite
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 16053492
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 31
  OnCreate = FormCreate
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
  object cbxStyles: TComboBox
    Left = 48
    Top = 240
    Width = 145
    Height = 23
    TabOrder = 8
    Text = 'cbxStyles'
    OnChange = cbxStylesChange
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 30
    CustomButtons = <>
    object Edit1: TEdit
      Left = 192
      Top = 3
      Width = 65
      Height = 23
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 272
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
  end
end
