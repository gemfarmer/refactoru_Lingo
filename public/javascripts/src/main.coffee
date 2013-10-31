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
			if (extractedText[0].value == "")
				$('#translation-repo').text("Cannot translate when you are so withholding...")
				return
			else
				console.log(extractedText)
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
					data.serverData.message = "Please Enter a real word"
					if (data.serverData.translation)?
						$('#translation-repo').text(data.serverData.translation)
					else
						console.log(data.serverData)
						$('#translation-repo').text(data.serverData.message)
				return
			return
		return
	addTranslator()

	# Quiz Section

	$('.question-drop').on 'change', () ->
		fromL = this.value
		console.log(fromL)
		return

	$('.start-quiz').on 'click', (e) ->
		$('.question-lang').empty()

		addQuestion = '<form id="translation-form">'+
		'<input id="translation-text type="text" name="translate-text" placeholder="hello">'+
		'<br><button class="btn btn-primary.submit-btn" type="submit">Button</button>'+
		'</input></form>'
	 
		$('.question-lang').append(addQuestion)
		addTranslator()
		return



	return



