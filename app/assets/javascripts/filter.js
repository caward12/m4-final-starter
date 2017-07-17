function filterLinks(){
  var filter = $(".filter-links #q").val().toLowerCase()
  var links = $(".link ")
  debugger

  $(".links .link").hide()
  showMatchingLinks(filter, links)
}

function showMatchingLinks(filter, links){
  links.each(function(link){
    var title = $(this)[0]
  })
}

$(document).ready(function(){
  $(".filter-links #q").keyup(function(){
    filterLinks()
  })
})