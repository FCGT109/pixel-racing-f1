extends Camera2D
var direccio := Vector2(0,-1)
func _ready() -> void:
	position= Vector2(0,0)
rotation += direccio.angle() + deg_to_rad(+90)
