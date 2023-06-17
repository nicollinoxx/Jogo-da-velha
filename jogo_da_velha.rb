tabuleiro = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]
jogador_atual = '1'

def mesa(tabuleiro)
  tabuleiro.each do |matriz|
    puts matriz.join(' ')
  end
end

def verificar_vencedor(tabuleiro)
    if (tabuleiro[0][0] == 'x' && tabuleiro[1][1] == 'x' && tabuleiro[2][2] == 'x') || #diagonal
       (tabuleiro[2][0] == 'x' && tabuleiro[1][1] == 'x' && tabuleiro[0][2] == 'x') || #diagonal inversa
       (tabuleiro[0][0] == 'x' && tabuleiro[1][0] == 'x' && tabuleiro[2][0] == 'x') || #vertical esquerda
       (tabuleiro[0][1] == 'x' && tabuleiro[1][1] == 'x' && tabuleiro[2][1] == 'x') || #vertical meio
       (tabuleiro[0][2] == 'x' && tabuleiro[1][2] == 'x' && tabuleiro[2][2] == 'x') || #vertical direita
       (tabuleiro[0][0] == 'x' && tabuleiro[0][1] == 'x' && tabuleiro[0][2] == 'x') || #horizontal cima
       (tabuleiro[1][0] == 'x' && tabuleiro[1][1] == 'x' && tabuleiro[1][2] == 'x') || #horizontal meio
       (tabuleiro[2][0] == 'x' && tabuleiro[2][1] == 'x' && tabuleiro[2][2] == 'x')    #horizontal baixo
       puts 'jogador 1 venceu!'
       return true
    end

    if (tabuleiro[0][0] == 'O' && tabuleiro[1][1] == 'O' && tabuleiro[2][2] == 'O') || #diagonal
       (tabuleiro[2][0] == 'O' && tabuleiro[1][1] == 'O' && tabuleiro[0][2] == 'O') || #diagonal inversa
       (tabuleiro[0][0] == 'O' && tabuleiro[1][0] == 'O' && tabuleiro[2][0] == 'O') || #vertical esquerda
       (tabuleiro[0][1] == 'O' && tabuleiro[1][1] == 'O' && tabuleiro[2][1] == 'O') || #vertical meio
       (tabuleiro[0][2] == 'O' && tabuleiro[1][2] == 'O' && tabuleiro[2][2] == 'O') || #vertical direita
       (tabuleiro[0][0] == 'O' && tabuleiro[0][1] == 'O' && tabuleiro[0][2] == 'O') || #horizontal cima
       (tabuleiro[1][0] == 'O' && tabuleiro[1][1] == 'O' && tabuleiro[1][2] == 'O') || #horizontal meio
       (tabuleiro[2][0] == 'O' && tabuleiro[2][1] == 'O' && tabuleiro[2][2] == 'O')    #horizontal baixo
       puts 'jogador 2 venceu!'
       return true
    end
  return false
end

def empate(tabuleiro)
  tabuleiro.each do |matriz|
    matriz.each  do |posição|
      if posição == '_'
        return false
      end
    end
  end
  puts 'empate!'
  return true
end

while true
  puts 'Jogador ' + jogador_atual
  puts ' '
  puts 'Selecione a linha: '
  linha = gets.chomp.to_i
  puts ' '
  puts 'Selecione a coluna: '
  coluna = gets.chomp.to_i

  system('cls')

  if tabuleiro[linha][coluna] == '_'
    if jogador_atual == '1'
      tabuleiro[linha][coluna] = 'x'
      jogador_atual = '2'
    else
      tabuleiro[linha][coluna] = 'O'
      jogador_atual = '1'
    end
  else
    puts 'Essa posição já foi preenchida. Tente novamente.'
    puts ' '
  end

  if verificar_vencedor(tabuleiro)
    puts ' '
    mesa(tabuleiro)
    break
  end

  if empate(tabuleiro)
    mesa(tabuleiro)
    puts ' '
    break
  end
  mesa(tabuleiro)
end
