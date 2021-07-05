import consumer from "./consumer"

function scroll_bottom() {
    let el = document.getElementsByClassName('messagesContainer')[0],
        height = el.scrollHeight;
    el.scrollTo(0, height);
}


consumer.subscriptions.create("ChatroomChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        $('#messageContainer').append(data.mod_message);
        scroll_bottom();
        $('input[name="message[body]"]').val('')

    }
});
