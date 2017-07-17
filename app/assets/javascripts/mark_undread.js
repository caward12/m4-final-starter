$( document ).ready(function(){
  $("body").on("click", ".mark-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();
  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateReadLinkStatus)
    .fail(displayFailure);
}

function updateReadLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(`Read: ${link.read}`)
  $(`.link[data-link-id=${link.id}] .read-links .mark-unread`).remove()
  $(`.link[data-link-id=${link.id}]`).find(".read-links").append('<div class="mark-as-read"><a href="/"> Mark as Read</a></div>')
  $(`.link[data-link-id=${link.id}]`).removeClass("read")
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}