export tag Editor
	#caretMargin = 0
	lines\string[] = [
		"Changing \\Omega -> Ω"
		"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
		"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
		"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		"Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.",
		"Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit.",
		"Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.",
		"Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.",
		"Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi. Pellentesque facilisis.",
		"Curabitur vitae diam non enim vestibulum interdum. Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor.",
		"Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor."
	]

	carets\[number, number][] = []

	css
		s: 100%
		pos: relative
		p: 16px
		box-sizing: border-box
		ff: MapleMono
		of:auto

		.wrapper
			pos: absolute
			w: calc(100% - 32px)

		.editor
			ol: none

		.render
			miw: 100%
			pos: absolute
			t: 0
			l: 0
			display: grid;
			grid-template-columns: auto 1fr;
			grid-column-gap: 0px;
			grid-row-gap: 0px;
			lh: 20px
			fs: 14px

		.lineContent

			gcs: 2
			gce: 2

			# white-space: nowrap

		.lineIndex
			px: 8px
			pr: 16px
			ta: right
			gcs: 1
			gce: 1

		.carets
			pos: absolute
			inset: 0
			pe: none
			animation: 1s blink step-end infinite
			@keyframes blink
				from, to
					o: 0

				50%
					o: 1

			.caret
				pos: absolute
				l: $x
				t: $y
				w: 1px
				h: 18px
				bg: #16DB65


	def mount
		$render.addEventListener "click", do(event)
			const selection = document.getSelection!
			const range = selection.getRangeAt(0)
			const parentRect = $wrapper.getBoundingClientRect!
			const elementRect = range.getBoundingClientRect!
			const [x, y] = [elementRect.x - parentRect.x, elementRect.y - parentRect.y]
			if carets.length is 0
				carets.push [x, y]
			else
				carets[0] = [x, y]
			# console.log event, selection, x, y
			imba.commit!


	<self>
		<$wrapper.wrapper>
			<.editor >
			<$render.render>
				for line, i in lines
					<.lineIndex> i + 1
					<.lineContent> line
			<.carets>
				for caret, i in carets
					<.caret [$x: {caret[0]}px $y: {caret[1] + #caretMargin}px]>


