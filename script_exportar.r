library(MLDataR)

tir <- MLDataR::thyroid_disease

write.csv(tir, file = "dataset_tiorides.csv")

sessionInfo()

# order

head(tir)
sort(tir$patient_age)

tir2 <- tir[order(tir$patient_age), ]
tir2 # me sale ordenado por edad de menor a mayor 


# aggregate (valores(edad), grupos(tyr), estadistico (mean)). Ponemos list porque se requiere
# Lo que hace list es convertir vector en una lista 

aggregate(tir$patient_age,  list(tir$ThryroidClass) , mean)



# tir completo


tir_completo <- tir[complete.cases(tir), ] # me quita los pacientes que tiene  algun missing


 edad_tyr <- aggregate(tir_completo$patient_age,
          list(tir_completo$ThryroidClass),
          mean)

aggregate(tir_completo$patient_age,
          list(tir_completo$ThryroidClass,
               tir_completo$patient_gender),
          mean)

edad_tyr_gen <- aggregate(tir_completo$patient_age,
          list(tir_completo$ThryroidClass,
               tir_completo$patient_gender),
          median)


# Guardarlo en un datafrme cambiandole los titulos, poner un vector con el mismo tamaña que columnas

names(edad_tyr) <- c("Tiroides", "Media")


edad_tyr_gen

names(edad_tyr_gen) <- c("Tiroides", "Género", "Mediana")
