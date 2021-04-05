$(function () { // credits to jeva for this part :)
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.type === "afkUI") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://B3-Afk/exitNUI', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('https://B3-Afk/exitNUI', JSON.stringify({}));
        return
    })
    $("#submit").click(function () {
        let inputText = $("#input").val()
        if (inputText.length >= 50) {
            $.post("https://B3-Afk/error", JSON.stringify({
                error: "Input less than 50 characters."
            }))
            return
        } else if (!inputText) {
            $.post("https://B3-Afk/error", JSON.stringify({
                error: "Fill out every field!"
            }))
            return
        }
        $.post('https://B3-Afk/sendplayerisAFK', JSON.stringify({
            text: inputText,
        }));
        return;
    })
})
