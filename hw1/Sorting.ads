-- The code is produced by Qifeng Zeng

package Sorting is
 procedure QSort(Low: in integer; High: in integer; Div: in integer);
 subtype my_integer is integer range 0..500;
 SIZE : integer := 40;
 type my_array is array(1..SIZE) of my_integer;
 Arr : my_array;
end Sorting;

