extends RigidBody2D
var score = 0
var lives = 3
var inity
var initx
var initdy
var initdx

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	inity = position.y
	initx = position.x
	initdy = linear_velocity.y
	initdx = linear_velocity.x
	
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Tiles"):
			body.queue_free()
			score = score + 10
			print("Score: "+str(score))
			
	if position.y > get_viewport_rect().end.y:
		print("Died. Lives Remaining "+str(lives))
		lives = lives - 1
		if lives <= 0:
			print("Game Over!")
			queue_free()
		else:
			reset()
		
func reset():
	position.x = initx
	position.y = inity
	linear_velocity.x = initdx
	linear_velocity.y = initdy