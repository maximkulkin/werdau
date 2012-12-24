Spree.Admin.doOnTyping = function(field, func) {
	field.keypress(function (e) {
		if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
			func();
			return false;
		} else
			 return true;
	});

	field.delayedObserver(function() {
		func();
	}, 0.75);
}