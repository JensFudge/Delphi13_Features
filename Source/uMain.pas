unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnTernary: TButton;
    btnNameOf: TButton;
    lbNames: TListBox;
    btnIsNot: TButton;
    btnNotIn: TButton;
    procedure btnTernaryClick(Sender: TObject);
    procedure btnNameOfClick(Sender: TObject);
    procedure btnIsNotClick(Sender: TObject);
    procedure btnNotInClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  math,
  uArcherClass;

function DoCalc(A, B : Integer) : Integer;
begin
   Result := A div B;
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

  lbNames.Items.Clear;
  lbNames.Items.Add(NameOf(Sender));
  lbNames.Items.Add((Sender as TComponent).Name);  //This is not using the NameOf
  var lArcher : TArcher;
  lbNames.Items.Add(NameOf(lArcher));

  var i : Integer := 42;
  var j : Integer := 2;
  lbNames.Items.Add(NameOf(DoCalc) + ' called with ' + NameOf(i)+': ' + IntToStr(i) + ', '+  NameOf(j) + ': ' + IntToStr(j))  ;

end;

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
   try
     archer := if Recurve then  TRecurveArcher.Create else TArcher.Create;
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

end.
