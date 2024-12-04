extends Area2D

# movimento da bola
var velocidade_da_bola : float = 500.0
var posicao_inicial : Vector2 = Vector2(400, 500)
var direcao_inicial : Vector2 = Vector2(0, 0)
var nova_direcao : Vector2 = Vector2(0, 0)

#limites da bola
var x_minimo : float = 0
var x_maximo : float = 800
var y_minimo : float = 0
var y_maximo : float = 600

#verificações
var primeiro_lancamento : bool = true


func _ready() -> void:
	resetar_bola()


func _process(delta: float) -> void:
	if primeiro_lancamento:
		if Input.is_action_just_pressed("lancar-bola"):
			escolher_direcao_inicial()
			primeiro_lancamento = false
	movimentar_bola(delta)
	verificar_posicao_da_bola();


func resetar_bola() -> void:
	position = posicao_inicial
	
	
func escolher_direcao_inicial() -> void:
	var x_aleatorio = [-1, 1].pick_random() 
	#pega um valor aleatório do vetor, p/ definir se é direita ou esquerda

	direcao_inicial = Vector2(x_aleatorio, -1)
	nova_direcao = direcao_inicial


func movimentar_bola(delta : float) -> void:
	position += nova_direcao * velocidade_da_bola * delta


func verificar_posicao_da_bola() -> void:
	#se tiver dentro da tela, a rebate ao colidir com as bordas
	if position.y <= y_maximo:
		if position.y <= y_minimo:
			nova_direcao.y *= -1

	if position.x <= x_minimo or position.x >= x_maximo:
		nova_direcao.x *= -1
		
	if position.y > 700:
		sair_da_tela()


func sair_da_tela() -> void:
	nova_direcao = Vector2(0, 0)
	primeiro_lancamento = true
	resetar_bola()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("paddle"):
		nova_direcao.y *= -1
		
	elif body.is_in_group("blocos"):
		body.receber_dano()
		nova_direcao.y *= -1
