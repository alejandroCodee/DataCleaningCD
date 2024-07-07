import pandas as pd


#Modificar nombre del afiliado

"""
# Cargar el dataset desde un archivo Excel
df = pd.read_excel('CORREGIDO.xlsx')

# Imprimir los nombres de las columnas para verificar
print(df.columns)

# Definir una lista con las posibles variaciones de "MISMO HUESPED"
mismos = [
    'MISMO HUESPED', 'MISMA HUESPED', 'MISMO HUÉSPED', 'MISMO AFILIADO', 'MISMO HUESED', 
    'MISMO HUEPSED', 'ELLA MISMA', 'EL MISMO', 'MISMO H', 'M. H.', 'M. HUESPED', 'M.A.', 
    'M.H', 'M.H,', 'M.H.', 'M.H-.', 'M.H. /MILITAR'
]

# Verificar que las columnas C, D, E, F y Q existen
required_columns = ['Primer Nombre', 'Segundo Nombre', 'Primer Apellido', 'Segundo Apellido', 'Nombre completo del afiliado']
missing_columns = [col for col in required_columns if col not in df.columns]
if missing_columns:
    raise ValueError(f"Las siguientes columnas faltan en el DataFrame: {', '.join(missing_columns)}")

# Función para concatenar nombres
def concatenar_nombres(row):
    return f"{row['Primer Nombre']} {row['Segundo Nombre']} {row['Primer Apellido']} {row['Segundo Apellido']}"

# Reemplazar valores en la columna Q si están en la lista de variaciones
df['Nombre completo del afiliado'] = df.apply(lambda row: concatenar_nombres(row) if row['Nombre completo del afiliado'] in mismos else row['Nombre completo del afiliado'], axis=1)

# Guardar el DataFrame modificado en un nuevo archivo Excel
df.to_excel('CORREGIDO_modificado.xlsx', index=False)
"""


#Modificar la identidad del afiliado
"""
df = pd.read_excel('archivo_sin_duplicados.xlsx')

mismos = ["M. H.", "M.H.", "MH.", "MISMA HUESPED", "MISMO HUESPED"]

def actualizar_identidad(row):
    id_afiliado = row['Número de identidad del afiliado (Separado con guiones)']
    if id_afiliado in mismos:
        return row["Número de identidad del huésped (Separado por guiones)"]
    else:
        return row['Número de identidad del afiliado (Separado con guiones)']


df['Número de identidad del afiliado (Separado con guiones)'] = df.apply(actualizar_identidad, axis=1)

df.to_excel('CORREGIDO_modificado.xlsx', index=False)
"""


#Voy a hacer que la columna identidad del afiliado tenga exactamente el formato que necesito.
"""
df = pd.read_excel("CORREGIDO_modificado.xlsx")

def formato(valor):
    value_str = str(valor)

    if "-" in value_str:
        return value_str

    formato_valor = '-'.join(value_str[i:i+4] for i in range(0, len(value_str), 4))
    return  formato_valor

df["Número de identidad del afiliado (Separado con guiones)"] = df["Número de identidad del afiliado (Separado con guiones)"].apply(formato)


df.to_excel("formato_corregido.xlsx", index = False)

"""


#Código para arreglar mismos de telefono afiliado
"""
df = pd.read_excel("actual.xlsx")

mismos = ["M. H.", "M.H.", "MISMA HUESPED", "MISMO HUESPED", "MM.H.", ".H."]


def encontrar_mismos(row):
    tel_afiliado = row["Teléfono celular del afiliado (Separado con guión en medio)"]

    if tel_afiliado in mismos:
        return row["Teléfono celular (Separado con guión en medio)"]
    else: 
        return row["Teléfono celular del afiliado (Separado con guión en medio)"] 


#Actualizar la columna
df["Teléfono celular del afiliado (Separado con guión en medio)"] = df.apply(encontrar_mismos, axis = 1)

df.to_excel("indNumeroA_corregido.xlsx" , index = False)
"""

#Código para dar formato al número de celular del afiliado
"""
df = pd.read_excel("indNumeroA_corregido.xlsx")

def formato(valor):
    value_str = str(valor)

    if "-" in value_str:
        return value_str

    # Asegurar que el valor tenga al menos 8 caracteres
    if len(value_str) != 8:
        return value_str  # No formatear si no tiene 8 dígitos

    # Añadir el guión en la posición correcta
    formato_valor = value_str[:4] + '-' + value_str[4:]
    return formato_valor



df["Teléfono celular del afiliado (Separado con guión en medio)"] = df["Teléfono celular del afiliado (Separado con guión en medio)"].apply(formato)


df.to_excel("formato_corregido.xlsx", index = False)
"""

#Código para el numero telefonico del paciente
"""
df = pd.read_excel("formato_corregido.xlsx")


mismosA = [
"MILSMO AFILIADO",
"MISMO AFILIADO",
"M. AFILIADA",
"M. A.",
"MISMO AFILIADO",
"M.A."
]

mismosH = [
"MISMO HUESPED",
"M.H.",
"M. H."
]


def encontrar_mismos(row):
    tel_afiliado = row["Teléfono celular del afiliado (Separado con guión en medio)"]
    tel_huesped = row["Teléfono celular (Separado con guión en medio)"]
    tel_paciente = row["Teléfono celular del paciente (Separado con guión en medio)"]

    if tel_paciente in mismosA:
        return tel_afiliado
    elif tel_paciente in mismosH:
        return tel_huesped
    else:
        return tel_paciente

df["Teléfono celular del paciente (Separado con guión en medio)"] = df.apply(encontrar_mismos, axis = 1)

df.to_excel("Telefono_del_paciente.xlsx", index = False)
"""

#CODIGO PARA EL NOMBRE DEL PACIENTE

df = pd.read_excel("Telefono_del_paciente.xlsx")


mismosA = [
",M.A.",
"|M.A.",
"MISMO AFILIADO",
"MISMOS AFILIADOS",
"Mismo afiliado",
"MISMA AFILIADA",
"MISMO AFILIADO Y SUS BEBES RECIEN NACIDOS"
]

mismosH = [
"MISMO HUESPED",
"EL MISMO HUESPED",
"MISMA HUESPED",
"MISMO",
"EL MISMO",
"LA MISMA",
"MISMA HUESPED Y MATEO VALLADARES",
"MISMA HUESPED Y RECIEN NACIDAS",
"ELLA MISMA"
]

#Function que concatene los nombres por si es huesped.
def concatenar_nombres(row):
    return f"{row['Primer Nombre']} {row['Segundo Nombre']} {row['Primer Apellido']} {row['Segundo Apellido']}"


#Function para encontrar los iguales
def encontrar_mismos(row):
    nombre_paciente = row["Nombre del paciente"]
    nombre_afiliado = row["Nombre completo del afiliado"]

    if nombre_paciente in mismosA:
        return nombre_afiliado
    elif nombre_paciente in mismosH:
        return concatenar_nombres(row)
    else:
        return nombre_paciente



df["Nombre del paciente"] = df.apply(encontrar_mismos, axis = 1)

df.to_excel("Nombre_del_paciente.xlsx", index = False)

