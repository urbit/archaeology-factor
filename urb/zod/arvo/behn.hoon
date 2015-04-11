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
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    local arvo
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  club                                                ::  agent action
  $%  [%kick ~]                                         ::  reboot
      [%kill ~]                                         ::  reboot and delete
      [%load p=?(%cold %warm) q=beak]                   ::  reload
      [%peer p=path]                                    ::  subscribe
      [%look p=path]                                    ::  peer then pull 
      [%poke p=cage]                                    ::  apply
      [%pull p=path]                                    ::  unsubscribe
      [%stop ~]                                         ::  toggle suspend
      [%took ~]                                         ::  acknowledge rush
      [%wipe ~]                                         ::  reinitialize
  ==                                                    ::
++  dude  term                                          ::  local identity
++  gent  (pair ship dude)                              ::  global identity
++  stab  ?(%fail %live %over %stop)                    ::  status report
++  tare  (list tank)                                   ::  error abstraction
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    %behn cards
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  kiss-behn                                           ::  incoming request
  $:  [%behn p=dude q=club]                             ::  request to agent
      [%load p=dude q=?(%cold %warm) r=beak]            ::  load / reload
      [%stop p=dude]                                    ::  toggle pause
      [%unto p=dude q=club]                             ::  agent action
  ==                                                    ::
++  gift-behn                                           ::  outgoing result
  $%  [%coup p=(unit tare)]                             ::  %poke success
      [%meta p=vase]                                    ::  meta-gift
      [%stat p=stab q=(unit tare)]                      ::  installer status
      [%quit p=~]                                       ::  subscription stop
      [%reap p=(unit tare)]                             ::  peer result
      [%rush p=cage]                                    ::  subscription update
  ==                                                    ::
++  sign-behn                                           ::  incoming result
  $%  [%f gift-ford]                                    ::
      [%e gift-eyre]                                    ::
      [%d gift-dill]                                    ::
      [%c gift-clay]                                    ::
      [%a gift-ames]                                    ::
  ==                                                    ::
++  note-behn                                           ::  outgoing request
  !!                                                    ::
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    %behn state
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  axle                                                ::  all state
  $:  %0                                                ::  state version
      ore=(unit ship)                                   ::  who we are
      pol=(map ship mast)                               ::  apps by ship
  ==                                                    ::
++  gest                                                ::  subscriber data
  $:  sup=(map bone (pair ship path))                   ::  subscribers
      pus=(jug path bone)                               ::  srebircsbus
      qel=(map bone ,@ud)                               ::  implicit rush queue
  ==                                                    ::
++  mast                                                ::  ship state
  $:  sys=duct                                          ::  system duct
      sap=(map ship scad)                               ::  foreign contacts
      bum=(map dude seat)                               ::  running agents
      wub=(map dude sofa)                               ::  waiting queue
  ==                                                    ::
++  ffuc                                                ::  new cuff
    $:  p=(unit (set monk))                             ::  can be read by
        q=monk                                          ::  caused or created by
    ==                                                  ::
++  prey  (pair volt ffuc)                              ::  privilege
++  scad                                                ::  opaque for foreign
  $:  p=@ud                                             ::  index
      q=(map duct ,@ud)                                 ::  by duct
      r=(map ,@ud duct)                                 ::  by index
  ==                                                    ::
++  scar                                                ::  opaque input
  $:  p=@ud                                             ::  bone sequence
      q=(map duct bone)                                 ::  by duct
      r=(map bone duct)                                 ::  by bone
  ==                                                    ::
++  scup                                                ::  autoupdate
  $:  law=?(%cold %warm)                                ::  frozen/evergreen
      for=(trel ship desk case)                         ::  currently loaded
      ped=(set (pair ship desk))                        ::  dependency
  ==                                                    ::
++  seat                                                ::  agent state
  $:  mom=(unit duct)                                   ::  control duct 
      liv=?                                             ::  unstopped
      toc=torc                                          ::  privilege
      tyc=stic                                          ::  statistics
      ged=gest                                          ::  subscribers
      hav=vase                                          ::  running state
      pup=scup                                          ::  update control
      zam=scar                                          ::  opaque ducts
  ==                                                    ::
