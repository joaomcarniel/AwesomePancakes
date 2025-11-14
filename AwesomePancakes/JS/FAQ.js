$(document).ready(function () {
	$(".answer").hide();
	$("h4").click(function () {
		$(this).next("p").slideToggle(500);
	});
});