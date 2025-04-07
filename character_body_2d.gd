extends CharacterBody2D
var direccio := Vector2(0,-1)
var velocitat := 200.0
var temps := 0
var acceleracio := 0
func _ready() -> void:
	position= Vector2(0,0)
func _process(delta:float) -> void:
	var mov= Input.get_axis("frena","accelera") 
	if mov<0:
		acceleracio= 800.0
	if mov>0:
		acceleracio= 300.0
	if mov = 0:
		acceleracio= -80
	velocitat += mov * acceleracio * delta
	velocity = direccio * velocitat 
	$Label.text = "velocitat: %.2f\nacceleració: %.2f\nvelocity: %.2v" % [velocitat, acceleracio, velocity]
	if Input.is_action_pressed("moure_esquerra"):
		direccio = direccio.rotated(-0.05)
	if Input.is_action_pressed("moure_dreta"):
		direccio = direccio.rotated(0.05)
	move_and_slide()
	
	anima(direccio, delta)
	
func anima(direccio: Vector2,delta: float):
	rotation = direccio.angle() + deg_to_rad(+90)
	
	
	
