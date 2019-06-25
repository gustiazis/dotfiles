# Ref : http://stackoverflow.com/questions/20356784/delete-u200b-zero-width-space-characters-using-sublime-text-3

import sublime_plugin

class ShowZeroWidthSpace(sublime_plugin.EventListener):
	def on_modified_async(self, view):
		spaces = []
		p = 0
		while True:
			s = view.find('\u200b', p + 1)
			if not s:
				break
			spaces.append(s)
			p = s.a

		if spaces:
			view.add_regions("zero-width", spaces, "invalid")
		else:
			view.erase_regions("zero-width")
