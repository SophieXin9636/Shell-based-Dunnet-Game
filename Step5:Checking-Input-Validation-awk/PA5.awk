#!/bin/awk -f
BEGIN{
	"ls ~/I | tr '\t\n' ' '" | getline x;
	n_inv = split(x, invetory, "[ \t]+");

	for(i=1; i<=n_inv; i++){
		inv_d[invetory[i]] = invetory[i];
	}

	"ls | tr '\t\n' ' '" | getline y;
	n_ls = split(y, current, "[ \t]+");

	for(i=1; i<=n_ls; i++){
		ls_d[current[i]] = current[i];
	}
}
END{
	getline < "F";
	a = $0;
	n = split(a, para, "[ ]+");


	if( para[1] == "You" || para[1] == "I" ){
		print a;
	}
	else if(para[1] ~ "[s]"){
		if( para[2] in inv_d ){
			print para[1] " " para[2];
		}
		else if( para[2] in ls_d ){
			if(para[2] == "tree" || para[2] == "bear"){
				print a;
			}
			else {
				print "You don't have that."
			}
		}
		else{
			print "You don't have that."
		}
	}
	else if(para[1] ~ "[de]"){
		if( para[2] in inv_d ){
			print para[1] " " para[2];
		}
		else{
			print "You don't have that.";
		}
	}
	else if(para[1] ~ "[gxc]"){
		if(n == 3){
			if( para[2] in inv_d ){
				print para[1] " " para[2];
			}
			else{
				print "I don't see that here.";
			}			
		}
		else{
			if( para[2] in ls_d ){
				print para[1] " " para[2];
			}
			else{
				print "You don't have that.";
			}
		}
	}
	else if(para[1] ~ "[p]"){
		if(n == 5){
			if( para[4] in inv_d ){
				sub("@","\0",a);
				print a;
			}
			else{
				print "That indirect object is not here.";
			}
		}
		else{
			if( para[2] in inv_d ){
				print a;
			}
			else{
				print "You don't have that.";
			}
		}
	}
	else{
		print "You don't have that.";
	}
}