<<<<<<< HEAD:urb/zod/mar/write-paste.hoon
::   
::::  /hoon+core+save+mar
=======
::
::::  /hoon/paste/write/mar
>>>>>>> galenwp/factor:urb/zod/mar/write/paste.hoon
  ::
!:
|_  {typ/?($hoon $md $txt) txt/@t}
++  grab
  |%
  ++  noun  {?($hoon $md $txt) @t}
  ++  json  
    (corl need =>(jo (ot typ+(ci (soft ?($hoon $md $txt)) so) txt+so ~)))
  --
--
