.data
	Matriculas: .word 0x20111766, 0x19110394, 0x19110236, 0x19111026, 0x19110324, 0x20210674, 0x19110386, 0x18110269, 0x20110520, 0x20111601, 0x18210553, 0x19110420, 0x19111418, 0x19110904, 0x18110318, 0x18210651, 0x19110524, 0x19111014, 0x19110191, 0x19111664, 0x18210469, 0x19111299, 0x19110929, 0x19111150, 0x19210570, 0x19110421, 0x19110734, 0x18210809, 0x22111275, 0x18110402, 0x18210499, 0x22110406, 0x19110177, 0x20110415, 0x20111610, 0x20111401, 0x19110415, 0x19210861, 0x20111044, 0x21111310, 0x19110030, 0x20110266, 0x19111203, 0x17210743, 0x19110376, 0x19110390, 0x20210121, 0x19110779, 0x19110423, 0x18111101, 0x21110599, 0x19111090, 0x18210114, 0x19110785, 0x20110898, 0x20210436, 0x19110104, 0x20210601, 0x21111274, 0x19111128
	Nomes: .asciiz "ADEILSON DE SOUSA LEAL                       ", "AIRON CIRILO GUENES FILHO                    ", "ALYSSON MACHADO DE OLIVEIRA BARBOSA          ", "ANDERSON MARCOS SILVA                        ", "ANDREY LUCYAN NASCIMENTO PAIVA               ", "BARBARA BEZERRA BARBOSA                      ", "BRUNO NASCIMENTO GOMES DE OLIVEIRA           ", "CAIO VASCONCELOS BENIGNO DE ABRANTES         ", "CLEISSON DE ALENCAR RAMOS                    ", "DAVI AUGUSTO MONTEIRO GONZAGA                ", "DEBORA DA SILVA COSTA                        ", "DIEGO ALMEIDA DIAS                           ", "DOUGLAS BARROS CALISTA                       ", "EDGLEY DA SILVA CARVALHO FILHO               ", "EDUARDO LUIS FERREIRA BARBOSA                ", "EUDES MEDEIROS                               ", "FABIO VICTOR GALDINO NASCIMENTO              ", "FELIPE ALEXANDRE DA SILVA BENTO              ", "FELIPE LUCENA SOUZA MEDEIROS                 ", "FERNANDO HENRIQUE DE SOUSA SILVA             ", "FILIPE JOSE FERREIRA DE ARAUJO               ", "FRANCINILDO BARBOSA FIGUEIREDO               ", "HEBERT SANTOS CRISPIM                        ", "HELSON JADER ROCHA                           ", "HIGOR COSTA DE OLIVEIRA                      ", "IGOR COSTA XAVIER                            ", "IURY CHAGAS DA SILVA CAETANO                 ", "JACKSON DA SILVA GUEDES                      ", "JANIELE PEREIRA BENICIO                      ", "JESSYCA DAYANE SOUSA BRANDAO                 ", "JOSE HELIO DE ARAUJO JUNIOR                  ", "JOSE TAYRONE SANTOS DE OLIVEIRA              ", "JULIA RAMALHO COSTA SOUZA                    ", "KAYO MATHEUS ARAUJO SANTOS                   ", "LAVNIS OLIVEIRA DE ARAUJO                    ", "LEIRY GABRIELLE MARQUES LUZ PINTO            ", "LEONARDO PESSOA BANDEIRA LACERDA             ", "LINDEMBERG COSTA LUNA                        ", "LUCAS ALLYSON HERMINIO SOUSA                 ", "LUCAS CARMO PASCHOAL                         ", "LUCAS DE OLIVEIRA LOBO                       ", "LUCAS HENRIQUE ANDRADE VILA NOVA             ", "MARCUS VINICIUS COSTA PEREIRA                ", "MARIA THEREZA GOMES DO NASCIMENTO ROQUE      ", "MICAEL ESPINOLA FONSECA TOMAZ                ", "MOISES DE ARAUJO OLIVEIRA                    ", "PEDRO HENRIQUE FERNANDES MACEDO              ", "PEDRO LIRA BANDEIRA                          ", "RAFAEL SA BENIGNO                            ", "RAFAELA TAVARES MARTINS                      ", "ROGERIO MOREIRA ALMEIDA                      ", "ROSMANYA MARLLA FIALHO DE LIMA FONSECA       ", "SABRINA ARAUJO CARDOSO                       ", "SAMARA LIMA CARDOSO                          ", "TULIO RAFAEL DE AGUIAR TAVARES               ", "UBIRAJARA POSSIANO DA SILVA FILHO            ", "VITOR TRINDADE ROCHA RIBEIRO                 ", "VITORIA JAMILLE GONCALVES DE OLIVEIRA NOBREGA", "WALISSON MAXIMINO MESSIAS                    ", "WILLIAM HENRIQUE AZEVEDO MARTINS             "
	Comando: .asciiz "Digite sua matrícula: "
	Inicio: .asciiz "A matrícula 1"
	Acerto: .asciiz " corresponde ao aluno "
	Erro: .asciiz " não foi encontrada"
	Eu: .asciiz "Sou eu! Eu sou ANDREY LUCYAN NASCIMENTO PAIVA, e tenho matrícula 119110324"
	
