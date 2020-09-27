/* code for task 3 */
$(document).ready(function () {
  $.get('http://localhost:5001/api/v1/status/', function (data) {
    if (data.status === 'OK') {
      $('div#api_status').addClass('available');
    }
  }).fail(function () {
    $('div#api_status').removeClass('available');
  });
});
