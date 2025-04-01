extends CharacterBody2D
var direccio := Vector2(0,1)
var velocitat := 200
func _ready() -> void:
	position= Vector2(0,0)
func _process(delta:float) -> void:
	var mov= Input.get_axis("accelera","frena") 
	velocity = direccio * velocitat * mov*3
	if Input.is_action_pressed("moure_esquerra"):
		direccio = direccio.rotated(-0.1)
	if Input.is_action_pressed("moure_dreta"):
		direccio = direccio.rotated(0.1)
		
	move_and_slide()

	
