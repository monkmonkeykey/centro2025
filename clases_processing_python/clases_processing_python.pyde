execfile("Circulo.py")
texto = "mafufi"
circulos = []
ultimo_circulo = None
numero_circulos = 1
factor_velocidad = 5
elipses_activas = None

def setup():
    global x, y 
    size(500,500)
    colorMode(HSB,360,100,100)

    for _ in range(numero_circulos):
        diametro = random(5,15)
        x = random(diametro, width - diametro) 
        y = random(diametro, height - diametro)
        velocidad = random(1, factor_velocidad)
        color_actual = random(360)
    
        circulos.append(Circulo(x,y,diametro,velocidad,color_actual,texto))
        
def draw():
    background(50)
    elipses_activas = 0
    for circulo in circulos:
        if circulo.activa:
            circulo.dibujar()
            circulo.vibrar()
            circulo.salir_pantalla()
            circulo.mostrar_texto()
            elipses_activas += 1
            ultimo_circulo = circulo
    if elipses_activas == 1 and ultimo_circulo is not None:
        ultimo_circulo.vibrar_activo = False
        ultimo_circulo.dibujar()
        ultimo_circulo.mostrar_texto()
        ultimo_circulo.crecer()
        ultimo_circulo.centrar()
        ultimo_circulo.easing()
        
    println(elipses_activas)
