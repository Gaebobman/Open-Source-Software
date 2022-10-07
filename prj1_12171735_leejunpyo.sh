#! /bin/bash

file=$1
clear
if ! [ $# = 1 ]
then
    echo "Error!!! Usage: $0 <textfile>"
    exit 1
fi

user_input=0
option_selected=("0" "0" "0" "0" "0" "0") # 유저가 선택한 옵션을 추적함 (0: No / 1, 2: Yes)
variable_name_to_be_changed="A"
new_variable_name="A"

# Remove empty lines
empty_line_removal(){
    sed -i "/^\s*$/d" ${file}   # \n 뿐만아니라 스페이스, Tab도 제거
}
comment_removal(){
    echo "comment removal"
    sed -i "/\s*^#\([^!]\|$\)/d" ${file} # '#'으로 시작하는 Comment를 제거, 하지만 Shebang 은 남김
}
duplicate_whitespaces(){
    echo "duplicate_ws"
   # sed -i "/[\w]\s{2}"
}
line_number(){
    echo "line_num"
}
change_variable_name(){
    echo "Variable name to be changed: $variable_name_to_be_changed"
    echo "New variable name: $new_variable_name"
    # Check if there is variable
    # And Verify that the variable name is grammatically correct
}
arithmathic_expansion(){
    echo "arithmathic_ex"
}

save(){
    for (( i=0; i<6; i++ ))
        do 
        if ! [ "${option_selected[$i]}" = "0" ]
        then
            case $i in
                0)  
                    empty_line_removal
                ;;
                1)
                    comment_removal
                ;;
                2)
                    duplicate_whitespaces
                ;;
                3)
                    line_number
                    # Start or End Start = 1, End = 2
                ;;
                4)
                    change_variable_name
                ;;
                5)
                    arithmathic_expansion
                ;;
            esac
        fi
    done
}

# Print Menu
print_menu(){

    echo "User name: $(whoami)junpyo 12171735"
    echo "[ MENU ]"
    echo "1. Enable/disable empty line removal"
    echo "2. Enable/disable comment removal"
    echo "3. Enable/disable duplicate whitespaces among words"
    echo "4. Add the line number"
    echo "5. Change the variable name"
    echo "6. Remove \${} in arithmathic expansion"
    echo "7. Export new file"
    echo "8. Exit"
    echo "-------------------------------"
    read -p "Enter your choice [ 1-8 ]: " user_input

}


until [ "$user_input" = 8 ]
do
    print_menu
    case $user_input in
    1)
        clear
        echo "Empty line removal!"
        read -p "Do you want to remove all blank line ?(y/n): " input
        case $input in
        [yY])
            option_selected[0]="1"
        ;;
        [nN])
            option_selected[0]="0"
        ;;
        *)
            echo "Error!!! invalid option..."
        ;;
        esac
    ;;

    2)
        clear
        read -p "Do you want to remove all comment ?(y/n): " input
        case $input in
        [yY])
            option_selected[1]="1"
        ;;
        [nN])
            option_selected[1]="0"
        ;;
        *)
            echo "Error!!! invalid option..."
        ;;
        esac
    ;;

    3)
        clear
        read -p "Do you want to remove duplicate whitespaces ?(y/n): " input
        case $input in
        [yY])
            option_selected[2]="1"
        ;;
        [nN])
            option_selected[2]="0"
        ;;
        *)
            echo "Error!!! invalid option..."
        ;;
        esac
    ;;

    4)
        clear
        read -p "Where you want to add whether the start or the end of the line. (s/e): " input
        case $input in
        [sS])
            option_selected[3]="1"
        ;;
        [eE])
            option_selected[3]="2"
        ;;
        *)
            echo "Error!!! invalid option..."
        ;;
        esac
    ;;

    5)
        clear
        read -p "Variable name to be changed: " variable_name_to_be_changed
        read -p "New variable name: " new_variable_name
        option_selected[4]="1"
    ;;

    6)
        clear
        read -p "Do you want to remove \${} ?(y/n): " input
        case $input in
        [yY])
            option_selected[5]="1"
        ;;
        [nN])
            option_selected[5]="0"
        ;;
        *)
            echo "Error!!! invalid option..."
        ;;
        esac
    ;;

    7)
        clear
        read -p "Do you want save changes ?(y/n): " input
        case $input in
        [yY])
            save
        ;;
        [nN])
            echo "Return to menu"
        ;;
        *)
            echo "Error!!! invalid option..."
        ;;
        esac
    ;;

    8)

        echo "Bye!"
    ;;

    *) 
        echo "Error: Invalid option..."
    ;;
    esac
done

exit 0