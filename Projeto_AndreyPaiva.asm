.data
	Matriculas: .word 0x20111766, 0x19110394, 0x19110236, 0x19111026, 0x19110324, 0x20210674, 0x19110386, 0x18110269, 0x20110520, 0x20111601, 0x18210553, 0x19110420, 0x19111418, 0x19110904, 0x18110318, 0x18210651, 0x19110524, 0x19111014, 0x19110191, 0x19111664, 0x18210469, 0x19111299, 0x19110929, 0x19111150, 0x19210570, 0x19110421, 0x19110734, 0x18210809, 0x22111275, 0x18110402, 0x18210499, 0x22110406, 0x19110177, 0x20110415, 0x20111610, 0x20111401, 0x19110415, 0x19210861, 0x20111044, 0x21111310, 0x19110030, 0x20110266, 0x19111203, 0x17210743, 0x19110376, 0x19110390, 0x20210121, 0x19110779, 0x19110423, 0x18111101, 0x21110599, 0x19111090, 0x18210114, 0x19110785, 0x20110898, 0x20210436, 0x19110104, 0x20210601, 0x21111274, 0x19111128
	Nomes: .asciiz "ADEILSON DE SOUSA LEAL                       \n", "AIRON CIRILO GUENES FILHO                    \n", "ALYSSON MACHADO DE OLIVEIRA BARBOSA          \n", "ANDERSON MARCOS SILVA                        \n", "ANDREY LUCYAN NASCIMENTO PAIVA               \n", "BARBARA BEZERRA BARBOSA                      \n", "BRUNO NASCIMENTO GOMES DE OLIVEIRA           \n", "CAIO VASCONCELOS BENIGNO DE ABRANTES         \n", "CLEISSON DE ALENCAR RAMOS                    \n", "DAVI AUGUSTO MONTEIRO GONZAGA                \n", "DEBORA DA SILVA COSTA                        \n", "DIEGO ALMEIDA DIAS                           \n", "DOUGLAS BARROS CALISTA                       \n", "EDGLEY DA SILVA CARVALHO FILHO               \n", "EDUARDO LUIS FERREIRA BARBOSA                \n", "EUDES MEDEIROS                               \n", "FABIO VICTOR GALDINO NASCIMENTO              \n", "FELIPE ALEXANDRE DA SILVA BENTO              \n", "FELIPE LUCENA SOUZA MEDEIROS                 \n", "FERNANDO HENRIQUE DE SOUSA SILVA             \n", "FILIPE JOSE FERREIRA DE ARAUJO               \n", "FRANCINILDO BARBOSA FIGUEIREDO               \n", "HEBERT SANTOS CRISPIM                        \n", "HELSON JADER ROCHA                           \n", "HIGOR COSTA DE OLIVEIRA                      \n", "IGOR COSTA XAVIER                            \n", "IURY CHAGAS DA SILVA CAETANO                 \n", "JACKSON DA SILVA GUEDES                      \n", "JANIELE PEREIRA BENICIO                      \n", "JESSYCA DAYANE SOUSA BRANDAO                 \n", "JOSE HELIO DE ARAUJO JUNIOR                  \n", "JOSE TAYRONE SANTOS DE OLIVEIRA              \n", "JULIA RAMALHO COSTA SOUZA                    \n", "KAYO MATHEUS ARAUJO SANTOS                   \n", "LAVNIS OLIVEIRA DE ARAUJO                    \n", "LEIRY GABRIELLE MARQUES LUZ PINTO            \n", "LEONARDO PESSOA BANDEIRA LACERDA             \n", "LINDEMBERG COSTA LUNA                        \n", "LUCAS ALLYSON HERMINIO SOUSA                 \n", "LUCAS CARMO PASCHOAL                         \n", "LUCAS DE OLIVEIRA LOBO                       \n", "LUCAS HENRIQUE ANDRADE VILA NOVA             \n", "MARCUS VINICIUS COSTA PEREIRA                \n", "MARIA THEREZA GOMES DO NASCIMENTO ROQUE      \n", "MICAEL ESPINOLA FONSECA TOMAZ                \n", "MOISES DE ARAUJO OLIVEIRA                    \n", "PEDRO HENRIQUE FERNANDES MACEDO              \n", "PEDRO LIRA BANDEIRA                          \n", "RAFAEL SA BENIGNO                            \n", "RAFAELA TAVARES MARTINS                      \n", "ROGERIO MOREIRA ALMEIDA                      \n", "ROSMANYA MARLLA FIALHO DE LIMA FONSECA       \n", "SABRINA ARAUJO CARDOSO                       \n", "SAMARA LIMA CARDOSO                          \n", "TULIO RAFAEL DE AGUIAR TAVARES               \n", "UBIRAJARA POSSIANO DA SILVA FILHO            \n", "VITOR TRINDADE ROCHA RIBEIRO                 \n", "VITORIA JAMILLE GONCALVES DE OLIVEIRA NOBREGA\n", "WALISSON MAXIMINO MESSIAS                    \n", "WILLIAM HENRIQUE AZEVEDO MARTINS             \n"
	Comando: .asciiz "Digite sua matr�cula: "
	Inicio: .asciiz "A matr�cula 1"
	Acerto: .asciiz " corresponde ao aluno "
	Erro: .asciiz " n�o foi encontrada\n"
	Eu: .asciiz "Sou eu! Eu sou ANDREY LUCYAN NASCIMENTO PAIVA, e tenho matr�cula 119110324\n"
	
