$ ->

	toL = "eng"
	fromL = "eng"

	$('.lang-from').on 'change', () ->
		fromL = this.value
		return

	$('.lang-to').on 'change', () ->
		toL = this.value
		return

	addTranslator = () ->
		$('#translation-form').on 'click', '.submit-btn', (e) ->
			e.preventDefault()

			extractedText = $('#translation-form').serializeArray()

			info = 
				{
					text: extractedText[0].value
					from: fromL
					to: toL
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
	addTranslator()

	# Quiz Section

	$('.question-drop').on 'change', () ->
		fromL = this.value
		console.log(fromL)

	$('.start-quiz').on 'click', () ->
		$('.question-lang').empty()



	return



