Pascal Implementation: A Book and Sources 

Included here is the Pascal source of a public-domain Pascal compiler and
interpreter, the P4 compiler and interpreter. It is coded entirely in
Pascal, and produces a high-level so-called intermediate code as output. The
program 'pint' is an assembler and interpreter for this language. 

The entire compiler and interpreter is documented in the book:

Pascal Implementation: The P4 Compiler and Interpreter, by Steven Pemberton
and Martin Daniels, Ellis Horwood, ISBN: 0-13-653-0311 (also available in
Japanese). 

It was distributed by John Wiley in other countries, but now that Prentice Hall
has taken over Ellis Horwood, that will have changed. 

Steven Pemberton is contactable by email as Steven.Pemberton@cwi.nl. He did not
write the compiler, only documented it in the book. 

What you have to do to use this compiler

     Compile pcom.p and pint.p with a Pascal compiler. You obviously have to
     have a Pascal compiler already. This gives you a Pascal compiler (pcom)
     that produces P4 code, and an interpreter (pint) that runs P4 code. 
     To use the compiler, run pcom with the Pascal program as standard input.
     This produces any diagnostics on standard output, and its code on a Pascal
     file that is called prr. Check with your Pascal compiler how this gets
     assigned to a file in the filestore. You may have to change the lines
     'rewrite(prr)' in pcom.p and pint.p and 'reset(prd)' in pint.p for your
     compiler, for instance to "rewrite(prr, 'prr')" etc.
     To run the resulting code, run pint with the prr output produced by pcom
     as input for the file 'prd', and input for the compiled pascal program on
     standard input. 

For instance, do this once: 

     pc -o pcom pcom.p 
     pc -o pint pint.p 

and for each program: 

     pcom < test.p # produces file prr containing the p4 code 
     mv prr prd 
     pint < input 

You have to supply input to pint, even if the program doesn't read from it, for instance: 

     pint < /dev/null 

If you intend to compile pcom with itself, there are two lines that have to be
commented out when you do; search for the word 'comment' in the pcom source.
There is no reason why you should want to compile pint.p with pcom. 

What If You Haven't Got a Pascal Compiler?

     Find a friend who does, and ask them to compile it for you. 
     Use the C Translation of the Pascal Compiler (gzipped tar file), and
     compile that with a C compiler (as above). 
     Get a copy of the pcode of the Pascal Compiler as compiled by itself,
     translate pint.p, the interpreter, by hand into something else, and
     interpret the compiler. 

Differences with the Book

The code here is slightly different from that in the book, but the line numbers
have been kept the same. The changes were to allow modern Pascal compilers to
compile the source (there were some laxities in the original code). 
