$ ->
	player = _V_ 'video_box'
	$('.tile').click (e) ->
		player.src window.location + $(this).data 'url'

	player.ready () ->
		aspectRatio = 9/16
		resize = () ->
			width = document.getElementById(player.id).parentElement.offsetWidth
			player.width(width).height(width * aspectRatio)	
			if document.body.offsetWidth < 1250
				$('.videos').removeClass 'span5'
			else
				$('.videos').addClass 'span5'
		resize()
		$(window).resize resize
  