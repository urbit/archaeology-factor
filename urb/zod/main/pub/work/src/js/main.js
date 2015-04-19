$(function() {
  console.log('ready')  
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