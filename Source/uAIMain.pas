unit uAIMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SmartCoreAI.Types,
  SmartCoreAI.Driver.OpenAI, SmartCoreAI.Comp.Connection, SmartCoreAI.Comp.Chat;

type
  TForm1 = class(TForm)
    mmoQ: TMemo;
    mmoA: TMemo;
    btnAsk: TButton;
    AIConnection1: TAIConnection;
    AIOpenAIDriver1: TAIOpenAIDriver;
    AIChatRequest1: TAIChatRequest;
    procedure btnAskClick(Sender: TObject);
    procedure AIChatRequest1Response(Sender: TObject; const Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uAIAPI;

{$R *.dfm}

      //what is the maximum velocity of an unladen swallow?
      //What is the ultimate number

procedure TForm1.AIChatRequest1Response(Sender: TObject; const Text: string);
begin
  mmoA.Lines.Text := Text;
end;

procedure TForm1.btnAskClick(Sender: TObject);
begin
   AIOpenAIDriver1.Params.Values['APIKEY'] :=  GetAPIKey;

   AIChatRequest1.Chat(mmoQ.Lines.Text);

end;

end.
