if (instance_exists(coinsFont)) {
	coinsFont.text = NumberFormatter(coins);
}


if (livesText == "") {
	livesFont.text = NumberFormatter(chances);
}
else {
	livesFont.text = livesText;
}