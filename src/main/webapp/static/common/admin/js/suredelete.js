var suredelete = {
	onDeleteButtonClicked : function(event) {
		var r = confirm("确定删除");
		if (!r){
			event.preventDefault();
		}
	},
	initialize : function() {
		var self = suredelete;
		$('.deletebutton').on('click', self.onDeleteButtonClicked);
	}
}
$(function() {
	suredelete.initialize();
});
