unit uArcherClass;

interface

uses
  generics.collections;

Type

  TArcher = class (TObject)
  private
    FPoint: Integer;
    procedure SetPoint(const Value: Integer);

  public
    property Point : Integer read FPoint write SetPoint;

  end;

  TRecurveArcher = class (TArcher)

  end;



implementation

{ TArcher }

procedure TArcher.SetPoint(const Value: Integer);
begin
  FPoint := Value;
end;

end.
