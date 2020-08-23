#!/bin/tcsh

rm -f ~/X ~/O ~/I ~/A
ln -s /dev/null ~/X
ln -s ~/PA2/inventory ~/I
ln -s ~/PA2/objects ~/O
ln -s ~/PA2/obj ~/A
alias itemAlerts 'ls -a ???* | cat -n | tr "1-9" "e" | tr -s " " "-" | tr "\t" " " | tr "\n" " " | xargs fgrep ~/O/.alerts'
alias dig '(ls ~/I/shovel >& ~/X || echo "You have nothing with which to dig.") && (ls ~/I/shovel >& ~/X && (ls .cpu >& ~/X && echo "I think you found something." && ( mv .cpu cpu && mv .board board && mv .card card) || echo "Digging here reveals nothing."))'

cd;
rm -r PA2 >& ~/X
tar xvf PA1.tar >& ~/X
cd ~/PA2/start
head -n `ls [19]` .d
mv 9 1 >& ~/X;
(itemAlerts) >& ~/X
if( $? == 0 ) then
    itemAlerts
endif

set nearBear = 0

while ( 1 )
    echo -n ">"
    set cmd = ($<)

    set flag = 0
    if( $#cmd == 0 ) then
        continue
    endif

    if ( $cmd[1] == e || $cmd[1] == s || $cmd[1] == w || $cmd[1] == se || $cmd[1] == sw || $cmd[1] == nw ) then
        set flag = 1
    else if( $cmd[1] == ne || $cmd[1] == n ) then
        set flag = 2
    else if( $cmd[1] == l ) then
        cat .d
        (itemAlerts) >& ~/X
        if( $? == 0 ) then
            itemAlerts
        endif
    else if( $cmd[1] == x ) then
        if ( $#cmd == 1 ) then
            echo "You must supply an object."
            continue
        endif
        if ( -e ~/O/$cmd[2] ) then
            if ( -e $cmd[2] ) then
                cat ~/O/$cmd[2]
            else if( -e ~/I/$cmd[2] ) then
                cat ~/O/$cmd[2]
            else
                echo "I don't see that here."
            endif
        else 
            echo "I don't know what that is."
        endif
    else if( $cmd[1] == i ) then
        if ( $#cmd == 1 ) then
            echo "You currently have:"
            ls ~/I | cat -n | tr -d "\t1-8" | cat -n | tr "\t1-8" "e-" | xargs fgrep ~/I/.messages
        endif
    else if( $cmd[1] == 'get' ||  $cmd[1] == 'take' ) then
        if ( $#cmd == 1 ) then
            echo "You must supply an object."
            continue
        endif
        if ( $cmd[2] == 'all' ) then
            if( -e emerald || -e bracelet ) then
                mv bracelet emerald ~/I >& ~/X
                echo "A bracelet: Taken."
            endif
            if( -e cpu || -e board || -e card ) then
                mv cpu card board ~/I >& ~/X
                echo "A computer board: Taken."
            endif
            if( -e key ) then
                mv key ~/I >& ~/X 
                chmod 700 ~/PA2/start/e/e/ne/ne/ne
                echo "A brass key: Taken."
            endif
            if( -e food ) then
                echo "Some food: Taken."
            endif
        else if ( ! -e ~/O/$cmd[2] ) then
            echo "I don't know what that is."
        else
            if ( ! -e $cmd[2] ) then
                echo "I do not see that here."
            else
                ls ~/O/*[ckavlo][prelom][udyplt] | grep $cmd[2] >& ~/X
                if ( $? > 0 ) then
                    echo "You cannot take that."
                    continue
                endif
                mv $cmd[2] ~/I >& ~/X
                if( $cmd[2] == 'bracelet' || $cmd[2] == 'emerald' ) then
                    mv bracelet emerald ~/I >& ~/X
                    echo "Taken."
                else if( $cmd[2] == 'board' || $cmd[2] == 'card' || $cmd[2] == 'cpu' ) then
                    mv cpu card board ~/I >& ~/X
                    echo "Taken."
                else if( $cmd[2] == 'key' ) then
                    chmod 700 ~/PA2/start/e/e/ne/ne/ne
                    echo "Taken."
                else
                    echo "Taken."
                endif
            endif
        endif
    else if( $cmd[1] == 'drop' || $cmd[1] == 'throw' ) then
        if ( $#cmd == 1 ) then
            echo "You must supply an object."
            continue
        endif
        if ( ! -e ~/O/$cmd[2] ) then
            echo "I don't know what that is."
        else
            if ( ! -e ~/I/$cmd[2] ) then
                echo "You don't have that."
            else
                mv ~/I/$cmd[2] . >& ~/X
                echo "Done."
                if( $cmd[2] == 'emerald' || $cmd[2] == 'bracelet' ) then
                    mv ~/I/[be][mr]* . >& ~/X
                else if ( $cmd[2] == 'cpu' || $cmd[2] == 'card' || $cmd[2] == 'board' ) then
                    mv ~/I/[bc][apo]*[ud] . >& ~/X
                else if ( $cmd[2] == 'key' ) then
                    chmod 400 ~/PA2/start/e/e/ne/ne/ne >& ~/X
                    chmod 400 ~/PA2/start/e/e/ne/ne/ne/n >& ~/X
                else if ( $cmd[2] == 'food' ) then
                    ls .[k]* >& ~/X
                    if ( $? == 0 ) then
                        echo "The bear takes the food and runs away with it. He left something behind."
                        rm [fb][oe][oa][dr] >& ~/X
                        mv .key key >& ~/X;
                    endif
                endif
            endif
        endif
    else if( $cmd[1] == 'quit' ) then
        echo
        echo "You have scored 0 out of a possible 90 points."
        break
    else if( $cmd[1] == 'climb' ) then
        if ( $#cmd == 1 ) then
            echo "You must supply an object."
            continue
        endif
        if( ! -e ~/O/$cmd[2] ) then
            echo "I don't know what that object is."
        else if ( ! -e $cmd[2] ) then
            echo "I don't see that here."
        else if ( $cmd[2] == 'tree' || $cmd[2] == 'trees' || $cmd[2] == 'palm' ) then
            echo "You manage to get about two feet up the tree and fall back down.  You notice that the tree is very unsteady."
        else 
            echo "You can't climb that."
        endif
    else if( $cmd[1] == 'shake' ) then
        if ( $#cmd == 1 ) then
            echo "You must supply an object."
            continue
        endif
        if( ! -e ~/O/$cmd[2] ) then
            echo "I don't know what that is."
        else
            if ( (! -e  $cmd[2] ) && (! -e ~/I/$cmd[2] ) ) then
                echo "I don't see that here."
            else if ( $cmd[2] == 'palm' ) then
                echo "You begin to shake a tree, and notice a coconut begin to fall from the air."
                echo "As you try to get your hand up to block it, you feel the impact as it lands on your head."
                echo "You are dead."
                echo "You have scored 0 out of a possible 90 points."
                break
            else if ( $cmd[2] == 'bear' ) then
                echo "As you go up to the bear, it removes your head and places it on the ground."
                echo "You are dead."
                echo "You have scored 0 out of a possible 90 points."
                break
            else
                if( -e ~/I/$cmd[2] ) then
                    if( $cmd[2] == "cpu" || $cmd[2] == "board" || $cmd[2] == "card" ) then
                        set sth = "a computer board"
                    else if( $cmd[2] == "food" ) then
                        set sth = "some food"
                    else if( $cmd[2] == "emerald" || $cmd[2] == "bracelet" ) then
                        set sth = "a bracelet"
                    else if( $cmd[2] == "key" ) then
                        set sth = "a brass key"
                    endif

                    if( $cmd[2] == "shovel" ||  $cmd[2] == "lamp" ) then
                        echo "Shaking a $cmd[2] seems to have no effect."
                    else
                        echo "Shaking $sth seems to have no effect."
                    endif
                else
                    echo "You don't have that."
                endif
            endif
        endif
    else if( $cmd[1] == 'eat' ) then
        if ( $#cmd == 1 ) then
            echo "You must supply an object."
        else
            if( ! -e ~/O/$cmd[2] ) then
                echo "I don't know what that is."
            else if( ! -e ~/I/$cmd[2] ) then
                echo "You don't have that."
            else if ( $cmd[2] == 'food' ) then
                echo "That tasted horrible."
            else
                if( $cmd[2] == 'key' ) then
                    echo "You forcefully shove a brass key down your throat, and start choking."
                else if( $cmd[2] == 'computer' || $cmd[2] == 'board' ) then
                    echo "You forcefully shove a computer board down your throat, and start choking."
                else if( $cmd[2] == 'key' ) then
                    echo "You forcefully shove a brass key down your throat, and start choking."
                else
                    echo "You forcefully shove a $cmd[2] down your throat, and start choking."
                endif
                echo "\nYou are dead."
                echo "You have scored 0 out of a possible 90 points."
                break
            endif
        endif
    else if( $cmd[1] == 'put' ) then
        if ( $#cmd == 1 ) then
            echo "You must supply an object."
            continue
        else if ( $#cmd == 2 || $#cmd == 3 ) then
            if ( -e ~/O/$cmd[2] ) then
                if ( $cmd[2] == 'key' && (! -e ~/I/$cmd[2]) ) then
                    echo "You don't have that."
                else
                    echo "You must supply an indirect object."
                endif
            else 
                echo "I don't know what that object is."
            endif
            continue
        else
            if ( -e ~/I/$cmd[2] && -e $cmd[4] ) then
                if ( $cmd[2] == 'card' && ( $cmd[4] == 'vax' || $cmd[4] == 'computer' ) ) then
                    if( -e .flashing ) then
                        echo "As you put the CPU board in the computer, it immediately springs to life."
                        echo "The lights start flashing, and the fans seem to startup."
                        rm ~/I/card ~/I/cpu ~/I/board >& ~/X
                        mv .flashing flashing >& ~/X
                        mv steady .steady >& ~/X
                        echo "Computer room\nYou are in a computer room.  It seems like most of the equipment has been removed.  There is a VAX 11/780 in front of you, however, with one of the cabinets wide open.  A sign on the front of the machine says: This VAX is named ‘pokey’.  To type on the console, use the ‘type’ command.  The exit is to the east." > .d
                    else
                        echo "You don't have that."
                    endif
                else
                    echo "I don't know how to combine those objects.  Perhaps you should just try dropping it."
                endif
            else if ( -e ~/I/$cmd[2]  && -e ~/I/$cmd[4] ) then
                echo "I don't know how to combine those objects.  Perhaps you should just try dropping it."
            else if ( -e ~/I/$cmd[2]  && (! -e $cmd[4] ) ) then
                echo "That indirect object is not here."
            else
                echo "You don't have that."
            endif 
        endif
    else if( $cmd[1] == 'dig' ) then
        dig
    else
        echo "I don't understand that."
    endif

    switch ( $flag )
        case 1:
            if( -x $cmd[1] ) then
                cd $cmd[1] >& ~/X
                head -n `ls [19]` .d*
                mv 9 1 >& ~/X
                (itemAlerts) >& ~/X
                if( $? == 0 ) then
                    itemAlerts
                endif
                if( -e bear ) then
                    set nearBear = 1
                endif
            else
                if( $cmd[1] == se && -e bear && $nearBear == 1 ) then
                    echo "The bear is very annoyed that you would be so presumptuous as to try and walk right by it.  He tells you so by tearing your head off."
                    echo
                    echo "You are dead."
                    echo "You have scored 0 out of a possible 90 points."
                    break
                else
                    echo "You cannot go that way."                    
                endif
            endif
            breaksw
        case 2:
            if( -x $cmd[1] ) then
                cd $cmd[1] >& ~/X
                head -n `ls [19]` .d
                mv 9 1 >& ~/X;
                (itemAlerts) >& ~/X
                if( $? == 0 ) then
                    itemAlerts
                endif
            else
                if( -e $cmd[1] ) then
                    echo "You do not have a key that can open this door."
                else
                    echo "You cannot go that way."
                endif
            endif
            breaksw
        default:
            breaksw
    endsw
end
exit
