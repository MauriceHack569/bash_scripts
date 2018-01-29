#!/bin/bash

output_file=~/Desktop/bash_scripting/download_homework.out

function exists {
	echo "$(tput setaf 1)The file \"$1\" already exists."
}
function removing {
	echo "Removing \"$1\" from current directory. $(tput setaf 2)$(tput bold)Proceeding .....$(tput sgr0)";
}
function doesnotexist {
	echo "$(tput setaf 1)The file \"$1\" does not exist. $(tput setaf 2)$(tput bold)Proceeding .....$(tput sgr0)";
}
function moving {
	echo "$(tput setaf 2)Moving \"$1\" to its destination .....";
	if [ "$2" = "hw" ]; then
		mv $1 ~/Desktop/eecs398/Homework/homework-$3;
	elif [ "$2" = "adv" ]; then
		mv $1 ~/Desktop/eecs398/Advanced/advanced-$3;
	else 
		echo "ERROR";
	fi
}
function download {
	echo "$(tput setaf 4)Downloading Homework $1 PDF Document..."
	wget https://c4cs.github.io/static/w18/hw/c4cs-wk$1-homework.pdf 2>> $output_file

	echo "Downloading Homework $1 Tex Document..."
	wget https://c4cs.github.io/static/w18/hw/c4cs-wk$1-homework.tex 2>> $output_file

	echo "Downloading Advanced Homework $1 PDF Document..."
	wget https://c4cs.github.io/static/w18/advanced/c4cs-wk$1-advanced.pdf 2>> $output_file

	echo "Downloading Advanced Homework $1 Tex Document..."
	wget https://c4cs.github.io/static/w18/advanced/c4cs-wk$1-advanced.tex 2>> $output_file	
}
function check_for_existance {
	for type in "$homeworkPDF" "$homeworkTEX" "$advancedPDF" "$advancedTEX"; do
		if [[ "$type" = "$homeworkPDF" || "$type" = "$homeworkTEX" ]]; then
			if [ -e ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM/$type ]; then
				exists $type;
				removing $type;
				rm $type; 
			elif [ -e $type ]; then
				moving $type "hw" $HOMEWORK_NUM;
			else
				doesnotexist $type;
			fi
		elif [[ "$type" = "$advancedPDF" || "$type" = "$advancedTEX" ]]; then
			if [ -e ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM/$type ]; then
				exists $type;
				removing $type;
				rm $type; 
			elif [ -e $type ]; then
				moving $type "adv" $HOMEWORK_NUM;
			else
				doesnotexist $type;
			fi
		else
			exit 1;
		fi
	done
}

for HOMEWORK_NUM in $@; do
	homeworkPDF="c4cs-wk$HOMEWORK_NUM-homework.pdf"
	homeworkTEX="c4cs-wk$HOMEWORK_NUM-homework.tex"
	advancedPDF="c4cs-wk$HOMEWORK_NUM-advanced.pdf"
	advancedTEX="c4cs-wk$HOMEWORK_NUM-advanced.tex"

	download $HOMEWORK_NUM;
	check_for_existance;
done