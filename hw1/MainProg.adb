-- The code is produced by Qifeng Zeng

with text_io; -- always need these two lines for reading and printing
use text_io;
with Sorting;
use Sorting;
procedure MainProg is
    package int_io is new integer_io(integer);
    use int_io;
    task Printingtask is
        entry start;
        entry print;
        entry add(X:integer);
    end Printingtask;

    task Sortingtask is
        entry Go;
    end Sortingtask;

    task Addingtask is
        entry finish;
    end Addingtask;

    task body Sortingtask is
        begin
            accept Go do
                QSort(1,SIZE,1);
            end Go;
            Printingtask.print;
            Addingtask.finish;
    end Sortingtask;

    task body Addingtask is
        sum : integer := 0;
        begin
            accept finish do
                for i in 1..SIZE loop
                    sum := sum+Arr(i);
                end loop;
            end finish;
            Printingtask.add(sum);
    end Addingtask;


    task body Printingtask is
        begin
            accept start do
                for i in 1..SIZE loop
                    put(Arr(i));
                end loop;
            end start;
            Sortingtask.Go;
            accept print do
                New_Line;
                New_Line;
                for i in 1..SIZE loop
                    put(Arr(i));
                end loop;
            end print;
            accept add(X: integer) do
                New_Line;
                New_Line;
                put(X);
            end add;

        end Printingtask;

    -- If you want to input numbers to the array from a file, use this get_array procedure!!
    -- Notice the format of the "numbers.txt" should be like that each number possess the whole line!!

    -- procedure get_array is
    --    F: File_Type;
    --    File_Name: constant String := "numbers.txt";
    --    begin
    --        Open(F, In_File, File_Name);
    --        for i in 1..SIZE loop
    --            Arr(i) := Integer'Value(Get_Line(F));
    --        end loop;
    --        Close(F);
    --    end get_array;

    -- If you want to input numbers using terminal, use this get_array procedure!!

    procedure get_array is
        begin
            for i in 1..SIZE loop
                Put("Input a number of an element of the array whose length is");
                Put(SIZE);
                Put("  ");
                Put("Currently you are inputting the number at the position:");
                Put(i);
                New_Line;
                Get(Arr(i));
            end loop;
        end get_array;


begin
    get_array;
    Printingtask.start;
end MainProg;



