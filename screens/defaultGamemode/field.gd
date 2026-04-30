extends GridContainer

@onready var game = get_node("..")
@onready var buttons = [
	$fieldZero,
	$fieldOne,
	$fieldTwo,
	$fieldThree,
	$fieldFour,
	$fieldFive,
	$fieldSix,
	$fieldSeven,
	$fieldEight
]

var x_icon = load("res://assets/player_x.png")
var o_icon = load("res://assets/player_o.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(buttons.size()):
		buttons[i].pressed.connect(_on_field_pressed.bind(i))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func buttonLogicHelper() -> void:
	print("")

func _on_field_pressed(index: int) -> void:
	var row = index / 3
	var col = index % 3
	
	if game.boardArray[row][col] != game.cellState.EMPTY:
		return

	if game.isPlayerXTurn:
		buttons[index].icon = x_icon
		game.boardArray[row][col] = game.cellState.X
	else:
		buttons[index].icon = o_icon
		game.boardArray[row][col] = game.cellState.CIRCLE
	game.player_turn_switch()
