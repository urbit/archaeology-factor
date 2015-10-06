::
::::  /hoon/ping/hood/cat
  ::
/?  314
::
::::
  !:
|=  $:  [now=@da eny=@uvI bec=beak]
        [arg=?(~ [log=@ud ~] [log=@ud rec=? ~]) ~]
    ==
:-  %atom
?~  arg
  0
?>  (lte log.arg 32)
%+  add
  (bex (bex log.arg))
?~  +.arg
  0
?:(rec.arg 0 1)
