function ajaxHtml(url, domId) {
	$.ajax({
		type: "POST",
		url : url,
		dataType : "html",
		success : function(data) {
			$("#" + domId).html(data);
		}
	});
}

function checkAll(src){
	$(".ids").each(function(no, item) {
		item.checked = src.checked;
	});
}

function getCheckedToArray(){
	var ids = [];
	$(".ids").each(function(no, item) {
		if(item.checked){
			ids.push(item.value);
		}
	});
	return ids.join(",");
}