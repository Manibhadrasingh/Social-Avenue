//    function openEditPopup(experienceNumber) {
//const editPopup = document.getElementById(`edit-popup-${experienceNumber}`);
//document.getElementById("exp_id").value=experienceNumber;
//document.getElementById("company").value=document.getElementById(`company_name_${experienceNumber}`).innerText;;
//document.getElementById("job-role").value=document.getElementById(`job_role_${experienceNumber}`).innerText;;
//document.getElementById("total-experience").value=document.getElementById(`interval_${experienceNumber}`).innerText;;
//document.getElementById("timing").value=document.getElementById(`timing_${experienceNumber}`).innerText;;
//
//document.getElementById("about").value=document.getElementById(`about_${experienceNumber}`).innerText;;
//editPopup.style.display = "block";
//}
//
//function closeEditPopup(experienceNumber) {
//const editPopup = document.getElementById(`edit-popup-${experienceNumber}`);
//editPopup.style.display = "none";
//}
//
//function openEditPopup(experienceNumber) {
//    const editPopup = document.getElementById('edit-popup');
//    const editForm = document.getElementById('edit-form');
//
//    // Populate form fields with data for the given experienceNumber
//    document.getElementById("exp_id").value = experienceNumber;
//    document.getElementById("company").value = document.getElementById(`company_name_${experienceNumber}`).innerText;
//    document.getElementById("job-role").value = document.getElementById(`job_role_${experienceNumber}`).innerText;
//    document.getElementById("total-experience").value = document.getElementById(`interval_${experienceNumber}`).innerText;
//    document.getElementById("timing").value = document.getElementById(`timing_${experienceNumber}`).innerText;
//    document.getElementById("about").value = document.getElementById(`about_${experienceNumber}`).innerText;
//
//    // Set form action dynamically
//    editForm.action = `edit_experience.jsp?id=${experienceNumber}`;
//
//    // Display the popup
//    editPopup.style.display = "block";
//}
//
//function closeEditPopup() {
//    const editPopup = document.getElementById('edit-popup');
//    // Reset form fields if necessary
//    // editForm.reset();
//    // Hide the popup
//    editPopup.style.display = "none";
//}
// Function to open the edit popup
a