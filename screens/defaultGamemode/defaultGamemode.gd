extends Node2D

var isPlayerXTurn = false # default player is X
var isPlayerSelected = false # check if player was selected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var turns = 0 # set turns to zero on start
	
	# set each tile on the map to empty on game start
	var boardArray = [
		[cellState.EMPTY, cellState.EMPTY, cellState.EMPTY],
		[cellState.EMPTY, cellState.EMPTY, cellState.EMPTY],
		[cellState.EMPTY, cellState.EMPTY, cellState.EMPTY]
	]
	
	# iterate through array to get current states of tiles
	for i in range(boardArray.size()):
		for j in range(boardArray[i].size()):
			print(boardArray[i][j])
		
	
	
# show map visually

# let player decide if X or O
func _choosePlayer() -> void:
	if (!isPlayerSelected):
		$playerChooser.show()
	
# logic for placing X or O on tiles

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_choosePlayer()
	

enum cellState {
	EMPTY,
	CIRCLE,
	X
}

enum Players {
	PLAYER_X,
	PLAYER_O
}

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://screens/mainMenu/mainMenu.tscn")

func _load_map() -> void:
	pass
	
func _on_player_x_pressed() -> void:
	print("x pressed")
	isPlayerXTurn = true
	isPlayerSelected = true
	$playerChooser.hide()

func _on_player_o_pressed() -> void:
	print("o pressed")
	isPlayerXTurn = false
	isPlayerSelected = true
	$playerChooser.hide()
