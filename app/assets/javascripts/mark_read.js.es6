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
  $(`.link[data-link-id=${link.id}]`).removeClass("mark-as-read")
  $(`.link[data-link-id=${link.id}]`).addClass("mark-unread")
  $(`.link[data-link-id=${link.id}]`).addClass("read")
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
