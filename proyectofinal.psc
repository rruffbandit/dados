
//calculo de score
SubAlgoritmo petty <- CALCULOSCORE( ra, re, ri, ro, ru, ry)
	petty <- ra + re + ro + ru + ri + ry
FinSubAlgoritmo


//UNOSSSSSS
SubAlgoritmo potty <- PUNTAJEUNOS( cant_u )
	definir basic_u,special_u Como Entero
	basic_u = 100//basico de uno
	special_u = 1000//especial de 3 jackPOT
	si(cant_u <> 0) Entonces
		Segun cant_u Hacer
			1: potty <- basic_u
			2: potty <- basic_u*2
			3: potty <- special_u
			4: potty <- special_u *2
			5: potty <- special_u *4
			6: potty <- special_u * 10 //mega jackpot WINNER gana el juego de una
		FinSegun
	SiNo
		potty <- 0
	FinSi
FinSubAlgoritmo

//contador
SubAlgoritmo patty <- CONTADORES( datos, b )
	definir contador Como Entero
	para i = 1 hasta 6 con paso 1 Hacer
		si( datos[i] == b) Entonces
			contador = contador + 1
		FinSi
	FinPara
	patty <- contador
FinSubAlgoritmo


//todos los num distintos de 1 y 5(cuando es mayor a 2)
SubAlgoritmo putty <- TODOLODEMAS( a, cant_a)
	definir basic Como Entero
	basic = a * 100
	si(cant_a > 2) Entonces
		segun cant_a Hacer
			3: putty <- basic
			4: putty <- basic * 2
			5: putty <- basic * 4
			6: putty <- basic * 8
		FinSegun
	SiNo
		putty <- 0
	FinSi
FinSubAlgoritmo

Algoritmo FUNCIONESDADOSAA
	definir aux, i, j,score como entero
	definir nom Como Caracter
	dimension dados[6]
	
	escribir "dados 10,000 con funciones bc fuck it"
	escribir "ingrese su nombre AEUGH"
	leer nom
	
	score = 0;
	
	
	mientras score < 10000 Hacer
		
		escribir "aight get rEADY 6 DADOS LETSSS GOOOOO!!!!!!!!!!!!!!!!!"
		
		para i = 1 hasta 6 con paso 1 Hacer
			dados[i] = Aleatorio(1,6) //1 a 6 duhh
		FinPara
		//ORGANIZO DADOS
		aux = 0;
		para i = 1 hasta 6 con paso 1 Hacer
			para j = 1 hasta 6 con paso 1 Hacer
				si(dados[i] < dados[j]) Entonces
					aux = dados[j]
					dados[j] = dados[i]
					dados[i] = aux
				FinSi
			FinPara
		FinPara
		//MUESTRO LOS DADOS GRRFKUWUGHLKR
		para i = 1 hasta 6 con paso 1 Hacer
			escribir Sin Saltar"[", dados[i], "]"
		FinPara
		escribir ""
		
		//variable de contadores
		c_uno = CONTADORES( dados , 1)
		c_dos = CONTADORES( dados , 2)
		c_tres = CONTADORES( dados , 3)
		c_cuatro = CONTADORES( dados , 4)
		c_cinco = CONTADORES( dados , 5)
		c_seis = CONTADORES( dados , 6)
		
		
		//puntaje de cada uno
		p_unos = PUNTAJEUNOS(c_uno)
		p_tres = TODOLODEMAS(3, c_tres)
		p_cuatro = TODOLODEMAS(4, c_cuatro)
		p_dos = TODOLODEMAS(2, c_dos)
		p_cinco = TODOLODEMAS(5, c_cinco)
		p_seis = TODOLODEMAS(6, c_seis)
		
		score = CALCULOSCORE (p_unos,p_dos,p_tres,p_cuatro,p_cinco,p_seis) + score 
		escribir score
		leer n
		
	FinMientras
	
	
	
FinAlgoritmo
