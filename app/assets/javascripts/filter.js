function filterLinks(){
  var filter = $(".filter-links #q").val().toLowerCase()
  var links = $(".link ")

  links.hide()

  links.each(function(index, link){
    var title = link.children[1].innerText.split(":")[1].toLowerCase()
    var url = link.children[2].innerText.split("URL:")[1].toLowerCase()

    if(title.includes(filter) || url.includes(filter)){
      $(this).show()
    }
  })
}


$(document).ready(function(){
  $(".filter-links #q").keyup(function(){
    filterLinks()
  })
})