#!/bin/bash

HOMEWORK_NUMBER=$@

homeworkPDF="c4cs-wk$HOMEWORK_NUM-homework.pdf"
homeworkTEX="c4cs-wk$HOMEWORK_NUM-homework.tex"
advancedPDF="c4cs-wk$HOMEWORK_NUM-advanced.pdf"
advancedTEX="c4cs-wk$HOMEWORK_NUM-advanced.tex"

for HOMEWORK_NUM in $HOMEWORK_NUMBER; do
	tput setaf 3; echo "Downloading Homework $HOMEWORK_NUM PDF Document ....."
	wget https://c4cs.github.io/static/w18/hw/c4cs-wk$HOMEWORK_NUM-homework.pdf 2>> ~/Desktop/bash_scripting/download_homework.out

	tput setaf 3; echo "Downloading Homework $HOMEWORK_NUM Tex Document ....."
	wget https://c4cs.github.io/static/w18/hw/c4cs-wk$HOMEWORK_NUM-homework.tex 2>> ~/Desktop/bash_scripting/download_homework.out

	tput setaf 3; echo "Downloading Advanced Homework $HOMEWORK_NUM PDF Document ....."
	wget https://c4cs.github.io/static/w18/advanced/c4cs-wk$HOMEWORK_NUM-advanced.pdf 2>> ~/Desktop/bash_scripting/download_homework.out

	tput setaf 3; echo "Downloading Advanced Homework $HOMEWORK_NUM Tex Document ....."
	wget https://c4cs.github.io/static/w18/advanced/c4cs-wk$HOMEWORK_NUM-advanced.tex 2>> ~/Desktop/bash_scripting/download_homework.out

	for type in $homeworkPDF $homeworkTEX $advancedPDF $advancedTEX; do
		if [[ "$type" = "$homeworkPDF" || "$type" = "$homeworkTEX" ]]; then
			if [ -e ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM/$type ]; then
				tput setaf 1; echo "The file \"$type\" already exists. Removing file from current directory.";
				rm $type;
				tput setaf 2; echo "Proceeding .....";
			elif [ -e $type ]; then
				mv $type ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM;
			else
				tput setaf 1; echo "The file \"$type\" does not exist. Proceeding .....";
			fi
		elif [[ "$type" = "$advancedPDF" || "$type" = "$advancedTEX" ]]; then
			if [ -e ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM/$type ]; then
				tput setaf 1; echo "The file \"$type\" already exists. Removing file from current directory.";
				rm $type;
				tput setaf 2; echo "Proceeding .....";
			elif [ -e $type ]; then
				mv $type ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM;
			else
				tput setaf 1; echo "The file \"$type\" does not exist. Proceeding .....";
			fi
		else
			echo "What happened!";
		fi
	done


	# ##########################################################################################

	# if [ -e ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM/$type ]; then
	# 	tput setaf 1; echo "The file \"$type\" already exists. Removing file from current directory.";
	# 	rm $type;
	# 	tput setaf 2; echo "Proceeding .....";
	# elif [ -e $type ]; then
	# 	mv $type ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM;
	# else
	# 	tput setaf 1; echo "The file \"$type\" does not exist. Proceeding .....";
	# fi

	# ##########################################################################################

	# if [ -e ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM/$homeworkTEX ]; then
	# 	tput setaf 1; echo "The file \"$homeworkTEX\" already exists. Removing file from current directory.";
	# 	rm $homeworkTEX;
	# 	tput setaf 2; echo "Proceeding .....";
	# elif [ -e $homeworkTEX ]; then
	# 	mv $homeworkTEX ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM;
	# else
	# 	tput setaf 1; echo "The file \"$homeworkTEX\" does not exist. Proceeding .....";
	# fi

	# ##########################################################################################

	# if [ -e ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM/$advancedPDF ]; then
	# 	tput setaf 1; echo "The file \"$advancedPDF\" already exists. Removing file from current directory.";
	# 	rm $advancedPDF;
	# 	tput setaf 2; echo "Proceeding .....";
	# elif [ -e $advancedPDF ]; then
	# 	mv $advancedPDF ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM;
	# else
	# 	tput setaf 1; echo "The file \"$advancedPDF\" does not exist. Proceeding .....";
	# fi

	# ##########################################################################################

	# if [ -e ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM/$advancedTEX ]; then
	# 	tput setaf 1; echo "The file \"$advancedTEX\" already exists. Removing file from current directory.";
	# 	rm $advancedTEX;
	# 	tput setaf 2; echo "Proceeding .....";
	# elif [ -e $advancedTEX ]; then
	# 	mv $advancedTEX ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM;
	# else
	# 	tput setaf 1; echo "The file \"$advancedTEX\" does not exist. Proceeding .....";
	# fi
done

