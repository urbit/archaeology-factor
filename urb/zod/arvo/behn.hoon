!:  ::  %behn, agent execution
!?  163
::::
|=  pit=vase
=>  =~
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    rest of arvo
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  hood                                                ::  assembly plan
  $:  zus=@ud                                           ::  zuse kelvin
      sur=(list hoot)                                   ::  structures
      lib=(list hoof)                                   ::  libraries
      fan=(list horn)                                   ::  resources
      src=(list hoop)                                   ::  program
  ==                                                    ::
++  hoof  (pair term (unit (pair case ship)))           ::  resource reference
++  hoot  (pair bean hoof)                              ::  structure gate/core
++  hoop                                                ::  source in hood
  $%  [%& p=twig]                                       ::  direct twig
      [%| p=beam]                                       ::  resource location   
  ==                                                    ::
++  horn                                                ::  resource tree
  $%  [%ape p=twig]                                     ::  /~  twig by hand
      [%arg p=twig]                                     ::  /$  argument
      [%day p=horn]                                     ::  /|  list by @dr
      [%dub p=term q=horn]                              ::  /=  apply face
      [%fan p=(list horn)]                              ::  /.  list
      [%for p=path q=horn]                              ::  /,  descend
      [%hel p=@ud q=horn]                               ::  /%  propagate heel
      [%hub p=horn]                                     ::  /@  list by @ud
      [%man p=(map span horn)]                          ::  /*  hetero map
      [%nap p=horn]                                     ::  /_  homo map
      [%now p=horn]                                     ::  /&  list by @da
      [%saw p=twig q=horn]                              ::  /;  operate on
      [%see p=beam q=horn]                              ::  /:  relative to
      [%sic p=tile q=horn]                              ::  /^  cast
      [%toy p=mark]                                     ::  /mark/  static
  ==                                                    ::
++  silk                                                ::  construction layer
  $&  [p=silk q=silk]                                   ::  cons
  $%  [%bake p=mark q=beam r=path]                      ::  local synthesis
      [%boil p=mark q=beam r=path]                      ::  general synthesis
      [%call p=silk q=silk]                             ::  slam
      [%cast p=mark q=silk]                             ::  translate
      [%done p=(set beam) q=cage]                       ::  literal
      [%dude p=tank q=silk]                             ::  error wrap
      [%dune p=(set beam) q=(unit cage)]                ::  unit literal
      [%mute p=silk q=(list (pair wing silk))]          ::  mutant
      [%plan p=beam q=spur r=hood]                      ::  structured build
      [%reef ~]                                         ::  kernel reef
      [%ride p=twig q=silk]                             ::  silk thru twig
      [%vale p=mark q=ship r=*]                         ::  validate [our his]
  ==                                                    ::
++  volt  ?(%low %high)                                 ::  voltage
++  torc  $|(?(%iron %gold) [%lead p=ship])             ::  security control
++  roon                                                ::  reverse ames msg
  $%  [%d p=mark q=*]                                   ::  diff (diff)
      [%x ~]                                            ::
  ==                                                    ::
++  rook                                                ::  forward ames msg
  $%  [%m p=mark q=*]                                   ::  message
      [%s p=path]                                       ::  subscribe
      [%u ~]                                            ::  cancel/unsubscribe
  ==                                                    ::
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    local arvo
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  club                                                ::  agent action
  $%  [%peer p=path]                                    ::  subscribe
      [%poke p=cage]                                    ::  apply
      [%pull ~]                                         ::  unsubscribe
      [%pump p=(unit tang)]                             ::  pump yes/no
  ==                                                    ::
++  culm                                                ::  config action
  $%  [%load p=scup]                                    ::  load/reload
  ::  [%kick ~]                                         ::  restart everything
  ::  [%stop ~]                                         ::  toggle suspend
  ::  [%wipe ~]                                         ::  destroy all state
  ==                                                    ::
++  cuss  (pair dude club)                              ::  internal kiss
++  cuft                                                ::  internal gift
  $%  [%coup p=(unit tang)]                             ::  poke result
      [%diff p=cage]                                    ::  subscription output
      [%quit ~]                                         ::  close subscription
      [%reap p=(unit tang)]                             ::  peer result
  ==                                                    ::
++  cote                                                ::  ++ap note
  $%  [%meta p=@tas q=vase]                             ::  
      [%send p=ship q=cuss]                             ::  
  ==                                                    ::
++  cove  (pair duct (mold cote cuft))                  ::  internal move 
++  dude  term                                          ::  local identity
++  scup  (pair ship desk)                              ::  autoupdate
++  suss  (trel dude ,@tas ,@da)                        ::  config report
++  tang  (list tank)                                   ::  error abstraction
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    %behn cards
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  kiss-ames                                           ::
  $%  [%wont p=sock q=path r=*]                         ::
  ==                                                    ::
++  kiss-behn                                           ::  incoming request
  $%  [%conf p=ship q=dude r=culm]                      ::  configure app
      [%init p=ship]                                    ::  set owner
      [%deal p=sock q=cuss]                             ::  full transmission
      [%rote p=sack q=path r=*]                         ::  remote request
      [%roth p=sack q=path r=*]                         ::  remote response
  ==                                                    ::
++  kiss-ford                                           ::
  $%  [%exec p=@p q=(unit silk)]                        ::  make / kill
      [%wasp p=@p q=@uvH]                               ::  depends query
  ==                                                    ::
++  gift-ames                                           ::
  $%  [%woot p=ship q=(unit ares)]                      ::  e2e reaction message
  ==                                                    ::
++  gift-behn                                           ::  outgoing result
  $%  [%onto p=(each suss tang)]                        ::  about agent
      [%unto p=cuft]                                    ::  within agent
  ==                                                    ::
++  gift-ford                                           ::  out result <-$
  $%  [%made p=@uvH q=(each cage tang)]                 ::  computed result
      [%news ~]                                         ::  fresh depends       
  ==                                                    ::
++  sign-behn                                           ::  incoming result
  $%  [%a gift-ames]
      [%b gift-behn]                                    ::
      [%f gift-ford]                                    ::
  ==                                                    ::
++  note-behn                                           ::  outgoing request
  $?  [@tas %meta p=vase]                               ::
  $%  [%a kiss-ames]                                    ::
      [%b kiss-behn]                                    ::
      [%f kiss-ford]                                    ::
  ==  ==                                                ::
++  move  ,[p=duct q=(mold note-behn gift-behn)]        ::  typed move
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    %behn state
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  axle                                                ::  all state
  $:  %0                                                ::  state version
      pol=(map ship mast)                               ::  apps by ship
  ==                                                    ::
++  gest                                                ::  subscriber data
  $:  sup=(map bone (pair ship path))                   ::  subscribers
      pus=(jug path bone)                               ::  srebircsbus
      qel=(map bone ,@ud)                               ::  queue meter
  ==                                                    ::
++  mast                                                ::  ship state
  $:  sys=duct                                          ::  system duct
      sap=(map ship scad)                               ::  foreign contacts
      bum=(map dude seat)                               ::  running agents
      wub=(map dude sofa)                               ::  waiting queue
  ==                                                    ::
++  ffuc                                                ::  new cuff
    $:  p=(unit (set ship))                             ::  disclosing to
        q=ship                                          ::  attributed to
    ==                                                  ::
++  prey  (pair volt ffuc)                              ::  privilege
++  scad                                                ::  foreign connection
  $:  p=@ud                                             ::  index
      q=(map duct ,@ud)                                 ::  by duct
      r=(map ,@ud duct)                                 ::  by index
  ==                                                    ::
++  scar                                                ::  opaque input
  $:  p=@ud                                             ::  bone sequence
      q=(map duct bone)                                 ::  by duct
      r=(map bone duct)                                 ::  by bone
  ==                                                    ::
++  seat                                                ::  agent state
  $:  mom=duct                                          ::  control duct 
      liv=?                                             ::  unstopped
      toc=torc                                          ::  privilege
      tyc=stic                                          ::  statistics
      ged=gest                                          ::  subscribers
      hav=vase                                          ::  running state
      pup=scup                                          ::  update control
      zam=scar                                          ::  opaque ducts
  ==                                                    ::
++  sofa                                                ::  queue for blocked
  $:  kys=(qeu (trel duct prey club))                   ::  queued kisses
  ==                                                    ::
++  stic                                                ::  statistics
  $:  act=@ud                                           ::  change number
      eny=@uvI                                          ::  entropy
      lat=@da                                           ::  time
  ==                                                    ::
--                                                      ::
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::  vane header
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
.  ==
=|  all=axle                                            ::  all vane state
|=  $:  now=@da                                         ::  urban time
        eny=@uvI                                        ::  entropy
        ska=sled                                        ::  activate
    ==                                                  ::  opaque core
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::  state machine
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  mo
  |_  $:  $:  our=@p 
              hen=duct
              moz=(list move)
          ==
          mast
      ==
  ++  mo-abed                                           ::  initialize
    |=  [our=@p hen=duct]
    ^+  +>
    %_    +>
      our  our
      hen  hen
      +<+  (~(got by pol.all) our)
    ==
  ::
  ++  mo-abet                                           ::  resolve to 
    ^-  [(list move) _+>+]
    :_  +>+(pol.all (~(put by pol.all) our +<+))
    %-  flop
    %+  turn  moz
    |=  a=move
    ?.  ?=(%pass -.q.a)  a
    [p.a %pass [(scot %p our) p.q.a] q.q.a]
  ::
  ++  mo-conf                                           ::  configure
    |=  [dap=dude lum=culm]
    (mo-boot dap ?:((~(has by bum) dap) %old %new) p.lum)
  ::
  ++  mo-pass                                           ::  standard pass
    |=  [pax=path noh=note-behn]
    %_(+> moz :_(moz [hen %pass pax noh]))
  ::
  ++  mo-give
    |=  git=gift-behn
    %_(+> moz :_(moz [hen %give git]))
  ::
  ++  mo-okay                                           ::  valid agent core
    |=  vax=vase
    ^-  ?
    (~(nest ut -:!>(*hide)) %| p:(slot 12 vax))
  ::
  ++  mo-boom                                           ::  complete new boot
    |=  [dap=dude pup=scup dep=@uvH cux=(each cage tang)]
    ^+  +>
    ?-    -.cux
        %|  (mo-give %onto %| p.cux)
        %&
      ?.  (mo-okay q.p.cux)
        (mo-give %onto %| [%leaf "{<dap>}: bogus core"]~)
      =.  +>  (mo-bold dap dep)
      =.  +>  (mo-born dap pup q.p.cux)
      =+  old=+>.$
      =+  wag=(ap-prop:(ap-abed:ap dap [%high [~ our]]) ~)
      ?^  -.wag
        =.  +>.$  old
        (mo-give %onto %| u.-.wag)
      =.  +>.$  ap-abet:+.wag
      (mo-give:(mo-claw dap) %onto %& dap %boot now)
    ==
  ::
  ++  mo-born                                           ::  new seat
    |=  [dap=dude pup=scup hav=vase]
    =+  sat=*seat
    %_    +>.$
        bum
      %+  ~(put by bum)  dap
      %_  sat
        mom  hen
        pup  pup
        hav  hav
        p.zam  1
        q.zam  [[~ 0] ~ ~]
        r.zam  [[0 ~] ~ ~]
      ==
    ==
  ::
  ++  mo-boon                                           ::  complete old boot
    |=  [dap=dude pup=scup dep=@uvH cux=(each cage tang)]
    ^+  +>
    ~&  [%mo-boon dap pup]
    ?.  (~(has by bum) dap)  
      ~&  [%behn-old-boon dap]
      +>
    =.  +>  (mo-bold dap dep)
    ?-  -.cux
      %|  (mo-give %onto %| p.cux)
      %&  ap-abet:(ap-peep:(ap-abed:ap dap [%high [~ our]]) q.p.cux)
    ==
  ::
  ++  mo-bold                                           ::  wait for dep
    |=  [dap=dude dep=@uvH]
    ^+  +>
    %+  mo-pass  [%sys %dep dap ~] 
    [%f %wasp our dep]
  ::
  ++  mo-boot                                           ::  create ship
    |=  [dap=dude how=?(%new %old) pup=scup]
    ^+  +>
    ::  ~&  [%mo-boot dap how pup]
    %+  mo-pass  [%sys how dap (scot %p p.pup) q.pup ~]
    ^-  note-behn
    [%f %exec our `[%boil %core [[p.pup q.pup [%da now]] [dap %ape ~]] ~]]
  ::
  ++  mo-away                                           ::  foreign request
    |=  [him=ship caz=cuss]                             ::  
    ^+  +>
    ::  ~&  [%mo-away him caz]
    ?<  ?=(%pump -.q.caz)
    =^  num  +>.$  (mo-bale him)
    =+  ^=  roc  ^-  rook
        ?-  -.q.caz
          %poke  [%m p.p.q.caz q.q.p.q.caz]
          %pull  [%u ~]
          %peer  [%s p.q.caz]
        ==
    %+  mo-pass  
      [%sys %way -.q.caz ~]
    `note-behn`[%a %wont [our him] [%q %be p.caz ~] [num roc]]
  ::
  ++  mo-baal                                           ::  error convert a
    |=  art=(unit ares)
    ^-  ares
    ?~(art ~ ?~(u.art `[%blank ~] u.art))
  ::
  ++  mo-baba                                           ::  error convert b
    |=  ars=ares
    ^-  (unit tang)
    ?~  ars  ~
    `[[%leaf (trip p.u.ars)] q.u.ars]
  ::
  ++  mo-awed                                           ::  foreign response
    |=  [him=ship why=?(%peer %poke %pull) art=(unit ares)]
    ^+  +>
    =+  tug=(mo-baba (mo-baal art))
    ?-  why
      %peer  (mo-give %unto %reap tug)
      %poke  (mo-give %unto %coup tug)
      %pull  ~&  [%pull-fail tug]
             +>.$
    ==
  ::
  ++  mo-bale                                           ::  assign outbone
    |=  him=ship 
    ^-  [@ud _+>]
    =+  sad=(fall (~(get by sap) him) `scad`[1 ~ ~])
    =+  nom=(~(get by q.sad) hen)
    ?^  nom  [u.nom +>.$]
    :-  p.sad
    %_    +>.$
        sap
      %+  ~(put by sap)  him
      %_  sad
        p  +(p.sad)
        q  (~(put by q.sad) hen p.sad)
        r  (~(put by r.sad) p.sad hen)
      ==
    ==
  ::
  ++  mo-ball                                           ::  find outbone
    |=  [him=ship num=@ud]
    ^-  duct
    (~(got by r:(~(got by sap) him)) num)
  ::
  ++  mo-come                                           ::  handle locally
    |=  [her=ship caz=cuss]
    ^+  +>
    =+  pry=`prey`[%high [~ her]]
    (mo-club p.caz pry q.caz)
  ::
  ++  mo-coup                                           ::  back from mo-away
    |=  [dap=dude him=ship cup=ares]
    %^  mo-give  %unto  %coup
    ?~  cup  ~
    [~ `tang`[[%leaf (trip p.u.cup)] q.u.cup]]
  ::
  ++  mo-cyst                                           ::  take in /sys
    |=  [pax=path sih=sign-behn]
    ^+  +>
    ?+    -.pax  !!
        %dep                                            ::  update
      ?>  ?=([%f %news *] sih)
      ?>  ?=([@ ~] t.pax)
      =+  sot=(~(get by bum) i.t.pax)
      ?~  sot
        ~&  [%mo-cyst-none i.t.pax]
        +>.$
      (mo-boot i.t.pax %old pup.u.sot)
    ::
        %new
      ?>  ?=([%f %made *] sih)
      ?>  ?=([@ @ @ ~] t.pax)
      (mo-boom i.t.pax [(slav %p i.t.t.pax) i.t.t.t.pax] +>.sih)
    ::
        %old                                            ::  reload old
      ?>  ?=([%f %made *] sih)
      ?>  ?=([@ @ @ ~] t.pax)
      (mo-boon i.t.pax [(slav %p i.t.t.pax) i.t.t.t.pax] +>.sih)
    ::
        %rep                                            ::  reverse request
      ?>  ?=([@ @ @ ~] t.pax)
      ?>  ?=([%f %made *] sih)
      =+  :*  him=(slav %p i.t.pax)
              dap=i.t.t.pax
              num=(slav %ud i.t.t.t.pax)
          ==
      ?-  -.q.+>.sih
        %|  ~&  [%diff-crash p.q.+>.sih]                ::  crash is correct
            !!
        %&  =.  +>.$  (mo-give %unto %coup ~)           ::  XX ames auto-ack
            (mo-give(hen (mo-ball him num)) %unto %diff `cage`p.q.+>.sih)
      ==
    ::
        %req                                            ::  inbound request
      ?>  ?=([@ @ @ ~] t.pax)
      =+  :*  him=(slav %p i.t.pax)
              dap=i.t.t.pax
              num=(slav %ud i.t.t.t.pax)
          ==
      ?:  ?=([%f %made *] sih)
        ?-  -.q.+>.sih
          %|  (mo-give %unto %coup `p.q.+>.sih)         ::  XX should crash
          %&  (mo-pass [%sys pax] %b %deal [him our] i.t.t.pax %poke p.q.+>.sih)
        ==
      ?:  ?=([%a %woot *] sih)
        ?~  q.+>.sih  +>.$
        ~&  [%behn-woot-lost pax +>.sih]
        +>.$
      ?>  ?=([%b %unto *] sih)
      =+  cuf=`cuft`+>.sih
      ?-    -.cuf
        %coup  (mo-give %unto %coup p.cuf)
        %diff  %+  mo-pass  [%sys pax]
               [%a %wont [our him] [%q %bh dap ~] [num %d p.p.cuf q.q.p.cuf]]
        %quit  %+  mo-pass  [%sys pax]
               [%a %wont [our him] [%q %bh dap ~] [num %x ~]]
        %reap  (mo-give %unto %reap p.cuf)
      ==
    ::
        %way                                            ::  outbound request
      ?>  ?=([%a %woot *] sih)
      ?>  ?=([@ ~] t.pax)
      %-  mo-awed
      :*  p.+>.sih
          (?(%peer %poke %pull) i.t.pax)
          +>+.sih
      ==
    ==
  ::
  ++  mo-cook                                           ::  take in /use
    |=  [pax=path hin=(hypo sign-behn)]
    ^+  +>
    ?.  ?=([@ @ ?(%inn %out) *] pax)
      ~&  [%mo-cook-bad-pax pax]
      !!
    =+  dap=`@tas`i.pax
    =+  pry=`prey`[%high [~ (slav %p i.t.pax)]]
    =+  pap=(ap-abed:ap dap pry) 
    =+  vax=(slot 3 `vase`hin)
    ?-  i.t.t.pax
      %inn  ap-abet:(ap-pour:pap t.t.t.pax (slot 3 `vase`hin))
      %out  ?.  ?=([%b %unto *] q.hin)
              ~&  [%mo-cook-weird q.hin]
              ~&  [%mo-cook-weird-path pax]
              +>.$
            ap-abet:(ap-pout:pap t.t.t.pax +>.q.hin)
    ==
  ::
  ++  mo-claw                                           ::  clear queue
    |=  dap=dude
    ^+  +>
    ?.  (~(has by bum) dap)  +>
    =+  suf=(~(get by wub) dap)
    =+  neh=hen
    ?~  suf  +>.$
    |-  ^+  +>.^$
    ?:  =(~ kys.u.suf)
      +>.^$(hen neh, wub (~(del by wub) dap))
    =^  lep  kys.u.suf  [p q]:~(get to kys.u.suf)
    ::  ~&  [%mo-claw-play dap r.lep]
    $(+>.^$ ap-abet:(ap-club:(ap-abed:ap(hen p.lep) dap q.lep) r.lep))
  ::
  ++  mo-club                                           ::  local action
    |=  [dap=dude pry=prey cub=club]
    ^+  +>
    ?:  |(!(~(has by bum) dap) (~(has by wub) dap))
      ::  ~&  [%mo-club-qeu dap cub]
      =+  syf=(fall (~(get by wub) dap) *sofa)
      +>.$(wub (~(put by wub) dap syf(kys (~(put to kys.syf) [hen pry cub]))))
    ap-abet:(ap-club:(ap-abed:ap dap pry) cub)
  ::
  ++  mo-gawk                                           ::  ames forward
    |=  [him=@p dap=dude num=@ud rok=rook]
    %+  mo-pass  
      [%sys %req (scot %p him) dap (scot %ud num) ~]
    ^-  note-behn
    ?-  -.rok
      %m  [%f %exec our ~ %vale p.rok our q.rok]        ::  XX use build beak
      %s  [%b %deal [him our] dap %peer p.rok]
      %u  [%b %deal [him our] dap %pull ~]
    ==
  ::
  ++  mo-gawd                                           ::  ames backward
    |=  [him=@p dap=dude num=@ud ron=roon]
    ?-    -.ron
        %d
      %+  mo-pass  
        [%sys %rep (scot %p him) dap (scot %ud num) ~]
      [%f %exec our ~ %vale p.ron our q.ron]
    ::
        %x  (mo-give %unto %quit ~)
    ==
  ::
  ++  ap                                                ::  agent engine
    |_  $:  $:  dap=dude
                pry=prey
                ost=bone
                zip=(list cove)
                dub=(list (each suss tang))
            ==
            seat
        ==
    ::
    ++  ap-abed                                         ::  initialize
      |=  [dap=dude pry=prey]
      ^+  +>
      =:  ^dap   dap
          ^pry   pry
          +>+<+  `seat`(~(got by bum) dap)
        ==
      =+  unt=(~(get by q.zam) hen)
      =:  act.tyc  +(act.tyc)
          eny.tyc  (shax (mix (add dap act.tyc) eny))
          lat.tyc  now
        ==
      ?^  unt
        +>.$(ost u.unt)
      %=  +>.$
        ost      p.zam
        p.zam    +(p.zam)
        q.zam    (~(put by q.zam) hen p.zam)
        r.zam    (~(put by r.zam) p.zam hen)
      ==
    ::
    ++  ap-abet                                         ::  resolve
      ^+  +>
      %_  +>  
        bum  (~(put by bum) dap +<+)
        moz  :(weld (turn zip ap-aver) (turn dub ap-avid) moz)
      ==
    ::
    ++  ap-aver                                         ::  cove to move
      |=  cov=cove
      ^-  move 
      :-  p.cov
      ?-    -.q.cov
          ?(%slip %sick)  !!
          %give  [%give %unto p.q.cov]
          %pass
        :+  %pass  `path`[%use dap p.q.cov]
        ?-  -.q.q.cov
          %send  `note-behn`[%b %deal [our p.q.q.cov] q.q.q.cov]
          %meta  `note-behn`[`@tas`p.q.q.cov %meta `vase`q.q.q.cov]
        ==
      ==
    ::
    ++  ap-avid                                         ::  onto results
      |=([a=(each suss tang)] [hen %give %onto a])
    ::
    ++  ap-club                                         ::  apply effect
      |=  cub=club
      ^+  +>
      ?-  -.cub
        %poke   (ap-poke +.cub)
        %peer   (ap-peer +.cub)
        %pull   ap-pull
        %pump   ?^(p.cub ~&([%club-fall p.cub] +>.$) ap-fall)
      ==
    ::
    ++  ap-find                                         ::  general arm
      |=  [cog=term pax=path]
      =+  dep=0
      |-  ^-  (unit (pair ,@ud term))
      =+  ^=  spu
          ?~  pax  ~ 
          $(pax t.pax, dep +(dep), cog (ap-hype cog i.pax))
      ?^  spu  spu
      ?.((ap-fond cog) ~ `[dep cog])
    ::
    ++  ap-fall                                         ::  drop from queue
      ^+  .
      =+  soy=(~(get by qel.ged) ost)
      ?~  soy  +  ::  ~&(%ap-fall-underflow +)
      ?:  =(0 u.soy)  
        +(qel.ged (~(del by qel.ged) ost))
      +(qel.ged (~(put by qel.ged) ost (dec u.soy)))
    ::
    ++  ap-fill                                         ::  add to queue
      ^-  [? _.]
      =+  suy=(fall (~(get by qel.ged) ost) 0)
      ?:  =(10 suy)  [%| +]
      [%& +(qel.ged (~(put by qel.ged) ost +(suy)))]
    ::
    ++  ap-pull                                         ::  pull subscription
      =+  wim=(~(get by sup.ged) ost)
      ?~  wim  ~&(%ap-pull-none +)
      %_  +
        sup.ged  (~(del by sup.ged) ost)
        pus.ged  (~(del ju pus.ged) q.u.wim ost)
        qel.ged  (~(del by qel.ged) ost)
      ==
    ::
    ++  ap-fond                                         ::  check for arm
      |=  cog=term
      ^-  ?
      (slob cog p.hav)
    ::
    ++  ap-hype                                         ::  hyphenate
      |=([a=term b=term] `term`(cat 3 a (cat 3 '-' b)))
    ::
    ++  ap-give                                         ::  return result
      |=  cit=cuft
      ^+  +>
      +>(zip :_(zip [(~(got by r.zam) ost) %give cit]))
    ::
    ++  ap-pass                                         ::  request action
      |=  [pax=path coh=cote]
      ^+  +>
      +>(zip :_(zip [(~(got by r.zam) ost) %pass pax coh]))
    ::
    ++  ap-hide                                         ::  set up hide
      %_    .
          +12.q.hav
        ^-  hide
        :*  :*  our
                dap
                ~
            ==
            ~
            sup.ged
            pus.ged
            tyc
        ==
      ==
    ++  ap-sled  (mole (slod ska))                      ::  namespace view
    ++  ap-cull
      |=  [cog=term one=vase two=vase]
      ^-  [(unit tang) _+>]
      !!
    ++  ap-call                                         ::  call into agent
      |=  [cog=term arg=vase]
      ^-  [(unit tang) _+>]
      =.  +>  ap-hide
      =+  puz=(mule |.((~(mint ut p.hav) [%noun [%cnzy cog]])))
      ?:  ?=(%| -.puz)  [`p.puz +>.$]
      =+  wiz=(mule |.((slit p.p.puz p.arg)))
      ?:  ?=(%| -.wiz)  
        ~&  %ap-call-mismatch 
        ~>  %slog.[0 ~(duck ut p.arg)]
        ~>  %slog.[0 ~(duck ut (~(peek ut p.p.puz) %free 6))]
        [`(ap-suck "call: {<cog>}: type mismatch") +>.$]
      =-  ?-  -.zep
            %|  [`p.zep +>.$]
            %&  (ap-sake p.wiz +.zep)
          ==
      ^=  zep  ^-  (each noun tang)
      =+  ton=(mock [q.hav q.p.puz] ap-sled)
      ?-  -.ton
        %0  =+  ton=(mong [p.ton q.arg] ap-sled)
            ?-  -.ton
              %0  [%& p.ton]
              %1  [%| (turn p.ton |=(a=* (smyt (path a))))]
              %2  [%| p.ton]
              ==
        %1  [%| (turn p.ton |=(a=* (smyt (path a))))]
        %2  [%| p.ton]
      ==
    ::
    ++  ap-peep                                         ::  reinstall
      |=  vax=vase
      ^+  +>
      (ap-prep(hav vax) `hav)
    ::
    ++  ap-prop                                         ::  install
      |=  vux=(unit vase)
      ^-  [(unit tang) _+>]
      ?.  (ap-fond %prep) 
        ?~  vux
          `+>.$
        ?.  (~(nest ut p:(slot 13 hav)) %| p:(slot 13 u.vux))
          :_(+>.$ `(ap-suck "prep mismatch"))
        `+>.$(+13.q.hav +13.q.u.vux)
      =^  tur  +>.$
          %+  ap-call  %prep
          ;:  slop
            !>(`@ud`ost)
            !>(`@p`q.q.pry)
            ?~  vux  !>(~)
            (slop !>(~) (slot 13 u.vux))
          ==
      ?~(tur `+>.$ :_(+>.$ `u.tur))
    ::
    ++  ap-prep                                         ::  install
      |=  vux=(unit vase)
      ^+  +>
      =^  gac  +>.$  (ap-prop vux)
      %=    +>.$
          dub
        :_(dub ?~(gac [%& dap ?~(vux %boot %bump) now] [%| u.gac]))
      ==
    ::
    ++  ap-suck                                         ::  standard tang
      |=  msg=tape
      ^-  tang
      [%leaf (weld "behn: {<dap>}: " msg)]~
    ::
    ++  ap-safe                                         ::  process move list
      |=  vax=vase
      ^-  (each (list cove) tang)
      ?~  q.vax  [%& ~]
      ?@  q.vax  [%| (ap-suck "move: malformed list")]
      =+  sud=(ap-move (slot 2 vax))
      ?:  ?=(%| -.sud)  sud
      =+  res=$(vax (slot 3 vax))
      ?:  ?=(%| -.res)  res
      [%& p.sud p.res]
    ::
    ++  ap-move                                         ::  process each move
      |=  vax=vase
      ^-  (each cove tang)
      ?@  q.vax    [%| (ap-suck "move: invalid move (atom)")]
      ?^  -.q.vax  [%| (ap-suck "move: invalid move (bone)")]
      ?@  +.q.vax  [%| (ap-suck "move: invalid move (card)")]
      =+  hun=(~(get by r.zam) -.q.vax)
      ?~  hun  [%| (ap-suck "move: invalid card (bone)")]
      =+  cav=(spec (slot 3 (spec (slot 3 vax))))
      ?+  +<.q.vax  [%| (ap-suck "move: invalid card ({(trip (,@ +<.q.vax))})")]
        %diff  (ap-move-diff u.hun cav)
        %send  (ap-move-send u.hun cav)
        %pass  (ap-move-pass u.hun cav)
        %quit  (ap-move-quit u.hun cav)
      ==
    ::
    ++  ap-move-quit                                    ::  give quit move
      |=  [neh=duct vax=vase]
      ^-  (each cove tang)
      ?^  q.vax  [%| (ap-suck "move: improper quit")]
      [%& `cove`[neh %give `cuft`[%quit ~]]]
    ::
    ++  ap-term                                         ::  atomic vase
      |=  [a=@tas b=@]  
      ^-  vase
      [[%cube b %atom a] a]
    ::
    ++  ap-move-diff                                    ::  give diff move
      |=  [neh=duct vax=vase]
      ^-  (each cove tang)
      ?.  &(?=(^ q.vax) ?=(@ -.q.vax) ((sane %tas) -.q.vax))
        [%| (ap-suck "move: improper diff")]
      [%& neh %give %diff `cage`[-.q.vax (slot 3 vax)]]
    ::
    ++  ap-move-send                                    ::  pass gall action
      |=  [neh=duct vax=vase]
      ^-  (each cove tang)
      ?.  ?&  ?=([p=* [q=@ [r=@ [s=@ t=*]]]] q.vax)
              (gte 1 (met 7 q.q.vax))
              ((sane %tas) r.q.vax)
          ==
        [%| (ap-suck "move: malformed send")]
      =+  pux=((soft path) p.q.vax)
      ?.  &(?=(^ pux) (levy u.pux (sane %ta)))
        [%| (ap-suck "move: malformed path")]
      ?:  ?=(%poke s.q.vax)
        =+  gav=(spec (slot 15 vax))
        ?>  =(%poke -.q.gav)
        ?.  ?&  ?=([p=@ q=*] t.q.vax)
                ((sane %tas) p.t.q.vax)
            ==
          [%| (ap-suck "move: malformed poke")]
        :^  %&  neh  %pass
        :-  [(scot %p q.q.vax) %out r.q.vax u.pux]
        ^-  cote
        ::  ~&  [%ap-move-send `path`[(scot %p q.q.vax) %out r.q.vax u.pux]]
        [%send q.q.vax r.q.vax %poke p.t.q.vax (slot 3 (spec (slot 3 gav)))]
      =+  cob=((soft club) [s t]:q.vax)
      ?~  cob
        [%| (ap-suck "move: malformed club")]
      :^  %&  neh  %pass
      :-  [(scot %p q.q.vax) %out r.q.vax u.pux]
      ::  ~&  [%ap-move-send `path`[(scot %p q.q.vax) %out r.q.vax u.pux]]
      [%send q.q.vax r.q.vax u.cob]
    ::
    ++  ap-vain                                         ::  card to vane
      |=  sep=@tas
      ^-  (unit ,@tas)
      ?+  sep  ~&  [%ap-vain sep]
               ~
        %cash  `%a
        %conf  `%b
        %deal  `%b
        %exec  `%f
        %flog  `%d
        %mess  `%g
        %nuke  `%g
        %show  `%g
        %took  `%g
        %plug  `%c
        %want  `%a
      ==
    ::
    ++  ap-move-pass                                    ::  pass general move 
      |=  [neh=duct vax=vase]
      ^-  (each cove tang)
      ?.  &(?=([* @ *] q.vax) ((sane %tas) +<.q.vax))
        [%| (ap-suck "move: malformed pass")]
      =+  pux=((soft path) -.q.vax)
      ?.  &(?=(^ pux) (levy u.pux (sane %ta)))
        [%| (ap-suck "move: malformed path")]
      =+  huj=(ap-vain +<.q.vax)
      ?~  huj
        [%| (ap-suck "move: unknown note {(trip +<.q.vax)}")]
      ::  ~&  [%ap-move-pass u.huj u.pux]
      :^  %&  neh  %pass 
      :-  [(scot %p q.q.pry) %inn u.pux]
      [%meta u.huj (spec (slot 3 vax))]
    ::
    ++  ap-save                                         ::  verify core
      |=  vax=vase
      ^-  (each vase tang)
      ?.  (~(nest ut p.hav) %| p.vax)
        [%| (ap-suck "invalid core")]
      [%& vax]
    ::
    ++  ap-sake                                         ::  handle result
      |=  vax=vase
      ^-  [(unit tang) _+>]
      ?:  ?=(@ q.vax)
        [`(ap-suck "sake: invalid product (atom)") +>.$]
      =+  muz=(ap-safe (slot 2 vax))
      ?:  ?=(%| -.muz)  [`p.muz +>.$]
      =+  sav=(ap-save (slot 3 vax))
      ?:  ?=(%| -.sav)  [`p.sav +>.$]
      :-  ~
      %_  +>.$
        zip  (weld (flop p.muz) zip)
        hav  p.sav 
      ==
    ::
    ++  ap-poke                                         ::  apply %poke
      |=  cag=cage
      ^+  +>
      =+  cug=(ap-find %poke p.cag ~)
      ?~  cug
        (ap-give %coup `(ap-suck "no poke arm"))
      ::  ~&  [%ap-poke dap p.cag cug]
      =^  tur  +>.$
          %+  ap-call  q.u.cug
          ;:  slop
            !>(`@ud`ost)
            !>(`@p`q.q.pry)
            ?.  =(0 p.u.cug)  q.cag
            (slop (ap-term %tas p.cag) q.cag)
          ==
      (ap-give %coup tur)
    ::
    ++  ap-peon                                         ::  add subscriber
      |=  pax=path
      %_  +>.$
        sup.ged  (~(put by sup.ged) ost [q.q.pry pax])
        pus.ged  (~(put ju pus.ged) pax ost)
      ==
    ::
    ++  ap-peer                                         ::  apply %peer
      |=  pax=path
      ^+  +>
      =+  cug=(ap-find %peer pax)
      ?~  cug
        (ap-peon pax)
      =^  cam  +>.$ 
          %+  ap-call  q.u.cug
          !>([`@ud`ost `@p`q.q.pry `path`(slag p.u.cug pax)])
      ?^  cam
        (ap-give %reap cam)
      (ap-give:(ap-peon pax) %reap ~)
    ::
    ++  ap-pour-fail                                    ::  pour error
      |=  [wut=@tas why=tang]
      ^+  +>
      ~&  [%ap-pour-fail wut why]
      +>   
    ::
    ++  ap-pour                                         ::  generic take
      |=  [pax=path vax=vase]
      ^+  +>
      ?.  &(?=([@ *] q.vax) ((sane %tas) -.q.vax))
        (ap-pour-fail %pour (ap-suck "pour: malformed card"))
      =+  cug=(ap-find [-.q.vax pax])
      ?~  cug
        (ap-pour-fail -.q.vax (ap-suck "pour: no {(trip -.q.vax)}: {<pax>}"))
      =^  cam  +>.$
          %+  ap-call  q.u.cug
          ;:  slop
            !>(`@ud`ost)
            !>(`@p`q.q.pry)
            (slop !>(`path`(slag p.u.cug pax)) (slot 3 vax))
          ==
      ?^  cam  (ap-pour-fail -.q.vax u.cam)
      +>.$
    ::
    ++  ap-pout                                         ::  specific take
      |=  [pax=path cuf=cuft]
      ^+  +>
      ?-  -.cuf
        %coup  (ap-punk q.q.pry +.pax %coup !>([pax p.cuf]))
        %diff  (ap-diff q.q.pry +.pax p.cuf)
        %quit  (ap-punk q.q.pry +.pax %quit !>(pax))
        %reap  (ap-punk q.q.pry +.pax -.cuf !>([pax p.cuf]))
      ==
    ::
    ++  ap-punk                                         ::  non-diff gall take
      |=  [her=ship pax=path wut=term end=vase]
      ^+  +>
      =+  cug=(ap-find [wut pax])
      ?~  cug
        ~&  [%ap-punk-none wut]
        +>.$
      =^  cam  +>.$  
        (ap-call q.u.cug :(slop !>(`@ud`ost) !>(`@p`q.q.pry) end))
      ?^  cam  (ap-pour-fail q.u.cug u.cam)
      +>.$
    ::
    ++  ap-diff                                         ::  pour a diff
      |=  [her=ship pax=path cag=cage]
      =+  cug=(ap-find [%diff p.cag pax])
      ?~  cug
        (ap-pour-fail %diff (ap-suck "pour: no diff"))
      =^  cam  +>.$
          %+  ap-call  q.u.cug
          ;:  slop
            !>(`@ud`ost)
            !>(`@p`q.q.pry)
            ?:  =(0 p.u.cug)
              :(slop !>(`path`pax) !>(cag))
            :(slop !>(`path`(slag (dec p.u.cug) pax)) q.cag)
          ==
      ?^  cam  (ap-pour-fail q.u.cug u.cam)
      +>.$
    --
  --
++  call                                                ::  request
  |=  [hen=duct hic=(hypo (hobo kiss-behn))]
  ^-  [p=(list move) q=_..^$]
  =>  .(q.hic ?.(?=(%soft -.q.hic) q.hic ((hard kiss-behn) p.q.hic)))
  ?-    -.q.hic
      %conf
    ?.  (~(has by pol.all) p.q.hic)
      ~&  [%behn-not-ours p.q.hic]
      [~ ..^$]
    mo-abet:(mo-conf:(mo-abed:mo p.q.hic hen) q.q.hic r.q.hic)
  ::
      %deal
    =<  mo-abet
    ?.  (~(has by pol.all) q.p.q.hic)                   ::  either to us
      ?>  (~(has by pol.all) p.p.q.hic)                 ::  or from us
      (mo-away:(mo-abed:mo p.p.q.hic hen) q.p.q.hic q.q.hic)
    (mo-come:(mo-abed:mo q.p.q.hic hen) p.p.q.hic q.q.hic)
  ::
      %init 
    ~&  [%behn-init p.q.hic]
    [~ ..^$(pol.all (~(put by pol.all) p.q.hic [hen ~ ~ ~]))]
  ::
      %rote
    ::  ~&  [%behn-rote p.q.hic]
    ?.  (~(has by pol.all) p.p.q.hic)
      ~&  [%behn-not-ours p.q.hic]
      [~ ..^$]
    ?>  ?=([@ ~] q.q.hic)
    =+  dap=i.q.q.hic
    =+  our=p.p.q.hic
    =+  him=q.p.q.hic
    =+  mes=((hard ,[@ud rook]) r.q.hic)
    =<  mo-abet
    (mo-gawk:(mo-abed:mo our hen) him dap mes)
  ::
      %roth
    ::  ~&  [%behn-roth p.q.hic]
    ?.  (~(has by pol.all) p.p.q.hic)
      ~&  [%behn-not-ours p.q.hic]
      [~ ..^$]
    ?>  ?=([@ ~] q.q.hic)
    =+  dap=i.q.q.hic
    =+  our=p.p.q.hic
    =+  him=q.p.q.hic
    =+  mes=((hard ,[@ud roon]) r.q.hic)
    =<  mo-abet
    (mo-gawd:(mo-abed:mo our hen) him dap mes)
  ==
::
++  doze                                                ::  sleep until
  |=  [now=@da hen=duct]
  ^-  (unit ,@da)
  ~
::
++  load                                                ::  recreate vane
  |=  old=axle
  ^+  ..^$
  ..^$(all old)
::
++  scry
  |=  [fur=(unit (set monk)) ren=@tas who=ship syd=desk lot=coin tyl=path]
  ^-  (unit (unit (pair mark ,*)))
  [~ ~]
::
++  stay                                                ::  save w/o cache
  `axle`all
::
++  take                                                ::  response
  |=  [tea=wire hen=duct hin=(hypo sign-behn)]
  ^-  [p=(list move) q=_..^$]
  ~|  [%behn-take tea]
  ?>  ?=([@ ?(%sys %use) *] tea) 
  =+  our=(need (slaw %p i.tea))
  =+  mow=(mo-abed:mo our hen)
  ?:  ?=(%sys i.t.tea)
    mo-abet:(mo-cyst:mow t.t.tea q.hin)
  ?>  ?=(%use i.t.tea)
  mo-abet:(mo-cook:mow t.t.tea hin)
--
