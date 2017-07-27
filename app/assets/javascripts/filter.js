function filterLinks(){
  var filter = $(".filter-links").val().toLowerCase()
  var links = $(".link ")
  links.hide()

  links.each(function(index, link){
    var title = link.children[2].innerText.split(":")[1].toLowerCase()
    var url = link.children[3].innerText.split("URL:")[1]
    if(title.includes(filter) || url.includes(filter)){
      $(this).show()
    }
  })
}


$(document).ready(function(){
  $(".filter-links").keyup(function(){

    filterLinks()
  })
})