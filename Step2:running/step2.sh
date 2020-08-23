rm -f ~/X ~/O ~/I ~/A
ln -s /dev/null ~/X
ln -s ~/PA2/inventory ~/I
ln -s ~/PA2/objects ~/O
ln -s ~/PA2/obj ~/A
alias nogo='echo You cannot go that way.'
alias nokey='echo You do not have a key that can open this door.'
alias quit='echo You scored 0 out of a possible 90 points.;exit'
alias l='mv 1 9 >& ~/X; see'
alias drop='~/drop.sh'
alias see='head -n `ls [19] 2> ~/X` .d 2> ~/X; mv 9 1 &> ~/X; itemAlerts; echo -n'
alias itemAlerts='(ls -a ???* 2> ~/X | cat -n | tr "1-9" "e" | tr -s " " "-" | tr "\t" " " | tr "\n" " " | xargs fgrep ~/O/.alerts) 2> ~/X'


alias e='cd e &> ~/X && (see) || nogo'
alias w='cd w &> ~/X && (see) || nogo'
alias s='cd s &> ~/X && (see) || nogo'
alias nw='cd nw &> ~/X && (see) || nogo'
alias se='cd se &> ~/X && (see) || nogo'
alias sw='cd sw &> ~/X && (see) || nogo'
alias n='cd n &> ~/X && (see) || nokey'
alias ne='cd ne &> ~/X && (see) || nokey'

alias i='echo You currently have:;(cd ~/I; ls -a ???* 2> ~/X | cat -n | tr "1-9" "e" | tr -s " " "-" | tr "\t" " " | tr "\n" " " | xargs fgrep .messages) 2> ~/X'
alias x='(cat | xargs echo ~/O | tr " " "/" | xargs cat) <'
alias get='(echo > ~/A/`cat` && ls ~/A/*[kavlo][relom][dyplt] &> ~/X && mv `ls ~/A| xargs basename` ~/I && echo Taken. || echo "You cannot get that."; ls ~/A/bracelet &> ~/X && mv ~/A/bracelet emerald ~/I &> ~/X; ls ~/A/board &> ~/X && mv cpu ~/I &> ~/X && mv card ~/I &> ~/X && mv ~/A/board ~/I &> ~/X; ls ~/A/key &> ~/X && chmod +x ~/PA2/start/e/e/ne/ne/ne; rm -f ~/A/* &> ~/X) <'
alias dig='(ls ~/I/shovel &> ~/X || echo "You have nothing with which to dig.") && (ls ~/I/shovel &> ~/X && (ls .cpu &> ~/X && echo "I think you found something." && ( mv .cpu cpu && mv .board board && mv .card card) || echo "Digging here reveals nothing."))'

cd; PS1='>'; chmod +x ~/PA2/start/e/e/ne/ne/ne &> ~/X; chmod +x ~/PA2/start/e/e/ne/ne/ne/n &> ~/X; rm -r ~/PA2 &> ~/X; tar xvf ~/PA1.tar &> ~/X; cd ~/PA2/start &> ~/X; l 2> ~/X