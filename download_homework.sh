#!/bin/bash

HOMEWORK_NUMBER=$@

for HOMEWORK_NUM in $HOMEWORK_NUMBER; do
	echo "Downloading Homework $HOMEWORK_NUM PDF Document ....."
	wget https://c4cs.github.io/static/w18/hw/c4cs-wk$HOMEWORK_NUM-homework.pdf 2>> ~/Desktop/bash_scripting/download_homework.out

	echo "Downloading Homework $HOMEWORK_NUM Tex Document ....."
	wget https://c4cs.github.io/static/w18/hw/c4cs-wk$HOMEWORK_NUM-homework.tex 2>> ~/Desktop/bash_scripting/download_homework.out

	echo "Downloading Advanced Homework $HOMEWORK_NUM PDF Document ....."
	wget https://c4cs.github.io/static/w18/advanced/c4cs-wk$HOMEWORK_NUM-advanced.pdf 2>> ~/Desktop/bash_scripting/download_homework.out

	echo "Downloading Advanced Homework $HOMEWORK_NUM Tex Document ....."
	wget https://c4cs.github.io/static/w18/advanced/c4cs-wk$HOMEWORK_NUM-advanced.tex 2>> ~/Desktop/bash_scripting/download_homework.out

	homeworkPDF="c4cs-wk$HOMEWORK_NUM-homework.pdf"
	homeworkTEX="c4cs-wk$HOMEWORK_NUM-homework.tex"
	advancedPDF="c4cs-wk$HOMEWORK_NUM-advanced.pdf"
	advancedTEX="c4cs-wk$HOMEWORK_NUM-advanced.tex"

	##########################################################################################

	if [ -e ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM/$homeworkPDF ]; then
		echo "The file \"$homeworkPDF\" already exists. Removing file from current directory.";
		rm $homeworkPDF;
		echo "Proceeding .....";
	elif [ -e $homeworkPDF ]; then
		mv $homeworkPDF ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM;
	else
		echo "The file \"$homeworkPDF\" does not exist. Proceeding .....";
	fi

	##########################################################################################

	if [ -e ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM/$homeworkTEX ]; then
		echo "The file \"$homeworkTEX\" already exists. Removing file from current directory.";
		rm $homeworkTEX;
		echo "Proceeding .....";
	elif [ -e $homeworkTEX ]; then
		mv $homeworkTEX ~/Desktop/eecs398/Homework/homework-$HOMEWORK_NUM;
	else
		echo "The file \"$homeworkTEX\" does not exist. Proceeding .....";
	fi

	##########################################################################################

	if [ -e ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM/$advancedPDF ]; then
		echo "The file \"$advancedPDF\" already exists. Removing file from current directory.";
		rm $advancedPDF;
		echo "Proceeding .....";
	elif [ -e $advancedPDF ]; then
		mv $advancedPDF ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM;
	else
		echo "The file \"$advancedPDF\" does not exist. Proceeding .....";
	fi

	##########################################################################################

	if [ -e ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM/$advancedTEX ]; then
		echo "The file \"$advancedTEX\" already exists. Removing file from current directory.";
		rm $advancedTEX;
		echo "Proceeding .....";
	elif [ -e $advancedTEX ]; then
		mv $advancedTEX ~/Desktop/eecs398/Advanced/advanced-$HOMEWORK_NUM;
	else
		echo "The file \"$advancedTEX\" does not exist. Proceeding .....";
	fi
done

