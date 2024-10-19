function AddLike(PostId, UserId,curr) {
	/*console.log(PostId);
	console.log(UserId);
	console.log(curr)
*/
	const d = {
		PId: PostId,
		UId: UserId,
		operation: "Like"
	}

	$.ajax({
		url: "LikeServlet",
		data: d,

		success: function(data, textStatus, jqXHR) {
			console.log(data);
			if (data.trim() == "true") {
				let LikeCntSpan = ($(curr).find('.like-counter'))
				let LikeCnt=parseInt( LikeCntSpan.html());
				LikeCnt++;
				LikeCntSpan.html(LikeCnt);
			}

		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);

		},

	});
}

