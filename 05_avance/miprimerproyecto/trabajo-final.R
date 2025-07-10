library("sf")
library("dplyr")
library("ggplot2")
library("stringr")

load("Sb11_20082.rda")
load("municipios_trad.rda")

# Punto 1 - Calcular un indicador de puntaje de Humanidades por Municipio
SB11_20082 %>%
  mutate(humanidades_punt = 0.30*CIENCIAS_SOCIALES_PUNT + 0.20*FILOSOFIA_PUNT + 0.5*LENGUAJE_PUNT) %>%
  group_by(ESTU_CODIGO_RESIDE_MCPIO) %>%
  summarise(humanidades_punt = mean(humanidades_punt)) -> tb_humanidades_municipio 

# Punto 2 - Corregir el código del municipio de residencia
tb_humanidades_municipio %>%
  mutate(ESTU_CODIGO_RESIDE_MCPIO = str_pad(ESTU_CODIGO_RESIDE_MCPIO,5, pad = "0")
  ) -> tb_humanidades_municipio

# Punto 3 - Concatenar tb_humanidades_municipio y municipios_trad en nueva tabla: tb_mapas_humanidades
right_join(tb_humanidades_municipio, municipios_trad, by = c("ESTU_CODIGO_RESIDE_MCPIO" = "mpio_cdpmp")
) -> tb_mapas_humanidades

# Punto 4 - Hacer el mapa de municipios con la nota promedio de humanidades
tb_mapas_humanidades %>%
  ggplot() + aes(fill = humanidades_punt, geometry = geometry) + geom_sf() + theme_void()
