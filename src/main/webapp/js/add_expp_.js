   document.addEventListener("DOMContentLoaded", function () {
      const editExperienceButton = document.getElementById("add-experience-button");
      const editExperiencePopup = document.getElementById("add-experience-popup");
      const closeExperienceButton = document.getElementById("close-experience-button");
      const updateExperienceForm = document.getElementById("add-experience-form");
  
      // Show edit experience popup when the edit button is clicked
      editExperienceButton.addEventListener("click", function () {
        editExperiencePopup.style.display = "block";
  
      });
  
      // Close the edit experience popup when the close button is clicked
      closeExperienceButton.addEventListener("click", function () {
        editExperiencePopup.style.display = "none";
      });
    });
    
    
