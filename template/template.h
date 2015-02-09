: "set uuid
: let myuuid=system('uuidgen')
: let myuuid=substitute(myuuid, '-', '', 'g')
: let myuuid=substitute(myuuid, '\n', '', 'g')
: %s/<+MYID+>/\=myuuid/g 
:
: "move cursor
:  if search('<+CURSOR+>')
:    execute 'normal! "_da>'
:  endif
:  finish
#ifndef H_<+MYID+>
#define H_<+MYID+>

<+CURSOR+>

#endif
