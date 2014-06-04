$(document).ready(function(){
	$('.btn-like').on('click', function(event){
		event.preventDefault();
		$.post(this.href);
	});

	// The block above is all we need to update the like count (it reloads webpage, no websocket yet)

	var connection = new WebSocketRails('localhost:3000/websocket');
	// The line above helps us to handle events with our class likes. We are triggering the event using js
	channel = connection.subscribe('likes');
	channel.bind('new', function(post) {
		var postElem = $('.post[data-id=' + post.id + '] .btn-like')
		postElem.text('❤ ' + post.new_like_count) ;
		console.log('a new like registered');
	});
})
