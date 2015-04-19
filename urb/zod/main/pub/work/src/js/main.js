$(function() {
  console.log('ready')  
  window.urb.subscribe({
    appl:"work",
    path:"/r"
  },function(err,res) {
    console.log('sub')
    console.log(err)
    console.log(res)
  })
  $('body').on('click',function() {
    window.urb.send({
      appl:"work",
      path:"/",
      mark:"work-command",
      data:{
        'create':{
          'sort':1,
          'task':{
            'task':1,
            'title':'go and!'
          }
        }
      }
    },function(err,res) {
      console.log('send')
      console.log(arguments)
    })
  })
})