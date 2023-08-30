

//calculo de score, p refiriendose a puntos
SubAlgoritmo petty <- CALCULOSCORE( p_unos, p_dos, p_tres, p_cuatro, p_cincos, p_seis)
	petty <-p_unos + p_dos+ p_tres+ p_cuatro+ p_cincos+ p_seis
	
FinSubAlgoritmo


//funcion solo para unos, recibe contador de unos, sale el puntaje
SubAlgoritmo potty <- PUNTAJEUNOS( cant_u )
	definir basic_u,special_u Como Entero
	basic_u = 100//basico de uno
	special_u = 1000//especial de 3 jackpot
	si(cant_u <> 0) Entonces
		Segun cant_u Hacer
			1: potty <- basic_u
			2: potty <- basic_u*2
			3: potty <- special_u
			4: potty <- special_u *2
			5: potty <- special_u *4
			6: potty <- special_u * 10 //<- gana el juego
		FinSegun
	SiNo
		potty <- 0
	FinSi
FinSubAlgoritmo

//contador,cuantos hay de que numero
SubAlgoritmo patty <- CONTADORES( datos, b )
	definir contador Como Entero
	para i = 1 hasta 6 con paso 1 Hacer
		si( datos[i] == b) Entonces
			contador = contador + 1
		FinSi
	FinPara
	patty <- contador
FinSubAlgoritmo


//todos los num distintos de 1, recibe contador y el numero, sale el puntaje
SubAlgoritmo putty <- PUNTAJE_N( a, cant_a)
	definir basic Como Entero
	basic = a * 100
	
	si( a == 5 Y cant_a <> 0) Entonces
		segun cant_a hacer
			1: putty <- 50
			2: putty <- 100
		FinSegun
	SiNo
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
	FinSi
	
FinSubAlgoritmo

Algoritmo Dados_
	definir aux, i, j,score como entero
	definir nom Como Caracter
	dimension dados[6]
	dimension title[10]
	
	title[1] = "____                  __                          _      __          __       __       __     "
	title[2] = "/\  _`\               /\ \                       /* \   /*__`\      /*__`\   /*__`\   /*__`\   "
	title[3] = "\ \ \/\ \     __      \_\ \     ___     ____    /\_, \ /\ \/\ \    /\ \/\ \ /\ \/\ \ /\ \/\ \  "
	title[4] = " \ \ \ \ \  /*__`\    /*_` \   / __`\  /*,__\   \/_/\ \\ \ \ \ \   \ \ \ \ \\ \ \ \ \\ \ \ \ \ "
	title[5] = "  \ \ \_\ \/\ \L\.\_ /\ \L\ \ /\ \L\ \/\__, `\     \ \ \\ \ \_\ \ __\ \ \_\ \\ \ \_\ \\ \ \_\ \"
	title[6] = "   \ \____/\ \__/.\_\\ \___,_\\ \____/\/\____/      \ \_\\ \____//\ \\ \____/ \ \____/ \ \____/"
	title[7] = "    \/___/  \/__/\/_/ \/__,_ / \/___/  \/___/        \/_/ \/___/ \ \/ \/___/   \/___/   \/___/ "
	
	para i = 1 hasta 7 con paso 1 hacer
		escribir title[i]
	FinPara
	
	escribir ""
	escribir "ingrese su nombre :)"
	leer nom
	
	
	score = 0
	turno = 1
	
	mientras score < 10000 Hacer
		
		escribir "turno = ",turno
		escribir "** lanza dados **"
		para i = 1 hasta 6 con paso 1 Hacer
			dados[i] = Aleatorio(1,6) //lleno los dados de 1 a 6
		FinPara
		//organizo los dados de menor a mayor (me va a servir luego)
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
		//muestro los dados en pantalla
		para i = 1 hasta 6 con paso 1 Hacer
			escribir Sin Saltar"[", dados[i], "]"
		FinPara
		escribir ""
		
		
		repetir
			escribir "le gustaria cambiar dados? 1_Si 0_No"
			leer r
			
			si(r = 1) Entonces
				repetir
					escribir "que dado?"
					leer n
					
					para i = 1 hasta 6 con paso 1 Hacer
						si(i = n) Entonces
						dados[i] = Aleatorio(1,6)
						FinSi
					FinPara
					escribir ""
						para j = 1 hasta 6 con paso 1 Hacer
							escribir Sin Saltar"[", dados[j], "]"
						FinPara
					escribir "algun otro? 1_si 0_No"
					leer p
				hasta que p = 0
				r = 0
				
			FinSi
			
			
			
		hasta que r = 0
		
		//variable de contadores
		c_uno = CONTADORES( dados , 1)
		c_dos = CONTADORES( dados , 2)
		c_tres = CONTADORES( dados , 3)
		c_cuatro = CONTADORES( dados , 4)
		c_cinco = CONTADORES( dados , 5)
		c_seis = CONTADORES( dados , 6)
		
		
		//puntaje de cada uno
		p_unos = PUNTAJEUNOS(c_uno)
		p_tres = PUNTAJE_N(3, c_tres)
		p_cuatro = PUNTAJE_N(4, c_cuatro)
		p_dos = PUNTAJE_N(2, c_dos)
		p_cinco = PUNTAJE_N(5, c_cinco)
		p_seis = PUNTAJE_N(6, c_seis)
		
		score = CALCULOSCORE(p_unos,p_dos,p_tres,p_cuatro,p_cinco,p_seis) + score 
		escribir "S C O R E  ",score "/10,000"
		turno = turno + 1
		
	FinMientras
	
	
	
FinAlgoritmo
