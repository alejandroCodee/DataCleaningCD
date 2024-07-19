import pandas as pd

def concatenar_nombres(row):
    return f"{row['Primer Nombre']} {row['Segundo Nombre']} {row['Primer Apellido']} {row['Segundo Apellido']}"

df = pd.read_excel('CORREGIDO.xlsx')

required_columns = ['Primer Nombre', 'Segundo Nombre', 'Primer Apellido', 'Segundo Apellido', 'Nombre completo del afiliado']
missing_columns = [col for col in required_columns if col not in df.columns]
if missing_columns:
    raise ValueError(f"Las siguientes columnas faltan en el DataFrame: {', '.join(missing_columns)}")

mismos = [
    'MISMO HUESPED', 'MISMA HUESPED', 'MISMO HUÉSPED', 'MISMO AFILIADO', 'MISMO HUESED', 
    'MISMO HUEPSED', 'ELLA MISMA', 'EL MISMO', 'MISMO H', 'M. H.', 'M. HUESPED', 'M.A.', 
    'M.H', 'M.H,', 'M.H.', 'M.H-.', 'M.H. /MILITAR'
]

df['Nombre completo del afiliado'] = df.apply(lambda row: concatenar_nombres(row) if row['Nombre completo del afiliado'] in mismos else row['Nombre completo del afiliado'], axis=1)

df.to_excel('CORREGIDO_modificado.xlsx', index=False)

df = pd.read_excel('archivo_sin_duplicados.xlsx')
mismos = ["M. H.", "M.H.", "MH.", "MISMA HUESPED", "MISMO HUESPED"]

def actualizar_identidad(row):
    id_afiliado = row['Número de identidad del afiliado (Separado con guiones)']
    if id_afiliado in mismos:
        return row["Número de identidad del huésped (Separado por guiones)"]
    else:
        return id_afiliado

df['Número de identidad del afiliado (Separado con guiones)'] = df.apply(actualizar_identidad, axis=1)
df.to_excel('CORREGIDO_modificado.xlsx', index=False)

df = pd.read_excel("CORREGIDO_modificado.xlsx")

def formato(valor):
    value_str = str(valor)
    if "-" in value_str:
        return value_str
    return '-'.join(value_str[i:i+4] for i in range(0, len(value_str), 4))

df["Número de identidad del afiliado (Separado con guiones)"] = df["Número de identidad del afiliado (Separado con guiones)"].apply(formato)
df.to_excel("formato_corregido.xlsx", index=False)

df = pd.read_excel("actual.xlsx")
mismos = ["M. H.", "M.H.", "MISMA HUESPED", "MISMO HUESPED", "MM.H.", ".H."]

def encontrar_mismos(row):
    tel_afiliado = row["Teléfono celular del afiliado (Separado con guión en medio)"]
    if tel_afiliado in mismos:
        return row["Teléfono celular (Separado con guión en medio)"]
    else: 
        return tel_afiliado

df["Teléfono celular del afiliado (Separado con guión en medio)"] = df.apply(encontrar_mismos, axis=1)
df.to_excel("indNumeroA_corregido.xlsx", index=False)

df = pd.read_excel("indNumeroA_corregido.xlsx")

def formato_telefono(valor):
    value_str = str(valor)
    if "-" in value_str:
        return value_str
    if len(value_str) != 8:
        return value_str  # No formatear si no tiene 8 dígitos
    return value_str[:4] + '-' + value_str[4:]

df["Teléfono celular del afiliado (Separado con guión en medio)"] = df["Teléfono celular del afiliado (Separado con guión en medio)"].apply(formato_telefono)
df.to_excel("formato_corregido.xlsx", index=False)

df = pd.read_excel("formato_corregido.xlsx")
mismosA = ["MILSMO AFILIADO", "MISMO AFILIADO", "M. AFILIADA", "M. A.", "MISMO AFILIADO", "M.A."]
mismosH = ["MISMO HUESPED", "M.H.", "M. H."]

def encontrar_mismos_paciente(row):
    tel_afiliado = row["Teléfono celular del afiliado (Separado con guión en medio)"]
    tel_huesped = row["Teléfono celular (Separado con guión en medio)"]
    tel_paciente = row["Teléfono celular del paciente (Separado con guión en medio)"]
    if tel_paciente in mismosA:
        return tel_afiliado
    elif tel_paciente in mismosH:
        return tel_huesped
    else:
        return tel_paciente

df["Teléfono celular del paciente (Separado con guión en medio)"] = df.apply(encontrar_mismos_paciente, axis=1)
df.to_excel("Telefono_del_paciente.xlsx", index=False)

df = pd.read_excel("Formato_mayus.xlsx")
mismosA = ["M. AFILIAFA", "M.A", "M.A-", "M.A.", "M.AA", "M.AFILIADA", "M.AFILIADO"]
mismosH = ["M-H", "MH.", "M.H", "M.H-", "M.H,.", "M.H.", "M.H. Y SU BEBE", "M. H.", "M.H"]

def encontrar_mismos_nombre(row):
    nombre_paciente = row["Nombre del paciente"]
    nombre_afiliado = row["Nombre completo del afiliado"]
    if nombre_paciente in mismosA:
        return nombre_afiliado
    elif nombre_paciente in mismosH:
        return concatenar_nombres(row)
    else:
        return nombre_paciente

df["Nombre del paciente"] = df.apply(encontrar_mismos_nombre, axis=1)
df.to_excel("Nombre_del_paciente.xlsx", index=False)

df = pd.read_excel("Nombre_del_paciente.xlsx")
df = df.applymap(lambda x: x.upper() if isinstance(x, str) else x)
df.to_excel("NOMBRE_ARREGLO.xlsx", index=False)
