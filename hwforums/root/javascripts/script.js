
function show(id)
{
	var control = document.getElementById(id);
    	if(control != null)
        	control.style.display = "block";
}

function hide(id)
{       
	var control = document.getElementById(id);
	if(control != null)
		control.style.display = "none";
}


function setfocus(id)
{
	var control = document.getElementById(id);
    	if(control != null)
        	control.focus();
}

