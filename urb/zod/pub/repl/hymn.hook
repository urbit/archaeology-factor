;html
  ;head
    ;title: REPL
    ;script@"//cdnjs.cloudflare.com/ajax/libs/codemirror/4.3.0/codemirror.js";
    ;script@"/{(trip &2:%)}/lib/syntax/hoon.js";
    ;link(rel "stylesheet", href "//cdnjs.cloudflare.com/ajax/libs/".
      "codemirror/4.3.0/codemirror.min.css");
    ;link/"/{(trip &2:%)}/lib/syntax/codemirror.css"(rel "stylesheet");
    ;script@"//cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js";
  ==
  ;body
    ;div.all
      ;textarea#ini: (add 2 2)
    ==
    ;style:'''
           .CodeMirror {height: 3rem} /* halp */
           .error {background: #ebb}
           '''
    ;script:'''
            window.util = window.util || {}
            window.util.urle = function(s){
              // neither escape nor encodeURIComponent get '*'
              var hex = "0123456789ABCDEF"
              return [].map.call(s,function(c){ switch(true) {
                case /[a-z0-9._~-]/.test(c): return c  // Safe
                case /[ -~]/.test(c):                  // Printable
                  var n = c.charCodeAt(0)
                  return "%"+hex[n/16 |0]+hex[n%16]
                default: return encodeURIComponent(c)  // Control, UTF8
            }}).join('')};
            var send = function(str,cb){
              $.getJSON("repl.json",
                  // "now="+Date.now()+
                  "eval="+window.util.urle(str),
                cb)
            }
            //var receive = function(elem, 
            $.extend(CodeMirror.defaults,
              {lineNumbers:true,autofocus:true,extraKeys:{Enter: "send"}}
            )
            CodeMirror.commands.send = function(cm){
              var val = cm.getValue()
              if(val === "") return;
              send(val,function(res){
                var pre = $('<pre>').insertAfter(cm.display.wrapper)
                switch(Object.keys(res).join(" ")){
                        case "good":
                    pre[0].innerText = res.good
                  break; case "bad":
                    pre.addClass('error')
                    pre[0].innerText = res.bad
                    var latest = $('.CodeMirror').last()[0].CodeMirror
                    if(latest && latest.hasFocus() && latest.getValue() === ""){
                      latest.replaceRange(val,{line:0,ch:0})
                    }
                  break;    default: 
                    throw new Error("Unknown result "+Object.keys(res))
                }
              })
              CodeMirror.fromTextArea(
                $('<textarea>').appendTo($('.all'))[0],
                {autofocus:true}
              )
            }
            CodeMirror.fromTextArea($('#ini')[0]).execCommand("send")
            '''
  ==
==
