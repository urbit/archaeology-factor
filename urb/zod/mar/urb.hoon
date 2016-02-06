::
::::  /hoon/urb/mar
  ::
/?  314
!:
|_  own/manx
::
++  grow                                                ::  convert to
  |%
  ++  html  (crip (poxo own))                           ::  convert to %html
  ++  mime  [/text/html (taco html)]                    ::  convert to %mime
  --
++  grab  
  |%                                                    ::  convert from
  ++  noun  manx                                        ::  clam from %noun
<<<<<<< HEAD
  ++  hymn                                              ::  inject into %hymn
    |=  old/manx  old                                   ::  moved to %eyre
=======
  ::  conversion from hymn is handled specially by %eyre,
  ::  which injects dependency information
  ::  ++  hymn  !!                                      ::  inject into %hymn
>>>>>>> galenwp/factor
  --
--
