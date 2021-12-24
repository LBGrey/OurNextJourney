

$(document).ready(function () {
//change selectboxes to selectize mode to be searchable
   $("select").select2();
});



function openWindow(select) {
    var value = select.options[select.selectedIndex].value;
    window.open(value, 'newwindow')
}