$(document).ready(function(){
  bindShowReadButtonWithFilterLinks()
})

function bindShowReadButtonWithFilterLinks(){
  $('.filter .show-read').on("click", function(event){
    event.preventDefault()
    filterReadLinks()
  })
}

function filterReadLinks(){
  $(".true").each(function(){
    $(this).show()
  })
  $(".false").each(function(){
    $(this).hide()
  })
}