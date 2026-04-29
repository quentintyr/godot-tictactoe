extends Control

var isPlayerXTurn = true # default player is X
var isPlayerSelected = false # check if player was selected
var turns = 0 # set turns to zero on start
# set each tile on the map to empty on game start
var boardArray = [
		[cellState.EMPTY, cellState.EMPTY, cellState.EMPTY],
		[cellState.EMPTY, cellState.EMPTY, cellState.EMPTY],
		[cellState.EMPTY, cellState.EMPTY, cellState.EMPTY]
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# iterate through array to get current states of tiles
	for i in range(boardArray.size()):
		for j in range(boardArray[i].size()):
			print(boardArray[i][j])
	
	$field.hide()
		
	
	
# show map visually
func _load_map() -> void:
	$field.show()


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

func player_turn_switch() -> void:
	if (isPlayerXTurn == true): # if player is currently x switch to circle
		isPlayerXTurn = false
		print("player circle")
	else:
		isPlayerXTurn = true # if the player is currently not x, switch to x
		print("player x")

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://screens/mainMenu/mainMenu.tscn")
	
func _on_player_x_pressed() -> void:
	print("x pressed")
	isPlayerXTurn = true
	isPlayerSelected = true
	$playerChooser.hide()
	_load_map()

func _on_player_o_pressed() -> void:
	print("o pressed")
	isPlayerXTurn = false
	isPlayerSelected = true
	$playerChooser.hide()
	_load_map()
	
