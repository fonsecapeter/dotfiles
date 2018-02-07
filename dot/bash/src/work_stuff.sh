# need this all the time
alias accounts='cat $(notes --find new_account)'

# can never remember where my docs are
alias docs='cd ~/Documents/code_base/'

# for printing through django stderr logs
alias pbprint="echo \"import sys
sys.stderr.write('\n\n' + repr(object_to_print) + '\n\n')\" | pbcopy"

# sample images
alias garfield='printf https://upload.wikimedia.org/wikipedia/en/3/34/Garfield_the_Cat.jpg'
alias keyboard-cat='printf https://i.scdn.co/image/98535eae915c09ce219703f817010a07aacb5794'

export API_HOST=api.23andme.local
