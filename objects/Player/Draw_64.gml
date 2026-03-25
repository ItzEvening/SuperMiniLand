if (instance_exists(coinsFont)) {
	coinsFont.text = NumberFormatter(coins);
}


if (livesText == "" and global.difficulty != 0) {
	livesFont.text = NumberFormatter(chances);
}
else {
	livesFont.text = livesText;
}