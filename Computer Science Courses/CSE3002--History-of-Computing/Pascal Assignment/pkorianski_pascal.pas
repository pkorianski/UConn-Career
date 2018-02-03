(* Program was created by Patrick Korianski for CSE3002 *)
(* References include Professor Demurjian's Pascal slides and also the slideshow that explains the program ReadWritetoFiles*)

program WCF;
var
   readfilename  : string;
   writefilename : string;
   myreadfile    : text;
   mywritefile   : text;
   line          : packed array [1..120] of char;
   tot_chars     : integer;
   tot_spaces    : integer;
   tot_lines     : integer;
   tot_words     : integer;
   i,j           : integer;
   curr_chars: integer;
   curr_words     : integer;
   curr_spaces    : integer;


begin
   (* put all files in same folder/directory *)
   readfilename:='HoCMoviesAssignment.txt'; (*input.txt was the test file I used which was given my our professor *)
   writefilename:='outputfile.txt';
   
   assign(myreadfile, readfilename);
   reset(myreadfile);

   assign(mywritefile, writefilename);
   rewrite(mywritefile);

   writeln(mywritefile, 'File created and written by Patrick Korianski');
   writeln(mywritefile, 'Total Results will be shown at the bottom of the txt file');
   writeln(mywritefile, '*************************************************************');
   while NOT EOF (myreadfile) do
     begin
      readln(myreadfile, line);
      curr_chars := 0;
      curr_words := 0;
      curr_spaces := 0;
      i:=1;
      while (ord(line[i]) <> 0) do i:=i+1;
      writeln(mywritefile, i);

      for j:=1 to i do
          (* Code to find the char's in each line *)
          if (ord(line[j]) <> 0) and (line[j] <> ' ') then
           begin
              curr_chars := curr_chars + 1;
              (* Code to determine if there is a word.. how? by looking for spaces and if there is not two spaces in a row, count it. *)
              (*if (line[j] = ' ') then
                begin
                  curr_spaces := curr_spaces + 1;
                  curr_words := curr_words + 1;
                  if(line[j+1] <> ' ') then
                  begin
                    curr_words := curr_words + 1;
                  end
                end;*)
            end
           else
              begin
                curr_words := curr_words + 1;
                curr_spaces := curr_spaces +1;
              end;

           (* Code to determine the number of lines.. how? when i=100, it is at the end of the line so add +1 to each time i=100*)
           if (j = i) then
             begin
               tot_lines := tot_lines + 1;
             end;
           (*writeln(mywritefile,'Line ', tot_lines, ':  has ', curr_chars-curr_spaces, ' chars and ', curr_words, ' words' );*)

      (* Calculating Total Amounts *)
      tot_chars := tot_chars + curr_chars;
      tot_words := tot_words + curr_words;
      tot_spaces := tot_spaces + curr_spaces

    end;
   (*Assuming spaces are not considered char's*)
   writeln(mywritefile, '');
   writeln(mywritefile, 'Total char (Assuming spaces arent chars)= ', tot_chars);
   writeln(mywritefile, 'Total char (With spaces included)= ', tot_chars + tot_spaces);
   writeln(mywritefile, 'Total lines= ', tot_lines);
   writeln(mywritefile, 'Total words= ', tot_words);
   writeln(mywritefile,'Completed writing'); 
   
   close(myreadfile);
   close(mywritefile);
end.
