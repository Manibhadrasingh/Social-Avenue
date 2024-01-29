document.addEventListener("DOMContentLoaded", function () {
    const skill_button = document.getElementById("add_skill_button");
    const skill_Popup = document.getElementById("add_skills");
    const skill_Form = document.getElementById("update_skills");

    // Show edit experience popup when the edit button is clicked
    skill_button.addEventListener("click", function () {
        event.preventDefault();

    });


});
const close_skill_button = document.getElementById("close_skills");

close_skill_button.addEventListener("click", function () {
    const add_skill_popup = document.getElementById("add_skills");

    add_skill_popup.style.display = "none";
});
function openSkillModel() {
    const add_skill_popup = document.getElementById("add_skills");
    const add_skill_button = document.getElementById("add_skill_button");

    const buttonRect = add_skill_button.getBoundingClientRect();
    add_skill_popup.style.left = "0px";
    add_skill_popup.style.top = "0px";
    add_skill_popup.style.display = "block";


}
    