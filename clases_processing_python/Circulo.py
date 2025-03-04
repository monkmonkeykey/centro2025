class Circulo:  
    def __init__(self,x,y,diametro,velocidad,color_actual,texto):
        self.x = x
        self.y = y
        self.diametro = diametro
        self.velocidad = velocidad
        self.color_actual = color_actual
        self.activa = True
        self.vibrar_activo = True
        self.texto = texto
        self.targetX = x
        self.targetY = y
        self.factor_easing = 0.025
    def dibujar(self):
        ellipseMode(CENTER)
        if self.activa:
            fill(self.color_actual,80,80)
            ellipse(self.x,self.y,self.diametro,self.diametro)
        
    def vibrar(self):
        if self.vibrar_activo:
            self.x += random(-self.velocidad, self.velocidad)
            self.y += random(-self.velocidad, self.velocidad)
        else:
            self.x = self.x
            self.y = self.y
    def salir_pantalla(self):
        if self.x <= - self.diametro or self.x >= width + self.diametro :
            self.activa = False
        elif self.y <= - self.diametro  or self.y >= height + self.diametro  :
            self.activa = False
    def crecer(self):
        if self.diametro <= 200:
            self.diametro += 0.25
    def mostrar_texto(self):
        fill(360)
        if self.vibrar_activo == True:
            text(self.texto,self.x + self.diametro/4 * 2.125 ,self.y + self.diametro/16)
        elif self.vibrar_activo == False:
            text(self.texto,self.x - self.diametro/4,self.y + self.diametro/16)
    def centrar(self):
       self.targetX = mouseX 
       self.targetY = mouseY 
    def easing(self):
        self.x += (self.targetX - self.x) * self.factor_easing
        self.y += (self.targetY - self.y) * self.factor_easing
