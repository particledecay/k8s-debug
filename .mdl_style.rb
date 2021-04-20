all
# using html tags for the first header instead of markdown
exclude_rule 'MD002'
# lines don't have to be so short
rule 'MD013', :line_length => 200
# we use html for GitHub's markdown
exclude_rule 'MD033'
exclude_rule 'MD041'
