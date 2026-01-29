import random

def generar_palabra_4_letras():
    return ''.join(chr(random.randint(97, 122)) for _ in range(4))

def crear_matriz_cuadrada(n):
    return [[generar_palabra_4_letras() for _ in range(n)] for _ in range(n)]

def contiene_vocal(palabra):
    vocales = set('aeiou')
    return any(letra in vocales for letra in palabra)

def contar_vocales_divide_venceras(filas):
    if len(filas) == 1:
        return sum(1 for palabra in filas[0] if contiene_vocal(palabra))
    else:
        medio = len(filas) // 2
        izquierda = filas[:medio]
        derecha = filas[medio:]
        return contar_vocales_divide_venceras(izquierda) + contar_vocales_divide_venceras(derecha)

def mostrar_matriz(matriz):
    for fila in matriz:
        print(' '.join(fila))

n = 8
matriz = crear_matriz_cuadrada(n)
print("Matriz 8x8 generada:\n")
mostrar_matriz(matriz)

total_con_vocal = contar_vocales_divide_venceras(matriz)
print(f"\nTotal de palabras con al menos una vocal: {total_con_vocal}")
