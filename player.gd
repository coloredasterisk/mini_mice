extends RigidBody2D

@export var speed = 400

var screen_size;
var width = 8
var height = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO;
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if velocity.length() != 0:
		velocity = velocity.normalized() * speed
	
	#screen wrap
	if position.x < -width*2:
		print(position.x)
		global_position.x = screen_size.x# + width
	if position.x > screen_size.x + width*2:
		print(position.x)
		global_position.x = 0 #- width
	if position.y < -height*2:
		print(position.y)
		global_position.y = screen_size.y# + height
	if position.y > screen_size.y + height*2:
		print(position.y)
		global_position.y = 0
		#position.y = 0#-height
		
		
	apply_impulse(velocity * delta)
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true



func _on_body_entered(body):
	print(body)
	print("test")
	pass # Replace with function body.
