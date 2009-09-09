# Written by Aleksey Cheusov <vle@gmx.net>, public domain
#
# This awk module is a part of RUNAWK distribution,
#        http://sourceforge.net/projects/runawk
#
############################################################

function join_keys (hash, sep,                   k,ret,flag){
	ret = ""
	for (k in hash){
		if (flag){
			ret = ret sep k
		}else{
			flag = 1
			ret = k
		}
	}
	return ret
}

function join_values (hash, sep,                   k,ret,flag){
	ret = ""
	for (k in hash){
		if (flag){
			ret = ret sep hash [k]
		}else{
			flag = 1
			ret = hash [k]
		}
	}
	return ret
}

function join_by_numkeys (array, sep, start, end,                  ret,flag){
	ret = ""

	if (start == "")
		start = 1

	if (end == "")
		end = 1.0E+37

	for (; start <= end && (start in array); ++start){
		if (flag){
			ret = ret sep array [start]
		}else{
			flag = 1
			ret = array [start]
		}
	}

	return ret
}
