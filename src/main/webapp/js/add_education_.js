document.addEventListener("DOMContentLoaded", function () {
    const editExperienceButton = document.getElementById("edit_experience_button");
    const editExperiencePopup = document.getElementById("edit_experience_popup");
    const updateExperienceForm = document.getElementById("update_experience_form");

    // Show edit experience popup when the edit button is clicked
    editExperienceButton.addEventListener("click", function () {
        event.preventDefault();

    });

   
});
    const closeExperienceButton = document.getElementById("close_experience_button");

 closeExperienceButton.addEventListener("click", function () {
         const addExperiencePopup = document.getElementById("edit_experience_popup");

        addExperiencePopup.style.display = "none";
    });
function openEducationModel() {
    const addExperiencePopup = document.getElementById("edit_experience_popup");
        const addExperienceButton = document.getElementById("edit_experience_button");

    const buttonRect = addExperienceButton.getBoundingClientRect();
    addExperiencePopup.style.left =   "0px";
    addExperiencePopup.style.top =  "0px";
    addExperiencePopup.style.display = "block";


}
    