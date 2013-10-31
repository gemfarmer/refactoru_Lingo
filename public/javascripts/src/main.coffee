$ ->
	$('#translation-form').on 'click', '.submit-btn',(e) ->
		e.preventDefault()
		console.log("clicked")
		info = $('#translation-form').serialize()
		$('#translation-form').each () ->
			this.reset();
			return
		console.log(info)
		$.post '/translate', info, (data) ->
			newData = data.console
			console.log(newData)
			return

		return
	return