.text
Start:
	li $v0, 4			#Carrega 4 em $v0, para que a opera��o de exibir uma string seja realizada
	la $a0, Comando			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 5			#Carrega 5 em $v0, para que a opera��o de ler um inteiro seja realizada
	syscall				#L� o inteiro
	
	add $a1, $zero, $v0		#Soma o conte�do de $v0 a 0 e salva em $a1, para que tenhamos uma c�pia do n�mero fornecido
	
	beq $a1, $zero, exit		#Caso o n�mero fornecido seja 0, encerrar o programa
	
	addi $a1, $a1, -100000000	#Soma o n�mero fornecido com -100000000 para que removamos o 1 do come�o da matr�cula
	addi $a2, $zero, 0		#Inicializa o registrador $a2 com 0 para o loop
	addi $t8, $zero, 0		#Inicializa o registrador $t8 com 0 para o loop
	
	j Search			#(Executar� caso o beq anterior n�o funcione) Inicia o loop de procura no array de matr�culas 

Search:					#Realiza a procura no array de matr�culas
	mul $a2, $t8, 4			#Multiplica o contador salvo em $t8 por 4 para servir de �ndice do array de matr�culas
	lw $a3, Matriculas($a2)		#Carrega em $a3 o valor da posi��o $a2 do array de matr�culas
	
	j Conversor			#Executa o conversor hexadecimal-decimal
	
