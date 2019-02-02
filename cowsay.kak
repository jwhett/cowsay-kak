# Fail if cowsay is unavailable
evaluate-commands %sh{
    [ -z $(command -v cowsay) ] && echo "fail Missing dependency: cowsay"
}

define-command -override -params .. -docstring "cowsay [<arguments>]: wrap selection using the cowsay command line utility" cowsay %{
    evaluate-commands %sh{
        echo "execute-keys |cowsay<space>$(echo $@ | sed 's/ /\<space\>/g')<ret>"
    }
}
