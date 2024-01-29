function openEditPopup(experienceNumber) {
    const editPopup = document.getElementById('edit--popup');
    const expIdField = document.getElementById('exp_id');
    const jobRoleField = document.getElementById('job-role');
    const companyField = document.getElementById('company');
    const timingField = document.getElementById('timing');
    const expField = document.getElementById('total-experience');
    const aboutField = document.getElementById('about');

    // Populate form fields with data for the given experienceNumber
    expIdField.value = experienceNumber;
    jobRoleField.value = document.getElementById(`job_role_${experienceNumber}`).innerText;
    companyField.value = document.getElementById(`company_name_${experienceNumber}`).innerText;
    timingField.value = document.getElementById(`interval_${experienceNumber}`).innerText;
    expField.value = document.getElementById(`timing_${experienceNumber}`).innerText;
    aboutField.value = document.getElementById(`about_${experienceNumber}`).innerText;
    // Populate other form fields similarly

    // Set form action dynamically
    const editForm = document.getElementById('edit-form');
    editForm.action = `edit_experience.jsp?id=${experienceNumber}`;

    // Display the popup
    editPopup.style.display = "block";
}

// Function to close the edit popup
function closeEditPopup() {
    const editPopup = document.getElementById('edit--popup');
    // Reset form fields if necessary
    document.getElementById('edit-form').reset();
    // Hide the popup
    editPopup.style.display = "none";
}

// Assuming you have edit buttons with class name 'edit-button'
const editButtons = document.querySelectorAll('.edit-button');
editButtons.forEach(function (button) {
    button.addEventListener('click', function () {
        // Extract experienceNumber from button ID
        const experienceNumber = button.id.split('_')[1];
        openEditPopup(experienceNumber);
    });
});
