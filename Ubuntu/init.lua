-- Markdown preview config
textadept.run.compile_commands.markdown = 'pandoc -f markdown -t html %p -o /tmp/%e.html'
textadept.run.run_commands.markdown = 'firefox /tmp/%e.html'

-- Remove trailing whitespaces
textadept.editing.strip_trailing_spaces = true

