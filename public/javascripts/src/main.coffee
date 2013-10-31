$ ->

	findLangFrom = () ->
		$('.lang-from').on 'change', () ->
		console.log("this value:", this.value)
		console.log("this", this)
		return this.value

	findLangTo = () ->
		$('.lang-to').on 'change', () ->
		console.log("this value:", this.value)
		console.log("this", this)
		return this.value

	$('#translation-form').on 'click', '.submit-btn',(e) ->
		e.preventDefault()
		console.log("clicked")
		info = 
			{
				text: $('#translation-form').serialize()
				from: 'eng', 
				to: 'fra'
			}
		$('#translation-form').each () ->
			this.reset();
			return
		console.log(info)
		$.post '/translate', info, (data) ->
			console.log(data.serverData)
			$('#translation-repo').text(data.serverData.translation)

		return
	return