.text
	li $v0, 4			#Carrega 4 em $v0, para que a operação de exibir uma string seja realizada
	la $a0, Comando			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 5			#Carrega 5 em $v0, para que a operação de ler um inteiro seja realizada
	syscall				#Lê o inteiro
	
	add $a1, $zero, $v0		#Soma o conteúdo de $v0 a 0 e salva em $a1, para que tenhamos uma cópia do número fornecido
	
	beq $a1, $zero, exit		#Caso o número fornecido seja 0, encerrar o programa
	
	addi $a1, $a1, -100000000	#Soma o número fornecido com -100000000 para que removamos o 1 do começo da matrícula
	addi $a2, $zero, 0		#Inicializa o registrador $a2 com 0 para o loop
	addi $t8, $zero, 0		#Inicializa o registrador $t8 com 0 para o loop
	
	j Search			#(Executará caso o beq anterior não funcione) Inicia o loop de procura no array de matrículas 

Search:					#Realiza a procura no array de matrículas
	mul $a2, $t8, 4			#Multiplica o contador salvo em $t8 por 4 para servir de índice do array de matrículas
	lw $a3, Matriculas($a2)		#Carrega em $a3 o valor da posição $a2 do array de matrículas
	
	j Conversor			#Executa o conversor hexadecimal-decimal
	