Conversor:				#Converte o hexadecimal fornecido para decimal
	divu $t0, $a3, 0x10000000	#Isola o primeiro algarismo da matr�cula e salva o resultado em $t0
	sll $t1, $a3, 4			#Desloca o n�mero salvo em $a1 em 4 bits (1 algarismo hexadecimal) e salva o resultado em $t1
	divu $t1, $t1, 0x10000000	#Isola o segundo algarismo da matr�cula e salva o resultado em $t1
	sll $t2, $a3, 8			#Desloca o n�mero salvo em $a1 em 8 bits (2 algarismos hexadecimal) e salva o resultado em $t2
	divu $t2, $t2, 0x10000000	#Isola o terceiro algarismo da matr�cula e salva o resultado em $t2
	sll $t3, $a3, 12		#Desloca o n�mero salvo em $a1 em 12 bits (3 algarismos hexadecimal) e salva o resultado em $t3
	divu $t3, $t3, 0x10000000	#Isola o quarto algarismo da matr�cula e salva o resultado em $t3
	sll $t4, $a3, 16		#Desloca o n�mero salvo em $a1 em 16 bits (4 algarismos hexadecimal) e salva o resultado em $t4
	divu $t4, $t4, 0x10000000	#Isola o quinto algarismo da matr�cula e salva o resultado em $t4
	sll $t5, $a3, 20		#Desloca o n�mero salvo em $a1 em 20 bits (5 algarismos hexadecimal) e salva o resultado em $t5
	divu $t5, $t5, 0x10000000	#Isola o sexto algarismo da matr�cula e salva o resultado em $t5
	sll $t6, $a3, 24		#Desloca o n�mero salvo em $a1 em 24 bits (6 algarismos hexadecimal) e salva o resultado em $t6
	divu $t6, $t6, 0x10000000	#Isola o s�timo algarismo da matr�cula e salva o resultado em $t6
	sll $t7, $a3, 28		#Desloca o n�mero salvo em $a1 em 28 bits (7 algarismos hexadecimal) e salva o resultado em $t7
	divu $t7, $t7, 0x10000000	#Isola o oitavo algarismo da matr�cula e salva o resultado em $t7
	
	mul $s7, $t7, 1			#Multiplica o oitavo algarismo da matr�cula por 1 e salva o resultado em $s7
	mul $s6, $t6, 10		#Multiplica o s�timo algarismo da matr�cula por 10 e salva o resultado em $s6
	mul $s5, $t5, 100		#Multiplica o sexto algarismo da matr�cula por 100 e salva o resultado em $s5
	mul $s4, $t4, 1000		#Multiplica o quinto algarismo da matr�cula por 1000 e salva o resultado em $s4
	mul $s3, $t3, 10000		#Multiplica o quarto algarismo da matr�cula por 10000 e salva o resultado em $s3
	mul $s2, $t2, 100000		#Multiplica o terceiro algarismo da matr�cula por 100000 e salva o resultado em $s2
	mul $s1, $t1, 1000000		#Multiplica o segundo algarismo da matr�cula por 1000000 e salva o resultado em $s1
	mul $s0, $t0, 10000000		#Multiplica o primeiro algarismo da matr�cula por 10000000 e salva o resultado em $s0
	
	add $t0, $zero, $s0		#Adiciona o primeiro algarismo da matr�cula a $t0
	add $t0, $t0, $s1		#Adiciona o segundo algarismo da matr�cula a $t0
	add $t0, $t0, $s2		#Adiciona o terceiro algarismo da matr�cula a $t0
	add $t0, $t0, $s3		#Adiciona o quarto algarismo da matr�cula a $t0
	add $t0, $t0, $s4		#Adiciona o quinto algarismo da matr�cula a $t0
	add $t0, $t0, $s5		#Adiciona o sexto algarismo da matr�cula a $t0
	add $t0, $t0, $s6		#Adiciona o s�timo algarismo da matr�cula a $t0
	add $t0, $t0, $s7		#Adiciona o oitavo algarismo da matr�cula a $t0
	
	beq $t0, $a1, Hit		#Caso o n�mero encontrado seja igual ao fornecido, executa a rotina de acerto
	
	addi $t8, $t8, 1		#Adiciona 1 ao registrador $t8, servindo como contador para a procura no array
	
	beq $t8, 60, Miss		#Caso nenhuma matr�cula seja correspondente ao n�mero fornecido, executa a rotina correspondente
	
	j Search			#(Executar� caso o beq anterior n�o funcione) Retorna � busca no array de matr�culas
	
Hit:					#Executa a rotina de acerto
	beq $t8, 4, Meu			#Caso o contador de repeti��es aponte para o meu nome, executar a rotina correspondente
	
	mul $t9, $t8, 47		#Multiplica o contador salvo em $t8 por 46 para servir de �ndice do array de nomes
	li $v0, 4			#Carrega 4 em $v0, para que a opera��o de exibir uma string seja realizada
	la $a0, Inicio			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 1			#Carrega 1 em $v0, para que a opera��o de exibir um inteiro seja realizada
	add $a0, $a1, $zero		#Carrega o inteiro a ser exibido em $a0
	syscall				#Exibe o inteiro
	
	li $v0, 4			#Carrega 4 em $v0, para que a opera��o de exibir uma string seja realizada
	la $a0, Acerto			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 4			#Carrega 4 em $v0, para que a opera��o de exibir uma string seja realizada
	la $a0, Nomes($t9)		#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	j Start				#Reinicia o programa
	
Meu:					#Exibe a mensagem de que a matr�cula � a minha
	li $v0, 4			#Carrega 4 em $v0, para que a opera��o de exibir uma string seja realizada
	la $a0, Eu			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string	
	
	j Start				#Reinicia o programa

Miss:					#Executa a rotina de erro
	li $v0, 4			#Carrega 4 em $v0, para que a opera��o de exibir uma string seja realizada
	la $a0, Inicio			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	li $v0, 1			#Carrega 1 em $v0, para que a opera��o de exibir um inteiro seja realizada
	add $a0, $a1, $zero		#Carrega o inteiro a ser exibido em $a0
	syscall				#Exibe o inteiro
	
	li $v0, 4			#Carrega 4 em $v0, para que a opera��o de exibir uma string seja realizada
	la $a0, Erro			#Carrega a string a ser exibida em $a0
	syscall				#Exibe a string
	
	j Start				#Reinicia o programa
	
exit:					#Executa a rotina de encerramento
	li $v0, 10			#Carrega 10 em $v0, para que a opera��o de encerrar a execu��o seja realizada
	syscall				#Executa o comando
