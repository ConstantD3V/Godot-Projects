extends CanvasLayer
var coins =0 


func _on_coin_coin_collected():
	var CoinIcon = "coins: "+ String(coins)
	coins += 1
	$ Control/HBoxContainer/CoinICon.text = str(coins)
	Global.coins += 1
	
	
	
