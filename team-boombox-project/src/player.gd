extends CharacterBody2D

enum {NONE, PLATFORM, MENU}
@export var CONTROLMODE = PLATFORM

@export var ACCEL = 20
@export var airACCEL = 5
@export var DECEL = 20
@export var MAXSPEED = 100
@export var airSPEED = 150
var movement_dir:Vector2
var prev_dir

@export var JUMP = 280
@export var FALLSPEED = 150
@export var GRAVITY = 20
var jumpBuffer = false
var was_on_floor = false

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	match CONTROLMODE:
		NONE:
			pass
		
		PLATFORM:
			movement_dir = round(Input.get_vector("Left","Right","Down","Up"))
			handleMovement(delta)
	

func _input(_event: InputEvent) -> void:
	match CONTROLMODE:
		NONE: ## For pausing player control for cutscenes
			pass
		
		PLATFORM: ## When platforming around
			pass
	anim()
	

func handleMovement(_delta):
	var direction = movement_dir.x
	var accel = ACCEL
	var maxSpeed = MAXSPEED
	
	if !is_on_floor(): 
		if prev_dir != 0 && prev_dir == -direction:
			accel = airACCEL
		maxSpeed = airSPEED
		velocity.y += GRAVITY
		if velocity.y > maxSpeed:
			velocity.y = maxSpeed
	else:
		$JumpTimer.stop()
		
	
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * maxSpeed, accel)
	else:
		velocity.x = move_toward(velocity.x, 0, DECEL)
	
	
	if Input.is_action_just_pressed("Action1"):
		$JumpTimer.start()
		jump()
	
	was_on_floor = is_on_floor()	
	
	if !was_on_floor && is_on_floor():
		if jumpBuffer:
			jumpBuffer = false
			jump()
	
	prev_dir = direction
	
	move_and_slide()

func jump():
	if is_on_floor():
		velocity.y = -JUMP
	elif !jumpBuffer:
		jumpBuffer = true
		$jumpBufferTimer.start()

func _on_jump_buffer_timer_timeout() -> void:
	jumpBuffer = false

func _on_jump_timer_timeout() -> void: ## Used for variable jump height
	if !Input.is_action_pressed("Action1") && velocity.y < -JUMP/3:
		velocity.y = -(JUMP/3.0)



func anim() -> void:
	var movement_dir = round(Input.get_vector("Left","Right","Down","Up"))
	match CONTROLMODE:
		NONE:
			pass
		
		PLATFORM:
			if movement_dir.x != 0: 
				$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x) * movement_dir.x
				$AnimatedSprite2D.play("MoveRight")
			else: $AnimatedSprite2D.play("Right")
			
			if Input.is_action_pressed("Action1") && is_on_floor():
				$AnimatedSprite2D.play("Jump")
				if $AnimatedSprite2D.frame == 11:
					$AnimatedSprite2D.frame = 12
			elif $AnimatedSprite2D.animation == "Jump" && $AnimatedSprite2D.frame == 11:
				$AnimatedSprite2D.frame = 11

func _on_damage_body_entered(body: Node2D) -> void:
	get_parent().get_parent()._restart()
