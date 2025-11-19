program D13AI;

uses
  Vcl.Forms,
  uAIMain in 'uAIMain.pas' {Form1},
  uAIAPI in 'uAIAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
