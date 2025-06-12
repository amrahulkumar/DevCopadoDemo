({
	handleClick : function(component, event, helper) {
        var dateMaxValue = document.getElementById('datemax').value;
		document.getElementById('datemax').setAttribute('min', '2024-01-20');
        document.getElementById('datemax').setAttribute('max', '2024-01-29');
        console.log(dateMaxValue);
	}
})