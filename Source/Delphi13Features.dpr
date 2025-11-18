program Delphi13Features;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uArcherClass in 'uArcherClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
