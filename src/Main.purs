module Main where

import Prelude
import Data.Array (sortBy, sortWith, reverse, (:))
import Data.String (length)

type Usuario = {nombre :: String, apellido :: String}

-- Lenguaje declarativo
-- Todo son funciones
-- (Las constantes son sólo funciones sin argumentos)
admin :: Usuario
admin = {nombre: "Esteban", apellido: "Encina"}

-- Funciones simples y componibles
-- En programación funcional, se utilizan funciones pequeñas
-- como bloques para construir funciones más grandes
nombreCompleto :: Usuario -> String
nombreCompleto u = u.apellido <> ", " <> u.nombre

-- Inmutabilidad
-- Las estructuras de datos son INMUTABLES: siempre se copian para modificarse
conAdmin :: Array Usuario -> Array Usuario
conAdmin us = admin:us

-- Pureza
-- Las funciones no tienen efectos secundarios
-- No existe un "estado compartido global"
-- No podemos tener variables (¡porque son variables!)

-- Herramientas básicas
-- Al no tener variables ni bucles, necesitamos las herramientas que nos da el lenguaje
-- (map, filter, fold)
nombresUsuarios :: Array Usuario -> Array String
nombresUsuarios = map nombreCompleto

ordenAlfabetico :: Array Usuario -> Array Usuario
ordenAlfabetico = sortWith (_.nombre)

-- Matcheo de patrones
-- Aunque existen sentencias condicionales, muchas veces nos basta con patrones
esBermudez :: Usuario -> String
esBermudez {nombre: _, apellido: a@"Bermúdez"} = a <> " es Bermúdez"
esBermudez {nombre: _, apellido: a} = a <> " no es Bermúdez"

-- Currificación
-- Todas las funciones son unarias (reciben un argumento y devuelven un valor)
-- Así es más fácil componerlas
compararRango :: Usuario -> Usuario -> Ordering
compararRango u1 u2 = length u1.nombre `compare` length u2.nombre

-- Notación point-free
-- Escribir las funciones sin argumentos se acerca más a la filosofía declarativa
mostrarPorRango :: Array Usuario -> Array String
mostrarPorRango = nombresUsuarios <<< reverse <<< sortBy compararRango
