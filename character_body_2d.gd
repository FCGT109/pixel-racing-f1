extends CharacterBody2D
var direccio := Vector2(0,-1)
var velocitat := 200.0
var acceleracio := 0
var voltes:=0

func voltes_portades():
	voltes+=1

func _ready() -> void:
	position= Vector2(500,300)
func _process(delta:float) -> void:
	var mov= Input.get_axis("frena","accelera") 
	if mov<0:
		acceleracio= 800.0
	if mov>0:
		acceleracio= 300.0

	velocitat += mov * acceleracio * delta
	velocity = direccio * velocitat 
	$BlueLabel.text = "velocitat: %.2f\nnºvoltes: %.2f\ntemps: %.2f" % [velocitat, voltes, velocitat]
	if Input.is_action_pressed("moure_esquerra"):
		direccio = direccio.rotated(-0.05)
	if Input.is_action_pressed("moure_dreta"):
		direccio = direccio.rotated(0.05)
	move_and_slide()
	
	anima(direccio, delta)
	
func anima(direccio: Vector2,delta: float):
	rotation = direccio.angle() + deg_to_rad(+90)
		
