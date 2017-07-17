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
  $(".false").each(function(){
    $(this).hide()
  })
}