Conversor:				#Converte o hexadecimal fornecido para decimal
	divu $t0, $a3, 0x10000000	#Isola o primeiro algarismo da matrícula e salva o resultado em $t0
	sll $t1, $a3, 4			#Desloca o número salvo em $a1 em 4 bits (1 algarismo hexadecimal) e salva o resultado em $t1
	divu $t1, $t1, 0x10000000	#Isola o segundo algarismo da matrícula e salva o resultado em $t1
	sll $t2, $a3, 8			#Desloca o número salvo em $a1 em 8 bits (2 algarismos hexadecimal) e salva o resultado em $t2
	divu $t2, $t2, 0x10000000	#Isola o terceiro algarismo da matrícula e salva o resultado em $t2
	sll $t3, $a3, 12		#Desloca o número salvo em $a1 em 12 bits (3 algarismos hexadecimal) e salva o resultado em $t3
	divu $t3, $t3, 0x10000000	#Isola o quarto algarismo da matrícula e salva o resultado em $t3
	sll $t4, $a3, 16		#Desloca o número salvo em $a1 em 16 bits (4 algarismos hexadecimal) e salva o resultado em $t4
	divu $t4, $t4, 0x10000000	#Isola o quinto algarismo da matrícula e salva o resultado em $t4
	sll $t5, $a3, 20		#Desloca o número salvo em $a1 em 20 bits (5 algarismos hexadecimal) e salva o resultado em $t5
	divu $t5, $t5, 0x10000000	#Isola o sexto algarismo da matrícula e salva o resultado em $t5
	sll $t6, $a3, 24		#Desloca o número salvo em $a1 em 24 bits (6 algarismos hexadecimal) e salva o resultado em $t6
	divu $t6, $t6, 0x10000000	#Isola o sétimo algarismo da matrícula e salva o resultado em $t6
	sll $t7, $a3, 28		#Desloca o número salvo em $a1 em 28 bits (7 algarismos hexadecimal) e salva o resultado em $t7
	divu $t7, $t7, 0x10000000	#Isola o oitavo algarismo da matrícula e salva o resultado em $t7
	
	mul $s7, $t7, 1			#Multiplica o oitavo algarismo da matrícula por 1 e salva o resultado em $s7
	mul $s6, $t6, 10		#Multiplica o sétimo algarismo da matrícula por 10 e salva o resultado em $s6
	mul $s5, $t5, 100		#Multiplica o sexto algarismo da matrícula por 100 e salva o resultado em $s5
	mul $s4, $t4, 1000		#Multiplica o quinto algarismo da matrícula por 1000 e salva o resultado em $s4
	mul $s3, $t3, 10000		#Multiplica o quarto algarismo da matrícula por 10000 e salva o resultado em $s3
	mul $s2, $t2, 100000		#Multiplica o terceiro algarismo da matrícula por 100000 e salva o resultado em $s2
	mul $s1, $t1, 1000000		#Multiplica o segundo algarismo da matrícula por 1000000 e salva o resultado em $s1
	mul $s0, $t0, 10000000		#Multiplica o primeiro algarismo da matrícula por 10000000 e salva o resultado em $s0
	
	add $t0, $zero, $s0		#Adiciona o primeiro algarismo da matrícula a $t0
	add $t0, $t0, $s1		#Adiciona o segundo algarismo da matrícula a $t0
	add $t0, $t0, $s2		#Adiciona o terceiro algarismo da matrícula a $t0
	add $t0, $t0, $s3		#Adiciona o quarto algarismo da matrícula a $t0
	add $t0, $t0, $s4		#Adiciona o quinto algarismo da matrícula a $t0
	add $t0, $t0, $s5		#Adiciona o sexto algarismo da matrícula a $t0
	add $t0, $t0, $s6		#Adiciona o sétimo algarismo da matrícula a $t0
	add $t0, $t0, $s7		#Adiciona o oitavo algarismo da matrícula a $t0
	
	beq $t0, $a1, Hit		#Caso o número encontrado seja igual ao fornecido, executa a rotina de acerto
	
	addi $t8, $t8, 1		#Adiciona 1 ao registrador $t8, servindo como contador para a procura no array
	
	beq $t8, 60, Miss		#Caso nenhuma matrícula seja correspondente ao número fornecido, executa a rotina correspondente
	
	j Search			#(Executará caso o beq anterior não funcione) Retorna à busca no array de matrículas
	
Hit:					#Executa a rotina de acerto
	beq $t8, 4, Meu			#Caso o contador de repetições aponte para o meu nome, executar a rotina correspondente
	
	mul $t9, $t8, 46		#Multiplica o contador salvo em $t8 por 46 para servir de índice do array de nomes
	li $v0, 4			#Carrega 4 em $v0, para que a operação de exibir uma string seja realizada
	la $a0, Inicio			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 1			#Carrega 1 em $v0, para que a operação de exibir um inteiro seja realizada
	add $a0, $a1, $zero		#Carrega o inteiro a ser exibido em $a0
	syscall				#Exibe o inteiro
	
	li $v0, 4			#Carrega 4 em $v0, para que a operação de exibir uma string seja realizada
	la $a0, Acerto			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 4			#Carrega 4 em $v0, para que a operação de exibir uma string seja realizada
	la $a0, Nomes($t9)		#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	j exit				#Encerra o programa
	
Meu:					#Exibe a mensagem de que a matrícula é a minha
	li $v0, 4			#Carrega 4 em $v0, para que a operação de exibir uma string seja realizada
	la $a0, Eu			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string	
	
	j exit				#Encerra o programa

Miss:					#Executa a rotina de erro
	li $v0, 4			#Carrega 4 em $v0, para que a operação de exibir uma string seja realizada
	la $a0, Inicio			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 1			#Carrega 1 em $v0, para que a operação de exibir um inteiro seja realizada
	add $a0, $a1, $zero		#Carrega o inteiro a ser exibido em $a0
	syscall				#Exibe o inteiro
	
	li $v0, 4			#Carrega 4 em $v0, para que a operação de exibir uma string seja realizada
	la $a0, Erro			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	j exit
	
exit:					#Executa a rotina de encerramento
	li $v0, 10			#Carrega 10 em $v0, para que a operação de encerrar a execução seja realizada
	syscall				#Executa o comando