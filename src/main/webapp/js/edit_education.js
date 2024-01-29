// Function to open the edit popup
function openEditPopupp(experienceNumber) {
    const editPopup = document.getElementById('edit__popup');
    const eduIdField = document.getElementById('edu_id');
    const collegeNameField = document.getElementById('add_collg_name');
    const courseNameField = document.getElementById('add_course_name');
    const startingDateField = document.getElementById('add_starting_date');
    const endingDateField = document.getElementById('add_ending_date');

    // Populate form fields with data for the given experienceNumber
    eduIdField.value = experienceNumber;
    collegeNameField.value = document.getElementById(`add_college_${experienceNumber}`).innerText;
    courseNameField.value = document.getElementById(`add_course_${experienceNumber}`).innerText;
    startingDateField.value = document.getElementById(`add_joining_${experienceNumber}`).innerText;
    endingDateField.value = document.getElementById(`add_closing_${experienceNumber}`).innerText;

    // Set form action dynamically
    const editForm = document.getElementById('edit_form');
    editForm.action = `edit_education.jsp?id=${experienceNumber}`;

    // Display the popup
    editPopup.style.display = "block";
}

// Function to close the edit popup
function closeEditPopupp() {
    const editPopup = document.getElementById('edit__popup');
    // Reset form fields if necessary
    document.getElementById('edit_form').reset();
    // Hide the popup
    editPopup.style.display = "none";
}

// Assuming you have edit buttons with class name 'edit-button'
const editButton = document.querySelectorAll('.edit_button');
editButton.forEach(function (button) {
    button.addEventListener('click', function () {
        // Extract experienceNumber from button ID
        const experienceNumber = button.id.split('_')[1];
        openEditPopupp(experienceNumber);
    });
});
