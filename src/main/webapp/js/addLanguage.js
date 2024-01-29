document.addEventListener("DOMContentLoaded", function () {
    const lng_button = document.getElementById("add_lng_button");
    const lng_Popup = document.getElementById("add_language");
    const lng_Form = document.getElementById("update_language");

    // Show edit experience popup when the edit button is clicked
    lng_button.addEventListener("click", function () {
        event.preventDefault();
    });
});
const close_lng_button = document.getElementById("close_language");

close_lng_button.addEventListener("click", function () {
    const add_lng_popup = document.getElementById("add_language");

    add_lng_popup.style.display = "none";
});
function addLanguage() {
    const add_lng_popup = document.getElementById("add_language");
    const add_lng_button = document.getElementById("add_lng_button");

    const buttonRect = add_lng_button.getBoundingClientRect();
    add_lng_popup.style.left = "0px";
    add_lng_popup.style.top = "0px";
    add_lng_popup.style.display = "block";
}
    