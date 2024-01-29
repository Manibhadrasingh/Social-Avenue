const openPostBtn = document.getElementById('openPostBtn');
const postOverlay = document.getElementById('postOverlay');
const closePostBtn = document.getElementById('closePostBtn');
const postForm = document.getElementById('postForm');

openPostBtn.addEventListener('click', () => {
postOverlay.style.display = 'block';
});

closePostBtn.addEventListener('click', () => {
postOverlay.style.display = 'none';
});

//postForm.addEventListener('submit', (e) => {
//e.preventDefault();
//
//postOverlay.style.display = 'none';
//});