++  sofa  (qeu (pair duct kiss))                        ::  waiting kisses
++  stic                                                ::  statistics
  $:  act=@ud                                           ::  change number
      eny=@uvI                                          ::  entropy
      lat=@da                                           ::  time
  ==                                                    ::
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    vane header
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
=|  all=axle                                            ::  all vane state
|=  $:  $:  now=@da                                     ::  urban time
            eny=@uvI                                    ::  entropy
        ::  our=@p                                      ::  identity
        ==                                              ::
        ska=sled                                        ::  activate
    ==                                                  ::  opaque core
=>  =~                                                  ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    state machine
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  mo
  |_  $:  $:  our=@p 
              hen=duct
              moz=(list move)
          ==
          mast
      ==
  ++  mo-abed                                           ::  initialize
    |=  hen=duct
    ^+  +>
    =:  our   (need ore.all)
        ^hen  hen
      ==
    =+  mib=(~(get by pol) our)
    ?^  mib 
      +>.$(+<+ u.mib)
    +>.$(+<+ [hen ~ ~ ~])
  ::
  ++  mo-abet                                           ::  resolve
    ^-  [(list move) _+>+]
    [(flop moz) +>+]
  ::
  ++  mo-club                                           ::  act
    |=  [dap=dude pry=prey cub=club]
    !!
  ::
  ++  ap
    |_  $:  $:  dap=dude
                pry=prey
                sec=(unit cuff)
                ost=bone
            ==
            seat
        ==
    ++  ap-abed                                         ::  initialize
      |=  [dap=dude vot=volt]
      ^+  +>
      =:  ^dap  dap
          ^vot  ?:(=(%gold toc) %low vot)
        ==
      =+  unt=(~(get by q.zam) hen)
      ?^  unt
        +>.$(ost p.u.unt, sec q.u.unt)
      %=  +>.$
        ost  p.zam
        p.zam  +(p.zam)
        q.zam  (~(put by q.zam) hen p.zam)
        r.zam  (~(put by r.zam) p.zam hen)
      ==
    ::
    ++  ap-abet                                         ::  resolve
      ^+  +>
      +>(bum (~(put by dap) num +<+))
    ::
    ++  ap-club                                         ::  apply effect
      |=  cub=club
      ?-  -.cub
        %kill   !!
        %poke   (ap-poke +.cub)
        %peer   (ap-peer +.cub)
      ==
    ::
    ++  ap-find                                         ::  check for arm
      |=  cog=@tas
      ^-  ?
      (slab cog p.hav)
    ::
    ++  ap-give                                         ::  return result
      |=  git=gift
      ^+  +>
      +>(moz :_(moz [%give (~(got by r.zam) ost) git]))
    ::
    ++  ap-pass                                         ::  request action
      |=  [pax=path noh=note]
      ^+  +>
      +>(moz :_(moz [%pass pax (~(got by r.zam) ost)]))
    ::
    ++  ap-call                                         ::  call into vase
      |=  [cog=term vax=vase]
      ^-  [(unit tare) _+>]
      =+  puz=(mule |.((~(mint ut p.vax) [%noun [%cnzy cog]])))
      =-  ?-  -.zep
            %|  [`+.zep +>.$]
            %&  (ap-sake +.zep)
          ==
      ^=  zep 
      ?-    -.puz
          %|  [%| +.puz]
          %&
        =+  ton=(mock [q.vax q.p.puz] |=(* ~))
        ?-  -.ton
          %0  [%& p.ton]
          %1  [%| (turn p.ton |=(a=* (smyt (path a))))]
          %2  [%| p.ton]
        ==
      ==
    ++  ap-rush                                         ::  return rush
      |=  [pax=path cag=cage]
      !! 
    ++  ap-suck                                         ::  standard tare
      |=  msg=tape
      ^-  tare
      [%leaf (weld "behn: {<dap>}:" msg)]~
    ::
    ++  ap-soot                                         ::  analyze note vase
      |=  vax=vase
      ^-  (each (pair path ,@tas) tare)
      ?.  &(?=([* @ *] q.vax) ((sane %tas) -.q.vax))
        [%| (ap-suck "same: malformed note"]
      =+  pux=((soft path) -.q.vax)
      ?.  &(?=(^ pux) (levy u.pux (sane %ta)))
        [%| (ap-suck "same: malformed path"]
      ?.  (levy u.pux (sane %ta))
      ?+  -.q.vax 
               [%| (ap-suck "same: unknown note {(trip -.q.vax)})]
        %exec  [%& u.pux %f]    ::  XX etc
      == 
    ::
    ++  ap-safe                                         ::  process move list
      |=  vax=vase
      ^-  (each (list move) tare)
      ?~  q.vax  [%& ~]
      =+  sud=(ap-same (slot 2 vax))
      ?:  ?=(%| -.sud)  sud
      =+  res=$(vax (slot 3 vax))
      ?:  ?=(%| -.res)  res
      [%& p.sud p.res]
    ::
    ++  ap-same                                         ::  process each move
      |=  vax=vase
      ^-  (each move tare)
      ?@  q.vax    [%| (ap-suck "same: invalid move (atom)")]
      ?^  -.q.vax  [%| (ap-suck "same: invalid move (bone)")]
      ?@  +.q.vax  [%| (ap-suck "same: invalid move (card)")]
      =+  cav=(slot 7 q.vax)
      =+  sto=-.q.vax
      ?:  =(0 sto)
        ?.  =(%pass +<.q.vax)
          [%| (ap-suck "same: invalid gift (bone 0)")]
        (ap-same-pass `duct`~ cav)
      =+  hun=(~(get by r.zam) sto)
      ?~  hun  [%| (ap-suck "same: invalid card (bone)")]
      ?+  +<.q.vax
        %rush  (ap-same-rush u.hun cav)
        %pass  (ap-same-pass u.hun cav)
        %quit  (ap-same-quit u.hun cav)
      ==
    ::
    ++  ap-same-quit                                    ::  quit move
      |=  [neh=duct vax=vase]
      ^-  (each move tare)
      ?^  q.vax  [%| (ap-suck "same: improper quit")]
      [%& neh %give %quit ~] 
    ::
    ++  ap-same-rush                                    ::  rush move
      |=  [neh=duct vax=vase]
      ^-  (each move tare)
      ?.  &(?=(^ q.vax) ?=(@ -.q.vax) ((sane %tas) -.q.vax))
        [%| (ap-suck "same: improper rush")]
      :^  %&  neh  %give
      :-  %meta
      :-  [%cell [%cube %rush %atom %tas] p.vax]
      [%rush q.vax]
    ::
    ++  ap-same-pass
      |=  [neh=duct vax=vase]
      ^-  (each move tare)
      =+  toh=(ap-soot vax)
      ?:  ?=(%| -.toh)  toh
      [%& neh %pass 
    ::
    ++  ap-save                                         ::  verify core
      |=  vax=vase
      ^-  (each vase tare)
      [%& vax]
    ::
    ++  ap-sake                                         ::  handle result
      |=  vax=vase
      ^-  [(unit tare) _+>]
      ?:  ?=(@ q.vax)
        [`(ap-suck "sake: invalid product (atom)") +>.$]
      =+  muz=(ap-safe (slot 2 vax))
      ?:  ?=(%| -.muz)  [`p.muz +>]
      =+  sav=(ap-save (slot 3 vax))
      ?:  ?=(%| -.sav)  [`p.sav +>]
      :-  ~
      %_  +>.$
        moz  (weld (flop p.muz) moz)
        hav  p.sav 
      ==
    ::
    ++  ap-poke                                         ::  apply message
      |=  cag=cage
      ^+  +>
      =+  spy=(cat 3 'poke-' p.cag)
      =+  [reh sto]=[!>(`@p`q.q.pry) !>(`@ud`ost)]
      =+  ^=  [cog vax]
          ?:  (ap-find spy)
            [spy :(slop reh sto q.cag)]
          [%poke :(slop reh sto !>(`@tas`p.cag) 
      =^  cam  +>.$  (ap-call cog vax)
      

            (ap-call spy :(slop !>(`@p`q.q.pry) !>(`@p`ost) q.cag))
          (ap-call spy :(slop 
    ::
    ++  ap-peer
      |=  pax=path
    --
  --
--
