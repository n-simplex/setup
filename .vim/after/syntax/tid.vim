syntax include @tidWikiNestedTex syntax/tex.vim
syntax region tidWikiEq
      \ start="\$\$" skip="\\\\\|\\\$" end="\$\$"
      \ contains=@tidWikiNestedTex keepend
