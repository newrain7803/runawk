# Written by Aleksey Cheusov <vle@gmx.net>, public domain
#
# This awk module is a part of RUNAWK distribution,
#        http://sourceforge.net/projects/runawk
#
############################################################

#
# This module reads a program's file, find .begin-str/.end-str pairs
# and reads lines between them.
#
# EMBED_STR - Associative array with string index
#
# Example:
#                     Input:
#.begin-str mymsg
# Line1
# Line2
#.end-str
#                     Output (result)
#EMBED_STR ["mymsg"]="Line1\nLine2"
#

#use "xgetline.awk"
#use "modinfo.awk"

BEGIN {
	_embed_str_id = ""
	while (xgetline0(MODMAIN)){
		if ($0 ~ /^#[.]begin-str/){
			_embed_str_id = $2
		}else if ($0 ~ /^#[.]end-str/){
			_embed_str_id = ""
		}else if (_embed_str_id != ""){
			if (EMBED_STR [_embed_str_id] != "")
				_nl = "\n"
			else
				_nl = ""

			EMBED_STR [_embed_str_id] = EMBED_STR [_embed_str_id] _nl substr($0, 3)
		}
	}
}
