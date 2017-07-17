$(document).ready(function(){
  bindShowUnreadButtonWithFilterLinks()
})

function bindShowUnreadButtonWithFilterLinks(){
  $('.filter .show-unread').on("click", function(event){
    event.preventDefault()
    filterUnreadLinks()
  })
}

function filterUnreadLinks(){
  $(".true").each(function(){
    $(this).hide()
  })
}