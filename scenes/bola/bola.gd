extends Area2D

var velocidade_da_bola : float = 400.0
var posicao_inicial : Vector2 = Vector2(400, 500)
var direcao_inicial : Vector2 = Vector2(0, 0)
var nova_direcao : Vector2 = Vector2(0, 0)



func _ready() -> void:
	resetar_bola()
	escolher_direcao_inicial()


func _process(delta: float) -> void:
	movimentar_bola(delta)


func resetar_bola() -> void:
	position = posicao_inicial
	
	
func escolher_direcao_inicial() -> void:
	var x_aleatorio = [-1, 1].pick_random() 
	#pega um valor aleatório do vetor, p/ definir se é direita ou esquerda

	direcao_inicial = Vector2(x_aleatorio, -1)
	nova_direcao = direcao_inicial


func movimentar_bola(delta : float) -> void:
	position += nova_direcao * velocidade_da_bola * delta
