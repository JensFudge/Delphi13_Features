object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Open AI'
  ClientHeight = 408
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object mmoQ: TMemo
    Left = 24
    Top = 8
    Width = 592
    Height = 137
    TabOrder = 0
  end
  object mmoA: TMemo
    Left = 24
    Top = 191
    Width = 592
    Height = 186
    TabOrder = 1
  end
  object btnAsk: TButton
    Left = 24
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Ask'
    TabOrder = 2
    OnClick = btnAskClick
  end
  object AIConnection1: TAIConnection
    Driver = AIOpenAIDriver1
    Left = 312
    Top = 152
  end
  object AIOpenAIDriver1: TAIOpenAIDriver
    Params.Strings = (
      'Model=gpt-4o')
    Left = 488
    Top = 144
  end
  object AIChatRequest1: TAIChatRequest
    Connection = AIConnection1
    OnResponse = AIChatRequest1Response
    Left = 176
    Top = 152
  end
end
