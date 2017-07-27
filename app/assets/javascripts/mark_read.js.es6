$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(`Read: ${link.read}`)
  $(`.link[data-link-id=${link.id}] .read-links .mark-as-read`).remove()
  $(`.link[data-link-id=${link.id}]`).find(".read-links").append('<div class="mark-unread"><a href="/"> Mark as Unread</a></div>')
  $(`.link[data-link-id=${link.id}]`).removeClass("false")
  $(`.link[data-link-id=${link.id}]`).addClass("true")
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
