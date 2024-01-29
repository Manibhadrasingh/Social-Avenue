document.addEventListener("DOMContentLoaded", function () {
    const editButton = document.getElementById("edit-button");
    const editPopup = document.getElementById("edit-popup");
    const closeButton = document.getElementById("close-button");
    const updateForm = document.getElementById("update-form");

    editButton.addEventListener("click", function () {
        editPopup.style.display = "block";

        // Pre-fill form fields with existing profile information
        document.getElementById("new-first-name").value = profileFields.name.innerText;
        document.getElementById("new-last-name").value = profileFields.lastName.innerText;
        document.getElementById("new-cover-photo").value = profileFields.education.innerText;
        document.getElementById("new-photo").value = profileFields.education.innerText;
        document.getElementById("new-headline").value = profileFields.headline.innerText;
        document.getElementById("new-position").value = profileFields.position.innerText;
        document.getElementById("new-location").value = profileFields.location.innerText;
        document.getElementById("new-city").value = profileFields.city.innerText;
    });

    closeButton.addEventListener("click", function () {
        editPopup.style.display = "none";
    });


});