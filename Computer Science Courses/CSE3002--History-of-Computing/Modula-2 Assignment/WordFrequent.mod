MODULE WordFrequent;

(* Programming Assignment 2 using Modula-2 by Patrick Korianski*)

FROM StreamFile IMPORT ChanId, Open, read, Close, OpenResults;
FROM TextIO IMPORT ReadString, WriteLn, WriteString, WriteChar, SkipLine;
FROM IOResult IMPORT ReadResult, ReadResults;
FROM StdChans IMPORT StdInChan, StdOutChan;
FROM WholeIO  IMPORT WriteInt;


TYPE line = ARRAY[0..120] OF CHAR;
     AllLines = ARRAY [1..1000] OF line;

     word = ARRAY[0..20] OF CHAR;
     WordFreq = RECORD
                freq   : INTEGER;
                aword   : word;
            END;
     AllWords = ARRAY [1..1000] OF WordFreq;


VAR
  infile, stdOut, stdIn : ChanId;
  res : OpenResults;
  inputline: line;
  i, j, k, m, n, x : INTEGER;
  charval : INTEGER;
  numlines: INTEGER;
  wordindex: INTEGER;
  numwords: INTEGER;
  document: AllLines;
  wordsindoc: AllWords;
  currFreq: INTEGER;
  word1, word2 : word;

BEGIN
  stdOut := StdOutChan(); (* to force screen output *)
    stdIn := StdInChan(); (* to force keyboard input *)
    (* The first part of the code reads all lines from the file *)
    (* into inputline and stores them in the document array *)
    Open (infile, "input.txt", read, res);
    IF res = opened
      THEN
        i := 1;
        REPEAT  (* Collect the numbers from the file *)
          ReadString (infile, inputline);
          WriteString (stdOut, inputline);
          IF ReadResult (infile) = allRight
            THEN
              SkipLine (infile);
              (* NOW PROCESS THE LINE TO FIND WORDS *)
              document[i]:=inputline;
              WriteLn (stdOut);
              i:=i+1;
            END;  (* if *)
        UNTIL ReadResult (infile) # allRight;
       Close (infile);
       (*WriteLn (stdOut);*)
      ELSE
       WriteString (stdOut,"Sorry, couldn't open the file");
       WriteLn (stdOut);
      END; (* if *)
      numlines :=i-1; (* i gets incremented for EOF line*)

      (* The code part of the code cycles through document array *)
          (* in order to identify words in each line*)
          numwords:=0;
          wordindex := 1;
          FOR i:=1 TO numlines DO
            j:=0; k:=0;
            WHILE ORD(document[i][j]) <> 0
            DO
             charval := ORD(document[i][j]);
             IF ((charval >= 48) AND (charval < 58)) OR
                ((charval >= 65) AND (charval < 92)) OR
                ((charval >= 97) AND (charval < 123)) OR
                ((charval = 45)) OR ((charval=39))
               THEN (* is it a number or upper/lower case char *)
                 wordsindoc[wordindex].aword[k] := document[i][j];
                 (*WriteChar(stdOut, wordsindoc[wordindex].aword[k]);*)
                 k:=k+1;
               ELSE (* end of word *)
                 (*WriteLn (stdOut);*)

                 wordindex:=wordindex+1;
                 numwords:=numwords+1;
                 k:=0;
               END;
             j:=j+1;
            END;
            (* I was getting errors for string comparision so I decided to compare the first 5 char's of each word to find the frequencies *)
            FOR m:=1 TO wordindex DO
              FOR n:=2 TO wordindex DO
                IF (wordsindoc[m].aword[1] = wordsindoc[n].aword[1])
                THEN
                  IF (wordsindoc[m].aword[2] = wordsindoc[n].aword[2])
                  THEN
                    IF (wordsindoc[m].aword[3] = wordsindoc[n].aword[3])
                    THEN
                      IF (wordsindoc[m].aword[4] = wordsindoc[n].aword[4])
                        THEN
                          IF (wordsindoc[m].aword[5] = wordsindoc[n].aword[5])
                          THEN
                            wordsindoc[m].freq := wordsindoc[m].freq +1;
                          END;
                        END;
                    END;
                  END;
                END;
              END;
            END;
          END;
          WriteLn(stdOut);
          WriteString(stdOut, "*****RESULTS OF THE TEXT ABOVE*****"); WriteLn(stdOut);
          WriteString(stdOut, "Number of words= "); WriteInt(stdOut,wordindex,0); WriteLn(stdOut); WriteLn(stdOut);
          WriteString(stdOut, "(Word, Frequency)");
          (*numwords:=numwords-1; WriteInt(stdOut, numwords, 3); WriteLn(stdOut);*)
          WriteLn(stdOut);
          (* Looping through the linked list and displaying the words and their frequencies*)
          FOR x:=1 TO wordindex DO
            WriteString(stdOut, wordsindoc[x].aword); WriteInt(stdOut, wordsindoc[x].freq, 0);
            WriteLn(stdOut);
          END;
          WriteLn(stdOut);

END WordFrequent.