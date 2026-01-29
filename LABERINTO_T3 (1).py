class LaberintoSolver:

    def __init__(self):
        self.LABERINTO = [
            [ 0,  1,  1,  1,  1,  1,  1,  1,  1],
            [ 1, 99,  1, 99,  1, 99,  1, 99,  1],
            [ 1,  1, -2,  1,  1,  1, 99,  1,  1],
            [ 1, 99,  1, 99,  1, 99,  1, 99,  1],
            [ 1,  1,  1,  1,  3,  1,  1,  1,  1],
            [ 1, 99,  1, 99,  1, 99,  1, 99,  1],
            [ 1, -2,  1,  1,  1,  1,  1,  1,  1],
            [ 1, 99,  1, 99,  1, 99,  1, 99,  1],
            [ 1,  1,  1,  1,  1,  1,  1,  1,  0]
        ]
        
        self.FILAS, self.COLUMNAS = 9, 9
        self.ENERGIA_INICIAL = 18
        self.INICIO = (0, 0)
        self.FIN = (8, 8)
        
        self.SOLUCION_MATRIZ = [[0] * self.COLUMNAS for _ in range(self.FILAS)]
        
        self.MOVIMIENTOS = [(0, -1), (1, 0), (-1, 0), (0, 1)]

    def mostrar_matriz(self, matriz):
        for fila in matriz:
            print(" ".join(f"{c:3}" for c in fila))

    def es_movimiento_valido(self, fila, columna, energia_restante_despues_paso):

        if not (0 <= fila < self.FILAS and 0 <= columna < self.COLUMNAS):
            return False

        if self.LABERINTO[fila][columna] == 99:
            return False
            
        if self.SOLUCION_MATRIZ[fila][columna] == 1:
            return False

        if energia_restante_despues_paso < 0:
            return False

        return True

    def resolver_laberinto_recursivo(self, fila_actual, col_actual, energia_actual):
        
        gasto_o_reposicion = self.LABERINTO[fila_actual][col_actual]
        
        if (fila_actual, col_actual) == self.INICIO:
            energia_despues_paso = energia_actual
        else:
            energia_despues_paso = energia_actual - gasto_o_reposicion

        if (fila_actual, col_actual) == self.FIN:
            self.SOLUCION_MATRIZ[fila_actual][col_actual] = 1
            return True

        self.SOLUCION_MATRIZ[fila_actual][col_actual] = 1

        for dr, dc in self.MOVIMIENTOS:
            nueva_fila, nueva_col = fila_actual + dr, col_actual + dc
            
            if 0 <= nueva_fila < self.FILAS and 0 <= nueva_col < self.COLUMNAS:
                costo_siguiente_celda = self.LABERINTO[nueva_fila][nueva_col]
                energia_futura = energia_despues_paso - costo_siguiente_celda
                
                if self.es_movimiento_valido(nueva_fila, nueva_col, energia_futura):
                    if self.resolver_laberinto_recursivo(nueva_fila, nueva_col, energia_despues_paso):
                        return True
    
        self.SOLUCION_MATRIZ[fila_actual][col_actual] = 0
        return False

    def ejecutar(self):
        print("LABERINTO ORIGINAL")
        self.mostrar_matriz(self.LABERINTO)
        print(f"\nENERGÍA INICIAL: {self.ENERGIA_INICIAL}")

        solucion_encontrada = self.resolver_laberinto_recursivo(self.INICIO[0], self.INICIO[1], self.ENERGIA_INICIAL)

        print("\nRESULTADO DE LA EJECUCIÓN")
        
        if solucion_encontrada:
            print("\nSE LOGRÓ LA SALIDA. CAMINO ENCONTRADO.")
            self.SOLUCION_MATRIZ[self.INICIO[0]][self.INICIO[1]] = 1
            self.mostrar_matriz(self.SOLUCION_MATRIZ)
        else:
            print("\nNO SE LOGRÓ LA SALIDA. NO HAY CAMINO VÁLIDO CON LA ENERGÍA DISPONIBLE.")
            self.mostrar_matriz(self.SOLUCION_MATRIZ)

if __name__ == "__main__":
    solver = LaberintoSolver()
    solver.ejecutar()