function showComment(id) {
    const commentInput = document.getElementById('comment-input_' + id);
    // Toggle the visibility of the comment input field
    commentInput.style.display = commentInput.style.display === 'none' ? 'block' : 'none';

    // Focus on the input field when shown
    if (commentInput.style.display === 'block') {
        commentInput.focus();
    }
}
  