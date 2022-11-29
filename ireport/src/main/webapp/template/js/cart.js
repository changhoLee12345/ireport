function number_format(amount) {
	return new Intl.NumberFormat('ko-KR', {
		style: 'currency',
		currency: 'KRW'
	}).format(amount);
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function () {
	if (this == 0) return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	return nstr;
};

let basket = {
	cartCount: 0,
	cartTotal: 0,
	delCheckedItem: function () {

	},
	delAllItem: function () {

	},
	reCalc: function () {

	},
	updateUI: function () {

	},
	changePNum: function () {

	},
	delItem: function () {

	}
};

basket.cartList();