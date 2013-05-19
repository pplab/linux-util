linux-util
==========

small tools

- new

	Create new script based on templates


- all.template

	template for all scripts


- sh.template

	template for sh scripts


- any2dec.awk

	convert a number of any base (less or equal than 9) to decimal base

	example: 

		echo 112 |awk -v B=3 -f any2dec.awk


- dec2any.awk

	convert a decimal number to a number of any base(less or equal than 9)

	example: 

		echo 14|awk -v B=3 -f dec2any.awk


- matXvec.sh

	multiply a matrix by a vector
