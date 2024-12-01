import './../public/font/MapleMono/load.css'
global css body c:warm2 bg:warm8 ff:Arial inset:0 d:vcc

tag Logo

	css
		s: 100%
	count = 0

	css svg
		s: 100px

		#firstPath
			fill: green

		#middlePath
			stroke: yellow

		#lastPath
			fill: red


	css .title
		pl: 24px
		ff: 'MapleMono'
		fs: 64px
		fw: 900
		c: #DDB771

	css .stack
		pl: 12px
		ff: 'MapleMono'
		fs: 64px
		fw: 900
		c: #B47AEA
		font-variant: small-caps;

	css .wrapper
			cursor: pointer
			pos:relative
			s: 96px
			$baseTransform: translate(-50%, -50%) rotate(-45deg) skew(15deg, 15deg)
			# transform: scale(1.2)
			# bg: #18181b

			.firstLayer
				tween: transform .16s cubic-in-out
				$size: 48px
				$skew: 30deg
				transform: $baseTransform translate(18px, -18px)
				s: $size
				bg: #4de643
				l: 50%
				t: 50%
				pos: absolute;
				rd: 4px
				box-sizing: border-box
				zi: 200

				.inner
					$skew: 30deg
					s: 32px
					bg: #262626
					b: 8px
					l: 8px
					pos: absolute;
					# rd: 4px

			.middleLayer
				$size: 48px
				$skew: 30deg
				transform: $baseTransform
				s: $size
				bg: #4fc3f7
				l: 50%
				t: 50%
				pos: absolute;
				rd: 4px
				box-sizing: border-box
				zi: 100

				.inner
					$skew: 30deg
					s: 48px
					bg: #262626
					b: 8px
					l: 8px
					pos: absolute;
					# rd: 4px

			.lastLayer
				tween: transform .16s cubic-in-out
				$size: 48px
				$skew: 30deg
				transform: $baseTransform translate(-18px, 18px)
				s: $size
				bg: #ff00ff
				l: 50%
				t: 50%
				pos: absolute;
				rd: 4px
				box-sizing: border-box

				.inner
					$skew: 30deg
					s: 48px
					bg: #262626
					b: 8px
					l: 8px
					pos: absolute;
					# rd: 4px

			@hover

				.firstLayer
					transform: $baseTransform translate(22px, -22px)
				.lastLayer
					transform: $baseTransform translate(-22px, 22px)
	css
		.projects
			pos: absolute
			d: hcc

			l: 50%
			t: 75%
			transform: translate(-50%, -50%)
			a
				d: block
				p: 12px
				ff: 'MapleMono'
				lh: 24px
				fs: 16px
				fw: 900
				rd: 8px
				td: none
				c: #D7CDCC
				bg: #1D1E2C
				tween: border-width .16s cubic-in-out, padding .16s cubic-in-out

				@hover
					p: 11px
					bd: 1px solid #42BFDD
	<self>
		<div>
			css pos: absolute d:hcc us: none t: 50% l: 50% transform: translate(-50%, -50%)
			<.wrapper route-to='/dashboard/'>
				<.firstLayer>
					<.inner>
				<.middleLayer>
					<.inner>
				<.lastLayer>
					<.inner>
			<.title> "JEET"
			<.stack> "StacK"

