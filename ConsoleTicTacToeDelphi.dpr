program ConsoleTicTacToeDelphi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  StrUtils;

var
  isPlayerOneTurn : Boolean;
  input, rowLetter : String;
  row, r, col, c, winner, i : Integer;
  field : array of array of Integer;

begin

  SetLength(field, 3);
  for r := 0 to 2 do
  begin
    SetLength(field[r], 3);
    for c := 0 to 2 do
    begin
      field[r,c] := 0;
    end;
  end;

  isPlayerOneTurn := true;
  winner := 0;

  while true do
  begin
    //Write Field

    for r := 0 to 2 do
    begin
      for c := 0 to 2 do
      begin
        Write(' ');

        if (c = 0) OR (c = 1) then Write(field[r,c])
        else WriteLn(field[r,c]);
      end;
    end;

    //Check for win

    for i := 0 to 2 do
    begin
      if (field[i,0] = field[i,1]) AND (field[i,1] = field[i,2]) AND ((field[i,2] = 1) OR (field[i,2] = 2)) then winner := field[i,2];
      if (field[0,i] = field[1,i]) AND (field[1,i] = field[2,i]) AND ((field[2,i] = 1) OR (field[2,i] = 2)) then winner := field[2,i];
    end;

    if winner <> 0 then break;

    //Get input

    Write('>: ');
    ReadLn(input);

    rowLetter := LeftStr(input, 1);
    col := StrToInt(RightStr(input, 1)) - 1;

    if LowerCase(rowLetter) = 'a' then row := 0
    else
      if LowerCase(rowLetter) = 'b' then row := 1
      else row := 2;

    //Set state of field

    if (field[row, col] <> 1) AND (field[row, col] <> 2) then
    begin
      if isPlayerOneTurn then field[row, col] := 1
      else field[row, col] := 2;
    end;

    isPlayerOneTurn := NOT isPlayerOneTurn;
  end;

  Write('Won by: ');
  WriteLn(winner);

  ReadLn;
end.
