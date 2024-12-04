extends StaticBody2D

var velocidade_do_paddle : float = 700.0
var x_minimo : float = 45
var x_maximo : float = 755

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	movimentar_paddle(delta)
	limitar_movimento_do_paddle();


func movimentar_paddle(delta: float) -> void:
	if Input.is_action_pressed("mv-esquerdo"):
		position.x -= velocidade_do_paddle * delta #multiplica por delta p/ controlar o FPS
	elif Input.is_action_pressed("mv-direito"):
		position.x  += velocidade_do_paddle * delta


func limitar_movimento_do_paddle() -> void:
	position.x = clamp(position.x, x_minimo, x_maximo)
