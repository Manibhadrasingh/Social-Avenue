 function updatePostTime() {
            var postTimeElements = document.getElementsByClassName('post-time');
            
            for (var i = 0; i < postTimeElements.length; i++) {
                var postTime = postTimeElements[i].getAttribute('data-post-time');
                var parsedTime = new Date(postTime);
                var formattedTime = PostUtil.calculateTimeAgo(parsedTime);
                postTimeElements[i].textContent = formattedTime;
            }
        }

        // Update post times every 60 seconds
        setInterval(updatePostTime, 60000);

        // Initial update
        updatePostTime();