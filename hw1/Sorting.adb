-- The code is produced by Qifeng Zeng
-- The QSort procedure is concurrent.

with text_io; -- always need these two lines for reading and printing
use text_io;

package body Sorting is

package int_io is new integer_io(integer);
use int_io;

 procedure QSort(Low:integer; High:integer; Div:integer) is

 task sort1;
 task sort2;

 task body sort1 is
 Lower: Integer := Low;
 Higher: Integer:= Div-1;
 I: Integer := Lower;
 J: Integer := Higher;
 M: Integer;
 tmp : Integer;
 middle:integer := (Lower+Higher)/2;
 begin
 if Lower< Higher then
    if middle = Lower then
        M := Arr(Lower);
        if M > Arr(Higher) then
            M := Arr(Higher);
        end if;
    else
        if Arr(Lower)<= Arr(middle) then
            if Arr(Lower)<= Arr(Higher) then
                if Arr(middle) <= Arr(Higher) then
                    M := Arr(middle);
                else
                    M := Arr(Higher);
                end if;
            else
                M := Arr(Lower);
            end if;
        else
            if Arr(middle)<= Arr(Higher) then
                if Arr(Lower) <= Arr(Higher) then
                    M := Arr(Lower);
                else
                    M := Arr(Higher);
                end if;
            else
                M := Arr(middle);
            end if;
        end if;
    end if;
    -- New_Line;
    -- put(I); put(J);
    -- put(Arr(I)); put(Arr(J)); put(Arr(middle)); put(M);
    While I < J
    loop
        While Arr(I) <= M and I< J
        loop
            I := I + 1;
        end loop;

        While Arr(J) > M and I<J
        loop
            J := J - 1;
        end loop;

        If I<J then
            tmp := Arr(J);
            Arr(J) := Arr(I);
            Arr(I) := tmp;
        end If;
    end loop;
    QSort(Lower,Higher,I);
 end if;
 end sort1;

task body sort2 is
 Lower: Integer := Div;
 Higher: Integer:= High;
 I: Integer := Lower;
 J: Integer := Higher;
 M: Integer;
 tmp : Integer;
 middle:integer := (Lower+Higher)/2;
 begin
 if Lower< Higher then
    if middle = Lower then
        M := Arr(Lower);
        if M > Arr(Higher) then
            M := Arr(Higher);
        end if;
    else
        if Arr(Lower)<= Arr(middle) then
            if Arr(Lower)<= Arr(Higher) then
                if Arr(middle) <= Arr(Higher) then
                    M := Arr(middle);
                else
                    M := Arr(Higher);
                end if;
            else
                M := Arr(Lower);
            end if;
        else
            if Arr(middle)<= Arr(Higher) then
                if Arr(Lower) <= Arr(Higher) then
                    M := Arr(Lower);
                else
                    M := Arr(Higher);
                end if;
            else
                M := Arr(middle);
            end if;
        end if;
    end if;
    -- New_Line;
    -- put(I); put(J);
    -- put(Arr(I)); put(Arr(J)); put(Arr(middle)); put(M);
    While I < J
    loop
        While Arr(I) <= M and I< J
        loop
            I := I + 1;
        end loop;

        While Arr(J) > M and I<J
        loop
            J := J - 1;
        end loop;

        If I<J then
            tmp := Arr(J);
            Arr(J) := Arr(I);
            Arr(I) := tmp;
        end If;
    end loop;
    QSort(Lower,Higher,I);
 end if;
 end sort2;

 begin
    Null;
 end QSort;


end Sorting;
