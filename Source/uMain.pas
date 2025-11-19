unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.TitleBarCtrls;

type
  TfrmMain = class(TForm)
    btnTernary: TButton;
    btnNameOf: TButton;
    lbValues: TListBox;
    btnIsNot: TButton;
    btnNotIn: TButton;
    btnPushPop: TButton;
    btnSelf: TButton;
    btnNoReturn: TButton;
    cbxStyles: TComboBox;
    TitleBarPanel1: TTitleBarPanel;
    Edit1: TEdit;
    Button1: TButton;
    procedure btnTernaryClick(Sender: TObject);

    procedure btnNameOfClick(Sender: TObject);
    procedure btnIsNotClick(Sender: TObject);
    procedure btnNotInClick(Sender: TObject);
    procedure btnPushPopClick(Sender: TObject);
    procedure btnSelfClick(Sender: TObject);
    procedure btnNoReturnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxStylesChange(Sender: TObject);
  private
    procedure FatalError(aMsg: string); //noreturn;
    function ComputeValue(A, B: integer): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;


  //In Delphi 12 the class operators don't have an implicit self
  TD12Rec = record
    Value : integer;
    class operator Initialize(out aRec : TD12Rec);
  end;

  //There is from Delphi 13 an implicit self in record class operators
  TD13Rec = record
    Value : integer;
    class operator initialize;
  end;


var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.math,
  vcl.Themes,
  vcl.Styles,
  uArcherClass;

function DoCalc(A, B : Integer) : Integer;
begin
   Result := A div B;
end;

function TfrmMain.ComputeValue (A, B : integer) : Integer;
begin
  //This will either raise an exception or return a value
  If A = 5 then
    FatalError(format('%s cannot be 5', [nameOf(A)]))    //If FatalError is called it will stop and not return
  else
    Result := A + B;
end;


//I can decorate FatalError method with noreturn, to tell the compiler it will never return
procedure TfrmMain.FatalError(aMsg : string);
begin
  OutputDebugString(Pchar(aMsg));
  raise Exception.Create(aMsg);
end;



procedure TfrmMain.FormCreate(Sender: TObject);
begin
  cbxStyles.Items.Clear;


  for var StyleName in TStyleManager.StyleNames do
    cbxStyles.Items.Add(StyleName);

  cbxStyles.ItemIndex := cbxStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TfrmMain.btnIsNotClick(Sender: TObject);
begin
  //Is Not is a more readable version of Is Not

  //Delphi pre 13
  If not (Sender is TEdit) then
    ShowMessage(format('%s is not a %s',[NameOf(Sender), NameOf(TEdit)]));

  //Delphi 13
  if Sender is not  TForm then
    ShowMessage(format('%s is not a %s',[NameOf(Sender), NameOf(TForm)]));
end;

procedure TfrmMain.btnNameOfClick(Sender: TObject);
begin
  //The NameOf method will return the name of the passed reference as a string
  //The purpose is for debugging.
  //Note NameOf  really just returns the passed parameter as a string
  //it does not resolve the name of the actual instans

  lbValues.Items.Clear;
  lbValues.Items.Add(NameOf(Sender));
  lbValues.Items.Add((Sender as TComponent).Name);  //This is not using the NameOf

  {$PUSHOPT}
  {$HINTS off}
  var lArcher : TArcher;
  lbValues.Items.Add(NameOf(lArcher));

  var i : Integer := 42;
  var j : Integer := 2;
  lbValues.Items.Add(NameOf(DoCalc) + ' called with ' + NameOf(i)+': ' + IntToStr(i) + ', '+  NameOf(j) + ': ' + IntToStr(j))  ;
end;
{$POPOPT}

procedure TfrmMain.btnNotInClick(Sender: TObject);
begin
  //The Not In operator is a more readable version of not in


  var point : Integer := 9;

  //Pre Delphi 13
  if not (point in [0, 5, 8,  10, 11]) then
    ShowMessage(NameOf(Point) + ' has an invalid value: ' + point.Tostring + ' For 3D archery');

  //Delphi 13
  point := 11;
  if point not in [0..10] then
    ShowMessage(NameOf(Point) + ' has an invalid value: ' + point.Tostring + ' For Target archery');

end;

procedure TfrmMain.btnTernaryClick(Sender: TObject);
begin
  //The Ternary operator has the following syntax
  //result := if condition then value1 else value2;

  //and is a shortcut to  the classic
  // if condition then result := value1
  // else result := value2

  //it is quite clear to read, and here are a few examples

   var A : integer := 10;
   var B : integer := 0;

   var C : Integer := if B <> 0 then doCalc(A, B) else A;    //doCalc is A div B

   var Recurve : Boolean := true;

   var archer : TArcher;
   archer := if Recurve then  TRecurveArcher.Create else TArcher.Create;
   try
     archer.Point := C;
     ShowMessage(archer.Point.ToString);
   finally
     archer.Free;
   end;



   //There is an older version of something similar
   //But this does not use lazy evaluation. The "complex" method doCalc will be evaluated

   C := IfThen(B <> 0, doCalc(A,B), 0);
   showmessage(C.ToString);

end;

procedure TfrmMain.cbxStylesChange(Sender: TObject);
begin
   //To add a custom titlebar
  //set the form.CustomTitleBar.enabled := true;
  //drop a TTitleBarPanel on the form
  //set form.CustomTitleBar.Control to the dropped component
  //set the form.StyleElements to true (all of them)

   TStyleManager.TrySetStyle(cbxStyles.Text);
end;

procedure TfrmMain.btnNoReturnClick(Sender: TObject);
begin
  var i : integer := 5;
  var j : integer := 6;

  //ComputeValue could end up not returning anything
  var k := ComputeValue(i,j);


  lbValues.Items.Add(k.ToString);
end;

procedure TfrmMain.btnSelfClick(Sender: TObject);
begin
   lbValues.Items.Clear;

   var l12 : TD12Rec;
   lbValues.Items.Add(format('%s Value: %d',[NameOf(l12), l12.Value]));

   var l13 : TD13Rec;
   lbValues.Items.Add(format('%s Value: %d',[NameOf(l13), l13.Value]));

end;

procedure TfrmMain.btnPushPopClick(Sender: TObject);
begin
   //The new {$PUSHOPT} will push all the current compiler settings to a stack
   //Just to remember what they are now so you can later restore
   //This has two (as I see it) benefits:
   // 1) If the setttings are set in various places you don't know what they are when you set them yourself
   // 2) Easy to restore a bunch at a time

    lbValues.Clear;

    var c : byte := 255;
    lbValues.Items.Add(c.ToString);


    //If they allready were switched of somewhere
   //   {$R-}
   //   {$Q-}

    {$PUSHOPT}
    {$R-}
    {$Q-}
    Inc(c);
    lbValues.Items.Add(c.ToString);
    {$POPOPT}   //The {$POPOPT} will restore the settings
    c := 255;
    try
      Inc(c);
      lbValues.Items.Add(c.ToString);

    except on E:Exception do
      lBValues.Items.Add(NameOf(Exception));

    end;


end;

{ TD12Rec }

class operator TD12Rec.Initialize(out aRec: TD12Rec);
begin
  //self.value := 12; Not compilable
  aRec.Value := 12;
end;

{ TD13Rec }

class operator TD13Rec.initialize;
begin
  self.Value := 13;
end;

end.
