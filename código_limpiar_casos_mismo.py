import pandas as pd

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
