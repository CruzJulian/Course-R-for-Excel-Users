library("stringr")
library("lubridate")
library("readxl")
library("tidyr")

read_excel("nivel-05.xlsx", sheet = "muestra") -> tb_data

library("dplyr")

glimpse(tb_data)


tb_data %>% 
  glimpse

tb_data %>% 
  select(
    BIOLOGIA_PUNT, 
    FILOSOFIA_PUNT, 
    LENGUAJE_PUNT,
    INGLES_PUNT, 
    INTERDISCIPLINAR_PUNT, 
    PROFUNDIZACION_PUNT, 
    FISICA_PUNT, 
    QUIMICA_PUNT,
    CIENCIAS_SOCIALES_PUNT, 
    MATEMATICAS_PUNT
  ) -> tb_00


tb_data %>% 
  select(ends_with("PUNT")) -> tb_01

tb_01 %>% 
  mutate(
    humanidades_punt = 0.30*CIENCIAS_SOCIALES_PUNT + 0.20*FILOSOFIA_PUNT + 0.5*LENGUAJE_PUNT,
    ciencias_punt = 0.25*FISICA_PUNT + 0.25*MATEMATICAS_PUNT + 0.25*BIOLOGIA_PUNT + 0.25*QUIMICA_PUNT
  ) -> tb_02

tb_data %>% 
  select(starts_with("ECON")) -> tb_03


tb_03 %>% 
  mutate(
    tiene_computador = if_else(ECON_SN_COMPUTADOR != 0, "Sí tiene", "No tiene"),
    tiene_internet = if_else(ECON_SN_INTERNET != 0, "Sí tiene", "No tiene"),
    tiene_celular = if_else(ECON_SN_CELULAR != 0, "Sí tiene", "No tiene")
  ) -> tb_04

tb_data %>% 
  select(starts_with("ESTU")) -> tb_05

tb_05 %>% 
  mutate(
    grupo_etario = case_when(
      ESTU_EDAD < 18 ~ "Menor de edad",
      ESTU_EDAD >= 18 & ESTU_EDAD < 30 ~ "Adulto joven",
      ESTU_EDAD >= 30 & ESTU_EDAD < 70 ~ "Adulto",
      ESTU_EDAD >= 70 ~ "Adulto mayor"
    )
  ) -> tb_06

tb_data %>% 
  filter(
    ESTU_CODIGO_RESIDE_MCPIO == "11001"
  ) %>% 
  mutate(
    humanidades_punt = 0.30*CIENCIAS_SOCIALES_PUNT + 0.20*FILOSOFIA_PUNT + 0.5*LENGUAJE_PUNT,
    ciencias_punt = 0.25*FISICA_PUNT + 0.25*MATEMATICAS_PUNT + 0.25*BIOLOGIA_PUNT + 0.25*QUIMICA_PUNT,
    tiene_computador = if_else(ECON_SN_COMPUTADOR != 0, "Sí tiene", "No tiene"),
    tiene_internet = if_else(ECON_SN_INTERNET != 0, "Sí tiene", "No tiene"),
    tiene_celular = if_else(ECON_SN_CELULAR != 0, "Sí tiene", "No tiene")
  ) %>% 
  select(
    humanidades_punt, 
    ciencias_punt, 
    tiene_computador, 
    tiene_internet, 
    tiene_celular
    ) -> tb_07


tb_data %>% 
  mutate(
    estu_fecha_nacimiento = 
      str_c(ESTU_NACIMIENTO_ANNO, ESTU_NACIMIENTO_MES, ESTU_NACIMIENTO_DIA, sep = "-"),
    estu_fecha_nacimiento = as_date(estu_fecha_nacimiento),
    edad_actual = (today() - estu_fecha_nacimiento)/365.25,
    edad_actual = interval(estu_fecha_nacimiento, today())/years(1)
  ) %>% 
  select(
    estu_fecha_nacimiento, 
    edad_actual
    ) -> tb_08

tb_08$estu_fecha_nacimiento
tb_08 %>% select(estu_fecha_nacimiento)
class(tb_08$estu_fecha_nacimiento)
tb_08$edad_actual
tb_04$tiene_computador
tb_04$tiene_computador == "Sí tiene" 
sum(tb_04$tiene_computador == "Sí tiene" )
mean(tb_04$tiene_computador == "Sí tiene" )

read_excel("nivel-05.xlsx", sheet = "divipola") %>% 
  rename(
    cod_depto = `Código...1`,
    nom_depto = `Nombre...2`,
    nom_mpio = `Nombre...3`,
    cod_mpio = `Código...4`
  ) -> tb_divipola

tb_data %>% 
  mutate(
    ESTU_CODIGO_RESIDE_MCPIO = str_pad(ESTU_CODIGO_RESIDE_MCPIO, 5, pad = "0")
  ) -> tb_09
  
left_join(
  tb_09, tb_divipola, by = c("ESTU_CODIGO_RESIDE_MCPIO" = "cod_mpio")
  ) -> tb_10

tb_10 %>% 
  group_by(ESTU_CODIGO_RESIDE_MCPIO, nom_depto, nom_mpio) %>% 
  summarise(
    punt_mat = mean(MATEMATICAS_PUNT, na.rm = TRUE)
  ) -> tb_11
  
  
tb_10 %>% 
  group_by(ESTU_CODIGO_RESIDE_MCPIO, nom_depto, nom_mpio) %>% 
  summarise(
    ind_computador = mean(ECON_SN_COMPUTADOR !=0),
    ind_celular = mean(ECON_SN_CELULAR !=0),
    ind_internet = mean(ECON_SN_INTERNET !=0)
  ) -> tb_12

tb_10 %>%
  group_by(ESTU_CODIGO_RESIDE_MCPIO, nom_depto, nom_mpio) %>%
  summarise(
    ind.computador = mean(ECON_SN_COMPUTADOR !=0),
    ind.celular = mean(ECON_SN_CELULAR !=0),
    ind.internet = mean(ECON_SN_INTERNET !=0),
  ) -> tb_12

tb_10 %>% 
  group_by(ESTU_CODIGO_RESIDE_MCPIO, nom_depto, nom_mpio) %>%
  summarise(
    cantidad_estudiantes = n(),
    .groups = "drop" # Esto es opcional, para desagrupar despúes del summarise
  )-> tb_13


# La tabla tb_14 contendrá el promedio de matemáticas a nivel nacional
tb_data %>%
  summarise(
    mat_promedio = mean(MATEMATICAS_PUNT)
  ) ->tb_14

tb_data %>%
  nest(datos =ESTU_CODIGO_RESIDE_MCPIO) -> tb_15

tb_15 %>%
  glimpse

View(tb_15$datos[[1]])

  












