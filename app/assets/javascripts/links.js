function postLink() {
  var linkData = {
      link: {
          url: $("#link_url").val(),
          title: $("#link_title").val()
       }
   }

 $.ajax({
        url: "/links",
        method: "POST",
        data: linkData
        })
        .done(function(newLinkMarkup) {
            $(".links").prepend(newLinkMarkup);
            $("#link_url").val(""),
            $("#link_title").val("")
        });
}
  function bindSubmitListenerAndPostLink() {
   $(".new-link .add-new-link").on("click", function(event) {
       event.preventDefault();
       postLink();
   });
  }

  $(document).ready(function(){
    bindSubmitListenerAndPostLink()
  })

