function scroll_bottom() {
    let el = document.getElementsByClassName('messagesContainer')[0],
        height = el.scrollHeight;
    el.scrollTo(0, height);
}

$(document).on('turbolinks:load', function () {
    $('.ui.dropdown').dropdown();
    $(".close.icon").click(function () {
        $(this).parent().remove();
    });
    scroll_bottom();
});