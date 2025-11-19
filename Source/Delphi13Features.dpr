program Delphi13Features;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uArcherClass in 'uArcherClass.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
