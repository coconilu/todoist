#!/bin/bash
touch todoList

printHelper(){
	echo "***********************************"
	echo "*       Welcome To Todoist        *"
	echo "***********************************"
	echo "-a add todo to list"
	echo "-d done todo in list"
	echo "-r remove todo in list"
	echo "-l list all todo in list"
}

printTodoList(){
	echo "***********************************"
	echo "*       Welcome To Todoist        *"
	echo "***********************************"
	if [[ -f "todoList" ]]; #判断todoList文件是否存在
	then
		cat todoList
	else
		echo "There is no TodoList"
	fi
}

addTodo(){
	echo "[ ] $1" >> todoList
	printTodoList
}

doneTodo(){
	notDone="\[ \]"
	haveDone="[*]"
	sed -i "" "$1s/$notDone/$haveDone/" todoList
	printTodoList
}

doneTodos(){
	for i in $@; do
		doneTodo $i
	done
}

removeTode(){
	sed -i "" "$1d" todoList
	printTodoList
}

removeTodes(){
	for i in $@; do
		removeTode $i
	done
}

while getopts :a:d:r:lh opt
do
    case "$opt" in
    a) addTodo $OPTARG;;
    d) doneTodo $OPTARG;;
	r) removeTode $OPTARG;;
    l) printTodoList;;
	h) printHelper;;
    esac;
done
