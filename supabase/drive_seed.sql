-- =====================================================
-- Drive de Siniestros — seed desde METRICA_LEGAL_CONSOLIDADA_04-06-2026.xlsx
-- 3519 registros. Correr DESPUES de migration_v7.sql.
-- Este seed borra e importa todo (evita duplicados al re-correr).
-- =====================================================

delete from public.drive_siniestros where creado_por is null;

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('-', 2026, null, null, null, null, null, null, null, 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'CERRADO', 'RVC'),
('17411977', 2026, null, null, 'Santa Anita', 'Santa Anita', '2026-02-04', null, 'Noelia', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('10000000', 2022, 'Julio', 'LIMA', 'San Isidro', null, '2022-07-29', '2022-07-29', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 100, 1400, '2022-07-29', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000000000', 2022, 'Abril', 'LIMA', 'Chacarrilla', null, '2022-04-29', '2022-04-29', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000002111', 2025, 'Octubre', null, 'BELEN', '9 DE DICIEMBRE', '2025-10-02', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 4000, '2025-10-03', 1, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1000100127', 2023, 'Julio', 'LIMA', 'San Isidro', null, '2023-07-28', '2023-07-28', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000100213', 2023, 'Julio', 'LIMA', 'Santa Felicia', null, '2023-07-29', '2023-07-29', 'DS', 1, 'NN', 'Policontuso', 1725, 'Leve', null, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('10001016916', 2023, 'Septiembre', 'LIMA', 'Pueblo Libre', null, '2023-09-07', '2023-09-07', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-09-08', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000789363', 2022, 'Enero', 'LIMA', 'Cerro Azul', null, '2022-01-15', '2022-01-15', 'DS', 1, 'Latigazo Cervical', 'Policontuso', 1725, 'Leve', 0, 5000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000807210', 2022, 'Marzo', 'LIMA', 'Orrantia', null, '2022-03-15', '2022-03-15', 'JD', 1, 'Fractura en Muñeca Derecha', 'Policontuso', 1725, 'Leve', 0, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('10001191081', 2024, 'Septiembre', 'Pisco', 'Pisco', 'Pisco', null, '2024-09-15', 'Alejandro Rodríguez', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 700, '1970-01-01', null, 'Cerrado s/detalle', 'CERRADO', 'Alejandro'),
('10001191113', 2024, 'Septiembre', 'Lima', 'Callao', 'Cía Oquendo', '2024-09-15', '2024-09-15', 'Pierina Ugaz', 1, 'Muerte inmediata', 'Fallecido', 65000, 'Grave', 0, 70000, '2024-09-18', 3, 'Rechazado', 'CERRADO', 'RVC'),
('1000362663', 2025, 'Mayo', null, 'HUARMEY', 'HUARMEY', '2025-05-20', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 25000, -21500, '2025-06-16', 27, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1000405495', 2024, 'Junio', 'RECUAY', 'RECUAY', null, '2024-06-26', '2019-12-23', 'JOEL HUAHUACONDORI', 12, 'Fallecido', 'Fallecido', 780000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1000652006', 2022, 'Julio', 'Nasca', 'Vista Alegre', 'Vista Alegre', null, '2020-09-01', 'Alejandro Rodríguez', 1, 'Fractura de columna', 'Fractura de columna', 20000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('1000687540', 2021, 'Enero', 'CALLAO', 'Callao', 'Carmen de la Legua.', '2021-01-04', '2021-01-04', 'Oscar Arroyo', 2, 'Fractura en rodilla derecha. 
 Poli contusos.', 'Fractura Pierna', 34500, 'Grave', 15000, 5000, '2022-02-08', 400, 'Transigido', 'CERRADO', 'RVC'),
('1000687917', 2021, 'Enero', 'LIMA', 'Los Olivos', 'Sol de Oro.', '2021-01-08', '2021-01-08', 'Oscar Arroyo', 6, '- Peatón: Pedro Teodorico Padilla Gómez (66)
 
 Diagnóstico: Contusión en la cabeza, herida en el cuero cabelludo, poli contuso traumatismo encéfalo craneano, herida contuso cortante en el escolpe amplia en región paritoxipital. Queda internado.
 
 Lesiones graves.
 
 Atendido en la Clínica San Vicente.', 'TEC Grave', 138000, 'Grave', 4000, 13000, '2022-03-12', 428, 'Transigido', 'CERRADO', 'RVC'),
('1000690307', 2021, 'Enero', 'CALLAO', 'Sarita Colonia', 'Bella Vista.', '2021-01-18', '2021-01-18', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Víctor Raúl López  Puescas (33)

Diagnóstico: Poli contuso en mano derecha (según denuncia policial), pero según información del nosocomio tiene fractura del dedo medio de la mano derecha. Queda en observación.

Lesiones graves.

Atendido en el Hospital Alcides Carrión – Callao.', 'Policontuso', 1725, 'Leve', null, null, '2022-02-16', 394, 'Transigido', 'CERRADO', 'RVC'),
('1000690793', 2021, 'Enero', 'LIMA', 'SMP.', 'Comisaría de Barboncito', '2021-01-19', '2021-01-19', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Luis Fernando Belaonia Carrillo (52)

Diagnóstico: Politraumatizado, trauma encéfalo craneal grave o severo, fractura expuesta de pierna derecha. Queda hospitalizado.

Lesiones graves.

Atendido en el Hospital Cayetano Heredia.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000691392', 2021, 'Enero', 'LIMA', 'San Juan de Miraflores', 'San Juan de Miraflores.', '2021-01-21', '2021-01-21', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Jair Gino Oswaldo Echevarría Mosqueda (33)

Diagnóstico: Atrición severa de pie izquierdo y fracturas. Queda en observación.

Lesiones graves.

Atendido en la Clínica Santa María Del Sur – SJM; luego se retiró voluntariamente y se internó en el Hospital María Auxiliadora de SJM.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000691487', 2021, 'Enero', 'LIMA', 'Villa el Salvador', 'Urb. De Pachacamac.', '2021-01-22', '2021-01-22', 'Oscar Arroyo', 1, '-      Conductor (Tercero 1): Leonardo Jorge Julca (56)

Diagnóstico: Permanece en observación - Emergencia.

Lesiones graves.

-      Ocupante (Tercero 2): Hipólito Chirinos Meza (60)

Diagnóstico: Permanece en observación – Emergencia.

Lesiones graves.

-      Ocupante (Tercero 3): Carlos Navarro Chahuaila (38)

Diagnóstico: No señala la denuncia ampliatoria. Atendido en el hospital Essalud Uldarico Rocca Fernández.

Los demás atendidos en el Hospital Villa El Salvador.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000692108', 2021, 'Enero', 'LIMA', 'SMP.', 'Sol de Oro', '2021-01-25', '2021-01-25', 'Oscar Arroyo', 1, '-      Conductora (Tercero): Juan Fray Torres Flores (27)

Diagnóstico: Poli contuso. Queda en observación.

Lesiones leves.

Atendida en la Clínica Jesús del Norte.

-      Ocupante (Tercero): Daysi Sofía Ramírez Cipriano (22)

Diagnostico: Policontuso TEC Fractura de tobillo derecho. Queda en observación.

Lesiones de consideración.

Atendida en la Clínica Jesús del Norte.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000692822', 2021, 'Enero', 'LIMA', 'La Victoria', 'Yerbateros.', '2021-01-26', '2021-01-26', 'Oscar Arroyo', 1, '-      Peatón (Tercero): Fernando Augusto Soto Carrasco (36)

Diagnóstico: Herida y poli contuso traumatizado.

Lesiones de consideración.

Atendida en la Clínica San Pablo de Surco.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000693872', 2021, 'Enero', 'LIMA', 'Callao', 'Ciudadela Chalaca', '2021-01-30', '2021-01-30', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Jhosnel Alexander Torres Albornoz (24)

Diagnóstico: Contusión de codo izquierdo por A/T. Observación descartar fractura de codo izquierdo. De alta por no tener SOAT y no tener dinero, refirió que verbalmente el médico le indicó 6 días de descanso médico.', 'Policontuso', 1725, 'Leve', 1200, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000694322', 2021, 'Febrero', 'CALLAO', 'Cercado de Lima', 'Comisaría de Palomino.', null, '2021-02-02', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Juan Manuel García Barrios (21)

Diagnóstico: Poli contusos, corte pierna derecha según lo que aprecia el asesor (Parte policial no indica DX).

Lesiones de consideración.

Atendido en la Clínica Stella Maris – Pueblo Libre', 'Policontuso', 1725, 'Leve', 2800, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000694689', 2021, 'Febrero', 'LIMA', 'SMP.', 'Condevilla.', null, '2021-02-03', 'Oscar Arroyo', 1, '-      Conductor (Tercero Venezolano): Jesús Eliezer Saer Gutiérrez (27)

Diagnóstico: No se mencionan en el acta policial, pero lesionado señala tener placas donde tiene fisuras de dedos de la mano (Se les tomó vistas fotográficas) y debía comprar instrumentos para estabilizar sus dedos, los cuales no los ha hecho por falta de dinero.

Lesiones graves

Atendido en el Hospital Cayetano Heredia.', 'Politraumatizado', 4000, 'Grave', 8000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000695626', 2021, 'Febrero', 'LIMA', 'San Juan de Lurigancho', 'la Huayrona.', null, '2021-02-09', 'Oscar Arroyo', 1, '-      Peatón (Tercero): Wilfredo Abarca Huamán (46)

Diagnóstico: Poli traumatizado. Queda en observación para descartar fracturas.

Lesiones graves.

Atendido en el Hospital Hipólito Unanue.', 'Politraumatizado', 4000, 'Grave', 37870.22, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000696756', 2021, 'Febrero', 'LIMA', 'Callao', 'Márquez Callao.', null, '2021-02-15', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Arlet Mendoza Mora (45)

Diagnóstico: Esguinces y torceduras de otras partes y las no especificadas con traumatismo superficiales que afectan otras combinaciones. Descanso médico 8 días, siendo considerado DELITO.

Lesiones graves.

Atendido en Clínica La Providencia.', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000698922', 2021, 'Febrero', 'LIMA', 'Ate', 'Vitarte.', null, '2021-02-24', 'Oscar Arroyo', 1, 'Poli contusos, traumatismo de pelvis, pierna derecho e izquierdo. Salió de alta con seis días de descanso médico (Del 24FEB2021 al 01MAR2021)', 'Policontuso', 1725, 'Leve', 800, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000699820', 2021, 'Febrero', 'LIMA', 'Rímac', 'Rímac.', null, '2021-02-27', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Cesar Enrique Romero Sandoval

Diagnóstico: Poli contuso y traumatismo en brazo izquierdo. Queda en observación.

Lesiones graves.

Atendido en la Clínica Megasalud Universal.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000699991', 2021, 'Febrero', 'LIMA', 'San Juan de Lurigancho', 'Santa Elizabeth SJL.', null, '2021-02-28', 'Oscar Arroyo', 1, '-       Conductor (Tercero): Juan Manuel Rosas Suarez

Diagnóstico: Traumatismo Múltiple y fractura en el codo y muñeca lado izquierdo.

Lesiones graves.

Atendido en la Clínica Limatambo SJL.', 'Fractura de muñeca', 17250, 'Grave', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000700540', 2021, 'Marzo', 'LIMA', 'Villa El Salvador', 'Villa El Salvador.', null, '2021-03-01', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Cristhyan Edward Corzo Quispe

Diagnóstico: Poli contusos por accidente de tránsito. Queda en observación.

Lesiones de consideración.

Atendido en el Hospital María Auxiliadora.

-      Ocupante 1 (Tercero): Ángela Luz Rosales de Quijada

Diagnóstico: Poli contusos por accidente de tránsito. Queda en observación.

Lesiones de consideración.

Atendida en el Hospital María Auxiliadora.

-      Ocupante 2 (Tercero): Lisbeth Ángela Quijada Rojas.

Diagnóstico: Poli contusos por accidente de tránsito. Queda en observación.

Lesiones de consideración.

Atendida en el Hospital María Auxiliadora.', 'Policontuso', 1725, 'Grave', 9100, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000701884', 2021, 'Marzo', 'LIMA', 'Cercado de Lima', 'Alfonso Ugarte.', null, '2021-03-05', 'Oscar Arroyo', 1, '-      Peatón (Tercero): Marcelino Chiclla Villar (59)

Diagnóstico: Fallecimiento.

Lesiones graves.', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000702624', 2021, 'Marzo', 'LIMA', 'Puente Piedra', 'Puente Piedra.', null, '2021-03-08', 'Oscar Arroyo', 1, '-      Conductora (Tercero): Nataly Milagros Gutiérrez Chaparro (19)

Diagnóstico: Ingreso a observación, pero más allá de ello no quiso tener atención, pese a tener un corte en pierna.

Lesiones de consideración.

-      Ocupante (Tercero): Piero Manuel Gutiérrez Espinoza (08)

Diagnóstico: Poli contusos. Queda en observación.

Lesiones de consideración.

Atendido en el Hospital Lanfranco la Hoz.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000703032', 2021, 'Marzo', 'LIMA', 'Santa Anita', 'Santa Anita.', null, '2021-03-09', 'Oscar Arroyo', 1, '-      Peatona : Claudia Ayme Huaraca (09)

Diagnóstico: Fractura de huesos nasales, contusión cervical, traumatismo encéfalo craneano leve.

Lesiones graves.

Atendido en la clínica Internacional de San Borja', 'TEC Grave', 23000, 'Grave', 3000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000703262', 2021, 'Marzo', 'CALLAO', 'SMP.', 'Barboncitos.', null, '2021-03-10', 'Oscar Arroyo', 1, '-      Ocupante (Tercero): Franco Paolo Rossi Manrique (21)

Diagnóstico: Policontusos, contusión en pierna derecha. Queda en observación para descartar fracturas.

Lesiones graves.

Atendido en la Clínica San Vicente.', 'Politraumatizado', 4000, 'Leve', 500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000704084', 2021, 'Marzo', 'CALLAO', 'Chorrillos', 'Chorrillos', null, '2021-03-13', 'Pierina Ugaz', 1, '-      Ocupante (Tercero): Siberia Arana Olivera (64)

Diagnóstico: Moretón en la rodilla izquierda y raspón en la mano. Queda en observación para tratamiento.

Lesiones de consideración.

Atendido en la Clínica Guadalupe.', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000704205', 2021, 'Marzo', 'LIMA', 'Chorrillos', 'Mateo Pumacahua.', null, '2021-03-13', 'Pierina Ugaz', 1, '-      Conductor (Tercero): José Luis Misthi Valverde

Diagnóstico: Policontusos, heridas en el rostro y fosas nasales, heridas superficiales en pierna izquierda, TEC. Queda en observación para descartar fracturas en pierna izquierda.

Lesiones graves.

Atendido en Hospital Casimiro Ulloa', 'Fractura Pierna', 17250, 'Grave', 4600, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000705073', 2021, 'Marzo', 'LIMA', 'Cercado de Lima', 'Alfonso Ugarte.', null, '2021-03-17', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Hans Pierre Solorzano Rivera (29)

Diagnóstico: Policontusos.

Atendido en la Clínica Stella Maris.', 'Policontuso', 1725, 'Leve', 2200, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000705174', 2021, 'Marzo', 'CALLAO', 'Comas', 'Túpac Amaru Comas', null, '2021-03-17', 'Oscar Arroyo', 1, '-      Peatón (Tercero): Fortunato Romero Cueva (80)

Diagnóstico: Politraumatizado, fractura desplazo de húmero izquierdo, traumatismo encéfalo craneano (TEC) severo por Glasgow; como consecuencia, fallecimiento.

Lesiones graves.

Peatón fue trasladado a la Clínica Jesús del Norte y falleció mientras era atendido en Clínica.', 'Fallecido', 65000, 'Grave', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000705852', 2021, 'Marzo', 'LIMA', 'Villa el Salvador.', 'Villa el Salvador.', null, '2021-03-19', 'Oscar Arroyo', 1, '-      Conductora (tercera) Jiona Rocio Tipismana Espino (34).

Diagnóstico: Policontusos.

Lesiones leves.

Centro Médico: Clínica Santa Martha.', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000707296', 2021, 'Marzo', 'LIMA', 'Cercado de Lima', 'Cotabambas.', null, '2021-03-25', 'Pierina Ugaz', 1, '-      Ocupante 1 (Tercero): ANNYE CABRERA ZAVALA

Diagnóstico: Policontusos

Lesiones leves.

Atendida en la Clínica Internacional.

-      Ocupante 2 (Tercero): ANNE UCLAZCO RAMIREZ

Diagnóstico: Policontusos

Lesiones leves.

Atendida en la Clínica Internacional.', 'Policontuso', 1725, 'Leve', 500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000707610', 2021, 'Marzo', 'LIMA', 'Comas', 'Santa Luzmila.', null, '2021-03-26', 'Pierina Ugaz', 1, '-       Tercero: No identificado

Diagnóstico: Desconocido. Fue derivado a emergencias.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000707917', 2021, 'Marzo', 'LIMA', 'Ate', 'Salamanca.', null, '2021-03-27', 'Pierina Ugaz', 1, '-       Conductor (Tercero): Jhon Cermeño Aular (23)

Diagnóstico: Fractura de pierna. Queda en observación.

Lesiones graves.

Atendido en el Hospital Bravo Chico.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000708470', 2021, 'Marzo', 'LIMA', 'San Juan de Miraflores', 'Pamplona I.', null, '2021-03-29', 'Pierina Ugaz', 1, '-       Conductor (Tercero): Andrea Elizabeth Noblecilla Chilingano

Diagnóstico: Policontuso y esguince. Fue dada de alta el mismo día.

Lesiones de leves', 'Esguince', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000709522', 2021, 'Abril', 'LIMA', 'SMP.', 'Condevilla.', null, '2021-04-05', 'Pierina Ugaz', 1, '-       Conductor (Tercero): Harry Ocampo Ayala

Diagnóstico: Policontusos. Queda en observación por posible luxo fractura en hombro derecho.

Lesiones graves.

Atendido en Clínica San Vicente.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000709943', 2021, 'Abril', 'CALLAO', 'Callao', 'Dulanto', null, '2021-04-06', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Luis Alberto Vilchez Kawakami

Diagnóstico: Traumatismos múltiples. Queda en observación para revisión en traumatología y descartar fracturas.

Lesiones graves.

Atendido en la Clínica Providencia.', 'Politraumatizado', 4000, 'Leve', 1000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000710629', 2021, 'Abril', 'LIMA', 'Ventanilla', 'Villa Los Reyes.', null, '2021-04-08', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Jaime Henry Pando Cisneros

Diagnóstico: Policontuso en el rostro y en pierna izquierda.

Lesiones de consideración.

Atendido en el Hospital de Puente Piedra.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000710680', 2021, 'Abril', 'CALLAO', 'Rímac', 'El Manzano.', null, '2021-04-08', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Alexander Michael Espino Sanchez

Diagnóstico: Policontusos

Lesiones de consideración.

Atendido en el Hospital Cayetano Heredia.

-      Ocupante (Tercero): Claudia Estefany Rojas Conde (Embarazada)

Diagnóstico: Tercigestanulipara de 25 ss Eco II semestre, traumatismo encéfalo craneano.

Lesiones graves.

Atendida en el Hospital Cayetano Heredia.', 'TEC Grave', 23000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000710795', 2021, 'Abril', 'LIMA', 'Lurín', 'Lurín.', null, '2021-04-08', 'Pierina Ugaz', 1, '-      Conductora (Tercero): Paola Nelida Chahua Cherre

Diagnóstico: Policontusos.

Lesiones leves.

Atendida en la Clínica Ricardo Palma.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000711092', 2021, 'Abril', 'LIMA', 'La Victoria', 'La Victoria', null, '2021-04-10', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Andy Sarmiento Bendezu

Diagnóstico: Policontusos. Queda en observación.

Lesiones leves.

Atendido en la Clínica Internacional.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000711471', 2021, 'Abril', 'LIMA', 'Callao', 'Carmen de la Legua.', null, '2021-04-11', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Angel Gabriel Salinas Dagnino

Diagnóstico: Policontusos y fractura de tibia

Lesiones graves.

Atendido en la Clínica Providencia.

-      Conductora (Tercero): Flores Gonzales Vigil Fabiana

Diagnóstico: Policontusos y traumatismo de hombro.

Lesiones de consideración.

Atendida en la Clínica Providencia.', 'Fractura de tibia', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000712382', 2021, 'Abril', 'LIMA', 'La Victoria', 'la Victoria', null, '2021-04-15', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Demetrio Arévalo Zúñiga

Diagnóstico: Policontusos con posible fractura en la clavícula. Queda en observación para descartar fracturas.

Lesiones graves.

Atendido en el Hospital Casimiro Ulloa.', 'Fractura de clavícula', 23000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000712516', 2021, 'Abril', 'LIMA', 'Santa Anita', 'Santa Anita.', null, '2021-04-15', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Gina Flor Orellana Rojas

Diagnostico: Policontuso y esguince en la muñeca derecha.

Lesiones de consideración.

Atendida en la Clínica Montefiori.', 'Esguince', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000712598', 2021, 'Abril', 'LIMA', 'Independencia', 'Payet.', null, '2021-04-15', 'Pierina Ugaz', 1, '-      Ocupante (Tercero): Milagros Solia Matos Paira.

Diagnóstico: Policontuso en la mano derecha e izquierda para descarte de fractura, escoriaciones múltiples brazo izquierdo altura del codo. Queda en observación.

Lesiones graves.

Atendida en el Hospital Cayetano Heredia.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000713230', 2021, 'Abril', 'CALLAO', 'Villa María del Triunfo', 'Villa María del Triunfo.', null, '2021-04-17', 'Pierina Ugaz', 1, '-      Conductor (Tercero): José Malma Sanchez

Diagnóstico: Policontusos, posible esguince. Queda en observación.

Lesiones de consideración.

Atendido en la Clínica Santa Martha Del Sur.', 'Esguince', 2300, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000713950', 2021, 'Abril', 'CALLAO', 'Carmen de la Legua Reynoso.', 'Carmen de la Legua Reynoso.', null, '2021-04-21', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Jeremy David Rubio Garibay

Diagnóstico: Tec. moderado, herida parietal derecha, traumatismo torax con abdominal cerrado. Queda hospitalizado.

Lesiones graves.

Atendido en la Clínica San Vicente.

-      Ocupante (Tercero): Gilder Yony Alvarado Carlos

 

Diagnostico: Policontuso, traumatismo cervical. Queda en observación.

 

Lesiones de consideración.

Atendido en la Clínica San Vicente.', 'TEC Leve', 5750, 'Leve', 1300, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000714366', 2021, 'Abril', 'LIMA', 'Los Olivos', 'Sol de Oro.', null, '2021-04-22', 'Pierina Ugaz', 1, '-      Conductora (Tercero): Pedro Guillermo Ramirez Yovera

Diagnóstico: Policontusos y TEC. Queda en observación.

Lesiones de consideración.

Atendido en la Clínica Jesús del Norte.', 'TEC Leve', 5750, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000714827', 2022, 'Abril', 'LIMA', 'Ancón', 'Ancón.', null, null, 'Pierina Ugaz', 1, '-      Conductora (Tercero): Virgilio Zerapio Dominguez Guillen

Diagnóstico: Policontusos, hemorragia interna en zona abdominal. Queda en observación.

Lesiones graves.

Atendido en el Hospital Carlos Lanfranco La Hoz- Puente Piedra.', 'Hemorragia interna', 17250, 'Grave', 11700, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000715268', 2021, 'Abril', 'LIMA', 'Callao.', 'Ingunza', null, '2021-04-26', 'Pierina Ugaz', 1, '-      Conductora (Tercero): Jean Marco Centeno Mandujano

Diagnóstico: Policontusos, corte en el cuello y cabeza. Queda en observación.

Lesiones de consideración.

Atendida en la Clínica San Gabriel.', 'Policontuso y corte', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000715434', 2021, 'Abril', 'LIMA', 'San Juan de Lurigancho', 'Santa Elizabeth.', null, '2021-04-26', 'Pierina Ugaz', 1, '-      Peatón (Tercero): Olga Solis Cordero

Diagnóstico: Fallecida.', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000715909', 2021, 'Abril', 'LIMA', 'Carabayllo', 'Carabayllo', null, '2021-04-28', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Junior Yesep Herrer Reyes

Diagnóstico: Tec. moderado, herida parietal derecha, traumatismo torax con abdominal cerrado. Queda hospitalizado.

Lesiones graves.

Atendido en el Hospital La franco la Hoz.

-      Ocupante (Tercero): Yeni Reyes Tarazona

 

Diagnostico: Policontuso, traumatismo cervical. Queda en observación.

 

Lesiones de consideración.

Atendido en el Hospital La franco la Hoz.', 'TEC Leve', 5750, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000716278', 2021, 'Abril', 'LIMA', 'Panamericana Norte', 'Ancón.', null, '2021-04-30', 'Pierina Ugaz', 1, 'Conductor (Tercero )Brian Paul Silva Ventura.   Diagnóstico: fractura en la pierna derecha.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000716929', 2021, 'Mayo', 'LIMA', 'Av. Evitamiento', 'el Agustino.', null, '2021-03-03', 'Pierina Ugaz', 1, 'NN / FALLECIDO', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000717648', 2021, 'Mayo', 'LIMA', 'Los Olivos', 'Sol de Oro', null, '2021-05-05', 'Pierina Ugaz', 1, 'Juan Carlos Lovera Lozano  Diagnóstico: Al parecer las lesiones serian policontuso debido a que salió de alta el mismo día.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000717867', 2021, 'Mayo', 'LIMA', 'Santa Anita', 'Santa Anita', null, '2021-05-06', 'Pierina Ugaz', 1, 'Jhon Porras Porras     Diagnóstico: Atrixción muñeca izquierda y cuerpos extraños.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000718092', 2021, 'Mayo', 'LIMA', 'San Juan de Lurigancho', 'San Juan de Lurigancho', null, '2021-05-07', 'Pierina Ugaz', 1, 'Joel Grober Ponce Jiménez    Diagnóstico: Policontuso, Traumatismo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000718717', 2021, 'Mayo', 'CALLAO', 'Cercado de Lima', 'Cercado de Lima', null, '2021-05-09', 'Pierina Ugaz', 1, 'Tercera:Rodriguez Infantes, María Inocenta     Diagnóstico: Policontuso y traumatismo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000719359', 2021, 'Mayo', 'LIMA', 'CALLAO', 'San Miguel', null, '2021-05-12', 'Pierina Ugaz', 1, 'David Giovanny Castro Villalobos (policontuso por descartar fractura)', 'Policontuso', 1725, 'Leve', 800, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000722424', 2021, 'Mayo', 'LIMA', 'Huachipa', 'Huachipa', null, '2021-05-23', 'Pierina Ugaz', 1, 'Conductor (Tercero): Cipriano Felix Romero Fuente (34)', 'Policontuso', 1725, 'Leve', 3500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000723078', 2021, 'Mayo', 'LIMA', 'Av. San Hilarión', 'La Huayrona', null, '2021-05-25', 'Pierina Ugaz', 1, 'Conductor (Tercero 1):  Jhosh LLamocca Pacheco (28)

Diagnóstico: Politraumatismo, TEC leve, TX en ambas rodillas. TX en el tobillo derecho

Atendido en Clínica Internacional San Pablo', 'TEC Leve', 5750, 'Leve', 3000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000723574', 2021, 'Mayo', 'LIMA', 'Villa el Salvador', 'El Salvador', null, '2021-05-23', 'Pierina Ugaz', 1, 'Conductor: Luis Antonio Condori Contreras (39)

Diagnóstico: Politraumatismo, TEC, descarte de fractura  fémur derecho, tobillo izquierdo

Lesiones graves

-      Ocupante Tercero: Gastón Castro Concha (16)

Diagnóstico: Policontuso TEC, queda en observación

Atendido en Clínica Santa Martha', 'Fractura de fémur', 23000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000725286', 2021, 'Junio', 'LIMA', 'SMP.', 'Mirones Altos', null, '2021-06-02', 'Pierina Ugaz', 1, 'Conductor: Rubén Norberto Aguirre Solis.
Diagnóstico: Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000725518', 2021, 'Junio', 'LIMA', 'Chorrillos', 'Chorrillos', null, '2021-06-03', 'Pierina Ugaz', 1, 'Brisa Paola Felix del Rosario (22)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000727045', 2021, 'Junio', 'LIMA', 'SJL.', 'Santa Elizabeth- SJL.', null, '2021-06-09', 'Pierina Ugaz', 1, 'Rigoberto Juan Velasco Ramírez (44)     Ocupante Tercero: Wilber Huarcaya Quispe (39)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000727485', 2021, 'Junio', 'LIMA', 'SMP', 'Barboncito', null, '2021-06-11', 'Pierina Ugaz', 1, 'Melissa Fiorella Castillo Vidal (36)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000728104', 2021, 'Junio', 'LIMA', 'Huachipa', 'Huachipa', null, '2021-06-14', 'Pierina Ugaz', 1, 'Melissa Wendy Timoteo Quispe (25)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000728179', 2021, 'Junio', 'CALLAO', 'Lurín', 'Lurín', null, '2021-06-14', 'Pierina Ugaz', 1, 'Jesús Manuel Guzmán Ysusquiza (20)    Maricielo Villapoma Viayrada (17)    J. V. V. (1 año)', 'Policontuso', 1725, 'Leve', 3500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000730100', 2021, 'Junio', 'LIMA', 'Cercado de Lima', 'Cotabambas.', null, '2021-06-21', 'Pierina Ugaz', 1, 'Conductor: Christopher Brandon Pérez Vega.

       Diagnóstico: Policontuso.

       Atendido: Hospital Hipólito Unanue.', 'Policontuso', 1725, 'Leve', 300, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000731522', 2021, 'Junio', 'LIMA', 'Santa Anita', 'Salamanca.', null, '2021-06-25', 'Pierina Ugaz', 1, 'Conductor: Diego Alexander Cruz Laura.    Diagnóstico: Fractura de pierna.    Atendido: Clínica Montefiori', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000732328', 2021, 'Junio', 'LIMA', 'La Victoria', 'La Victoria', null, '2021-06-30', 'Pierina Ugaz', 1, 'Marco Antonio Champac Ponce
Diagnóstico: Fractura de pierna.
Atendido: Hospital de Dos de Mayo.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000733553', 2021, 'Julio', 'LIMA', 'Panamericana norte', 'Sol de Oro', null, '2021-07-04', 'Pierina Ugaz', 1, 'Conductor tercero: Saul Sandoval Tovar (28)
Diagnóstico: Policontuso, fractura en la pierna.
Atendido en Clínica Jesús del Norte
- Ocupante tercera: Josselim Malpartida Santos (24)
Diagnóstico: Policontuso. Descarte de fractura.
Atendida en Clínica Jesús del Norte.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000734631', 2021, 'Julio', 'LIMA', 'CALLAO', 'Ciudadela Chalaca', null, '2021-07-08', 'Pierina Ugaz', 1, 'Conductor tercero: Ringo Nicolas Huidabrlú (20)    Diagnóstico: Policontuso, descarte de fractura en la nariz.    Atendido en Hospital Alcides Carrión    - Ocupante tercera: Ivonne Judith Gavilan Medina (22)    Atendida en Hospital Alcides Carrión   Diagnóstico: Policontuso, descarte de daño cerebral por convulsión a consecuencia del accidente.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000734814', 2021, 'Julio', 'LIMA', 'Ventanilla.', 'Ventanilla.', null, '2021-07-09', 'Pierina Ugaz', 1, 'Conductor tercero: Rafael Corihuaman Torres (34)

Diagnostico:  Policonstuso.

Atendido en Hospital Carlos La Hoz de Puente Piedra

- Ocupante tercera: María Maribel Risco Cayao (22)

Diagnóstico: Desgarro muscular en muñeca derecha

 Atendida en el Hospital Carlos La Hoz de Puente Piedra.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000735457', 2021, 'Julio', 'LIMA', 'Indepemdencia', 'Independencia', null, '2021-07-11', 'Pierina Ugaz', 1, 'Conductor tercero: Ivan Benh Terrones La Madrid (28)

Diagnóstico: Policontuso

Atendido en Clínica Jesús del Norte

- Ocupante tercera: Rocio Huanate Ferrer

Diagnóstico: Policontuso , fractura en la tibia.

 Atendida en Clínica Jesús del Norte', 'Fractura de tibia', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000735467', 2021, 'Julio', 'LIMA', 'Comas', 'Barboncitos', null, '2021-07-12', 'Pierina Ugaz', 1, 'Ocupante tercera: María Luisa Reyes Vargas (37)

Diagnóstico:  Policontuso.

 Atendida en Clínica San Vicente', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000736719', 2021, 'Julio', 'CALLAO', 'San Miguel', 'San Miguel', null, '2021-07-15', 'Pierina Ugaz', 1, 'Conductor: Denis Merino Rondoy García (27)

Diagnóstico: Policontuso

Atendido en: Clínica Ricardo Palma, San Isidro

- Ocupante tercero: Jeferson Junior García Naupari (21)

Diagnóstico: Policontuso

 Atendido en:  Clínica Ricardo Palma, San Isidro

- Ocupante tercera: María Gamarra Mejía (26)

Diagnóstico: Policontuso

 Atendida en: Clínica Ricardo Palma, San Isidro', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000736750', 2021, 'Julio', 'LIMA', 'Cercado de Lima', 'la Huayrona.', null, '2021-07-15', 'Pierina Ugaz', 1, '- Conductor: Hector Samir Mantari Pariño (23)

Diagnóstico: Politraumatismo, traumatismo de antebrazo izquierdo, traumatismo de cadera, traumatismo en tobillo izquierdo y heridas lacerativas múltiples.

 Atendido en Clínica internacional San Pablo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000736783', 2021, 'Julio', 'LIMA', 'San Martín de Porres', 'Barboncito', null, '2021-07-16', 'Pierina Ugaz', 1, 'Conductor tercero: Amadeo Alfonso Córdova Herrera

Diagnóstico: Fractura de brazo

Atendido en Hospital Loayza', 'Fractura de humero', 23000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000738716', 2021, 'Julio', 'LIMA', 'Cercado de Lima', 'Petit Thouars', null, '2021-07-23', 'Pierina Ugaz', 1, 'Francisco Curo Huari            Diagnóstico: Policontuso              Atendido en Clínica Internacional', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000739752', 2021, 'Julio', 'LIMA', 'Lurin', 'Lurin', null, '2021-07-27', 'Pierina Ugaz', 1, 'Ocupante (Tercero): José Manuel Velázquez Mendoza
Diagnóstico: Golpe, contusión, en la cabeza, descarte de fractura en la cabeza
Lesiones graves.
Atendido en el Hospital Villa el Salvador.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000740046', 2021, 'Julio', 'LIMA', 'SMP.', 'Mirones Bajo', null, '2021-07-28', 'Pierina Ugaz', 1, 'Conductor (Tercero): Ender José Brito Hernandez
Diagnóstico: Policontuso
Atendido en Clínica San Gabriel.', 'Policontuso', 1725, 'Grave', 29004320, null, '2024-09-17', null, 'Transigido', 'CERRADO', 'RVC'),
('1000740287', 2021, 'Julio', 'LIMA', 'Cieneguilla', 'Cieneguilla', null, '2021-07-29', 'Pierina Ugaz', 1, 'Conductor (Tercero 1): Marcelino Bellido Ochoa
Diagnóstico: Policontuso
Atendido en Centro de salud Tambo Viejo - Cieneguilla.
Ocupante (Tercero 1): Mariela Cruz Roña
Diagnóstico: Policontuso
Atendido en Centro de salud Tambo Viejo - Cieneguilla.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000741579', 2021, 'Agosto', 'LIMA', 'Cercado de Lima', 'San Andrés', null, '2021-08-03', 'Pierina Ugaz', 1, '-  Conductor Tercero: Marcos Contreras Gayoso

      Diagnóstico: Policontuso.

-      Ocupante tercera: Carmen Rosa Moncada Davila.

     Diagnóstico: Policontuso.

-      Ocupante tercero: Marcos Contreras Gayoso

  Diagnostico: Policontuso.

Atendidos en el Hospital Dos de Mayo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000741587', 2021, 'Agosto', 'LIMA', 'Zarate.', 'Zarate.', null, '2021-08-02', 'Pierina Ugaz', 1, '-     Conductor tercero: Luis Jefferson Egoavil Alarcón

Diagnóstico: Politraumatismo, quedando en observación.

-      Ocupante tercera: Rossana Rocío Vilca Miyashiro

Diagnóstico: Contusión en la rodilla izquierda y herida en rodilla izquierda.

-     Ocupante tercera: Maryori Medina Anicama

Diagnóstico: Politraumatismo, quedando en observación', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000742142', 2021, 'Agosto', 'LIMA', 'La Victoria', 'La Victoria', null, '2021-08-05', 'Pierina Ugaz', 1, 'Peatón: Leticia Lopez Perez

Diagnóstico: Fractura en la columna y en la pelvis.

Lesiones graves', 'Fractura de pelvis', 15000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000742494', 2021, 'Agosto', 'CALLAO', 'Santa Anita', 'Santa Anita', null, '2021-08-06', 'Pierina Ugaz', 1, 'Conductor tercero: Henderson Meza Suarez (31)

Diagnóstico: Policontuso

Atendido en Clínica Montefiori', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000743020', 2021, 'Agosto', 'LIMA', 'Chilca', 'Chilca', null, '2021-08-08', 'Pierina Ugaz', 1, 'Peatón: León Condori Chumbes

Diagnóstico: Fractura en la nariz, golpes en la cabeza. 

Atendido en clínica Santa Martha del Sur, San Juan de Miraflores', 'Policontuso', 1725, 'Leve', 5000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000743218', 2021, 'Agosto', 'LIMA', 'Santa Anita', 'Santa Anita', null, '2021-08-09', 'Pierina Ugaz', 1, 'Conductor tercero: José Luis Cuya Perez (34)
Diagnóstico:
Atendido en hospital Hipólito Unanue', 'Policontuso', 1725, 'Grave', 30000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000744987', 2021, 'Agosto', 'LIMA', 'Chosica', 'Chosica', null, '2021-08-15', 'Pierina Ugaz', 1, 'Conductor tercero 1: Jhon Arroyo Chaquin
Diagnóstico:
Atendido en hospital José Augusto Tello
Ocupante tercero 1: Teresa Peralta Espinoza (29)
Diagnóstico:
Atendido en hospital José Augusto Tello', 'Policontuso', 1725, 'Grave', 29512.39, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000745009', 2021, 'Agosto', 'LIMA', 'San Martin de Porres', 'Sol de Oro', null, '2021-08-15', 'Pierina Ugaz', 1, 'Peatón: Wilfredo Canchari Quicaño (40)
Diagnóstico: Traumatismo superficiales, múltiples, queda en observación.
Atendido en Clínica Jesús del Norte.', 'Politraumatizado', 4000, 'Leve', 1000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000745053', 2021, 'Agosto', 'LIMA', 'Huarochirí', 'Ricardo Palma', null, '2021-08-14', 'Pierina Ugaz', 1, 'Conductor tercero: Fiorella Amaro Cahuana
Diagnóstico: Policontuso y laceración en el brazo izquierdo
Atendido en Centro de Salud Ricardo Palma.', 'Policontuso y corte', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000745249', 2021, 'Agosto', 'LIMA', 'La Victoria', 'La Victoria', null, '2021-08-16', 'Pierina Ugaz', 1, 'Conductor tercero: Ivan Enrique Perozo Gil
Diagnóstico: Policontuso
Atendido en Clínica Vesallio, San Borja.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000746080', 2021, 'Agosto', 'LIMA', 'La Victoria', 'La Victoria', null, '2021-08-19', 'Pierina Ugaz', 1, 'Conductor tercero: Edison Ccapali Oscco (25)
Diagnóstico: Policontuso
Atendido en Clínica Vesalio, San Borja.', 'Policontuso', 1725, 'Leve', 400, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000746771', 2021, 'Agosto', 'LIMA', 'Pro', 'Pro', null, '2021-08-21', 'Pierina Ugaz', 1, 'Conductor tercero: Brandon Zorrilla Andrade (19)
Diagnóstico: Esguinces y torceduras de otras partes y las no especificadas de la rodilla.
Atendido en Clínica Jesús del norte.
Ocupante tercero: Katerine Baldeon Rubio (29)
Diagnóstico: Policontuso
Atendido en Clínica Jesús del norte.', 'Esguince', 2300, 'Leve', 4000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000747019', 2021, 'Agosto', 'LIMA', 'Callao', 'Ingunza', null, '2021-08-22', 'Pierina Ugaz', 1, 'Conductor tercero: Wilber Yupanqui Luna
Diagnóstico: Esguinces y torceduras de otras partes y las no especificadas de la rodilla.
Atendido en Clínica Jesús del norte.', 'Esguince', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000747331', 2021, 'Agosto', 'LIMA', 'Comas', 'Santa Luzmila', null, '2021-08-23', 'Pierina Ugaz', 1, 'Conductor tercero: Hector Paul Huamanlazo Tacsa

Diagnóstico: Fractura en la pierna, el brazo y en la cadera. Descarte de lesiones internas y en la cabeza.

Atendido en Clínica Jesús del norte.', 'Fractura de cadera', 12000, 'Grave', 30000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000747597', 2021, 'Agosto', 'LIMA', 'Alfonso Ugarte', 'Alfonso Ugarte', null, '2021-08-25', 'Pierina Ugaz', 1, 'Peatón: Joel Yair Gramón Lara
Diagnóstico: Policontuso y contusión en brazo derecho.
Atendido en Clínica Internacional.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000747954', 2021, 'Agosto', 'LIMA', 'Callao', 'Calle Tnt. Arístides del Carpio con Calle Mariano Arredondo - Comisaría de Unidad Vencinal N° 3', null, '2021-08-26', 'Pierina Ugaz', 1, 'Conductor tercero: Claudio Alfredo Ysrael Salas Espejo
Diagnóstico: Policontuso.
Atendido en Clínica Bellavista, Callao
Ocupante tercero: Thiago Salas Pachas (7)
Diagnóstico: Policontuso.
Atendido en Clínica Bellavista, Callao', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000748079', 2021, 'Agosto', 'LIMA', 'Zapallal', 'Panamericana norte Km. 32.5 - Comisaría de Zapallal', null, '2021-08-26', 'Pierina Ugaz', 1, 'Ocupante tercero: Miguel Angel Maza Toledo(33)
Diagnóstico: Policontuso.
Atendido en Hospital Lanfranco La Hoz, Puente Piedra.
Ocupante tercero: Amparo Irma Ayala Alvarez (50)
Diagnóstico: Policontuso.
Atendido en Hospital Lanfranco La Hoz, Puente Piedra.
Ocupante tercero: Cecilia Yenque Pimentel (60)
Diagnóstico: Policontuso.
Atendido en Hospital Lanfranco La Hoz, Puente Piedra.', 'Policontuso', 1725, 'Grave', 1300600, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000748449', 2022, 'Agosto', 'LIMA', 'San Juan de Lurigancho', 'Av. Santa Rosa con Av. Central, San Juan de Lurigancho – Comisaría La Huayrona', null, '2022-08-28', 'Mario Pilares', 1, 'Peatón: Gladys Trujillo Davalos
Diagnóstico: Policontuso
Atendido en Clínica Limatambo', 'Policontuso', 1725, 'Leve', null, null, '2021-09-28', null, 'Transigido', 'CERRADO', 'RVC'),
('1000750049', 2021, 'Septiembre', 'CALLAO', 'Javier Prado', 'Óvalo Huarochirí, Javier Prado - Comisaría de Salamanca', null, '2021-09-03', 'Pierina Ugaz', 1, 'Conductor tercero: Flavio Miguel Ojeda Torrejón

Diagnóstico: Corte en pie izquierdo, sutura de 8 puntos', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000750721', 2021, 'Septiembre', 'LIMA', 'San Miguel.', 'Av. Faucett, altura de la Av. Oscar Benavides, Comisaría Ciudad del Pescador.', null, '2021-09-06', 'Pierina Ugaz', 1, 'Ocupante tercero: Marlene Janett Rodriguez Paravicino

Diagnóstico: Contusión leve región occipital de la cabeza.

Atendida en  Clínica MED CARE

Ocupante tercero: Bianca Cristell Rivera Rodriguez

Diagnóstico: Contusión leve región temporal derecho.

Atendida en  Clínica MED CARE', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000752371', 2021, 'Septiembre', 'LIMA', 'Comas', 'Av. Micaela Bastidas, Comas – Comisaría de Santa Luzmila', null, '2021-09-11', 'Pierina Ugaz', 1, 'Conductor tercero: Denilson Bryam Valverde Pastrana (26)

Diagnóstico: Policontuso

Atendida en Clínica Versalles', 'Policontuso', 1725, 'Leve', 600, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000753375', 2021, 'Septiembre', 'CALLAO', 'Callao', 'Av. Universitaria con Av. Materiales – Comisaría de Mirones Bajos', null, '2021-09-15', 'Pierina Ugaz', 1, '- Conductor tercero: David Alexander Trigoso Loza

Diagnóstico: Policontuso

Atendido en Clínica Providencias', 'Policontuso', 1725, 'Grave', 10000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000753526', 2021, 'Septiembre', 'LIMA', 'Lima', 'Calle las cigüeñas con Av. Los canarios', null, '2021-09-16', 'Pierina Ugaz', 1, 'Ocupante tercero: Judith Soraya Coronel Flores

Diagnóstico: Policontuso

Atendido en Clínica Montefiori, La Molina

 

- Conductor asegurado: Axl Boris Machuca Abanto

Diagnóstico: Policontuso

Atendido en Clínica Montefiori, La Molina', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000754678', 2021, 'Septiembre', 'LIMA', 'Carabayllo', 'Av. Carabayllo con Av. Guillermo de la Fuente, comisaria Universitaria', null, '2021-09-20', 'Pierina Ugaz', 1, 'Ocupante tercero: Jul Bretnmer Lopez

Diagnóstico: Fractura en brazo izquierdo y fisura a la costilla.

Atendido en Hospital Sergio Bernales, Comas', 'Fractura de costillas', 10000, 'Grave', 6000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000755926', 2021, 'Septiembre', 'LIMA', 'Salamanca', 'Calle Las Dalias con Auxiliar vía Evitamiento – Comisaría Salamanca', null, '2021-09-24', 'Mario Pilares', 1, '- Conductor tercero: Carlos Eduardo Superlano Zambrano
Diagnóstico: Tendinitis región tibial posterior miembro inferior izquierdo – fractura próximal tercer dedo mano izquierda a descartar.
Atendido en la ambulancia de pacífico', 'Policontuso', 1725, 'Leve', null, null, '2025-03-21', null, 'Transigido', 'CERRADO', 'RVC'),
('1000756376', 2021, 'Septiembre', 'LIMA', 'Breña', 'Jr Centenario con Jr. Huaraz – Comisaría de Breña', null, '2021-09-26', 'Mario Pilares', 1, '- Conductor tercero: Carla Melissa Moreno Lozano
Diagnóstico: Contusión en mano derecha – fractura proximal tercer dedo mano izquierda a descartar.
Atendido en la ambulancia de pacífico', 'Policontuso', 1725, 'Leve', null, null, '2021-12-13', null, 'Transigido', 'CERRADO', 'RVC'),
('1000756381', 2021, 'Septiembre', 'LIMA', 'Breña', 'Jr. Loreto con Calle Castro Virreyna – Comisaría de Breña', null, '2021-09-26', 'Mario Pilares', 1, '- Conductor tercero: Gonzalo Ezequiel Blanco Guanda
Diagnóstico: Policontuso, fractura pierna izquierda
Atendido en Hospital Loayza', 'Fractura Pierna', 17250, 'Grave', null, null, '2024-04-25', null, 'Transigido', 'CERRADO', 'RVC'),
('1000757926', 2021, 'Octubre', 'LIMA', 'Villa María del Triunfo', 'Av. Simón Bolivar Cdra. 12, Villa María del Triunfo – Comisaría de José Carlos Mariategui', null, '2021-10-01', 'Pierina Ugaz', 1, 'Conductor tercero: Marcos Bravo Atencia

Diagnóstico: Cortes en la mano derecha, policontuso. No evidencia lesión en el cráneo.

Atendido en Clínica Santa Martha del Sur', 'Policontuso y corte', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000758166', 2021, 'Octubre', 'LIMA', 'Lima', 'Av. Tacna con Jr. Ica, Lima – Comisaría de Monserrat', null, '2021-10-02', 'Pierina Ugaz', 1, 'Conductor tercero: Jean Pieer Namo Acosta

Diagnóstico: Trauma en miembro inferior derecho

Atendido en Hospital Loayza', 'Policontuso', 1725, 'Leve', 4800, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000758272', 2021, 'Octubre', 'LIMA', 'San Juan de Miraflores', 'Panamericana Sur, Altura del Puente Alipio – Comisaría de San Juan de Miraflores', null, '2021-10-02', 'Pierina Ugaz', 1, 'Conductor tercero: Carlos Eduardo Ramirez Puentes

Diagnóstico: Politraumatismo

Atendido en Clínica Santa Martha', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000758513', 2021, 'Octubre', 'LIMA', ',San Martin de Porres', 'Av. Tomas Valle con Av. Juvenal Villaverde, San Martin de Porres – Comisaría de Condevilla', null, '2021-10-03', 'Pierina Ugaz', 1, 'Peatón: Alejandro Andres Fernandez Alejandro

Diagnóstico: Politraumatismo , descarte de fractura

Atendido en Hospital Cayetano Heredia', 'Politraumatizado', 4000, 'Grave', 10000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000759324', 2021, 'Octubre', 'LIMA', 'Ventanilla', 'Av. Nestor Gambeta, altura de la puerta 4 de la refinería La Pampilla Repsol – Comisaría de Ventanilla', null, '2021-10-06', 'Pierina Ugaz', 1, '- Ocupante tercero 1: Julio Cesar Marchena Mori

Diagnóstico: Policontuso

Atendido en Hospital de Ventanilla

- Ocupante tercero 1: Mario Antonio Huari Mori

Diagnóstico: Policontuso

Atendido en Hospital de Ventanilla', 'Policontuso', 1725, 'Leve', 5000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000760212', 2021, 'Octubre', 'LIMA', 'Callao', 'Av. San José con intersección Jr. Las Gaviotas, Callao – Comisaría Ciudad del Pescador', null, '2021-10-09', 'Pierina Ugaz', 1, '- Conductor tercero: Lorena Reyna Horna Paredes (24)

Diagnóstico: Policontuso

Atendido en Clínica Bellavista', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000760493', 2021, 'Octubre', 'LIMA', 'SComisaría Petit Thouars', 'Jr. Madre de Dios con Av. Arequipa – Comisaría Petit Thouars', null, '2021-10-11', 'Pierina Ugaz', 1, '- Conductor tercero: Giuliana Maldonado Cueva (32)

Diagnóstico: Policontuso

Atendido en Clínica Stella Maris', 'Policontuso', 1725, 'Leve', 600, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000762599', 2021, 'Octubre', 'CALLAO', 'Av. Faucett con Av. Venezuela - Comisaría Ciudad del pescador', 'Av. Faucett con Av. Venezuela - Comisaría Ciudad del pescador', null, '2021-10-18', 'Pierina Ugaz', 1, '- Conductor tercero: Edinson Enrique Lopez Pezdomo (34)

Diagnóstico: Policontuso

Atendido en Clínica Providencia', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000763217', 2021, 'Octubre', 'LIMA', 'Av. Merino Reyna con Av. Tupac Amaru – Comisaría Santa Isabel', 'Av. Merino Reyna con Av. Tupac Amaru – Comisaría Santa Isabel', null, '2021-10-20', 'Pierina Ugaz', 1, '- Conductor tercero: Lorenzo Jaime Coronel Figueroa

Diagnóstico: Esguince en tobillo izquierdo, por enyesar.

Atendido en Hospital Collique', 'Esguince', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000763369', 2021, 'Octubre', 'LIMA', 'Av. Canadá con Av. El aire – Comisaría Apolo', 'Av. Canadá con Av. El aire – Comisaría Apolo', null, '2021-10-21', 'Pierina Ugaz', 1, '- Conductor tercero: Hugo Marcial Bocanegra Fernandez

Diagnóstico: Policontuso

Atendido en Clínica Javier Prado', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000764084', 2021, 'Octubre', 'LIMA', 'Av. Defensores del morro con Av. N. Rivas – Comisaría Chorrillos', 'Av. Defensores del morro con Av. N. Rivas – Comisaría Chorrillos', null, '2021-10-24', 'Pierina Ugaz', 1, '- Conductor tercero: Juan Carlos Slee Castillo
Diagnóstico: Policontuso, golpes múltiples
Atendido en Clínica Maison de Santé', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000764091', 2021, 'Octubre', 'LIMA', 'Av. Argentina, pasando Av. Insurgentes – Comisaría Carmen de la Legua', 'Av. Argentina, pasando Av. Insurgentes – Comisaría Carmen de la Legua', null, '2021-10-24', 'Pierina Ugaz', 1, '- Conductor asegurado: Enrique Guillermo Alanoca Paco (43)
Diagnóstico: Policontuso (Puntos en la cabeza)
Atendido en Clínica Bellavista


- Conductor tercero: José Fernando Salas Tinco (46)
Diagnóstico: Politraumatismo
Atendido en Clínica San Gabriel', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000765923', 2021, 'Octubre', 'LIMA', 'Panamericana norte, altura del puente Caquetá – Comisaría San Martín de Porres', 'Panamericana norte, altura del puente Caquetá – Comisaría San Martín de Porres', null, '2021-10-30', 'Pierina Ugaz', 1, '- Conductor tercero: Carlos Alberto Calderón Díaz

Diagnóstico: Politraumatismo

Atendido en Hospital Central de la Policía Nacional', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000765927', 2021, 'Octubre', 'LIMA', 'Vía expresa, Paseo de la República, altura de la estación México – Comisaría Petit Thouars', 'Vía expresa, Paseo de la República, altura de la estación México – Comisaría Petit Thouars', null, '2021-10-30', 'Mario Pilares', 1, '- Peatón: Jhan Pool Guillen Escalante

Diagnóstico: Policontuso

Atendido en Hospital Casimiro Ulloa/Clínica Javier Prado', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000766196', 2021, 'Octubre', 'LIMA', 'Av. 13 de enero con Av. El Sol, San Juan de Lurigancho – Comisaría La Huayrona', 'Av. 13 de enero con Av. El Sol, San Juan de Lurigancho – Comisaría La Huayrona', null, '2021-10-31', 'Mario Pilares', 1, '- Conductor tercero: Carlinson Pizzuri Dahua

Diagnóstico: Policontuso, herida en la cara.

Atendido en Hospital de Canto Grande', 'Policontuso y corte', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000766374', 2021, 'Octubre', 'LIMA', 'Av. Palmeras con calle Pariahuanca – Comisaría Los Olivos', 'Av. Palmeras con calle Pariahuanca – Comisaría Los Olivos', null, '2021-10-31', 'Mario Pilares', 1, '- Conductor tercero: José Javier Becerra Becerra

Diagnóstico: Politraumatismo

Atendido en Hospital de Los Olivos', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000767569', 2021, 'Noviembre', 'CALLAO', 'Av. Los alisos con Av. Universitaria – Comisaría Sol de Oro', 'Av. Los alisos con Av. Universitaria – Comisaría Sol de Oro', null, '2021-11-04', 'Mario Pilares', 1, 'Conductor tercero: Jhon Alejandro Sanabria', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000768690', 2021, 'Noviembre', 'LIMA', 'Av. Universitaria C-37 – Comisaría Sol de Oro', 'Av. Universitaria C-37 – Comisaría Sol de Oro', null, '2021-11-08', 'Pierina Ugaz', 1, '- Conductor tercero: Williams Humberto Malpica Sanchez

Diagnóstico: Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000768820', 2021, 'Noviembre', 'LIMA', 'Av. Faucett cruce con Av. Morales Duarez – Comisaría de Dulanto', 'Av. Faucett cruce con Av. Morales Duarez – Comisaría de Dulanto', null, '2021-11-09', 'Pierina Ugaz', 1, '- Conductor tercero: Luis Anthony Chavez Villarreal', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000769086', 2021, 'Noviembre', 'LIMA', 'Calle Ignacio Seminario con Calle Joaquin Torrico – Comisaría San Juan de Miraflores', 'Calle Ignacio Seminario con Calle Joaquin Torrico – Comisaría San Juan de Miraflores', null, '2021-11-09', 'Mario Pilares', 1, 'Jhon Robert Aguirre Tacanga

- Diagnóstico: Policontuso

- Atendido en Clínica Santa Martha', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000771005', 2021, 'Noviembre', 'CALLAO', 'Ramiro Prialé, Atocongo – Comisaría Huachipa', 'Ramiro Prialé, Atocongo – Comisaría Huachipa', null, '2021-11-16', 'Pierina Ugaz', 1, '- Conductor tercero: Julian Gabino Yucyoc Ochoa (57)

- Diagnóstico: Policontuso

- Atendido en Hospital de Vitarte

 

- Conductor tercero: Diana Yucyoc (21)

- Diagnóstico: Policontuso

- Atendido en Hospital de Vitarte

 

- Conductor tercero: Alberto Carlos Yucyoc (17)

- Diagnóstico: Policontuso

- Atendido en Hospital de Vitarte

 

- Conductor tercero: Yulbert Yucyoc (15)

- Diagnóstico: Policontuso

- Atendido en Hospital de Vitarte', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000771046', 2021, 'Noviembre', 'LIMA', 'Av. Grau con Calle Javier Luna Pizarro – Comisaría Cotabambas', 'Av. Grau con Calle Javier Luna Pizarro – Comisaría Cotabambas', null, '2021-11-16', 'Pierina Ugaz', 1, '- Peatón: Jhonatan Smith Huasapoma

- Diagnóstico: Policontuso,hombro y cadera

- Atendido en Clínica Internacional', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000771821', 2021, 'Noviembre', 'LIMA', 'Av. Buenos Aires cuadra 5 – Comisaría de Puente Piedra', 'Av. Buenos Aires cuadra 5 – Comisaría de Puente Piedra', null, '2021-11-18', 'Pierina Ugaz', 1, '- Conductor asegurado: Corina Correa Cardenas

- Diagnóstico: Policontuso

- Atendido en Hospital Lanfranco La Hoz

 

- Conductor tercero: Jesus Castellano Vila

- Diagnóstico: Policontuso

- Atendido en Hospital Lanfranco La Hoz

 

- Ocupante tercero: Ronal Arias Borco

- Diagnóstico: Fractura por descarte de nariz

- Atendido en Hospital Lanfranco La Hoz

 

- Ocupante tercero: Caterin Colina Silva

- Diagnóstico: Corte en la cara

- Atendido en Hospital Lanfranco La Hoz', 'Policontuso y corte', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000772294', 2021, 'Noviembre', 'LIMA', 'Calle Omigron cuadra 5 – Comisaría La Legua', 'Calle Omigron cuadra 5 – Comisaría La Legua', null, '2021-11-20', 'Pierina Ugaz', 1, '- Conductor tercero: Jhulinio Villanueva Gonzales

- Diagnóstico: Contusiones

- Atendido en Clínica providencia', 'Policontuso', 1725, 'Leve', 500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000772450', 2021, 'Noviembre', 'LIMA', 'Av. Unión con Av. Pumacahua – Comisaría Villa María del triunfo', 'Av. Unión con Av. Pumacahua – Comisaría Villa María del triunfo', null, '2021-11-21', 'Pierina Ugaz', 1, '- Conductor tercero: Lorenzo Bruno Mayanga

- Diagnóstico: Policontuso

- Atendido en Hospital María Auxiliadora', 'Policontuso', 1725, 'Leve', 1192.21, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000772572', 2021, 'Noviembre', 'LIMA', 'Panamericana sur km 34– Comisaría de Lurin', 'Panamericana sur km 34– Comisaría de Lurin', null, '2021-11-22', 'Pierina Ugaz', 1, '- Conductor tercero: Jhonatan Fernando Flores Tuesta

- Diagnóstico: Fisura en pie izquierdo, descarte para operación.

- Atendido en Hospital', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000772591', 2021, 'Noviembre', 'LIMA', 'Av. Alfonso Ugarte, altura estadio Alberto Gallardo– Comisaría de Cotabambas', 'Av. Alfonso Ugarte, altura estadio Alberto Gallardo– Comisaría de Cotabambas', null, '2021-11-22', 'Pierina Ugaz', 1, '- Conductor tercero: Jesus Manuel Reyes Mendoza

- Diagnóstico: Policontuso

- No se atendieron en ningún lugar              - Ocupante tercero: Alison Adriana Quevedo Palmares

- Diagnóstico: Policontuso

- No se atendieron en ningún lugar', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000772619', 2021, 'Noviembre', 'LIMA', 'Av. Talladores con Av. Frutales – Comisaría de Salamanca', 'Av. Talladores con Av. Frutales – Comisaría de Salamanca', null, '2021-11-22', 'Pierina Ugaz', 1, '- Conductor tercero: Edgardo Martín Inga Flores  

- Diagnóstico: Policontuso

- Atendido en Hospital', 'Policontuso', 1725, 'Leve', 150, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000773502', 2021, 'Noviembre', 'CALLAO', 'Av. El Sol con Av. Micaela Bastidas – Comisaría Laderas de Villa', 'Av. El Sol con Av. Micaela Bastidas – Comisaría Laderas de Villa', null, '2021-11-24', 'Pierina Ugaz', 1, '- Conductor tercero: Axell Fabricio Vizeri Farroñay (20)

- Diagnóstico: Policontuso

- Atendido en hospital Villa el Salvador', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000773756', 2021, 'Noviembre', 'CALLAO', 'Av. Brasil con Av. Bolivar – Comisaría Jesús María', 'Av. Brasil con Av. Bolivar – Comisaría Jesús María', null, '2021-11-25', 'Pierina Ugaz', 1, '- Conductor tercero: Arnaldo Baltazar Huaman

- Diagnóstico: Fractura incompleta de pie, herida en pie izquierdo.

- Atendido en Clínica Centenario Peruano Japonesa', 'Policontuso', 1725, 'Leve', 3500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000774708', 2021, 'Noviembre', 'LIMA', 'Av. Las flores de primavera con Calle los Tomillos, comisaria de caja de agua', 'Av. Las flores de primavera con Calle los Tomillos, comisaria de caja de agua', null, '2021-11-29', '0', 1, '- Pasajera tercero: Floisa Collantes de Zegarra

- Diagnóstico: Policontuso

- Atendido en Hospital de San Juan de Lurigancho', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000775715', 2021, 'Diciembre', 'LIMA', 'Av. Guardia República – Comisaría San Martin de Porres/ Comisaría Manzanos', 'Av. Guardia República – Comisaría San Martin de Porres/ Comisaría Manzanos', null, '2021-12-01', 'Pierina Ugaz', 1, '- Conductor tercero 2: Miguel Goñe Liñan

- Diagnóstico: Sangrado estomacal interno y en otros órganos. Lesiones graves.

- Atendido en Hospital Cayetano Heredia. Solicita alta voluntaria para traslado a la clínica Jesús del Norte.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000777306', 2021, 'Diciembre', 'LIMA', 'Vía auxiliar Av. Nestor Gambeta con Calle California – Comisaría de Oquendo', 'Vía auxiliar Av. Nestor Gambeta con Calle California – Comisaría de Oquendo', null, '2021-12-07', 'Mario Pilares', 1, '- Conductor tercero: Isaias Victor Nieto Quintana

- Diagnóstico: Fallecimiento inmediato', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000778058', 2021, 'Diciembre', 'LIMA', 'Ovalo infantas con Av. 2 de Octubre – Comisaría de Pro', 'Ovalo infantas con Av. 2 de Octubre – Comisaría de Pro', null, '2021-12-10', 'Pierina Ugaz', 1, '- Ocupante tercera: Maritza Calderon Yanayaco

- Diagnóstico: Policontuso

- Atendido en Clínica Versalles', 'Policontuso', 1725, 'Leve', 5000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000779793', 2021, 'Diciembre', 'LIMA', 'Av. Arica con Jr. Pilcomayo – Comisaría de Breña', 'Av. Arica con Jr. Pilcomayo – Comisaría de Breña', null, '2021-10-15', 'Pierina Ugaz', 1, '- Conductor tercero: Andres Felipe Paez Moreno

- Diagnóstico: Policontuso

- Atendido en Hospital Loaysa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000780641', 2021, 'Diciembre', 'LIMA', 'Av. Tupac Amaru Cdra. 9, Carabayllo – Comisaría el Progreso', 'Av. Tupac Amaru Cdra. 9, Carabayllo – Comisaría el Progreso', null, '2021-12-18', 'Pierina Ugaz', 1, '- Ocupante tercero: Blanca Nereyda Rondon Delgado (40)

- Diagnóstico: Policontuso

- Atendido en Clínica CM CLINIMED SAC

 

- Ocupante tercero: Clotilde Blanca Delgado Perez (60)

- Diagnóstico: Policontuso

- Atendido en Clínica CM CLINIMED SAC

 

- Ocupante tercero: Thamara Angelica Guevara Paredes (13)

- Diagnóstico: Policontuso

- Atendido en Clínica CM CLINIMED SAC

 

- Ocupante tercero: Arlethe Nayeli Aronos Rondon (21)

- Diagnóstico: Policontuso

- Atendido en Clínica CM CLINIMED SAC', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000780939', 2021, 'Diciembre', 'LIMA', 'Av. General Pedro Silva 1030– Comisaría San Juan de Miraflores', 'Av. General Pedro Silva 1030– Comisaría San Juan de Miraflores', null, '2021-12-19', 'Mario Pilares', 1, '- Ocupante tercera: Sandra Paola Martinez Cubas

- Diagnóstico: Policontuso                          

- Atendido en Clínica Santa Martha





- Ocupante tercera: Nicolle Antonella Rojas Martinez

- Diagnóstico: poplicontuso

- Atendido en Clínica Santa Martha', 'Policontuso', 1725, 'Leve', null, null, '2025-03-24', null, 'Transigido', 'CERRADO', 'RVC'),
('1000781453', 2021, 'Diciembre', 'LIMA', 'Av. Manuel del Valle con calle Los Ficus – Comisaría de Pachacamac', 'Av. Manuel del Valle con calle Los Ficus – Comisaría de Pachacamac', null, '2021-12-21', 'Pierina Ugaz', 1, '- Conductor tercero: Alejandro Sanchez Calderon

- Diagnóstico: Fractura de fémur de pierna izquierda.                        

- Atendido en Clínica Santa Martha del Sur, San Juan de Miraflores', 'Fractura de fémur', 23000, 'Grave', 25240, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000783707', 2021, 'Diciembre', 'CALLAO', 'Jr. Abtao 1261 con pasaje Bélgica - Comisaría La Victoria', 'Jr. Abtao 1261 con pasaje Bélgica - Comisaría La Victoria', null, '2021-12-28', 'Pierina Ugaz', 1, '- Conductor tercero 2: Carlos Ortiz Rosales

- Diagnóstico: Lesión

- Atendido en Ambulancia de SANA en el lugar de los hechos', 'Policontuso', 1725, 'Leve', 3700, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000783914', 2021, 'Diciembre', 'LIMA', 'Cieza de León, Ate - Comisaría de Salamanca', 'Cieza de León, Ate - Comisaría de Salamanca', null, '2021-12-28', 'Pierina Ugaz', 1, '- Conductor tercero: Pedro Jair Molina Ayala (21)

- Diagnóstico: Lesión

- Atendido en Clínica San Juan de Dios', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000785996', 2022, 'Enero', 'LIMA', 'SMP', 'Barboncitos', '2022-01-04', '2022-01-04', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 18000, 7125, '2022-05-25', 141, 'Transigido', 'CERRADO', 'RVC'),
('1000786298', 2022, 'Enero', 'LIMA', 'Miraflores', null, '2022-01-05', '2022-01-05', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 450, 1050, '2022-01-10', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000786595', 2022, 'Enero', 'LIMA', 'Surco', null, '2022-01-06', '2022-01-06', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 350, 1150, '2022-01-06', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000786801', 2022, 'Enero', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2022-01-07', '2022-01-07', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000786830', 2022, 'Enero', 'LIMA', 'Miraflores', null, '2022-01-07', '2022-01-07', 'OU', 1, 'Politraumatismo, Heridas Cortantes Pierna y Mano', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-01-07', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000786934', 2022, 'Enero', 'LIMA', 'Pueblo Libre', null, '2022-01-07', '2022-01-07', 'GC', 1, 'Esguince de Tobillo', 'Esguince', 2300, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000787100', 2022, 'Enero', 'LIMA', 'COMAS', 'Santa Luzmila', '2022-01-07', '2022-01-07', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Grave', 22385, -7385, '2022-09-16', 252, 'Transigido', 'CERRADO', 'RVC'),
('1000787662', 2022, 'Enero', 'LIMA', 'Chacarrilla', null, '2022-01-10', '2022-01-10', 'GC', 1, 'Corte profundo en la pierna', 'Policontuso', 1725, 'Leve', 0, 5000, '2022-01-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000787809', 2022, 'Enero', 'LIMA', 'Magdalena', null, '2022-01-10', '2022-01-10', 'DS', 2, 'Politraumatizado / Policontuso', 'Politraumatizado', 8000, 'Grave', 0, 7500, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000787812', 2022, 'Enero', 'LIMA', 'BREÑA', 'Breña', '2022-01-10', '2022-01-10', 'Pierina Ugaz', 5, 'Grave', 'Politraumatizado', 20000, 'Grave', 13300, 15345, '2022-04-13', 93, 'Transigido', 'CERRADO', 'RVC'),
('1000787904', 2022, 'Enero', 'LIMA', 'Monterrico', null, '2022-01-10', '2022-01-10', 'OU', 1, 'Fractura Tibia-Peroné y Muñeca, Politraumatismo, Heridas Cortantes', 'Politraumatizado', 4000, 'Leve', 4500, 15500, '2022-03-03', 52, 'Transigido', 'CERRADO', 'Abeo'),
('1000787974', 2022, 'Enero', 'LIMA', 'CALLAO', 'Playa Rímac', '2022-01-10', '2022-01-10', 'Mario Pilares', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 21950, 19264, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000788696', 2022, 'Enero', 'LIMA', 'Monterrico', null, '2022-01-13', '2022-01-13', 'GC', 2, 'politrumatizados con corte profundo en la pierna izquierda.', 'Policontuso', 3450, 'Leve', 0, 5000, '2022-01-14', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000788827', 2022, 'Enero', 'LIMA', 'Magdalena', null, '2022-01-13', '2022-01-13', 'DS', 1, 'Fractura en los brazos', 'Policontuso', 1725, 'Leve', 0, 20000, '2022-01-17', 4, 'Rechazado', 'CERRADO', 'Abeo'),
('1000818830', 2022, 'Abril', 'LIMA', 'Sagitario', null, '2022-04-22', '2022-04-22', 'OU', 1, 'TEC, Contusión Cadera y Trauma Antebrazo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000790038', 2022, 'Enero', 'LIMA', 'COMAS', 'Santa Luzmila', '2022-01-18', '2022-01-18', 'Pierina Ugaz', 16, 'Grave', 'Politraumatizado', 64000, 'Grave', 62900, 30638, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000790171', 2022, 'Enero', 'LIMA', 'Miraflores', null, '2022-01-18', '2022-01-18', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1500, 0, '2022-01-20', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000790395', 2022, 'Enero', 'LIMA', 'San Isidro', null, '2022-01-19', '2022-01-19', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 100, 4900, '2022-01-19', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000790424', 2022, 'Enero', 'LIMA', 'LIMA', 'Conde de la Vega', '2022-01-19', '2022-01-19', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 7000, '2022-01-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000791640', 2022, 'Enero', 'LIMA', 'SJM', 'Laderas de Villa', '2022-01-24', '2022-01-24', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 31000, 240, '2023-02-07', 379, 'Transigido', 'CERRADO', 'RVC'),
('1000791978', 2022, 'Enero', 'LIMA', 'SAN LUIS', 'Yerbateros', '2022-01-25', '2022-01-25', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 700, 9300, '2023-01-25', 365, 'Transigido', 'CERRADO', 'RVC'),
('1000792469', 2022, 'Enero', 'LIMA', 'San Isidro', null, '2022-01-26', '2022-01-26', 'DS', 1, 'Fractura de Pierna', 'Fractura Pierna', 17250, 'Grave', 25000, 5000, '2022-01-31', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000792703', 2022, 'Enero', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-01-27', '2022-01-27', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 29000, 365, '2023-02-27', 396, 'Transigido', 'CERRADO', 'RVC'),
('1000792744', 2022, 'Enero', 'LIMA', 'SAN MIGUEL', 'Maranga', '2022-01-27', '2022-01-27', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-01-27', 365, 'Transigido', 'CERRADO', 'RVC'),
('1000792915', 2022, 'Enero', 'LIMA', 'MI PERÚ', 'Mi Perú', '2022-01-28', '2022-01-28', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-06-27', 150, 'Transigido', 'CERRADO', 'RVC'),
('1000793456', 2022, 'Enero', 'LIMA', 'Surquillo', null, '2022-01-30', '2022-01-30', 'OU', 2, 'Esguince Tobillo Derecho y Politraumatismo / Fractura Tobillo y Politraumatismo', 'Politraumatizado', 8000, 'Grave', 48000, -13000, '2022-07-08', 159, 'Transigido', 'CERRADO', 'Abeo'),
('1000793503', 2022, 'Enero', 'LIMA', 'San Antonio de Mala', null, '2022-01-30', '2022-01-30', 'GC', 3, 'Policontusos', 'Policontuso', 5175, 'Leve', 1500, 0, '2022-02-07', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000793920', 2022, 'Enero', 'LIMA', 'LURIN', 'Lurín', '2022-01-31', '2022-01-31', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2023-07-06', 521, 'Transigido', 'CERRADO', 'RVC'),
('1000794142', 2022, 'Febrero', 'LIMA', 'Monterrico', null, '2022-02-01', '2022-02-01', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-02-08', 372, 'Rechazado', 'CERRADO', 'Abeo'),
('1000794566', 2022, 'Febrero', 'LIMA', 'CARABAYLLO', 'Santa Isabel', '2022-02-02', '2022-02-02', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-08-09', 553, 'Transigido', 'CERRADO', 'RVC'),
('1000794794', 2022, 'Febrero', 'LIMA', 'Santa Felicia', null, '2022-02-03', '2022-02-03', 'OU', 1, 'Luxación Hombro, Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1000, 14000, '2022-05-25', 111, 'Transigido', 'CERRADO', 'Abeo'),
('1000795015', 2022, 'Febrero', 'LIMA', 'Jesus Maria', null, '2022-02-04', '2022-02-04', 'GC', 1, 'Fractura de dedo de mano', 'Policontuso', 1725, 'Leve', 2000, 3000, '2022-02-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000795348', 2022, 'Febrero', 'LIMA', 'Miraflores', null, '2022-02-05', '2022-02-05', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 500, '2022-02-11', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000795646', 2022, 'Febrero', 'LIMA', 'Jesus Maria', null, '2022-02-07', '2022-02-07', 'GC', 1, 'Fractura epífisis superior de la tibia', 'Policontuso', 1725, 'Grave', 30000, 60000, '2022-05-25', 107, 'Transigido', 'CERRADO', 'Abeo'),
('1000795775', 2022, 'Febrero', 'LIMA', 'San Isidro', null, '2022-02-07', '2022-02-07', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000795958', 2022, 'Febrero', 'LIMA', 'Jesus Maria', null, '2022-02-07', '2022-02-07', 'DS', 3, 'Contusión Rodilla Izquierda / Herida Mucosa Bucal / Contusión Bilateral ambas rodillas', 'Policontuso', 5175, 'Grave', 14200, -4200, '2022-04-21', 73, 'Transigido', 'CERRADO', 'Abeo'),
('1000796205', 2022, 'Febrero', 'LIMA', 'Miraflores', null, '2022-02-08', '2022-02-08', 'DS', 1, 'Contusión Pelvica y Politraumatizada', 'Politraumatizado', 4000, 'Leve', 2800, 2200, '2022-02-10', 2, 'Transigido', 'CERRADO', 'Abeo'),
('16438427', 2024, 'Mayo', 'Lima', 'Ate', 'Huaycan.', '2024-05-23', '2024-05-23', 'Pierina Ugaz', 11, '1        - Policontuso por accidente de tránsito, de alta  

2        -Herida contuso cortante en región frontal y policontuso por accidente de tránsito. 


3       Traumatismo superficial que no afecta la cabeza y el cuello. 

4   Herida en el cuello cabelludo en región frontal y policontuso por accidente de tránsito. 


5     Múltiples fracturas en tobillos. 

       

6    Policontuso. 

7        Policontuso. 

8: Policontuso. 


9    Policontuso. 

10      Múltiples fracturas. 



11    Policontuso.', 'Fractura Pierna', 189750, 'Grave', null, 130000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000796354', 2022, 'Febrero', 'LIMA', 'San Borja', null, '2022-02-09', '2022-02-09', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 3700, -2200, '2022-04-18', 68, 'Transigido', 'CERRADO', 'Abeo'),
('1000796464', 2022, 'Febrero', 'LIMA', 'SJL', 'Mariscal Caceres', '2022-02-09', '2022-02-09', 'Pierina Ugaz', 2, 'Leves', 'Policontuso', 3450, 'Leve', 0, 20000, '2023-11-15', 644, 'Transigido', 'CERRADO', 'RVC'),
('1000796794', 2022, 'Febrero', 'LIMA', 'Orrantia', null, '2022-02-10', '2022-02-10', 'OU', 1, 'Fractura Miembro Inferior, Politraumatismo, Lesión Meniscos', 'Politraumatizado', 4000, 'Grave', 15030, 4970, '2022-02-18', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000797020', 2022, 'Febrero', 'LIMA', 'CALLAO', 'Bocanegra', '2022-02-10', '2022-02-10', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-02-14', 4, 'Rechazado', 'CERRADO', 'RVC'),
('1000797708', 2022, 'Febrero', 'LIMA', 'CHACLACAYO', 'Chaclacayo', '2022-02-13', '2022-02-13', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 44000, 1000, '2022-05-03', 79, 'Transigido', 'CERRADO', 'RVC'),
('1000797753', 2022, 'Febrero', 'LIMA', 'Magdalena', null, '2022-02-13', '2022-02-13', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000797857', 2022, 'Febrero', 'LIMA', 'Surquillo', null, '2022-02-13', '2022-02-13', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-02-13', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000798110', 2022, 'Febrero', 'LIMA', 'Miraflores', null, '2022-02-14', '2022-02-14', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-02-15', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000798112', 2022, 'Febrero', 'LIMA', 'RIMAC', 'Rimac', '2022-02-14', '2022-02-14', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 3000, 3950, '2022-03-31', 45, 'Transigido', 'CERRADO', 'RVC'),
('1000798195', 2022, 'Febrero', 'LIMA', 'LOS OLIVOS', 'Pro', '2022-02-14', '2022-02-14', 'Pierina Ugaz', 3, 'Leve', 'Policontuso', 5175, 'Leve', 1700, 18300, '2022-02-15', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000798283', 2022, 'Febrero', 'LIMA', 'Chacarrilla', null, '2022-02-15', '2022-02-15', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1500, 0, '2022-02-17', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000798446', 2022, 'Febrero', 'LIMA', 'ATE', 'Salamanca', '2022-02-15', '2022-02-15', 'Mario Pilares', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 40000, '2023-05-18', 457, 'Transigido', 'CERRADO', 'RVC'),
('1000798787', 2022, 'Febrero', 'LIMA', 'Chacarrilla', null, '2022-02-16', '2022-02-16', 'OU', 1, 'Politraumatismo, Escoriaciones', 'Politraumatizado', 4000, 'Leve', 2500, 2500, '2022-03-03', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1000799102', 2022, 'Febrero', 'LIMA', 'San Isidro', null, '2022-02-17', '2022-02-17', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000799184', 2022, 'Febrero', 'LIMA', 'San Isidro', null, '2022-02-17', '2022-02-17', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 500, '2022-02-28', 11, 'Transigido', 'CERRADO', 'Abeo'),
('1000799566', 2022, 'Febrero', 'LIMA', 'Surquillo', null, '2022-02-19', '2022-02-19', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000799567', 2022, 'Febrero', 'LIMA', 'San Antonio', null, '2022-02-19', '2022-02-19', 'JD', 1, 'Policontraumatizado', 'Politraumatizado', 4000, 'Leve', 2500, -1000, '2022-03-07', 16, 'Transigido', 'CERRADO', 'Abeo'),
('1000799722', 2022, 'Febrero', 'LIMA', 'San Borja', null, '2022-02-19', '2022-02-19', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-02-21', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000799892', 2022, 'Febrero', 'LIMA', 'San Antonio de Mala', null, '2022-02-20', '2022-02-20', 'JD', 4, 'Policontuso / Politraumatizada y Lesión en Columna / Policontuso y Politraumatizada / Lesión en Columna', 'Politraumatizado', 16000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000799908', 2022, 'Febrero', 'LIMA', 'CALLAO', 'Dulanto', '2022-02-20', '2022-02-20', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 500, 9500, '2022-02-20', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000799926', 2022, 'Febrero', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-02-20', '2022-02-20', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 700, 9300, '2022-02-20', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000799941', 2022, 'Febrero', 'LIMA', 'Monterrico', null, '2022-02-20', '2022-02-20', 'OU', 1, 'Politraumatismo, TEC Leve', 'TEC Leve', 5750, 'Leve', 200, 4800, '2022-02-21', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000800021', 2023, 'Febrero', 'LIMA', 'VMT', 'Lurin', '2023-02-20', '2023-02-20', 'Pierina Ugaz', 4, 'Leve', 'Policontuso', 6900, 'Grave', 3250, 26750, '2022-02-21', -364, 'Transigido', 'CERRADO', 'RVC'),
('1000800402', 2022, 'Febrero', 'LIMA', 'COMAS', 'La Pascana', '2022-02-21', '2022-02-21', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', null, 25000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000800712', 2022, 'Febrero', 'LIMA', 'EL AGUSTINO', 'San Cayetano', '2022-02-22', '2022-02-22', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 70160, -70160, '2022-07-12', 140, 'Transigido', 'CERRADO', 'RVC'),
('1000800775', 2022, 'Febrero', 'LIMA', 'San Borja', null, '2022-02-22', '2022-02-22', 'DS', 1, 'Esguince en la Pierna', 'Esguince', 2300, 'Leve', 4734, 266, '2022-03-14', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1000801155', 2022, 'Febrero', 'LIMA', 'San Antonio', null, '2022-02-23', '2022-02-23', 'DS', 1, 'Fractura del Metatarsiano pie izquierdo', 'Policontuso', 1725, 'Leve', 1500, 3500, '2022-02-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000801646', 2022, 'Febrero', 'LIMA', 'EL AGUSTINO', 'San Cayetano', '2022-02-25', '2022-02-25', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-09-06', 193, 'Transigido', 'CERRADO', 'RVC'),
('1000801678', 2022, 'Febrero', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-02-25', '2022-02-25', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-05-02', 66, 'Transigido', 'CERRADO', 'RVC'),
('1000801873', 2022, 'Febrero', 'LIMA', 'LA PERLA', 'La Perla', '2022-02-26', '2022-02-26', 'Richard Rodriguez', 2, 'Leve', 'Policontuso', 3450, 'Leve', 720, 9280, '2022-03-17', 19, 'Transigido', 'CERRADO', 'RVC'),
('1000801966', 2022, 'Febrero', 'LIMA', 'CALLAO', 'Playa Rímac', '2022-02-26', '2022-02-26', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 700, 29300, '2022-02-26', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000802179', 2022, 'Febrero', 'LIMA', 'Santa Felicia', null, '2022-02-27', '2022-02-27', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 2000, 3000, '2022-03-22', 23, 'Transigido', 'CERRADO', 'Abeo'),
('1000802233', 2022, 'Febrero', 'LIMA', 'CIENEGUILLA', 'Cieneguilla', '2022-02-27', '2022-02-27', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 30000, '2022-08-03', 157, 'Transigido', 'CERRADO', 'RVC'),
('1000802485', 2022, 'Febrero', 'LIMA', 'Monterrico', null, '2022-02-28', '2022-02-28', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 300, 4700, '2022-03-02', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000802508', 2022, 'Febrero', 'LIMA', 'Jesus Maria', null, '2022-02-28', '2022-02-28', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 1000, '2022-03-01', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000802561', 2022, 'Febrero', 'LIMA', 'San Borja', null, '2022-02-28', '2022-02-28', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2022-03-07', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000802644', 2022, 'Febrero', 'LIMA', 'San Borja', null, '2022-02-28', '2022-02-28', 'GC', 1, 'Fractura de Tibia y Peroné', 'Fractura de tibia', 17250, 'Grave', 7000, 23000, '2022-05-07', 68, 'Transigido', 'CERRADO', 'Abeo'),
('1000802962', 2022, 'Marzo', 'LIMA', 'Monterrico', null, '2022-03-01', '2022-03-01', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 400, 4600, '2022-03-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000803269', 2022, 'Marzo', 'LIMA', 'RIMAC', 'Rimac', '2022-03-02', '2022-03-02', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 700, 9300, '2022-03-02', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000803591', 2022, 'Marzo', 'LIMA', 'INDEPENDENCIA', 'Independencia', '2022-03-03', '2022-03-03', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 5000, 10854.4, '2023-10-04', 580, 'Transigido', 'CERRADO', 'RVC'),
('1000803910', 2022, 'Marzo', 'LIMA', 'CALLAO', 'Santa Marina', '2022-03-03', '2022-03-03', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', null, 30000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1000804053', 2022, 'Marzo', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-03-04', '2022-03-04', 'Richard Rodriguez', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', null, 30000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000804079', 2022, 'Marzo', 'LIMA', 'LIMA', 'Mirones Bajos', '2022-03-04', '2022-03-04', 'Pierina Ugaz', 3, 'Leve', 'Policontuso', 5175, 'Leve', 1000, 39000, '2022-03-05', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000804092', 2022, 'Marzo', 'LIMA', 'Pueblo Libre', null, '2022-03-05', '2022-03-05', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 600, 900, '2022-03-17', 12, 'Transigido', 'CERRADO', 'Abeo'),
('1000804144', 2022, 'Marzo', 'LIMA', 'Miraflores', null, '2022-03-05', '2022-03-05', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 800, 700, '2022-03-09', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000804513', 2022, 'Marzo', 'LIMA', 'CALLAO', 'La legua', '2022-03-06', '2022-03-06', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', null, 30000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000804539', 2022, 'Marzo', 'LIMA', 'Santa Felicia', null, '2022-03-07', '2022-03-07', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 359, 1141, '2022-03-07', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000804640', 2022, 'Marzo', 'LIMA', 'SMP', 'San Martín de Porres', '2022-03-07', '2022-03-07', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-03-07', 0, 'Transigido', 'CERRADO', 'RVC'),
('16184611', 2023, 'Diciembre', 'LIMA', 'Vía de Evitamiento', 'Santoyo.', '2023-05-12', '2023-05-12', 'Mario Pilares', 5, 'Traumatismo torácico y traumatismo múltiples./Traumatismo por aplastamiento en la cara, herida en los labios y traumatismo craneoencefálico moderado./: TEC trauma facial oído izquierdo, policontuso y trauma torácico. /Traumatismo torácico y traumas múltiples. / TEC trauma versical y policontuso.', 'TEC Moderado', 57500, 'Grave', null, 60000, '2025-08-22', 833, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000804744', 2022, 'Marzo', 'LIMA', 'Magdalena', null, '2022-03-07', '2022-03-07', 'DS', 1, 'Fractura de la Epifisis Inferior del Cúbito y Radio', 'Policontuso', 1725, 'Leve', 3000, 2000, '2022-03-09', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000804935', 2022, 'Marzo', 'LIMA', 'Orrantia', null, '2022-03-08', '2022-03-08', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-03-08', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000805126', 2022, 'Marzo', 'LIMA', 'LIMA', 'Cotabambas', '2022-03-08', '2022-03-08', 'Richard Rodriguez', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 30000, '2022-04-27', 50, 'Transigido', 'CERRADO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1000805219', 2022, 'Marzo', 'LIMA', 'Jesus Maria', null, '2022-03-08', '2022-03-08', 'JD', 2, 'Luxación en ambas muñecas y Fractura de Clavícula / TEC Moderado y Fractura Pie Izquierdo', 'Fractura de clavícula', 46000, 'Grave', 30000, -8500, '2022-03-25', 17, 'Transigido', 'CERRADO', 'Abeo'),
('1000805395', 2022, 'Marzo', 'LIMA', 'Monterrico', null, '2022-03-09', '2022-03-09', 'JD', 1, 'Contusión en Pie Derecho', 'Policontuso', 1725, 'Leve', 390, 1110, '2022-03-15', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000805928', 2022, 'Marzo', 'LIMA', 'Chacarrilla', null, '2022-03-10', '2022-03-10', 'GC', 1, 'Fractura de pie', 'Fractura Pierna', 17250, 'Grave', 2000, 8000, '2022-03-25', 15, 'Transigido', 'CERRADO', 'Abeo'),
('16158587', 2023, 'Noviembre', 'LIMA', 'PUENTE PIEDRA', 'Zapallal.', '2023-11-15', '2023-11-15', 'Mario Pilares', 1, 'Contusión de muñeca derecha.', 'Policontuso', 1725, 'Leve', null, 10000, '2025-05-25', 557, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000806547', 2022, 'Marzo', 'LIMA', 'LIMA', 'Cotabambas', '2022-03-12', '2022-03-12', 'Mario Pilares', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', null, 15000, '2026-04-24', 1504, 'Transigido', 'CERRADO', 'RVC'),
('1000806579', 2022, 'Marzo', 'LIMA', 'SJL', 'Zárate', '2022-03-13', '2022-03-13', 'Richard Rodriguez', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 7000, 800, '2022-03-23', 10, 'Transigido', 'CERRADO', 'RVC'),
('1000806646', 2022, 'Marzo', 'LIMA', 'La Planicie', null, '2022-03-13', '2022-03-13', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-03-13', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000834243', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-08', '2022-06-08', 'OU', 1, 'Latigazo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1000807690', 2022, 'Marzo', 'LIMA', 'LIMA', 'Mirones Bajos', '2022-03-16', '2022-03-16', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1500, 8500, '2022-03-16', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000807967', 2022, 'Marzo', 'LIMA', 'INGUNZA', 'Ingunza', '2022-03-17', '2022-03-17', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 125, 9875, '2022-03-17', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000808657', 2022, 'Marzo', 'LIMA', 'SJM', 'Laderas de Villa', '2022-03-19', '2022-03-19', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-03-25', 6, 'Transigido', 'CERRADO', 'RVC'),
('1000808767', 2022, 'Marzo', 'LIMA', 'San Borja', null, '2022-03-20', '2022-03-20', 'JD', 1, 'TEC Moderado, Corte en Frente y Contusión en Pierna Derecha', 'TEC Moderado', 11500, 'Grave', 2500, 2500, '2022-04-22', 33, 'Transigido', 'CERRADO', 'Abeo'),
('1000808779', 2022, 'Marzo', 'LIMA', 'San Antonio', null, '2022-03-20', '2022-03-20', 'JD', 1, 'TEC Moderado y Lesión en Columna', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000809364', 2022, 'Marzo', 'LIMA', 'LURIGANCHO', 'Jicamarca', '2022-03-22', '2022-03-22', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-03-22', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000809397', 2022, 'Marzo', 'LIMA', 'SMP', 'San Martín de Porres', '2022-03-22', '2022-03-22', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1000, 9000, '2022-03-22', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000809561', 2022, 'Marzo', 'LIMA', 'CALLAO', 'Playa Rimac', '2022-03-22', '2022-03-22', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 25000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000809703', 2022, 'Marzo', 'LIMA', 'Monterrico', null, '2022-03-23', '2022-03-23', 'DS', 1, 'Fractura de los huesos dedos del pie', 'Policontuso', 1725, 'Leve', 3500, 1500, '2022-03-25', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000810106', 2022, 'Marzo', 'LIMA', 'Surquillo', null, '2022-03-24', '2022-03-24', 'JD', 1, 'Fractura de 3 Vertebras', 'Policontuso', 1725, 'Grave', 10000, 5000, '2023-10-16', 571, 'Archivado', 'CERRADO', 'Abeo'),
('1000810253', 2022, 'Marzo', 'LIMA', 'LURIGANCHO', 'Huachipa', '2022-03-20', '2022-03-20', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', null, 70000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000810260', 2022, 'Marzo', 'LIMA', 'SJL', 'Zárate', '2022-03-25', '2022-03-25', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', null, 50000, null, null, 'Rechazado', 'CERRADO', 'RVC'),
('1000810270', 2022, 'Marzo', 'LIMA', 'Surquillo', null, '2022-03-24', '2022-03-24', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-03-26', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000810739', 2022, 'Marzo', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-03-26', '2022-03-26', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1500, 13500, '2022-03-28', 2, 'Transigido', 'CERRADO', 'RVC'),
('1000811264', 2022, 'Marzo', 'LIMA', 'BREÑA', 'Chacra colorada', '2022-03-28', '2022-03-28', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 400, 9600, '2022-04-28', 31, 'Transigido', 'CERRADO', 'RVC'),
('1000811465', 2022, 'Marzo', 'LIMA', 'LIMA', 'Petit Thouars', '2022-03-29', '2022-03-29', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-11-13', 229, 'Transigido', 'CERRADO', 'RVC'),
('1000811819', 2022, 'Marzo', 'LIMA', 'RIMAC', 'Manzano', '2022-03-30', '2022-03-30', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 2500, 2854, '2022-06-01', 63, 'Transigido', 'CERRADO', 'RVC'),
('1000812122', 2022, 'Marzo', 'LIMA', 'Monterrico', null, '2022-03-30', '2022-03-30', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1500, 0, '2022-04-05', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000812442', 2022, 'Marzo', 'LIMA', 'CALLAO', 'Callao', '2022-03-31', '2022-03-31', 'Mario Pilares', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 20000, 1220, '2022-12-07', 251, 'Transigido', 'CERRADO', 'RVC'),
('1000812491', 2022, 'Marzo', 'LIMA', 'VES', 'Villa el Salvador', '2022-03-31', '2022-03-31', 'Pierina Ugaz', 4, 'Leve', 'Policontuso', 6900, 'Grave', 0, 60000, '2022-03-31', 0, 'Rechazado', 'CERRADO', 'RVC'),
('1000813000', 2022, 'Abril', 'LIMA', 'VMT', 'Nueva esperanza', '2022-04-02', '2022-04-02', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Grave', 11506.56, 0, '2023-07-05', 459, 'Transigido', 'CERRADO', 'RVC'),
('16153421', 2023, 'Noviembre', 'LIMA', 'LIMA', 'Alfonso Ugarte.', '2023-11-13', '2023-11-13', 'Pierina Ugaz', 1, 'Politraumatismos múltiples.', 'Politraumatizado', 4000, 'Leve', null, 10000, '2025-08-29', 655, 'En Negociación', 'CERRADO', 'RVC'),
('1000813212', 2022, 'Abril', 'LIMA', 'San Borja', null, '2022-04-03', '2022-04-03', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000813866', 2022, 'Abril', 'LIMA', 'VMT', 'José Carlos Mariategui', '2022-04-06', '2022-04-06', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 700, 39300, '2022-04-07', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000814073', 2022, 'Abril', 'LIMA', 'LOS OLIVOS', 'Laura Caller', '2022-04-07', '2022-04-07', 'Pierina Ugaz', 4, 'Leves', 'Policontuso', 6900, 'Grave', null, 50000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000814434', 2022, 'Abril', 'LIMA', 'Chacarrilla', null, '2022-04-08', '2022-04-08', 'DS', 2, 'Politraumatizados', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000814687', 2022, 'Abril', 'LIMA', 'EL AGUSTINO', 'Villa hermosa', '2022-04-08', '2022-04-08', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-08-10', 124, 'Transigido', 'CERRADO', 'RVC'),
('1000814953', 2022, 'Abril', 'LIMA', 'Orrantia', null, '2022-04-09', '2022-04-09', 'DS', 1, 'Politraumatizado; Esguince de Hombro', 'Politraumatizado', 4000, 'Leve', 5500, 500, '2022-04-26', 17, 'Transigido', 'CERRADO', 'Abeo'),
('1000815647', 2022, 'Abril', 'LIMA', 'Miraflores', null, '2022-04-12', '2022-04-12', 'JD', 1, 'Fractura de 2 dedos de mano izquierda', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-04-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000815970', 2022, 'Abril', 'LIMA', 'San Borja', null, '2022-04-12', '2022-04-12', 'OU', 2, 'Politraumatisados', 'Policontuso', 3450, 'Leve', 300, 9700, '2022-04-13', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000816142', 2022, 'Abril', 'LIMA', 'Pueblo Libre', null, '2022-04-13', '2022-04-13', 'OU', 1, 'Esguince Pie Izquierdo y  Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000816289', 2022, 'Abril', 'LIMA', 'SANTIAGO DE SURCO', 'Monterrico', '2022-04-13', '2022-04-13', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1300, 8700, '2022-04-14', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000816323', 2022, 'Abril', 'LIMA', 'LURIN', 'Lurin', '2022-04-13', '2022-04-13', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 20000, '2022-04-13', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000816541', 2022, 'Abril', 'LIMA', 'LURIGANCHO', 'Huachipa', '2022-04-15', '2022-04-15', 'Javier Castañeda', 4, 'Grave', 'Politraumatizado', 16000, 'Grave', 0, 150000, '2022-08-16', 123, 'Rechazado', 'CERRADO', 'RVC'),
('1000816566', 2022, 'Abril', 'LIMA', 'Santa Maria', null, '2022-04-15', '2022-04-15', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000817167', 2022, 'Abril', 'LIMA', 'La Molina', null, '2022-04-17', '2022-04-17', 'JD', 1, 'Esguince de Muñeca y Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2022-04-18', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000817410', 2022, 'Abril', 'LIMA', 'San Borja', null, '2022-04-18', '2022-04-18', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 2300, 2700, '2022-05-03', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1000817529', 2022, 'Abril', 'LIMA', 'LA VICTORIA', 'Apolo', '2022-04-18', '2022-04-18', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 4100, 562.4, '2022-08-19', 123, 'Transigido', 'CERRADO', 'RVC'),
('1000817625', 2022, 'Abril', 'LIMA', 'San Isidro', null, '2022-04-19', '2022-04-19', 'GC', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-08-03', 106, 'Transigido', 'CERRADO', 'Abeo'),
('1000818365', 2022, 'Abril', 'LIMA', 'INGUNZA', 'Ingunza', '2022-04-21', '2022-04-21', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 5000, '2022-04-26', 5, 'Rechazado', 'CERRADO', 'RVC'),
('1000818555', 2022, 'Abril', 'LIMA', 'SAN BORJA', 'Estanque', '2022-04-21', '2022-04-21', 'Pierina Ugaz', 1, '-', 'Policontuso', 1725, 'Leve', null, 0, '2023-07-06', 441, 'Transigido', 'CERRADO', 'RVC'),
('1000818728', 2022, 'Abril', 'LIMA', 'RIMAC', 'Piedra Liza', '2022-04-22', '2022-04-22', 'Pierina Ugaz', 1, 'Muerte', 'Fallecido', 65000, 'Grave', 0, 50000, '2024-10-31', 923, 'Transigido', 'CERRADO', 'RVC'),
('1000878240', 2022, 'Octubre', 'LIMA', 'Monterrico', null, '2022-10-06', '2022-10-06', 'DS', 1, 'Fractura en la muñeca', 'Policontuso', 1725, 'Leve', 0, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000819082', 2022, 'Abril', 'LIMA', 'Miraflores', null, '2022-04-22', '2022-04-22', 'OU', 1, 'Politraumatismo y Trauma Pie Derecho', 'Politraumatizado', 4000, 'Leve', 150, 4850, '2022-04-23', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000819526', 2022, 'Abril', 'LIMA', 'Maranga', null, '2022-04-25', '2022-04-25', 'OU', 1, 'TEC, Fractura Húmero, Fractura Tobillo y Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 20000, '2022-04-28', 3, 'Rechazado', 'CERRADO', 'Abeo'),
('1000819827', 2022, 'Abril', 'LIMA', 'El Agustino', null, '2022-04-25', '2022-04-25', 'GC', 1, 'Múltiples fracturas', 'Policontuso', 1725, 'Grave', 35000, 15000, '2022-06-08', 44, 'Transigido', 'CERRADO', 'Abeo'),
('1000820027', 2022, 'Abril', 'LIMA', 'Monterrico', null, '2022-04-26', '2022-04-26', 'DS', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 0, 3000, '2022-04-26', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000820044', 2022, 'Abril', 'LIMA', 'Chacarrilla', null, '2022-04-26', '2022-04-26', 'GC', 2, 'Policontuso / Politraumatizada', 'Politraumatizado', 8000, 'Grave', 2500, 2500, '2022-04-29', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1000820102', 2022, 'Abril', 'LIMA', 'San Isidro', null, '2022-04-26', '2022-04-26', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-04-28', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000820440', 2022, 'Abril', 'LIMA', 'INGUNZA', 'Ingunza', '2022-04-27', '2022-04-27', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-04-29', 2, 'Rechazado', 'CERRADO', 'RVC'),
('1000820578', 2022, 'Abril', 'LIMA', 'La Molina', null, '2022-04-27', '2022-04-27', 'JD', 1, 'Esguince Tobillo Derecho y Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2500, 2500, '2022-05-04', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000820660', 2022, 'Abril', 'LIMA', 'Jesus Maria', null, '2022-04-27', '2022-04-27', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 2740, 2260, '2022-06-01', 35, 'Transigido', 'CERRADO', 'Abeo'),
('1000820692', 2022, 'Abril', 'LIMA', 'Miraflores', null, '2022-04-27', '2022-04-27', 'GC', 1, 'Fractura de Pelvis', 'Fractura de pelvis', 15000, 'Grave', 20000, 30000, '2022-10-05', 161, 'Transigido', 'CERRADO', 'Abeo'),
('1000820787', 2022, 'Abril', 'LIMA', 'SANTA ANITA', 'Santa Anita', '2022-04-28', '2022-04-28', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-06-22', 55, 'Transigido', 'CERRADO', 'RVC'),
('1000820873', 2022, 'Abril', 'LIMA', 'SJL', 'Santa Elizabeth', '2022-04-28', '2022-04-28', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-04-28', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000820941', 2022, 'Abril', 'LIMA', 'San Miguel', null, '2022-04-28', '2022-04-28', 'OU', 10, 'Politraumatisados', 'Policontuso', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000821392', 2022, 'Abril', 'LIMA', 'San Antonio', null, '2022-04-30', '2022-04-30', 'DS', 1, 'Politraumatizada, quedandose en observación', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000821499', 2022, 'Abril', 'LIMA', 'San Isidro', null, '2022-04-30', '2022-04-30', 'GC', 1, 'Esguince pierna', 'Esguince', 2300, 'Leve', 0, 5000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000821728', 2022, 'Mayo', 'LIMA', 'LIMA', 'Cotabambas', '2022-05-01', '2022-05-01', 'Javier Castañeda', 3, 'Leve', 'Policontuso', 5175, 'Leve', null, 30000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000821836', 2022, 'Mayo', 'LIMA', 'LIMA', 'Petit Thouars', '2022-05-02', '2022-05-02', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 1150, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000822009', 2022, 'Mayo', 'LIMA', 'San Antonio', null, '2022-05-02', '2022-05-02', 'GC', 1, 'Esguince de tobillo', 'Esguince', 2300, 'Leve', 3300, 1700, '2022-05-13', 11, 'Transigido', 'CERRADO', 'Abeo'),
('1000822530', 2022, 'Mayo', 'LIMA', 'Miraflores', null, '2022-05-04', '2022-05-04', 'JD', 1, 'Politraumatizado y Corte en Mano Derecha', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-05-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000822678', 2022, 'Mayo', 'LIMA', 'CARMEN DE LA LEGUA REYNOSO', 'Carmen de la Legua Reynoso', '2022-05-04', '2022-05-04', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 9275, 0, '2022-08-15', 103, 'Transigido', 'CERRADO', 'RVC'),
('1000822743', 2022, 'Mayo', 'LIMA', 'Lince', null, '2022-05-04', '2022-05-04', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 740, 4260, '2022-05-05', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000822942', 2022, 'Mayo', 'LIMA', 'BELLAVISTA', 'Ciudad del Pescador', '2022-05-05', '2022-05-05', 'Pierina Ugaz', 1, 'Muerte', 'Fallecido', 65000, 'Grave', 0, 50000, '2023-09-06', 489, 'Judicializado', 'CERRADO', 'RVC'),
('1000823070', 2022, 'Mayo', 'LIMA', 'ATE', 'Salamanca', '2022-05-05', '2022-05-05', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 1735, 2270, '2022-06-21', 47, 'Transigido', 'CERRADO', 'RVC'),
('1000823112', 2022, 'Mayo', 'LIMA', 'Chacarrilla', null, '2022-05-05', '2022-05-05', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1100, 3900, '2022-05-18', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1000823149', 2022, 'Mayo', 'LIMA', 'San Borja', null, '2022-05-06', '2022-05-06', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-05-06', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000823175', 2022, 'Mayo', 'LIMA', 'Chacarrilla', null, '2022-05-06', '2022-05-06', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-05-06', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000823227', 2022, 'Mayo', 'LIMA', 'Jesús María', null, '2022-05-06', '2022-05-06', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000823311', 2022, 'Mayo', 'LIMA', 'Santa Felicia', null, '2022-05-06', '2022-05-06', 'DS', 1, 'Politraumatisado, herida cortante en el rostro', 'Policontuso', 1725, 'Leve', 5000, 10000, '2022-09-22', 139, 'Transigido', 'CERRADO', 'Abeo'),
('1000823315', 2022, 'Mayo', 'LIMA', 'Las Praderas', null, '2022-05-06', '2022-05-06', 'GC', 1, 'fractura de tobillo', 'Fractura Pierna', 17250, 'Grave', 0, 10000, '2022-06-03', 28, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000823435', 2022, 'Mayo', 'LIMA', 'Surquillo', null, '2022-05-06', '2022-05-06', 'DS', 1, 'Politraumatisado', 'Policontuso', 1725, 'Leve', 1500, 3500, '2022-05-10', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000823613', 2022, 'Mayo', 'LIMA', 'Magdalena', null, '2022-05-07', '2022-05-07', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 500, '2022-05-23', 16, 'Transigido', 'CERRADO', 'Abeo'),
('1000823789', 2022, 'Mayo', 'LIMA', 'San Miguel', null, '2022-05-07', '2022-05-07', 'DS', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 0, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000823844', 2022, 'Mayo', 'LIMA', 'Chacarrilla', null, '2022-05-08', '2022-05-08', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-09-27', 142, 'Transigido', 'CERRADO', 'Abeo'),
('1000824081', 2022, 'Mayo', 'LIMA', 'Surco', null, '2022-05-09', '2022-04-27', 'DS', 1, 'Determinar lesiones, operación en rodilla', 'Policontuso', 1725, 'Leve', 2700, 2300, '2022-07-04', 56, 'Transigido', 'CERRADO', 'Abeo'),
('1000824888', 2022, 'Mayo', 'LIMA', 'Jesus Maria', null, '2022-05-11', '2022-05-11', 'OU', 1, 'TEC Moderado y Politraumatismo', 'TEC Moderado', 11500, 'Grave', 3000, 17000, '2022-05-16', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000825087', 2022, 'Mayo', 'LIMA', 'Surquillo', null, '2022-05-12', '2022-05-12', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2022-05-30', 18, 'Transigido', 'CERRADO', 'Abeo'),
('1000825157', 2022, 'Mayo', 'LIMA', 'Orrantia', null, null, null, 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-05-12', null, 'Transigido', 'CERRADO', 'Abeo'),
('1000825248', 2022, 'Mayo', 'LIMA', 'San Borja', null, '2022-05-12', '2022-05-12', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000825423', 2022, 'Mayo', 'LIMA', 'San Isidro', null, '2022-05-12', '2022-05-12', 'DS', 1, 'Fractura de Pierna', 'Fractura Pierna', 17250, 'Grave', 0, 25000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000825692', 2022, 'Mayo', 'LIMA', 'LIMA', 'Palomino', '2022-05-13', '2022-05-13', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 25000, '2022-05-13', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000826100', 2022, 'Mayo', 'LIMA', 'VES', 'Pachacamac', '2022-05-15', '2022-05-15', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 350, 9650, '2023-05-15', 365, 'Transigido', 'CERRADO', 'RVC'),
('1000826128', 2022, 'Mayo', 'LIMA', 'SJL', 'Mariscal Cáceres', '2022-05-15', '2022-05-15', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Grave', 12468, 2900, '2022-07-20', 66, 'Transigido', 'CERRADO', 'RVC'),
('1000827001', 2022, 'Mayo', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-05-18', '2022-05-18', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-05-19', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000827030', 2022, 'Mayo', 'LIMA', 'Sagitario', null, '2022-05-18', '2022-05-18', 'JD', 1, 'Corte en Mano', 'Policontuso', 1725, 'Leve', 0, 5000, '2022-05-19', 1, 'Archivado', 'CERRADO', 'Abeo'),
('1000827039', 2022, 'Mayo', 'LIMA', 'RIMAC', 'Manzano', '2022-05-18', '2022-05-18', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 14035.5, 2152.87, '2022-06-20', 33, 'Transigido', 'CERRADO', 'RVC'),
('1000827254', 2022, 'Mayo', 'LIMA', 'LIMA', 'Mirones bajos', '2022-05-18', '2022-05-18', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 500, 9500, '2022-05-22', 4, 'Transigido', 'CERRADO', 'RVC'),
('1000827401', 2022, 'Mayo', 'LIMA', 'Pueblo Libre', null, '2022-05-18', '2022-05-18', 'DS', 4, 'Politraumatizados en observación', 'Politraumatizado', 16000, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000827432', 2022, 'Mayo', 'LIMA', 'San Isidro', null, '2022-05-19', '2022-05-19', 'JD', 1, 'Esguince de Cadera / Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000827475', 2022, 'Mayo', 'LIMA', 'CHORRILLOS', 'Villa Chorrillos', '2022-05-19', '2022-05-19', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 800, 9200, '2022-05-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000827501', 2022, 'Mayo', 'LIMA', 'San Miguel', null, '2022-05-19', '2022-05-19', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 500, 4500, '2022-05-19', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000827540', 2022, 'Mayo', 'LIMA', 'LIMA', 'Palomino', '2022-05-19', '2022-05-19', 'Javier Castañeda', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 0, 30000, '2022-08-16', 89, 'Rechazado', 'CERRADO', 'RVC'),
('1000827903', 2022, 'Mayo', 'LIMA', 'VES', 'Villa el Salvador', '2022-05-20', '2022-05-20', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 3500, 9026, '2022-05-26', 6, 'Transigido', 'CERRADO', 'RVC'),
('1000828097', 2022, 'Mayo', 'LIMA', 'Chacarrilla', null, '2022-05-21', '2022-05-21', 'OU', 1, 'Cervicalgia, Heridas Cortantes y Politraumatismo', 'Politraumatizado', 4000, 'Leve', 550, 4450, '2022-05-26', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000828104', 2022, 'Mayo', 'LIMA', 'Chacarrilla', null, '2022-05-21', '2022-05-21', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000828183', 2022, 'Mayo', 'LIMA', 'RIMAC', 'El Manzano', '2022-05-21', '2022-05-21', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-06-20', 30, 'Transigido', 'CERRADO', 'RVC'),
('1000828592', 2022, 'Mayo', 'LIMA', 'SJL', 'Santa Elizabeth', '2022-05-23', '2022-05-23', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 1000, 5732, '2022-06-10', 18, 'Transigido', 'CERRADO', 'RVC'),
('1000828873', 2022, 'Mayo', 'LIMA', 'Miraflores', null, '2022-05-23', '2022-05-23', 'GC', 1, 'Politraumatizado esguince en la pierna', 'Politraumatizado', 4000, 'Grave', 6500, -500, '2022-06-03', 11, 'Transigido', 'CERRADO', 'Abeo'),
('1000829055', 2022, 'Mayo', 'LIMA', 'Lince', null, '2022-05-24', '2022-05-24', 'GC', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000829080', 2022, 'Mayo', 'LIMA', 'Surco', null, '2022-05-24', '2022-05-24', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000829572', 2022, 'Mayo', 'LIMA', 'Magdalena', null, '2022-05-25', '2022-05-25', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 500, 4500, '2022-05-29', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000891702', 2022, 'Noviembre', 'LIMA', 'Orrantia', null, '2022-11-10', '2022-11-10', 'GC', 1, 'Múltiples fracturas', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000829981', 2022, 'Mayo', 'LIMA', 'SMP', 'Barboncitos', '2022-05-27', '2022-05-27', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 2500, 3850, '2022-08-09', 74, 'Transigido', 'CERRADO', 'RVC'),
('1000830118', 2022, 'Agosto', 'LIMA', 'LA PERLA', 'La Perla', '2022-05-28', '2022-05-28', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000830426', 2022, 'Mayo', 'LIMA', 'Maranga', null, '2022-05-28', '2022-05-28', 'GC', 1, 'fractura de pie', 'Fractura Pierna', 17250, 'Grave', 5000, 10000, '2022-10-17', 142, 'Transigido', 'CERRADO', 'Abeo'),
('1000830467', 2022, 'Mayo', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2022-05-28', '2022-05-28', 'Javier Castañeda', 2, 'Leve', 'Policontuso', 3450, 'Leve', 2000, 1500, '2022-10-04', 129, 'Transigido', 'CERRADO', 'RVC'),
('1000831078', 2022, 'Mayo', 'LIMA', 'Lince', null, '2022-05-30', '2022-05-30', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1530, -30, '2022-06-07', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000831399', 2022, 'Mayo', 'LIMA', 'Surquillo', null, '2022-05-31', '2022-05-31', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 200, 4800, '2022-06-01', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000831429', 2022, 'Mayo', 'LIMA', 'SMP', 'San Martin de Porres', '2022-05-31', '2022-05-31', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 20000, '2023-07-05', 400, 'Transigido', 'CERRADO', 'RVC'),
('1000831520', 2022, 'Mayo', 'LIMA', 'Miraflores', null, '2022-05-31', '2022-05-31', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1000831554', 2022, 'Junio', 'LIMA', 'VES', 'Pachacamac', '2022-06-01', '2022-06-01', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Grave', 6300, 1400, '2023-03-28', 300, 'Transigido', 'CERRADO', 'RVC'),
('1000831573', 2022, 'Junio', 'LIMA', 'Surquillo', null, '2022-06-01', '2022-06-01', 'JD', 1, 'Fractura de Clavícula', 'Fractura de clavícula', 23000, 'Grave', 5100, 9900, '2022-06-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000831584', 2022, 'Junio', 'LIMA', 'Lince', null, '2022-06-01', '2022-06-01', 'OU', 1, 'Esguince y Torcedura Columna Cervical', 'Torcedura', 3450, 'Leve', 2500, 12500, '2022-06-16', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1000831917', 2022, 'Junio', 'LIMA', 'ATE', 'Vitarte', '2022-06-01', '2022-06-01', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 300, 9700, '2022-06-02', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000832293', 2022, 'Junio', 'LIMA', 'Miraflores', null, '2022-06-02', '2022-06-02', 'GC', 1, 'Tec Moderado', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000832738', 2022, 'Junio', 'LIMA', 'Orrantia', null, '2022-06-03', '2022-06-03', 'DS', 1, 'TEC Moderado', 'TEC Moderado', 11500, 'Grave', 5000, 0, '2022-10-18', 137, 'Transigido', 'CERRADO', 'Abeo'),
('1000832743', 2022, 'Junio', 'LIMA', 'RIMAC', 'Rimac', '2022-06-03', '2022-06-03', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-06-06', 3, 'Rechazado', 'CERRADO', 'RVC'),
('1000832752', 2022, 'Junio', 'LIMA', 'Miraflores', null, '2022-06-03', '2022-06-03', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000832874', 2022, 'Junio', 'LIMA', 'San Borja', null, '2022-06-04', '2022-06-04', 'DS', 1, 'Policontuso 7 dias de descanso médico', 'Policontuso', 1725, 'Leve', 1900, -400, '2022-06-07', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1000832913', 2022, 'Junio', 'LIMA', 'ATE', 'Huaycan', '2022-06-04', '2022-06-04', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2026-04-24', 1420, 'Transigido', 'CERRADO', 'RVC'),
('1000832914', 2022, 'Junio', 'LIMA', 'Chacarrilla', null, '2022-06-04', '2022-06-04', 'JD', 1, 'Fractura de Mano', 'Policontuso', 1725, 'Grave', 18000, -3000, '2022-06-20', 16, 'Transigido', 'CERRADO', 'Abeo'),
('1000833022', 2022, 'Junio', 'LIMA', 'Miraflores', null, '2022-06-04', '2022-06-04', 'DS', 1, 'Esguince de Tobillo', 'Esguince', 2300, 'Leve', 3000, 2000, '2022-06-07', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1000833198', 2022, 'Junio', 'LIMA', 'ATE', 'Vitarte', '2022-06-05', '2022-06-05', 'Javier Castañeda', 2, 'Leve', 'Policontuso', 3450, 'Leve', 600, 14400, '2022-06-06', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000833559', 2022, 'Junio', 'LIMA', 'La Molina', null, '2022-06-06', '2022-06-06', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000833911', 2022, 'Junio', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-06-07', '2022-06-07', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 7880, 6520, '2022-11-14', 160, 'Transigido', 'CERRADO', 'RVC'),
('1000834085', 2022, 'Junio', 'LIMA', 'San Miguel', null, '2022-06-08', '2022-06-08', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-06-09', 1, 'Rechazado', 'CERRADO', 'Abeo'),
('1000902399', 2022, 'Diciembre', 'LIMA', 'Monterrico', null, '2022-12-09', '2022-12-09', 'DS', 1, 'Traumatismo multiples', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000834839', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-10', '2022-06-10', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-06-11', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000835026', 2022, 'Junio', 'LIMA', 'Miraflores', null, '2022-06-10', '2022-06-10', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2700, 2300, '2022-06-16', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000835237', 2022, 'Junio', 'LIMA', 'CALLAO', 'La Legua', '2022-06-11', '2022-06-11', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 25000, '2022-09-06', 87, 'Transigido', 'CERRADO', 'RVC'),
('1000835264', 2022, 'Junio', 'LIMA', 'Monterrico', null, '2022-06-11', '2022-06-11', 'JD', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 0, 3000, '2022-06-12', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000835321', 2022, 'Junio', 'LIMA', 'SMP', 'Barboncitos', '2022-06-11', '2022-06-11', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 800, 9200, '2022-06-11', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000836064', 2022, 'Junio', 'LIMA', 'Miraflores', null, '2022-06-14', '2022-06-14', 'OU', 1, 'Politraumatismo, Trauma Hobro Derecho y Heridas Cortantes', 'Politraumatizado', 4000, 'Leve', 4544, 456, '2022-06-15', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000836204', 2022, 'Junio', 'LIMA', 'LOS OLIVOS', 'Laura Caller', '2022-06-14', '2022-06-14', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 3900, 1970, '2022-08-18', 65, 'Transigido', 'CERRADO', 'RVC'),
('1000836412', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-15', '2022-06-15', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 150, 1350, '2022-06-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000836762', 2022, 'Junio', 'LIMA', 'Barranco', null, '2022-06-16', '2022-06-16', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 1100, 400, '2022-06-23', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000836929', 2022, 'Junio', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-06-16', '2022-06-16', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-09-24', 100, 'Transigido', 'CERRADO', 'RVC'),
('1000837303', 2022, 'Junio', 'LIMA', 'Orrantia', null, '2022-06-17', '2022-06-17', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Grave', 7000, -2000, '2022-07-14', 27, 'Transigido', 'CERRADO', 'Abeo'),
('1000837383', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-17', '2022-06-17', 'OU', 1, 'Fractura Mano y Politraumatismo', 'Politraumatizado', 4000, 'Leve', 150, 19850, '2022-06-18', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000837456', 2022, 'Junio', 'LIMA', 'ATE', 'Salamanca', '2022-06-17', '2022-06-17', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2026-04-24', 1407, 'Transigido', 'CERRADO', 'RVC'),
('1000837602', 2022, 'Junio', 'LIMA', 'CHACLACAYO', 'Chaclacayo', '2022-06-18', '2022-06-18', 'Javier Castañeda', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 10000, '2022-06-20', 2, 'Transigido', 'CERRADO', 'RVC'),
('1000837650', 2022, 'Junio', 'LIMA', 'ATE', 'Vitarte', '2022-06-18', '2022-06-18', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-06-18', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000838312', 2022, 'Junio', 'LIMA', 'LOS OLIVOS', 'Laura Caller', '2022-06-20', '2022-06-20', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', null, 25000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000838353', 2022, 'Junio', 'LIMA', 'ATE', 'Salamanca', '2022-06-21', '2022-06-21', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 2800, 1567, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000838617', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-21', '2022-06-21', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000838711', 2022, 'Junio', 'LIMA', 'Surquillo', null, '2022-06-22', '2022-06-22', 'JD', 1, 'Esguince de Rodilla y de Tobillo', 'Esguince', 2300, 'Leve', 1000, 500, '2022-06-22', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000839312', 2022, 'Junio', 'LIMA', 'San Miguel', null, '2022-06-23', '2022-06-23', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 2100, 2900, '2022-07-11', 18, 'Transigido', 'CERRADO', 'Abeo'),
('1000839374', 2022, 'Junio', 'LIMA', 'LA VICTORIA', 'Apolo', '2022-06-23', '2022-06-23', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 15000, '2026-04-24', 1401, 'Transigido', 'CERRADO', 'RVC'),
('1000839471', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-24', '2022-06-24', 'OU', 2, 'Politraumatisados', 'Policontuso', 3450, 'Leve', 2000, 8000, '2022-09-15', 83, 'Transigido', 'CERRADO', 'Abeo'),
('1000839536', 2022, 'Junio', 'LIMA', 'LOS OLIVOS', 'de Pro', '2022-06-24', '2022-06-24', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 20000, '2022-06-24', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000839618', 2022, 'Junio', 'LIMA', 'Lince', null, '2022-06-24', '2022-06-24', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000839683', 2022, 'Junio', 'LIMA', 'San Borja', null, '2022-06-24', '2022-06-24', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000839708', 2022, 'Junio', 'LIMA', 'Orrantia', null, '2022-06-24', '2022-06-24', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 300, 1200, '2022-06-25', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000840020', 2022, 'Junio', 'LIMA', 'Orrantia', null, '2022-06-25', '2022-06-25', 'GC', 1, 'Fractura expuesta', 'Policontuso', 1725, 'Grave', 15000, 5000, '2022-07-13', 18, 'Transigido', 'CERRADO', 'Abeo'),
('1000840162', 2022, 'Junio', 'LIMA', 'SJM', 'Laderas de Villa', '2022-06-26', '2022-06-26', 'Javier Castañeda', 3, 'Leve', 'Policontuso', 5175, 'Leve', 0, 30000, '2022-08-03', 38, 'Transigido', 'CERRADO', 'RVC'),
('1000840187', 2022, 'Julio', 'LIMA', 'LIMA', 'MONSERRAT', '2022-06-06', '2022-06-06', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 2500, 3840, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000840208', 2022, 'Junio', 'LIMA', 'San Antonio', null, '2022-06-26', '2022-06-26', 'GC', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 0, 1500, '2022-06-28', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000840383', 2022, 'Junio', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-06-27', '2022-06-27', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1800, 1850, '2022-10-21', 116, 'Transigido', 'CERRADO', 'RVC'),
('1000840487', 2022, 'Junio', 'LIMA', 'La Molina', null, '2022-06-27', '2022-06-27', 'GC', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 1500, 1500, '2022-07-11', 14, 'Transigido', 'CERRADO', 'Abeo'),
('1000840730', 2022, 'Junio', 'LIMA', 'San Antonio', null, '2022-06-28', '2022-06-28', 'DS', 1, 'Fractura de Brazo', 'Policontuso', 1725, 'Grave', 10000, 10000, '2022-07-18', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1000841156', 2022, 'Junio', 'LIMA', 'Villa', null, '2022-06-29', '2022-06-29', 'JD', 1, 'Fractura de Cabeza de Peroné Izquierdo y Esguince de Muñeca Derecha', 'Esguince', 2300, 'Leve', 3000, 12000, '2022-07-10', 11, 'Transigido', 'CERRADO', 'Abeo'),
('1000841267', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-29', '2022-06-29', 'OU', 1, 'Latigazo, Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-06-30', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000841319', 2022, 'Junio', 'LIMA', 'LIMA', 'Alfonso Ugarte', '2022-06-29', '2022-06-29', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 700, 16300, '2022-07-05', 6, 'Transigido', 'CERRADO', 'RVC'),
('1000841374', 2022, 'Junio', 'LIMA', 'San Miguel', null, '2022-06-30', '2022-06-30', 'OU', 1, 'Fractura Femur', 'Policontuso', 1725, 'Grave', 12500, 7500, '2022-07-25', 25, 'Transigido', 'CERRADO', 'Abeo'),
('1000841871', 2022, 'Julio', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2022-07-01', '2022-07-01', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 5000, 0, '2024-03-04', 612, 'Transigido', 'CERRADO', 'RVC'),
('1000841897', 2022, 'Julio', 'LIMA', 'La Planicie', null, '2022-07-01', '2022-07-01', 'DS', 1, 'Esguince en la Rodilla', 'Esguince', 2300, 'Leve', 3000, 2000, '2022-07-05', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000842609', 2022, 'Julio', 'LIMA', 'San Borja', null, '2022-07-04', '2022-07-04', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 460, 1040, '2022-07-06', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000842638', 2022, 'Julio', 'LIMA', 'Orrantia', null, '2022-07-04', '2022-07-04', 'DS', 2, 'Fractura y Politraumatizada', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000842960', 2022, 'Julio', 'LIMA', 'Orrantia', null, '2022-07-05', '2022-07-05', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 1000, '2022-07-05', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000843126', 2022, 'Julio', 'LIMA', 'COMAS', 'Collique', '2022-07-05', '2022-07-05', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000843472', 2022, 'Julio', 'LIMA', 'SMP', 'Barboncitos', '2022-07-06', '2022-07-06', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2026-04-23', 1387, 'Transigido', 'CERRADO', 'RVC'),
('1000843536', 2022, 'Julio', 'LIMA', 'Miraflores', null, '2022-07-06', '2022-07-06', 'GC', 2, 'Fisura de Pie y policontusa', 'Policontuso', 3450, 'Leve', 3200, 6800, '2022-07-13', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000843592', 2022, 'Julio', 'LIMA', 'Monterrico', null, '2022-07-06', '2022-07-06', 'DS', 1, 'Fractura Expuesta', 'Policontuso', 1725, 'Grave', 10000, 10000, '2022-09-22', 78, 'Transigido', 'CERRADO', 'Abeo'),
('1000843642', 2022, 'Julio', 'LIMA', 'Sagitario', null, '2022-07-07', '2022-07-07', 'GC', 2, 'Fractura de Mano y Fractura de costilla', 'Policontuso', 3450, 'Grave', 13000, 17000, '2022-08-02', 26, 'Transigido', 'CERRADO', 'Abeo'),
('1000845034', 2022, 'Julio', 'LIMA', 'CALLAO', 'Dulanto', '2022-07-10', '2022-07-10', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-09-01', 53, 'Transigido', 'CERRADO', 'RVC'),
('1000845737', 2022, 'Julio', 'LIMA', 'Pueblo Libre', null, '2022-07-12', '2022-07-12', 'GC', 1, 'Rotura de ligamentos', 'Policontuso', 1725, 'Leve', 2220, 7780, '2022-07-19', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000845927', 2022, 'Julio', 'LIMA', 'Chacarrilla', null, '2022-07-12', '2022-07-12', 'DS', 1, 'TEC Moderado', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1000845975', 2022, 'Julio', 'LIMA', 'LIMA', 'UV3', '2022-07-13', '2022-07-13', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-01-11', 547, 'Transigido', 'CERRADO', 'RVC'),
('1000846288', 2022, 'Julio', 'LIMA', 'San Borja', null, '2022-07-13', '2022-07-13', 'DS', 1, 'Esguince', 'Esguince', 2300, 'Grave', 8000, -3000, '2022-09-22', 71, 'Transigido', 'CERRADO', 'Abeo'),
('15687277', 2023, 'Enero', 'LIMA', 'PACHACAMAC', 'Pachacamac', '2023-01-26', '2023-01-26', 'Pierina Ugaz', 2, 'Policontuso /Sin diagnóstico médico: Indica golpe en la cabeza y rodilla izquierda y corte en la mano derecha', 'Policontuso y corte', 4600, 'Leve', 0, 10000, '2025-05-25', 850, 'Transigido', 'CERRADO', 'RVC'),
('1000846976', 2022, 'Julio', 'LIMA', 'San Borja', null, '2022-07-15', '2022-07-15', 'JD', 1, 'TEC Severo / Politraumatizada', 'TEC Grave', 23000, 'Grave', 21000, -6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000847588', 2022, 'Julio', 'LIMA', 'LIMA', 'Mirones bajo', '2022-07-18', '2022-07-18', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 5000, '2023-08-10', 388, 'Transigido', 'CERRADO', 'RVC'),
('1000848345', 2022, 'Julio', 'LIMA', 'SJL', 'Caja de Agua', '2022-07-19', '2022-07-19', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-07-22', 3, 'Transigido', 'CERRADO', 'RVC'),
('1000848720', 2022, 'Julio', 'LIMA', 'SJL', 'Zarate', '2022-07-20', '2022-07-20', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-07-21', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000848786', 2022, 'Julio', 'LIMA', 'VMT', 'José Carlos Mariategui', '2022-07-21', '2022-07-21', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 4000, 2899.6, '2022-09-05', 46, 'Transigido', 'CERRADO', 'RVC'),
('1000849277', 2022, 'Julio', 'LIMA', 'San Isidro', null, '2022-07-21', '2022-07-21', 'OU', 1, 'Esguince Tobillo Derecho', 'Esguince', 2300, 'Leve', 2050, 12950, '2022-07-22', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000849976', 2022, 'Julio', 'LIMA', 'Jesus Maria', null, '2022-07-25', '2022-07-25', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000850208', 2022, 'Julio', 'LIMA', 'CHORRILLOS', 'Mateo Pumacahua', '2022-07-25', '2022-07-25', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 10560, 6906, '2023-03-20', 238, 'Transigido', 'CERRADO', 'RVC'),
('1000850229', 2022, 'Julio', 'LIMA', 'Sagitario', null, '2022-07-25', '2022-07-25', 'DS', 1, 'Esguince de Tobillo', 'Esguince', 2300, 'Leve', 0, 5000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000850553', 2022, 'Julio', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-07-26', '2022-07-26', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-08-27', 32, 'Transigido', 'CERRADO', 'RVC'),
('15563845', 2022, 'Noviembre', 'LIMA', 'LOS OLIVOS', 'Laura Caller', '2022-11-16', '2022-11-16', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', null, 100000, '2024-07-08', 600, 'Otros', 'CERRADO', 'RVC'),
('1000850866', 2022, 'Julio', 'LIMA', 'LIMA', 'Alfonso Ugarte', '2022-07-27', '2022-07-27', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 4000, 6750, '2022-09-27', 62, 'Transigido', 'CERRADO', 'RVC'),
('1000851680', 2022, 'Julio', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-07-30', '2022-07-30', 'Javier Castañeda', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 15000, '2022-07-30', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000851803', 2022, 'Julio', 'LIMA', 'Surquillo', null, '2022-07-31', '2022-07-31', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Grave', 7500, -2500, '2022-09-13', 44, 'Transigido', 'CERRADO', 'Abeo'),
('1000851896', 2022, 'Julio', 'LIMA', 'Miraflores', null, '2022-07-31', '2022-07-31', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 400, 1100, '2022-07-31', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000852045', 2022, 'Agosto', 'LIMA', 'Lince', null, '2022-08-01', '2022-08-01', 'DS', 1, 'Policontuso 7 días de descanso', 'Policontuso', 1725, 'Leve', 600, 900, '2022-08-08', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000852627', 2022, 'Agosto', 'LIMA', 'Surquillo', null, '2022-08-02', '2022-08-02', 'JD', 2, 'Politraumatizado y Politraumatizada', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000852863', 2022, 'Agosto', 'LIMA', 'Maranga', null, '2022-08-02', '2022-08-02', 'OU', 1, 'Politraumatismo, Trauma Muñeca Derecha', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-08-02', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000853328', 2022, 'Agosto', 'LIMA', 'Orrantia', null, '2022-08-03', '2022-08-03', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000853624', 2022, 'Agosto', 'LIMA', 'BELLAVISTA', 'Bellavista', '2022-08-04', '2022-08-04', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 600, 24400, '2022-08-04', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000853798', 2022, 'Agosto', 'LIMA', 'Santa Felicia', null, '2022-08-04', '2022-08-04', 'DS', 2, 'Politraumatizado y Policontusa', 'Politraumatizado', 8000, 'Grave', 0, 7500, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('15541323', 2022, 'Noviembre', 'LIMA', 'SJL', 'Canto Rey', '2022-11-02', '2022-11-02', 'Pierina Ugaz', 3, 'Leve', 'Policontuso', 5175, 'Leve', null, 30000, '2025-05-25', 935, 'Otros', 'CERRADO', 'RVC'),
('1000854396', 2022, 'Agosto', 'LIMA', 'San Borja', null, '2022-08-06', '2022-08-06', 'JD', 1, 'Fractura de Olecranon (Codo)/ Herida en Cabeza', 'Policontuso', 1725, 'Leve', 5000, 10000, '2022-09-11', 36, 'Transigido', 'CERRADO', 'Abeo'),
('1000855043', 2022, 'Agosto', 'LIMA', 'Chacarrilla', null, '2022-08-09', '2022-08-09', 'OU', 1, 'Esguince Muñeca, Trauma Pierna', 'Esguince', 2300, 'Leve', 0, 5000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000855341', 2022, 'Agosto', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2022-08-09', '2022-08-09', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 25000, '2022-08-15', 6, 'Transigido', 'CERRADO', 'RVC'),
('1000855510', 2022, 'Agosto', 'LIMA', 'San Antonio', null, '2022-08-10', '2022-08-10', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-08-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000856233', 2022, 'Agosto', 'LIMA', 'Surquillo', null, '2022-08-12', '2022-08-12', 'JD', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 300, 1200, '2022-08-17', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000856430', 2022, 'Agosto', 'LIMA', 'LIMA', 'Mirones Bajo', '2022-08-12', '2022-08-12', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1300, 13700, '2022-11-13', 93, 'Transigido', 'CERRADO', 'RVC'),
('1000856968', 2022, 'Agosto', 'LIMA', 'Miraflores', null, '2022-08-14', '2022-08-14', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '2022-08-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000857020', 2022, 'Agosto', 'LIMA', 'Chacarrilla', null, '2022-08-14', '2022-08-14', 'OU', 1, 'Politraumatismo, Dorsalgia', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-08-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000857058', 2022, 'Agosto', 'LIMA', 'Santa Felicia', null, '2022-08-14', '2022-08-14', 'OU', 1, 'Politraumatismo, Lumbalgia', 'Politraumatizado', 4000, 'Leve', 4000, 1000, '2022-08-16', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000857238', 2022, 'Agosto', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-08-15', '2022-08-15', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1500, 8500, '2022-08-16', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000857619', 2022, 'Agosto', 'LIMA', 'Miraflores', null, '2022-08-16', '2022-08-16', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-08-16', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000857852', 2022, 'Agosto', 'LIMA', 'LIMA', 'Petit Thouars', '2022-08-17', '2022-08-17', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 400, 9600, '2022-08-17', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000857986', 2022, 'Agosto', 'LIMA', 'Monterrico', null, '2022-08-17', '2022-08-17', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, 800, '2022-09-06', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1000858138', 2022, 'Agosto', 'LIMA', 'Miraflores', null, '2022-08-17', '2022-08-17', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2022-08-21', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000858472', 2022, 'Agosto', 'LIMA', 'Chacarilla', null, '2022-08-18', '2022-08-18', 'JD', 1, 'Fractura de Epífesis de Vertebra / TEC Leve', 'TEC Leve', 5750, 'Leve', 5000, 10000, '2022-09-02', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1000858538', 2022, 'Agosto', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-08-18', '2022-08-18', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 30000, '2022-10-12', 55, 'Transigido', 'CERRADO', 'RVC'),
('1000858703', 2022, 'Agosto', 'LIMA', 'Pueblo Libre', null, '2022-08-19', '2022-08-19', 'OU', 1, 'TEC, Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-08-25', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000858833', 2022, 'Agosto', 'LIMA', 'San Miguel', null, '2022-08-19', '2022-08-19', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-10-06', 48, 'Transigido', 'CERRADO', 'Abeo'),
('1000858950', 2022, 'Agosto', 'LIMA', 'ATE', 'Salamanca', '2022-08-19', '2022-08-19', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 2300, 2110, '2025-06-20', 1036, 'Transigido', 'CERRADO', 'RVC'),
('1000859280', 2022, 'Agosto', 'LIMA', 'CARABAYLLO', 'Santa Isabel', '2022-08-20', '2022-08-20', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2026-04-24', 1343, 'Transigido', 'CERRADO', 'RVC'),
('1000859773', 2022, 'Agosto', 'LIMA', 'Jesus Maria', null, '2022-08-22', '2022-08-22', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000860128', 2022, 'Agosto', 'LIMA', 'VES', 'Pachacamac', '2022-08-23', '2022-08-23', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-08-24', 1, 'Rechazado', 'CERRADO', 'RVC'),
('1000860266', 2022, 'Agosto', 'LIMA', 'San Borja', null, '2022-08-24', '2022-08-24', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-09-02', 9, 'Rechazado', 'CERRADO', 'Abeo'),
('1000860446', 2022, 'Agosto', 'LIMA', 'Surco', null, '2022-08-24', '2022-08-24', 'OU', 2, 'Politraumatismo', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000860606', 2022, 'Agosto', 'LIMA', 'SJL', 'Canto Rey', '2022-08-24', '2022-08-24', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 4000, 3558, '2022-09-23', 30, 'Transigido', 'CERRADO', 'RVC'),
('1000860824', 2022, 'Agosto', 'LIMA', 'Miraflores', null, '2022-08-25', '2022-08-25', 'OU', 2, 'Politraumatismo y Esguince Tobillo', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000861090', 2022, 'Agosto', 'LIMA', 'Surco', null, '2022-08-26', '2022-08-26', 'GC', 1, 'Herida por degloving pie derecho', 'Policontuso', 1725, 'Grave', 15000, 0, '2023-05-26', 273, 'Transigido', 'CERRADO', 'Abeo'),
('1000861550', 2022, 'Agosto', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-08-27', '2022-08-27', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 20000, '2022-08-31', 4, 'Rechazado', 'CERRADO', 'RVC'),
('1000861599', 2022, 'Agosto', 'LIMA', 'VMT', 'Villa Alejandro', '2022-08-27', '2022-08-27', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 15000, '2023-03-10', 195, 'Transigido', 'CERRADO', 'RVC'),
('1000861923', 2022, 'Agosto', 'LIMA', 'Pueblo Libre', null, '2022-08-28', '2022-08-28', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 3500, 1500, '2022-09-06', 9, 'Transigido', 'CERRADO', 'Abeo'),
('1000862139', 2022, 'Agosto', 'LIMA', 'VMT', 'Tablada de Lurín', '2022-08-29', '2022-08-29', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-08-29', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000863036', 2022, 'Agosto', 'LIMA', 'Miraflores', null, '2022-08-31', '2022-08-31', 'OU', 1, 'Fractura Muñeca Izquierda', 'Policontuso', 1725, 'Grave', 6990, 13010, '2022-08-31', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000863081', 2022, 'Agosto', 'LIMA', 'San Borja', null, '2022-09-01', '2022-09-01', 'GC', 2, 'Esguince tobillo Derecho y Politraumatizado', 'Politraumatizado', 8000, 'Grave', 4000, 6000, '2022-09-14', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1000863281', 2022, 'Septiembre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-09-01', '2022-09-01', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-10-16', 45, 'Transigido', 'CERRADO', 'RVC'),
('1000863655', 2022, 'Septiembre', 'LIMA', 'Chacarrilla', null, '2022-09-02', '2022-09-02', 'DS', 1, 'Traumatismos superficiales multiples', 'Policontuso', 1725, 'Leve', 0, 5000, '2022-09-03', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000863830', 2022, 'Septiembre', 'LIMA', 'Lince', null, '2022-09-02', '2022-09-02', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 4200, 800, '2022-10-11', 39, 'Transigido', 'CERRADO', 'Abeo'),
('1000863879', 2022, 'Septiembre', 'LIMA', 'Jesus Maria', null, '2022-09-02', '2022-09-02', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2022-09-09', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000864115', 2022, 'Septiembre', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-09-03', '2022-09-03', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 6000, 6660, '2022-09-16', 13, 'Transigido', 'CERRADO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1000864142', 2022, 'Septiembre', 'LIMA', 'Miraflores', null, '2022-09-03', '2022-09-03', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 200, 1300, '2022-09-04', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000865283', 2022, 'Septiembre', 'LIMA', 'San Miguel', null, '2022-09-07', '2022-09-07', 'GC', 2, 'Policontuso y Policontuso', 'Policontuso', 3450, 'Leve', 0, 3000, '2022-09-21', 14, 'Transigido', 'CERRADO', 'Abeo'),
('1000865527', 2022, 'Septiembre', 'LIMA', 'Maranga', null, '2022-09-07', '2022-09-07', 'DS', 1, 'TEC Leve', 'TEC Leve', 5750, 'Leve', 0, 1500, '2022-09-08', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000866040', 2022, 'Septiembre', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-09-08', '2022-09-08', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 10000, 0, '2023-05-02', 236, 'Transigido', 'CERRADO', 'RVC'),
('1000866155', 2022, 'Septiembre', 'LIMA', 'VES', 'Villa el Salvador', '2022-09-08', '2022-09-08', 'Pierina Ugaz', 3, 'Grave', 'Politraumatizado', 12000, 'Grave', 0, 30000, '2022-09-09', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000866376', 2022, 'Septiembre', 'LIMA', 'Miraflores', null, '2022-09-09', '2022-09-09', 'OU', 1, 'Esguince Tobillo', 'Esguince', 2300, 'Leve', 6000, 9000, '2022-09-10', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000867051', 2022, 'Septiembre', 'LIMA', 'Chacarrilla', null, '2022-09-11', '2022-09-11', 'GC', 1, 'Fractura de pie', 'Fractura Pierna', 17250, 'Grave', 0, 5000, '2022-09-12', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000867194', 2022, 'Septiembre', 'LIMA', 'Miraflores', null, '2022-09-12', '2022-09-12', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 1500, '2022-09-14', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000867207', 2022, 'Septiembre', 'LIMA', 'CHORRILLOS', 'Villa Chorrillos (La curva)', '2022-09-12', '2022-09-12', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-09-16', 4, 'Transigido', 'CERRADO', 'RVC'),
('1000867413', 2022, 'Septiembre', 'LIMA', 'Jesus Maria', null, '2022-09-12', '2022-09-12', 'GC', 1, 'Politraumatizado con corte profundo en la pierna', 'Politraumatizado', 4000, 'Leve', 2000, 1000, '2022-09-14', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000867541', 2022, 'Septiembre', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-09-12', '2022-09-12', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 20000, '2022-09-15', 3, 'Rechazado', 'CERRADO', 'RVC'),
('1000867575', 2022, 'Septiembre', 'LIMA', 'SMP', 'San Martin de Porres', '2022-09-13', '2022-09-13', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 5660, 4340, '2022-12-23', 101, 'Transigido', 'CERRADO', 'RVC'),
('1000867603', 2022, 'Septiembre', 'LIMA', 'Magdalena', null, '2022-09-13', '2022-09-13', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-09-13', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000867834', 2022, 'Septiembre', 'LIMA', 'Surco', null, '2022-09-13', '2022-09-13', 'DS', 1, 'Fractura del Arco Costal', 'Policontuso', 1725, 'Grave', 8000, 2000, '2022-10-17', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1000867966', 2022, 'Septiembre', 'LIMA', 'Barranco', null, '2022-09-14', '2022-09-14', 'DS', 1, 'Policontusa, Esguince Cervical, Contusión Toráxica, Contsión hombro izquierdo y contusión rodilla derecha', 'Esguince', 2300, 'Leve', 5000, 5000, '2022-09-19', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000868264', 2022, 'Septiembre', 'LIMA', 'LIMA', 'San Andrés', '2022-09-14', '2022-09-14', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-09-15', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000868504', 2022, 'Septiembre', 'LIMA', 'Chacarrilla', null, '2022-09-15', '2022-09-15', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 4500, 500, '2022-09-21', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000868506', 2022, 'Septiembre', 'LIMA', 'Sagitario', null, '2022-09-15', '2022-09-15', 'DS', 1, 'Contusión Toraxico', 'Policontuso', 1725, 'Leve', 1500, 0, '2022-09-16', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000868935', 2022, 'Septiembre', 'LIMA', 'San Isidro', null, '2022-09-16', '2022-09-16', 'OU', 1, 'Fractura Diafisis de Tibia', 'Policontuso', 1725, 'Grave', 34000, -4000, '2022-10-25', 39, 'Transigido', 'CERRADO', 'Abeo'),
('1000869602', 2022, 'Septiembre', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2022-09-17', '2022-09-17', 'Pierina Ugaz', 5, 'Leve', 'Policontuso', 8625, 'Grave', 790, 29210, '2023-03-22', 186, 'Transigido', 'CERRADO', 'RVC'),
('1000870611', 2022, 'Septiembre', 'LIMA', 'San Miguel', null, '2022-09-20', '2022-09-20', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 1500, '2022-09-10', -10, 'Transigido', 'CERRADO', 'Abeo'),
('1000870802', 2022, 'Septiembre', 'LIMA', 'INDEPENDENCIA', 'Independencia', '2022-09-21', '2022-09-21', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 40000, '2023-01-03', 104, 'Transigido', 'CERRADO', 'RVC'),
('1000871154', 2022, 'Septiembre', 'LIMA', 'LIMA', 'Palomino', '2022-09-21', '2022-09-21', 'Javier Castañeda', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 25000, '2022-09-26', 5, 'Transigido', 'CERRADO', 'RVC'),
('1000871506', 2022, 'Septiembre', 'LIMA', 'PACHACAMAC', 'Manchay', '2022-09-22', '2022-09-22', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-09-23', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000871855', 2022, 'Septiembre', 'LIMA', 'San Borja', null, '2022-09-23', '2022-09-23', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-09-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000872121', 2022, 'Septiembre', 'LIMA', 'San Miguel', null, '2022-09-23', '2022-09-23', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000873108', 2022, 'Septiembre', 'LIMA', 'Monterrico', null, '2022-09-24', '2022-09-24', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-09-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000873187', 2022, 'Septiembre', 'LIMA', 'EL AGUSTINO', 'Santoyo', '2022-09-25', '2022-09-25', 'Javier Castañeda', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', null, 15000, '2026-04-24', 1307, 'Transigido', 'CERRADO', 'RVC'),
('1000873203', 2022, 'Septiembre', 'LIMA', 'Petit Thouars', null, '2022-09-25', '2022-09-25', 'DS', 1, 'Amenaza de parto prematuro, Policontusa', 'Policontuso', 1725, 'Leve', 0, 3000, '2022-09-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000873212', 2022, 'Septiembre', 'LIMA', 'La Planicie', null, '2022-09-25', '2022-09-25', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 2950, 2050, '2022-10-12', 17, 'Transigido', 'CERRADO', 'Abeo'),
('1000874986', 2022, 'Septiembre', 'LIMA', 'Jesus Maria', null, '2022-09-28', '2022-09-28', 'OU', 1, 'Politraumatismo, TEC Leve', 'TEC Leve', 5750, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000875570', 2022, 'Septiembre', 'LIMA', 'SJM', 'Pamplona I', '2022-09-29', '2022-09-29', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 4700, 386, '2022-11-21', 53, 'Transigido', 'CERRADO', 'RVC'),
('1000876974', 2022, 'Octubre', 'LIMA', 'Magdalena', null, '2022-10-03', '2022-10-03', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-10-04', 1, 'Archivado', 'CERRADO', 'Abeo'),
('1000877966', 2022, 'Octubre', 'LIMA', 'Miraflores', null, '2022-10-05', '2022-10-05', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-03', 29, 'Transigido', 'CERRADO', 'Abeo'),
('15361017', 2022, 'Julio', 'LIMA', 'Jesus Maria', null, '2022-07-22', '2022-07-22', 'GC', 1, 'Politrumatizada', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000878428', 2022, 'Octubre', 'LIMA', 'Orrantia', null, '2022-10-06', '2022-10-06', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1150, 3850, '2022-10-10', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000878431', 2022, 'Octubre', 'LIMA', 'La Molina', null, '2022-10-06', '2022-10-06', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1213, 3787, '2022-10-14', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000878486', 2022, 'Octubre', 'LIMA', 'Santa Felicia', null, '2022-10-07', '2022-10-07', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000878700', 2022, 'Octubre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-10-05', '2022-10-05', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-11-08', 34, 'Transigido', 'CERRADO', 'RVC'),
('1000878787', 2022, 'Octubre', 'LIMA', 'Surquillo', null, '2022-10-07', '2022-10-07', 'OU', 1, 'Politraumatismo, Trauma Rodilla', 'Politraumatizado', 4000, 'Leve', 950, 4050, '2022-10-15', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000879167', 2022, 'Octubre', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-10-09', '2022-10-09', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 5850, 14760, '2022-11-15', 37, 'Transigido', 'CERRADO', 'RVC'),
('1000879344', 2022, 'Octubre', 'LIMA', 'PACHACAMAC', 'Manchay', '2022-10-09', '2022-10-09', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-10-09', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000879976', 2022, 'Octubre', 'LIMA', 'Maranga', null, '2022-10-11', '2022-10-11', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-10-11', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000880239', 2022, 'Octubre', 'LIMA', 'Santa Felica', null, '2022-10-12', '2022-10-12', 'DS', 1, 'Fractura de la epifisis superior de la tibia, esguince y torcedura de tobillo, Herida en la pierna', 'Torcedura', 3450, 'Leve', 800, 9200, '2022-10-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000880527', 2022, 'Octubre', 'LIMA', 'LIMA', 'Monserrate', '2022-10-12', '2022-10-12', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 700, 14300, '2022-10-09', -3, 'Transigido', 'CERRADO', 'RVC'),
('1000880784', 2022, 'Octubre', 'LIMA', 'SMP', 'Barboncitos', '2022-10-13', '2022-10-13', 'Pierina Ugaz', 6, 'Leve', 'Policontuso', 10350, 'Grave', null, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000881301', 2022, 'Octubre', 'LIMA', 'San Borja', null, '2022-10-14', '2022-10-14', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-10-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000882042', 2022, 'Octubre', 'LIMA', 'Jesus Maria', null, '2022-10-18', '2022-10-18', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000882244', 2022, 'Octubre', 'LIMA', 'San Antonio', null, '2022-10-18', '2022-10-18', 'JD', 2, 'Politraumatismo', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000882569', 2022, 'Octubre', 'LIMA', 'COMAS', 'Santa Luzmila', '2022-10-18', '2022-10-18', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000882856', 2022, 'Octubre', 'LIMA', 'Miraflores', null, '2022-10-19', '2022-10-19', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1000, 500, '2022-10-21', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000882892', 2023, 'Febrero', 'LIMA', 'INDEPENDENCIA', 'Independencia', '2023-02-06', '2022-10-16', 'Pierina Ugaz', 1, 'Fractura del pómulo derecho', 'Fractura Pierna', 17250, 'Grave', 9040, 9040, '2024-10-23', 625, 'Transigido', 'CERRADO', 'RVC'),
('1000884849', 2022, 'Octubre', 'LIMA', 'San Borja', null, '2022-10-23', '2022-10-23', 'DS', 2, 'Policontuso y Fractura en la Rotula', 'Policontuso', 3450, 'Grave', 20000, 1150, '2022-11-10', 18, 'Transigido', 'CERRADO', 'Abeo'),
('1000884852', 2022, 'Octubre', 'LIMA', 'Chacarrilla', null, '2022-10-23', '2022-10-23', 'JD', 1, 'Fractura de Tobillo', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000884972', 2022, 'Octubre', 'LIMA', 'San Borja', null, '2022-10-24', '2022-10-24', 'DS', 1, 'Esguince en el tobillo', 'Esguince', 2300, 'Leve', 0, 5000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000885023', 2022, 'Octubre', 'LIMA', 'Surco', null, '2022-10-24', '2022-10-24', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-10-24', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1000885268', 2022, 'Octubre', 'LIMA', 'Magdalena', null, '2022-10-24', '2022-10-24', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2022-12-28', 65, 'Transigido', 'CERRADO', 'Abeo'),
('1000885492', 2022, 'Octubre', 'LIMA', 'Lince', null, '2022-10-25', '2022-10-25', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 3000, 2000, '2022-10-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000886129', 2022, 'Octubre', 'LIMA', 'San Miguel', null, '2022-10-26', '2022-10-26', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 350, 1150, '2022-10-26', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000886597', 2022, 'Octubre', 'LIMA', 'San Isidro', null, '2022-10-27', '2022-10-27', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1700, 3300, '2022-10-28', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000886881', 2022, 'Octubre', 'LIMA', 'San Antonio', null, '2022-10-28', '2022-10-28', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 920, 4080, '2022-11-01', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000887039', 2022, 'Octubre', 'LIMA', 'Maranga', null, '2022-10-28', '2022-10-28', 'DS', 1, 'Esguince de tobillo', 'Esguince', 2300, 'Leve', 0, 5000, '2022-10-28', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000887587', 2022, 'Octubre', 'LIMA', 'LIMA', 'Cotabambas', '2022-10-29', '2022-10-29', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 25000, '2022-11-10', 12, 'Rechazado', 'CERRADO', 'RVC'),
('1000887648', 2022, 'Octubre', 'LIMA', 'SJL', 'Caja de Agua', '2022-10-31', '2022-10-31', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 350, 14650, '2022-10-31', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000887719', 2022, 'Octubre', 'LIMA', 'LIMA', 'San Andres', '2022-10-31', '2022-10-31', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-11-06', 6, 'Transigido', 'CERRADO', 'RVC'),
('1000888149', 2022, 'Noviembre', 'LIMA', 'Miraflores', null, '2022-11-01', '2022-11-01', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-11-01', 0, 'Archivado', 'CERRADO', 'Abeo'),
('15441895', 2022, 'Septiembre', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-09-07', '2022-09-07', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 0, 24000, '2023-02-22', 168, 'Judicializado', 'CERRADO', 'RVC'),
('1000888610', 2022, 'Noviembre', 'LIMA', 'Orrantia', null, '2022-11-02', '2022-11-02', 'DS', 1, 'Fractura de Radio Distal Derecho y fractura de arco costal izquierdo', 'Fractura de radio y cúbito', 17250, 'Grave', 9000, 11000, '2022-11-28', 26, 'Transigido', 'CERRADO', 'Abeo'),
('1000888624', 2022, 'Noviembre', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-11-02', '2022-11-02', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-12-05', 33, 'Transigido', 'CERRADO', 'RVC'),
('15421897', 2022, 'Agosto', 'LIMA', 'CARABAYLLO', 'Santa Isabel', '2022-08-24', '2022-08-24', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2025-05-25', 1005, 'Otros', 'CERRADO', 'RVC'),
('1000888888', 2022, 'Noviembre', 'LIMA', 'Surquillo', null, '2022-11-03', '2022-11-03', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 959, 541, '2022-11-03', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000889058', 2022, 'Noviembre', 'LIMA', 'LOS OLIVOS', 'Comisaría de Pro', '2022-11-04', '2022-11-04', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 4880, 4560, '2023-05-11', 188, 'Transigido', 'CERRADO', 'RVC'),
('1000889562', 2022, 'Noviembre', 'LIMA', 'Orrantia', null, '2022-11-05', '2022-11-05', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000889678', 2022, 'Noviembre', 'LIMA', 'PACHACAMAC', 'Manchay', '2022-11-05', '2022-11-05', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 100, 24900, '2022-11-07', 2, 'Transigido', 'CERRADO', 'RVC'),
('1000889715', 2022, 'Noviembre', 'LIMA', 'San Luis', null, '2022-11-05', '2022-11-05', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-11-05', 0, 'Rechazado', 'CERRADO', 'Abeo'),
('1000889878', 2022, 'Noviembre', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2022-11-06', '2022-11-06', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 3424, 3424, '2023-03-22', 136, 'Transigido', 'CERRADO', 'RVC'),
('1000889946', 2022, 'Noviembre', 'LIMA', 'LIMA', 'Alfonso Ugarte', '2022-11-06', '2022-11-06', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-11-06', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000889975', 2022, 'Noviembre', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2022-11-06', '2022-11-06', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-11-17', 11, 'Transigido', 'CERRADO', 'RVC'),
('1000890015', 2022, 'Noviembre', 'LIMA', 'CHORRILLOS', 'Villa Chorrillos', '2022-11-06', '2022-11-06', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 300, 9700, '2023-11-08', 367, 'Transigido', 'CERRADO', 'RVC'),
('1000890045', 2022, 'Noviembre', 'LIMA', 'San Isidro', null, '2022-11-07', '2022-11-07', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000890065', 2022, 'Noviembre', 'LIMA', 'COMAS', 'Tupac Amaru', '2022-11-07', '2022-11-07', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 6000, 2720, '2024-10-30', 723, 'Transigido', 'CERRADO', 'RVC'),
('1000890605', 2022, 'Noviembre', 'LIMA', 'San Antonio', null, '2022-11-08', '2022-11-08', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-08', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000890954', 2022, 'Noviembre', 'LIMA', 'Sagitario', null, '2022-11-08', '2022-11-08', 'DS', 1, 'Esguince en el tobillo', 'Esguince', 2300, 'Leve', 0, 5000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000891633', 2022, 'Noviembre', 'LIMA', 'Maranga', null, '2022-11-10', '2022-11-10', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, 800, '2022-11-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15768885', 2023, 'Marzo', 'LIMA', 'VMT', 'Nueva Esperanza', '2023-03-20', '2023-03-20', 'Pierina Ugaz', 1, 'Por actualizar', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1000891797', 2022, 'Noviembre', 'LIMA', 'COMAS', 'Tupac Amaru', '2022-11-10', '2022-11-10', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 15000, '2024-12-21', 772, 'Transigido', 'CERRADO', 'RVC'),
('1000891818', 2022, 'Noviembre', 'LIMA', 'Maranga', null, '2022-11-11', '2022-11-11', 'OU', 1, 'Herida Cortante en Mano, Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-12-02', 21, 'Transigido', 'CERRADO', 'Abeo'),
('1000891846', 2022, 'Noviembre', 'LIMA', 'SJL', 'Santa Elizabeth', '2022-11-11', '2022-11-11', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-11-11', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000892064', 2022, 'Noviembre', 'LIMA', 'LURIN', 'Lurin', '2022-11-11', '2022-11-11', 'Pierina Ugaz', 3, 'Grave', 'Politraumatizado', 12000, 'Grave', 0, 15000, '2023-12-02', 386, 'Rechazado', 'CERRADO', 'RVC'),
('1000892075', 2022, 'Noviembre', 'LIMA', 'Pueblo Libre', null, '2022-11-11', '2022-11-11', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000892395', 2022, 'Noviembre', 'LIMA', 'Jesus Maria', null, '2022-11-12', '2022-11-12', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-16', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000892694', 2022, 'Noviembre', 'LIMA', 'Surco', null, '2022-11-14', '2022-11-14', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000893014', 2022, 'Noviembre', 'LIMA', 'Miraflores', null, '2022-11-14', '2022-11-14', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 5000, 0, '2023-02-02', 80, 'Transigido', 'CERRADO', 'Abeo'),
('1000893097', 2022, 'Noviembre', 'LIMA', 'San Antonio', null, '2022-11-15', '2022-11-15', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000893368', 2022, 'Noviembre', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-11-15', '2022-11-15', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 10975, 1455, '2023-02-17', 94, 'Transigido', 'CERRADO', 'RVC'),
('1000893537', 2022, 'Noviembre', 'LIMA', 'San Borja', null, '2022-11-16', '2022-11-16', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-17', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000893717', 2022, 'Noviembre', 'LIMA', 'San Miguel', null, '2022-11-16', '2022-11-16', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000893835', 2022, 'Noviembre', 'LIMA', 'ATE', 'Salamanca', '2022-11-16', '2022-11-16', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-11-25', 9, 'Transigido', 'CERRADO', 'RVC'),
('1000893878', 2022, 'Noviembre', 'LIMA', 'Surquillo', null, '2022-11-16', '2022-11-16', 'OU', 1, 'Policontuso, Contusión Tobillo', 'Policontuso', 1725, 'Leve', 200, 1300, '2022-11-17', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000893909', 2022, 'Noviembre', 'LIMA', 'Jesus Maria', null, '2022-11-16', '2022-11-16', 'GC', 2, 'Politraumatizado y politraumatizado', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000893912', 2022, 'Noviembre', 'LIMA', 'Orrantia', null, '2022-11-16', '2022-11-16', 'DS', 1, 'Trauma Torax, Fractura de costillas', 'Fractura de costillas', 10000, 'Grave', 20000, 30000, '2022-12-22', 36, 'Transigido', 'CERRADO', 'Abeo'),
('1000894475', 2022, 'Noviembre', 'LIMA', 'ATE', 'Salamanca', '2022-11-18', '2022-11-18', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 10000, '2023-05-23', 186, 'Transigido', 'CERRADO', 'RVC'),
('1000894511', 2022, 'Noviembre', 'LIMA', 'Magdalena', null, '2022-11-18', '2022-11-18', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000895052', 2022, 'Noviembre', 'LIMA', 'Jesus Maria', null, '2022-11-19', '2022-11-19', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000895058', 2022, 'Noviembre', 'LIMA', 'Miraflores', null, '2022-11-19', '2022-11-19', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-11-20', 366, 'Transigido', 'CERRADO', 'Abeo'),
('1000895264', 2022, 'Noviembre', 'LIMA', 'Santa Felicia', null, '2022-11-19', '2022-11-19', 'DS', 1, 'Esguince de tobillo, contusión lumbo sacra y pelvis', 'Esguince', 2300, 'Leve', 1500, 3500, '2022-11-19', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000895297', 2022, 'Noviembre', 'LIMA', 'Jesus Maria', null, '2022-11-20', '2022-11-20', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-20', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1000895364', 2022, 'Noviembre', 'LIMA', 'SJL', 'Zarate', '2022-11-20', '2022-11-20', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-12-08', 18, 'Transigido', 'CERRADO', 'RVC'),
('1000895481', 2022, 'Noviembre', 'LIMA', 'SJM', 'Pamplona I', '2022-11-21', '2022-11-21', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 20000, '2022-12-10', 19, 'Transigido', 'CERRADO', 'RVC'),
('1000895746', 2022, 'Noviembre', 'LIMA', 'SANTA ANITA', 'Santa Anita', '2022-11-21', '2022-11-21', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-12-20', 29, 'Transigido', 'CERRADO', 'RVC'),
('1000895799', 2022, 'Noviembre', 'LIMA', 'COMAS', 'Tupac Amaru', '2022-11-21', '2022-11-21', 'Pierina Ugaz', 3, 'Leve', 'Policontuso', 5175, 'Leve', null, 40000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000896282', 2022, 'Noviembre', 'LIMA', 'Lince', null, '2022-11-23', '2022-11-23', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('15167325', 2022, 'Marzo', 'LIMA', 'LIMA', 'UV3', '2022-03-12', '2022-03-12', 'Mario Pilares', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 13610, '2022-11-07', 240, 'Judicializado', 'CERRADO', 'RVC'),
('1000896500', 2022, 'Noviembre', 'LIMA', 'SMP', 'Barboncitos', '2022-11-23', '2022-11-23', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 800, 9200, '2022-11-23', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000896768', 2022, 'Noviembre', 'LIMA', 'Maranga', null, '2022-11-24', '2022-11-24', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000896801', 2022, 'Noviembre', 'LIMA', 'SJL', 'Caja de Agua', '2022-11-24', '2022-11-24', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-12-12', 18, 'Transigido', 'CERRADO', 'RVC'),
('1000897086', 2022, 'Noviembre', 'LIMA', 'Monterrico', null, '2022-11-24', '2022-11-24', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000897125', 2022, 'Noviembre', 'LIMA', 'Chacarilla', null, '2022-11-25', '2022-11-25', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-11-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000897133', 2022, 'Noviembre', 'LIMA', 'Barranco', null, '2022-11-25', '2022-11-25', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000897217', 2022, 'Noviembre', 'LIMA', 'San Borja', null, '2022-11-25', '2022-11-25', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000897400', 2022, 'Noviembre', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-11-25', '2022-11-25', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-01-06', 42, 'Transigido', 'CERRADO', 'RVC'),
('1000897437', 2022, 'Noviembre', 'LIMA', 'LIMA', 'San Andres', '2022-11-25', '2022-11-25', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1580, 574, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000897514', 2022, 'Noviembre', 'LIMA', 'LOS OLIVOS', 'Laura Caller', '2022-11-26', '2022-11-26', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-11-26', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000898307', 2022, 'Noviembre', 'LIMA', 'Monterrico', null, '2022-11-28', '2022-11-28', 'OU', 1, 'Politraumatismo, Trauma Muñeca', 'Politraumatizado', 4000, 'Leve', 855.98, 4144.02, '2022-12-15', 17, 'Transigido', 'CERRADO', 'Abeo'),
('1000898798', 2022, 'Noviembre', 'LIMA', 'Miraflores', null, '2022-11-29', '2022-11-29', 'GC', 1, 'Fractura de pie', 'Fractura Pierna', 17250, 'Grave', 2500, 500, '2022-12-01', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000899113', 2022, 'Noviembre', 'LIMA', 'San Miguel', null, '2022-11-30', '2022-11-30', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-12-07', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000899121', 2022, 'Noviembre', 'LIMA', 'ATE', 'Ate Vitarte', '2022-11-30', '2022-11-30', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 3000, 3534, '2022-02-07', -296, 'Transigido', 'CERRADO', 'RVC'),
('1000899221', 2022, 'Noviembre', 'LIMA', 'Jesus Maria', null, '2022-11-30', '2022-11-30', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Grave', 17000, 3000, '2023-04-27', 148, 'Transigido', 'CERRADO', 'Abeo'),
('1000899813', 2022, 'Diciembre', 'LIMA', 'Surquillo', null, '2022-12-01', '2022-12-01', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000899915', 2022, 'Diciembre', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2022-12-02', '2022-12-02', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1800, 2090, '2024-03-20', 474, 'Transigido', 'CERRADO', 'RVC'),
('1000900152', 2022, 'Diciembre', 'LIMA', 'Miraflores', null, '2022-12-02', '2022-12-02', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2022-12-07', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000900617', 2022, 'Diciembre', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-12-03', '2022-12-03', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 4380, 4520, '2023-02-07', 66, 'Transigido', 'CERRADO', 'RVC'),
('1000901902', 2022, 'Diciembre', 'LIMA', 'Jesús María', null, '2022-12-07', '2022-12-07', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1400, 3600, '2022-12-10', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1000902019', 2022, 'Diciembre', 'LIMA', 'San Isidro', null, '2022-12-07', '2022-12-07', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-12-07', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1000902298', 2022, 'Diciembre', 'LIMA', 'San Antonio', null, '2022-12-08', '2022-12-08', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000902385', 2022, 'Diciembre', 'LIMA', 'Jesús María', null, '2022-12-09', '2022-12-09', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, 800, '2022-12-15', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000916616', 2023, 'Enero', 'LIMA', 'Sagitario', null, '2023-01-16', '2023-01-16', 'DS', 7, 'Traumatismos múltiples / Traumatismo Superficial múltiples / Contusión de la región Lumbosacra y pelvis / Traumatismo Múltiples / Traumatismo superficiales no especificados / Contusión de hombro y brazo / Contusión de hombro y brazo', 'Policontuso', 12075, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000902597', 2022, 'Diciembre', 'LIMA', 'San Borja', null, '2022-12-10', '2022-12-10', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000902748', 2022, 'Diciembre', 'LIMA', 'San Borja', null, '2022-12-10', '2022-12-10', 'GC', 1, 'Fractura Hombo', 'Policontuso', 1725, 'Grave', 10000, 5000, '2023-01-03', 24, 'Transigido', 'CERRADO', 'Abeo'),
('1000902975', 2022, 'Diciembre', 'LIMA', 'VENTANILLA', 'Villa Los Reyes}', '2022-12-11', '2022-12-11', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-12-14', 3, 'Transigido', 'CERRADO', 'RVC'),
('15153160', 2022, 'Febrero', 'LIMA', 'SJM', 'Pamplona I', '2022-02-25', '2022-02-25', 'Pierina Ugaz', 3, 'Grave', 'Politraumatizado', 12000, 'Grave', null, 80000, '2025-05-26', 1186, 'Otros', 'CERRADO', 'RVC'),
('1000903507', 2022, 'Diciembre', 'LIMA', 'ATE', 'Salamanca', '2022-12-13', '2022-12-13', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 250, 9750, '2023-12-13', 365, 'Transigido', 'CERRADO', 'RVC'),
('1000903550', 2022, 'Diciembre', 'LIMA', 'San Antonio', null, '2022-12-13', '2022-12-13', 'DS', 1, 'Fractura expuesta', 'Policontuso', 1725, 'Grave', 50000, 0, '2023-05-29', 167, 'Transigido', 'CERRADO', 'Abeo'),
('15139599', 2022, 'Febrero', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2022-02-16', '2022-02-16', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 20000, '2025-05-25', 1194, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000904995', 2022, 'Diciembre', 'LIMA', 'Miraflores', null, '2022-12-16', '2022-12-16', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 1500, '2023-01-03', 18, 'Transigido', 'CERRADO', 'Abeo'),
('1000905030', 2022, 'Diciembre', 'LIMA', 'Chacarrilla', null, '2022-12-16', '2022-12-16', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, 0, '2022-12-16', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000905065', 2022, 'Diciembre', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-12-16', '2022-12-16', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-12-30', 14, 'Transigido', 'CERRADO', 'RVC'),
('1000905604', 2022, 'Diciembre', 'LIMA', 'SMP', 'San Martín de Porres', '2022-12-18', '2022-12-18', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-01-08', 386, 'Transigido', 'CERRADO', 'RVC'),
('1000905633', 2022, 'Diciembre', 'LIMA', 'RIMAC', 'Piedra Liza', '2022-12-18', '2022-12-18', 'Javier Castañeda', 3, 'Leve', 'Policontuso', 5175, 'Leve', 0, 13500, '2023-01-15', 28, 'Transigido', 'CERRADO', 'RVC'),
('1000905697', 2022, 'Diciembre', 'LIMA', 'San Isidro', null, '2022-12-18', '2022-12-18', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000905767', 2022, 'Diciembre', 'LIMA', 'Pueblo Libre', null, '2022-12-18', '2022-12-18', 'DS', 4, 'Policontusos', 'Policontuso', 6900, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1000906129', 2022, 'Diciembre', 'LIMA', 'LIMA', 'Petit Thouars', '2022-12-19', '2022-12-19', 'Javier Castañeda', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 0, 50000, '2023-09-14', 269, 'Transigido', 'CERRADO', 'RVC'),
('1000906136', 2022, 'Diciembre', 'LIMA', 'PACHACAMAC', 'Pachacamac', '2022-12-17', '2022-12-17', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1000906662', 2022, 'Diciembre', 'LIMA', 'Monterrico', null, '2022-12-20', '2022-12-20', 'OU', 1, 'Esguince Cervical', 'Esguince', 2300, 'Leve', 1000, 4000, '2023-02-27', 69, 'Transigido', 'CERRADO', 'Abeo'),
('1000906765', 2022, 'Diciembre', 'LIMA', 'Chacarrilla', null, '2022-12-20', '2022-12-20', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Otros', 'CERRADO', 'Abeo'),
('1000906943', 2022, 'Diciembre', 'LIMA', 'San Miguel', null, '2022-12-20', '2022-12-20', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 200, 1300, '2022-12-20', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000907002', 2022, 'Diciembre', 'LIMA', 'Surquillo', null, '2022-12-20', '2022-12-20', 'OU', 1, 'Politraumatismo-, sin embargo, no paso atención médica de forma inicial', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000907018', 2022, 'Diciembre', 'LIMA', 'Monterrico', null, '2022-12-21', '2022-12-21', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-12-21', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1000907206', 2022, 'Diciembre', 'LIMA', 'Miraflores', null, '2022-12-21', '2022-12-21', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1400, 100, '2023-01-09', 19, 'Transigido', 'CERRADO', 'Abeo'),
('1000907732', 2022, 'Diciembre', 'LIMA', 'SMP', 'Barboncitos', '2022-12-22', '2022-12-22', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-12-22', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000907794', 2022, 'Diciembre', 'LIMA', 'EL AGUSTINO', 'El Agustino', '2022-12-22', '2022-12-22', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1000908350', 2022, 'Diciembre', 'LIMA', 'Lince', null, '2022-12-24', '2022-12-24', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000908630', 2022, 'Diciembre', 'LIMA', 'Maranga', null, '2022-12-25', '2022-12-25', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000908861', 2022, 'Diciembre', 'LIMA', 'LURIGANCHO', 'Huachipa', '2022-12-22', '2022-12-22', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-12-27', 5, 'Transigido', 'CERRADO', 'RVC'),
('1000908864', 2022, 'Diciembre', 'LIMA', 'Santa Felicia', null, '2022-12-26', '2022-12-26', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-12-30', 4, 'Archivado', 'CERRADO', 'Abeo'),
('1000908986', 2022, 'Diciembre', 'LIMA', 'Lince', null, '2022-12-26', '2022-12-26', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 200, 1300, '2022-12-27', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000909162', 2022, 'Diciembre', 'LIMA', 'Magdalena', null, '2022-12-26', '2022-12-26', 'GC', 1, 'Politraumatizado, Corte en la cabeza', 'Politraumatizado', 4000, 'Leve', 1500, 1500, '2022-12-29', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1000909443', 2022, 'Junio', 'LIMA', 'Surquiilo', null, '2022-06-14', '2022-06-14', 'GC', 1, 'Politrumatizado, Fractura de costillas', 'Fractura de costillas', 10000, 'Grave', 14400, 600, '2023-03-31', 290, 'Transigido', 'CERRADO', 'Abeo'),
('1000910090', 2022, 'Diciembre', 'LIMA', 'LURIN', 'Lurín', '2022-12-28', '2022-12-28', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 0, '2023-03-21', 83, 'Transigido', 'CERRADO', 'RVC'),
('1000910134', 2022, 'Diciembre', 'LIMA', 'Orrantia', null, '2022-12-28', '2022-12-28', 'GC', 1, 'Politraumatizada, esguinces y torceduras de la columna lumbar', 'Politraumatizado', 4000, 'Leve', 6000, 4000, '2023-02-16', 50, 'Transigido', 'CERRADO', 'Abeo'),
('1000910176', 2022, 'Diciembre', 'LIMA', 'RIMAC', 'Campo Rimac', '2022-12-29', '2022-12-29', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-02-02', 35, 'Rechazado', 'CERRADO', 'RVC'),
('1000910660', 2022, 'Diciembre', 'LIMA', 'INGUNZA', '. Ingunza', '2022-12-30', '2022-12-30', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 2300, 12700, '2023-01-04', 5, 'Transigido', 'CERRADO', 'RVC'),
('1000910936', 2022, 'Diciembre', 'LIMA', 'CARABAYLLO', 'Progreso', '2022-12-31', '2022-12-31', 'Pierina Ugaz', 2, 'Grave', 'Politraumatizado', 8000, 'Grave', 55000, 7310, '2024-01-08', 373, 'Transigido', 'CERRADO', 'RVC'),
('1000911199', 2023, 'Enero', 'LIMA', 'San Antonio', null, '2023-01-01', '2023-01-01', 'OU', 2, 'Politraumatismo', 'Politraumatizado', 8000, 'Grave', 400, 9600, '2023-01-03', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000911218', 2022, 'Diciembre', 'LIMA', 'San Miguel', null, '2022-12-31', '2022-12-31', 'OU', 3, 'Contusión Lumbar y 2 Policontusos', 'Policontuso', 5175, 'Leve', null, null, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000911756', 2022, 'Enero', 'LIMA', 'CHACLACAYO', 'Chaclacayo', '2022-01-03', '2022-01-03', 'Pierina Ugaz', 6, 'Policontuso / Policontuso/ Policontuso / Policontuso/ Policontuso/ Contusión en ambas piernas y codo izquierdo', 'Policontuso', 10350, 'Grave', null, 30000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000911762', 2023, 'Enero', 'LIMA', 'VES', 'Laderas de Villa', '2023-01-02', '2023-01-02', 'Mario Pilares', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', null, 30000, '2026-04-24', 1208, 'Transigido', 'CERRADO', 'RVC'),
('1000912069', 2023, 'Enero', 'LIMA', 'Miraflores', null, '2023-01-03', '2023-01-03', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000912461', 2023, 'Enero', 'LIMA', 'Santa Felicia', null, '2023-01-04', '2023-01-04', 'JD', 2, 'Politraumatizado / TEC Moderado', 'TEC Moderado', 23000, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000912746', 2023, 'Enero', 'LIMA', 'San Borja', null, '2023-01-05', '2023-01-05', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 3000, 2000, '2023-01-16', 11, 'Transigido', 'CERRADO', 'Abeo'),
('1000912911', 2023, 'Enero', 'LIMA', 'Lince', null, '2023-01-06', '2023-01-06', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-01-06', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000913157', 2023, 'Enero', 'LIMA', 'Surquillo', null, '2023-01-06', '2023-01-06', 'GC', 1, 'policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-02-01', 26, 'Transigido', 'CERRADO', 'Abeo'),
('1000913915', 2023, 'Enero', 'LIMA', 'COMAS', 'Santa Luzmila', '2023-01-08', '2022-01-08', 'Pierina Ugaz', 1, 'Policontuso (Dosaje etílico positivo)', 'Policontuso', 1725, 'Leve', 0, 15000, '2026-04-24', 1202, 'Transigido', 'CERRADO', 'RVC'),
('1000914347', 2023, 'Enero', 'LIMA', 'La Molina', null, '2023-01-10', '2023-01-10', 'DS', 1, 'Traumatismo de cabeza, Esguince de tobillo', 'Esguince', 2300, 'Leve', 0, 5000, '2023-06-27', 168, 'Transigido', 'CERRADO', 'Abeo'),
('1000914492', 2022, 'Enero', 'LIMA', 'LIMA', 'UV Mirones Altos', '2022-01-10', '2022-01-10', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 12000, '2026-04-24', 1565, 'Transigido', 'CERRADO', 'RVC'),
('1000914639', 2023, 'Enero', 'LIMA', 'Maranga', null, '2023-01-10', '2023-01-10', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 200, 1300, '2023-01-16', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000914719', 2023, 'Enero', 'LIMA', 'San Isidro', null, '2023-01-11', '2023-01-11', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 736, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000915703', 2023, 'Enero', 'LIMA', 'PACHACAMAC', 'Manchay', '2023-01-12', '2023-01-12', 'Pierina Ugaz', 3, ': Policontuso / Policontuso/ Policontuso', 'Policontuso', 5175, 'Leve', 0, 15000, '2023-10-12', 273, 'Judicializado', 'CERRADO', 'RVC'),
('1000915765', 2023, 'Enero', 'LIMA', 'Chacarrilla', null, '2023-01-13', '2023-01-13', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2000, 3000, '2023-01-27', 14, 'Transigido', 'CERRADO', 'Abeo'),
('1000915852', 2023, 'Enero', 'LIMA', 'San Isidro', null, '2023-01-13', '2023-01-13', 'DS', 1, 'Fractura de Perone', 'Policontuso', 1725, 'Grave', 27000, 3000, '2023-02-16', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1000915896', 2023, 'Enero', 'LIMA', 'Monterrico', null, '2023-01-13', '2023-01-13', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 150, 1350, '2023-01-16', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1000916256', 2023, 'Enero', 'LIMA', 'LIMA', 'Cotabambas', '2023-01-14', '2023-01-14', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 20000, '2023-01-14', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000916309', 2023, 'Enero', 'LIMA', 'Miraflores', null, '2023-01-14', '2023-01-14', 'DS', 1, 'Esguince de Tobillo', 'Esguince', 2300, 'Leve', 0, 5000, '2023-01-31', 17, 'Transigido', 'CERRADO', 'Abeo'),
('1000916427', 2023, 'Enero', 'LIMA', 'Santa Felicia', null, '2023-01-15', '2023-01-15', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000916548', 2022, 'Enero', 'LIMA', 'CARABAYLLO', 'Santa Isabel', '2022-01-15', '2022-01-15', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1800, 8200, '2023-03-01', 410, 'Transigido', 'CERRADO', 'RVC'),
('1000924191', 2023, 'Febrero', 'LIMA', 'Magdalena', null, '2023-02-03', '2023-02-03', 'OU', 2, 'Politraumaismo', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000916681', 2023, 'Enero', 'LIMA', 'Miraflores', null, '2023-01-16', '2023-01-16', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000917273', 2023, 'Enero', 'LIMA', 'ATE', 'Ate', '2023-01-17', '2023-01-17', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-02-02', 16, 'Rechazado', 'CERRADO', 'RVC'),
('1000917656', 2023, 'Enero', 'LIMA', 'PTE. PIEDRA', 'Zapallal', '2023-01-17', '2023-01-17', 'Pierina Ugaz', 1, 'Muerte instantánea', 'Fallecido', 65000, 'Grave', null, 20000, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('1000917663', 2023, 'Enero', 'LIMA', 'SJL', 'La Huayrona', '2023-01-18', '2023-01-18', 'Javier Castañeda', 2, 'Policontuso/ Policontuso', 'Policontuso', 3450, 'Leve', 0, 25000, '2023-02-03', 16, 'Transigido', 'CERRADO', 'RVC'),
('1000917678', 2023, 'Enero', 'CALLAO', 'CALLAO', 'Playa Rimac', '2023-01-18', '2023-01-18', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1500, 2556, '2023-07-17', 180, 'Transigido', 'CERRADO', 'RVC'),
('1000917942', 2023, 'Enero', 'LIMA', 'Surquillo', null, '2023-01-18', '2023-01-18', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 350, 2650, '2023-01-19', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000918124', 2023, 'Enero', 'CALLAO', 'VENTANILLA', 'Ventanilla', '2023-01-19', '2023-01-19', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-03-02', 773, 'Transigido', 'CERRADO', 'RVC'),
('1000918205', 2023, 'Enero', 'LIMA', 'Lince', null, '2023-01-19', '2023-01-19', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000918218', 2023, 'Enero', 'LIMA', 'Surco', null, '2023-01-19', '2023-01-19', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Grave', 12000, -7000, '2023-01-20', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000918408', 2023, 'Enero', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2023-01-19', '2023-01-19', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2100, 7900, '2023-01-24', 5, 'Transigido', 'CERRADO', 'RVC'),
('1000919018', 2023, 'Enero', 'LIMA', 'RIMAC', 'El Manzano', '2023-01-21', '2023-01-21', 'Pierina Ugaz', 1, 'Fractura de húmero derecho', 'Fractura de humero', 23000, 'Grave', 8075, 9433, '2023-07-06', 166, 'Transigido', 'CERRADO', 'RVC'),
('1000919258', 2023, 'Enero', 'LIMA', 'San Isidro', null, '2023-01-22', '2023-01-22', 'JD', 2, 'Fallecido / Fractura de Cadera y Pierna', 'Fallecido', 130000, 'Grave', 73500, -13500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000919639', 2023, 'Enero', 'LIMA', 'San Miguel', null, '2023-01-23', '2023-01-23', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-01-24', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000919664', 2023, 'Enero', 'LIMA', 'Chilca', null, '2023-01-23', '2023-01-23', 'GC', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 0, 50000, '2023-04-05', 72, 'Rechazado', 'CERRADO', 'Abeo'),
('1000920359', 2023, 'Enero', 'LIMA', 'LA VICTORIA', 'La Victoria', '2023-01-25', '2023-01-25', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2100, 1260, '2023-03-20', 54, 'Transigido', 'CERRADO', 'RVC'),
('1000920503', 2023, 'Enero', 'LIMA', 'Magdalena', null, '2023-01-25', '2023-01-25', 'GC', 1, 'policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000920710', 2023, 'Enero', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2023-01-25', '2023-01-25', 'Pierina Ugaz', 1, ': Fractura de tibia y peroné', 'Fractura de Peroné', 17250, 'Grave', 0, 15000, '2023-03-17', 51, 'Transigido', 'CERRADO', 'RVC'),
('1000921198', 2023, 'Enero', 'LIMA', 'LIMA', 'Mirones Bajo', '2023-01-26', '2023-01-26', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 400, 4600, '2023-01-30', 4, 'Transigido', 'CERRADO', 'RVC'),
('1000921330', 2023, 'Enero', 'LIMA', 'ATE', 'Salamanca', '2023-01-27', '2023-01-27', 'Pierina Ugaz', 1, 'Contusión', 'Policontuso', 1725, 'Leve', 0, 5000, '2023-09-01', 217, 'Transigido', 'CERRADO', 'RVC'),
('1000921568', 2023, 'Enero', 'LIMA', 'San Antonio', null, '2023-01-27', '2023-01-27', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000921838', 2023, 'Enero', 'CALLAO', 'MI PERÚ', 'Mi Perú', '2023-01-31', '2023-01-31', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-01-28', -3, 'Transigido', 'CERRADO', 'RVC'),
('1000921869', 2023, 'Enero', 'LIMA', 'Maranga', null, '2023-01-28', '2023-01-28', 'OU', 1, 'Fractura brazo, costillas, fémur y rodilla izquierda', 'Policontuso', 1725, 'Grave', 60000, -40000, '2023-04-12', 74, 'Transigido', 'CERRADO', 'Abeo'),
('1000921889', 2023, 'Enero', 'LIMA', 'ATE', 'Ate', '2023-01-28', '2023-01-28', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2000, 5000, '2023-02-08', 11, 'Transigido', 'CERRADO', 'RVC'),
('1000921920', 2023, 'Enero', 'LIMA', 'EL AGUSTINO', 'Villa Hermosa', '2023-01-29', '2023-01-29', 'Mario Pilares', 1, 'Policontuso y herida en mentón', 'Policontuso y corte', 2300, 'Leve', null, 10000, '2026-04-24', 1181, 'Transigido', 'CERRADO', 'RVC'),
('1000922424', 2023, 'Enero', 'LIMA', 'Miraflores', null, '2023-01-30', '2023-01-30', 'GC', 1, 'Fractura expuesta de tibia y peroné', 'Policontuso', 1725, 'Grave', 35000, -20000, '2023-08-15', 197, 'Transigido', 'CERRADO', 'Abeo'),
('1000922486', 2023, 'Enero', 'LIMA', 'Pueblo Libre', null, '2023-01-30', '2023-01-30', 'DS', 1, 'Contusión', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-01-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000922526', 2023, 'Enero', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2023-01-30', '2023-01-30', 'Pierina Ugaz', 1, 'Contusión de tórax y abdomen', 'Policontuso', 1725, 'Leve', 200, 9800, '2023-01-31', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000922806', 2023, 'Enero', 'LIMA', 'Magdalena', null, '2023-01-31', '2023-01-31', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 500, '2023-02-06', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000922904', 2023, 'Enero', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2023-01-31', '2023-01-31', 'Pierina Ugaz', 2, 'Policontuso



 

- Ocupante tercero: Daniel Chancahuana Villanueva (39)

- Diagnóstico: Policontuso

- Atendido en Hospital de Puente Piedra', 'Policontuso', 3450, 'Leve', 0, 20000, '2026-04-24', 1179, 'Transigido', 'CERRADO', 'RVC'),
('1000923654', 2023, 'Febrero', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2023-02-01', '2023-02-01', 'Pierina Ugaz', 1, ': Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-02-15', 14, 'Rechazado', 'CERRADO', 'RVC'),
('1000923711', 2023, 'Febrero', 'LIMA', 'VMT', 'Villa María del Triunfo', '2023-02-02', '2023-02-02', 'Pierina Ugaz', 2, 'Policontuso/ Policontuso', 'Policontuso', 3450, 'Leve', 0, 15000, '2025-05-25', 843, 'Transigido', 'CERRADO', 'RVC'),
('1000947971', 2023, 'Marzo', 'LIMA', 'Monterrico', null, '2023-03-31', '2023-03-31', 'GC', 1, 'Fallecida', 'Policontuso', 1725, 'Grave', 50000, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000924430', 2023, 'Febrero', 'LIMA', 'LOS OLIVOS', 'Pro', '2023-02-03', '2023-02-03', 'Mario Pilares', 1, 'Policontuso múltiple en todo el cuerpo', 'Policontuso', 1725, 'Leve', null, 12000, '2025-05-25', 842, 'Transigido', 'CERRADO', 'RVC'),
('1000924525', 2023, 'Febrero', 'CALLAO', 'CALLAO', 'Callao', '2023-02-03', '2023-02-03', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 5800, 6340, '2023-08-14', 192, 'Transigido', 'CERRADO', 'RVC'),
('1000924882', 2023, 'Febrero', 'LIMA', 'Yerbateros', null, '2023-02-05', '2023-02-05', 'GC', 1, 'politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000925385', 2023, 'Febrero', 'LIMA', 'Pueblo Libre', null, '2023-02-06', '2023-02-06', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000925565', 2023, 'Febrero', 'LIMA', 'Monterrico', null, '2023-02-07', '2023-02-07', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000925629', 2023, 'Febrero', 'LIMA', 'Pueblo Libre', null, '2023-02-07', '2023-02-07', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Grave', 14500, -9500, '2023-03-21', 42, 'Transigido', 'CERRADO', 'Abeo'),
('1000925745', 2023, 'Febrero', 'LIMA', 'San Antonio', null, '2023-02-07', '2023-02-07', 'DS', 2, 'Esguince Muñeca Derecha y Fractura Muñeca Derecha', 'Esguince', 4600, 'Grave', 10000, 20000, '2023-02-08', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000925808', 2023, 'Febrero', 'LIMA', 'LIMA', 'Cotabambas', '2023-02-07', '2023-02-07', 'Javier Castañeda', 2, 'Policontuso/Policontuso', 'Policontuso', 3450, 'Leve', null, 20000, '2026-04-24', 1172, 'Transigido', 'CERRADO', 'RVC'),
('1000926106', 2023, 'Febrero', 'LIMA', 'Maranga', null, '2023-02-08', '2023-02-08', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-02-08', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000926114', 2023, 'Febrero', 'LIMA', 'Lince', null, '2023-02-08', '2023-02-08', 'DS', 1, 'Fractura de tibia izquierda', 'Fractura de tibia', 17250, 'Grave', 25000, 5000, '2023-03-06', 26, 'Transigido', 'CERRADO', 'Abeo'),
('1000926354', 2023, 'Febrero', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2023-02-08', '2023-02-08', 'Pierina Ugaz', 3, 'Policontuso/ Policontuso/ Policontuso', 'Policontuso', 5175, 'Leve', 0, 25000, '2025-05-25', 837, 'Transigido', 'CERRADO', 'RVC'),
('1000926722', 2023, 'Febrero', 'LIMA', 'Santa Felicia', null, '2023-02-09', '2023-02-09', 'GC', 1, 'Politraumatizado Esguince de rodilla', 'Politraumatizado', 4000, 'Leve', 3000, 2000, '2023-02-17', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000926779', 2023, 'Febrero', 'LIMA', 'Orrantia', null, '2023-02-09', '2023-02-09', 'DS', 1, 'TEC Moderado', 'TEC Moderado', 11500, 'Grave', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000927467', 2023, 'Febrero', 'LIMA', 'CHORRILLOS', 'Mateo Pumacahua', '2023-02-11', '2023-02-11', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '2025-05-25', 834, 'Transigido', 'CERRADO', 'RVC'),
('1000927684', 2023, 'Febrero', 'LIMA', 'LIMA', 'Petit Thouars', '2023-02-11', '2023-02-11', 'Javier Castañeda', 1, 'Traumatismos superficiales múltiples, contusiones en las piernas.', 'Politraumatizado', 4000, 'Leve', null, 15000, '2023-02-14', 3, 'Transigido', 'CERRADO', 'RVC'),
('1000927926', 2023, 'Febrero', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2023-02-12', '2023-02-12', 'Pierina Ugaz', 1, ': Policontuso, descarte de fractura de cráneo', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-05-25', 833, 'Transigido', 'CERRADO', 'RVC'),
('1000928278', 2023, 'Febrero', 'LIMA', 'San Borja', null, '2023-02-13', '2023-02-13', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-02-14', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000928915', 2023, 'Febrero', 'LIMA', 'San Miguel', null, '2023-02-14', '2023-02-14', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000929180', 2023, 'Febrero', 'LIMA', 'San Miguel', null, '2023-02-15', '2023-02-15', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000929319', 2023, 'Febrero', 'CALLAO', 'BELLAVISTA', 'Ciudad del Pescador', '2023-02-15', '2023-02-15', 'Mario Pilares', 2, ': Policontuso (queda en UCI)/TEC leve policontuso', 'TEC Leve', 11500, 'Grave', 25298.73, 4711.27, '2023-09-12', 209, 'Transigido', 'CERRADO', 'RVC'),
('1000929649', 2023, 'Febrero', 'LIMA', 'Jesus Maria', null, '2023-02-16', '2023-02-16', 'GC', 1, 'Tec Severo', 'TEC Grave', 23000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000929788', 2023, 'Febrero', 'LIMA', 'SJL', 'Zarate', '2023-02-16', '2023-02-16', 'Pierina Ugaz', 1, 'Fractura en el dedo y drenaje en los pulmones', 'Rotura de bazo o pulmones', 23000, 'Grave', 5178, 7072, '2023-06-09', 113, 'Transigido', 'CERRADO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1000929986', 2023, 'Febrero', 'LIMA', 'SJL', 'Zarate', '2023-02-17', '2023-02-17', 'Pierina Ugaz', 1, 'Muerte', 'Fallecido', 65000, 'Grave', 13000, 67000, '2023-10-09', 234, 'Transigido', 'CERRADO', 'RVC'),
('1000930363', 2023, 'Febrero', 'LIMA', 'EL AGUSTINO', 'Santoyo', '2023-02-17', '2023-02-17', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2026-04-24', 1162, 'Transigido', 'CERRADO', 'RVC'),
('1000930490', 2023, 'Febrero', 'LIMA', 'LOS OLIVOS', 'Pro', '2023-02-19', '2023-02-19', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 800, 1640, '2023-06-02', 103, 'Transigido', 'CERRADO', 'RVC'),
('1000930828', 2023, 'Febrero', 'LIMA', 'SAN LUIS', 'Yerbateros', '2023-02-18', '2023-02-18', 'Pierina Ugaz', 1, 'Contusión de otras partes no especificadas en la pierna', 'Policontuso', 1725, 'Leve', 300, 9700, '2023-02-20', 2, 'Transigido', 'CERRADO', 'RVC'),
('1000931856', 2023, 'Febrero', 'LIMA', 'SJL', 'La Huayrona', '2023-02-22', '2023-02-22', 'Javier Castañeda', 1, 'TEC Policontuso, herida en cuero cabelludo', 'TEC Leve', 5750, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000932023', 2023, 'Febrero', 'LIMA', 'INDEPENDENCIA', 'Independencia', '2023-02-22', '2023-02-22', 'Mario Pilares', 1, 'TEC con heridas múltiples, por descartar fractura en hombro', 'TEC Leve', 5750, 'Leve', 5000, 15000, '2023-02-05', -17, 'Transigido', 'CERRADO', 'RVC'),
('1000932684', 2023, 'Febrero', 'LIMA', 'LIMA', 'Mirones Bajo', '2023-02-23', '2023-02-23', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 300, 4700, '2023-02-23', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000933143', 2023, 'Febrero', 'LIMA', 'Sagitaro', null, '2023-02-25', '2023-02-25', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-02-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000933157', 2023, 'Febrero', 'LIMA', 'LIMA', 'Mirones Bajo', '2023-02-24', '2023-02-24', 'Pierina Ugaz', 1, 'Traumatismo encefalocraneano', 'TEC Leve', 5750, 'Leve', 3000, 1706, '2023-08-24', 181, 'Transigido', 'CERRADO', 'RVC'),
('1000933263', 2023, 'Febrero', 'LIMA', 'Jesus Maria', null, '2023-02-25', '2023-02-25', 'GC', 1, 'TEC Severo / Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Judicializado', 'CERRADO', 'Abeo'),
('1000933286', 2023, 'Febrero', 'LIMA', 'Surco', null, '2023-02-25', '2023-02-25', 'OU', 1, 'Politraumatismo, Descartar Fractura', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000933391', 2023, 'Febrero', 'LIMA', 'LURIGANCHO', 'Chosica', '2023-02-25', '2023-02-25', 'Pierina Ugaz', 2, 'Policontuso
Policontuso', 'Policontuso', 3450, 'Leve', null, 20000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000933470', 2023, 'Febrero', 'LIMA', 'San Borja', null, '2023-02-25', '2023-02-25', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2023-03-01', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000933661', 2023, 'Febrero', 'LIMA', 'San Antonio', null, '2023-02-26', '2023-02-26', 'OU', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000934041', 2023, 'Febrero', 'LIMA', 'SMP', 'Condevilla', '2023-02-27', '2023-02-27', 'Pierina Ugaz', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', 200, 19800, '2023-03-01', 2, 'Transigido', 'CERRADO', 'RVC'),
('1000934060', 2023, 'Febrero', 'LIMA', 'Orrantia', null, '2023-02-27', '2023-02-27', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000934269', 2023, 'Febrero', 'LIMA', 'Lince', null, '2023-02-28', '2023-02-28', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1200, 1800, '2023-03-06', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000934986', 2023, 'Marzo', 'LIMA', 'San Isidro', null, '2023-03-01', '2023-03-01', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000935448', 2023, 'Marzo', 'LIMA', 'Miraflores', null, '2023-03-02', '2023-03-02', 'OU', 1, 'Politraumatismo, Hombro y Cadera Izquierda', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '2023-05-25', 84, 'Transigido', 'CERRADO', 'Abeo'),
('1000936200', 2023, 'Marzo', 'LIMA', 'SMP', 'San Martin de Porres', '2023-03-04', '2023-03-04', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 12000, '2025-05-25', 813, 'Transigido', 'CERRADO', 'RVC'),
('1000936376', 2023, 'Marzo', 'CALLAO', 'CALLAO', 'Ingunza', '2023-03-04', '2023-03-04', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-04-10', 37, 'Transigido', 'CERRADO', 'RVC'),
('14781982', 2022, 'Junio', 'LIMA', 'Salamanca', 'Salamanca', null, null, 'Pierina Ugaz', 1, 'Jhonathan Andrés Cordero Saavedra', 'Policontuso', 1725, 'Leve', null, null, '2021-12-13', null, 'Transigido', 'CERRADO', 'RVC'),
('1000937000', 2023, 'Marzo', 'LIMA', 'SJM', 'San Juan de Miraflores', '2023-03-06', '2023-03-06', 'Pierina Ugaz', 2, 'Policontuso, posible fractura en mano izquierda', 'Policontuso', 3450, 'Leve', 0, 20000, '2023-03-12', 6, 'Transigido', 'CERRADO', 'RVC'),
('1000937349', 2023, 'Marzo', 'LIMA', 'PTE. PIEDRA', 'Zapallal', '2023-03-07', '2023-03-07', 'Pierina Ugaz', 1, 'Policontuso, laceraciones en los dedos de la mano izquierda y rodilla derecha', 'Policontuso y corte', 2300, 'Leve', 0, 15000, '2025-05-25', 810, 'Transigido', 'CERRADO', 'RVC'),
('1000938128', 2023, 'Marzo', 'LIMA', 'LIMA', 'UV3', '2023-03-08', '2023-03-08', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 7800, 6580, '2023-09-14', 190, 'Transigido', 'CERRADO', 'RVC'),
('1000938477', 2023, 'Marzo', 'LIMA', 'Monterrico', null, '2023-03-09', '2023-03-09', 'OU', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 2717.08, 282.92, '2023-03-17', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000938482', 2023, 'Marzo', 'LIMA', 'San Isidro', null, '2023-03-09', '2023-03-09', 'GC', 1, 'Policontuso y laceraciones', 'Laceraciones', 2300, 'Leve', 200, 1300, '2023-03-09', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000938983', 2023, 'Marzo', 'LIMA', 'SMP', 'San Martin de Porres', '2023-03-10', '2023-03-10', 'Pierina Ugaz', 1, 'Policontuso leve en brazo izquierdo', 'Policontuso', 1725, 'Leve', 960, 675, '2023-05-20', 71, 'Transigido', 'CERRADO', 'RVC'),
('1000939166', 2023, 'Marzo', 'LIMA', 'ATE', 'Santa Clara', '2023-03-10', '2023-03-10', 'Mario Pilares', 3, 'Policontuso / Policontuso /  Policontuso', 'Policontuso', 5175, 'Leve', 0, 22000, '2022-04-12', -332, 'Transigido', 'CERRADO', 'RVC'),
('1000939199', 2023, 'Marzo', 'LIMA', 'Chacarilla', null, '2023-03-10', '2023-03-10', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 4600, 400, '2023-03-20', 10, 'Transigido', 'CERRADO', 'Abeo'),
('1000939374', 2023, 'Marzo', 'LIMA', 'San Borja', null, '2023-03-11', '2023-03-11', 'DS', 2, 'Atricción en el Brazo y Politraumatizado', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000939553', 2023, 'Marzo', 'LIMA', 'Monterrico', null, '2023-03-11', '2023-03-11', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 600, 900, '2023-03-27', 16, 'Transigido', 'CERRADO', 'Abeo'),
('1000939600', 2023, 'Marzo', 'LIMA', 'Pueblo Libre', null, '2023-03-12', '2023-03-12', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 250, 1250, '2023-03-11', -1, 'Transigido', 'CERRADO', 'Abeo'),
('1000939711', 2023, 'Marzo', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2023-03-12', '2023-03-12', 'Pierina Ugaz', 3, 'Fractura del dedo anular del pie izquierdo', 'Policontuso', 5175, 'Leve', 4000, 3674, '2023-06-06', 86, 'Transigido', 'CERRADO', 'RVC'),
('1000940188', 2023, 'Marzo', 'LIMA', 'ATE', 'Huaycan', '2023-03-13', '2023-03-13', 'Pierina Ugaz', 1, 'Lesión visible: Raspón expuesto en la rodilla izquierda', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-04-15', 33, 'Transigido', 'CERRADO', 'RVC'),
('1000940223', 2023, 'Marzo', 'LIMA', 'ATE', 'Salamanca', '2023-03-13', '2023-03-13', 'Mario Pilares', 1, 'Contusión de la región lumbosacra y de la pelvis', 'Policontuso', 1725, 'Leve', null, 18000, '2025-05-25', 804, 'Transigido', 'CERRADO', 'RVC'),
('1000940449', 2023, 'Marzo', 'LIMA', 'CHORRILLOS', '(Desisten del trámite policial)', '2023-03-14', '2023-03-14', 'Pierina Ugaz', 1, 'Lesiones: Contusión en diversas partes del cuerpo', 'Policontuso', 1725, 'Leve', 250, 9750, '2023-03-14', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000940736', 2023, 'Marzo', 'LIMA', 'San Miguel', null, '2023-03-14', '2023-03-14', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000940753', 2023, 'Marzo', 'CALLAO', 'CALLAO', 'Sarita Colonia', '2023-03-14', '2023-03-14', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 6273, 290, '2023-04-27', 44, 'Transigido', 'CERRADO', 'RVC'),
('1000941230', 2023, 'Marzo', 'LIMA', 'Maranga', null, '2023-03-15', '2023-03-15', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-03-16', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000941978', 2023, 'Marzo', 'LIMA', 'SMP', 'San Martin de Porres', '2023-03-17', '2023-03-17', 'Pierina Ugaz', 1, 'Fractura en la clavicula', 'Fractura de clavícula', 23000, 'Grave', 6400, 5750, '2023-06-08', 83, 'Transigido', 'CERRADO', 'RVC'),
('1000942179', 2023, 'Marzo', 'LIMA', 'EL AGUSTINO', 'Santoyo', '2023-03-17', '2023-03-17', 'Javier Castañeda', 1, 'Lesiones a la vista: contusión en la muñeca derecha', 'Policontuso', 1725, 'Leve', null, 5000, '2026-04-25', 1135, 'Transigido', 'CERRADO', 'RVC'),
('1000942218', 2023, 'Marzo', 'LIMA', 'San Bartolo', null, '2023-03-17', '2023-03-17', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 250, 1250, '2023-03-20', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1000942572', 2023, 'Marzo', 'LIMA', 'Magdalena', null, '2023-03-18', '2023-03-18', 'JD', 2, 'Torcedura Cervical; Politraumatizada / Politraumatizada', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000942936', 2023, 'Marzo', 'LIMA', 'San Miguel', null, '2023-03-19', '2023-03-19', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000943261', 2023, 'Marzo', 'LIMA', 'San Isidro', null, '2023-03-20', '2023-03-20', 'JD', 1, 'Esguince de Rodilla / Politraumatizado / TEC Moderado', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000943397', 2023, 'Marzo', 'LIMA', 'San Borja', null, '2023-03-20', '2023-03-20', 'OU', 1, 'Policontuso, escoriaciones', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-03-20', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000943603', 2023, 'Marzo', 'LIMA', 'Miraflores', null, '2023-03-21', '2023-03-21', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 2447.23, 2552.77, '2023-03-27', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1000943875', 2023, 'Marzo', 'LIMA', 'La Molina', null, '2023-03-21', '2023-03-21', 'GC', 1, 'fractura de mano', 'Policontuso', 1725, 'Grave', 20000, -5000, '2023-07-04', 105, 'Transigido', 'CERRADO', 'Abeo'),
('1000944153', 2023, 'Marzo', 'LIMA', 'San Isidro', null, '2023-03-22', '2023-03-22', 'GC', 2, 'Policontuso y Politraumatizada', 'Politraumatizado', 8000, 'Grave', 2000, 2500, '2023-03-30', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000944400', 2023, 'Marzo', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2023-03-22', '2023-03-22', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 119.5, 380.5, '2023-02-22', -28, 'Transigido', 'CERRADO', 'RVC'),
('1000944683', 2023, 'Marzo', 'LIMA', 'LIMA', 'Petit Thouars', '2023-03-22', '2023-03-22', 'Javier Castañeda', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 935, 1780, '2023-04-15', 24, 'Transigido', 'CERRADO', 'RVC'),
('1000944690', 2023, 'Marzo', 'LIMA', 'CIENEGUILLA', 'Cieneguilla', '2023-03-23', '2023-03-23', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '2023-06-05', 74, 'Transigido', 'CERRADO', 'RVC'),
('1000944724', 2023, 'Marzo', 'LIMA', 'San Borja', null, '2023-03-23', '2023-03-23', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-03-20', -3, 'Rechazado', 'CERRADO', 'Abeo'),
('1000944774', 2023, 'Marzo', 'LIMA', 'San Luis', null, '2023-03-23', '2023-03-23', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000945281', 2023, 'Marzo', 'LIMA', 'LIMA', 'Cercado', '2023-03-24', '2023-03-24', 'Pierina Ugaz', 1, 'Lesiones a la vista: Contusiones', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-10-12', 202, 'Transigido', 'CERRADO', 'RVC'),
('1000945605', 2023, 'Marzo', 'LIMA', 'LURIGANCHO', 'Huachipa', '2023-03-25', '2023-03-25', 'Mario Pilares', 2, 'Traumatismos superficiales múltiples, esquinces y torceduras de otros sitios no especificados del pie. /  Traumatismos superficiales múltiples, esquinces y torceduras de otros sitios no especificados del pie.', 'Politraumatizado', 8000, 'Grave', 0, 15000, '2023-05-13', 49, 'Transigido', 'CERRADO', 'RVC'),
('1000946158', 2023, 'Marzo', 'LIMA', 'SMP', 'San Martin de Porres', '2023-03-27', '2023-03-27', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 300, 9700, '2023-03-30', 3, 'Transigido', 'CERRADO', 'RVC'),
('1000946355', 2023, 'Marzo', 'LIMA', 'Surco', null, '2023-03-27', '2023-03-27', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 620, 4380, '2023-03-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000946769', 2023, 'Marzo', 'LIMA', 'San Isidro', null, '2023-03-28', '2023-03-28', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-03-28', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000946771', 2023, 'Marzo', 'LIMA', 'San Antonio', null, '2023-03-28', '2023-03-28', 'GC', 1, 'daño material', 'Policontuso', 1725, 'Leve', 0, 5000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000946884', 2023, 'Marzo', 'CALLAO', 'CALLAO', 'Ramón Castilla', '2023-03-28', '2023-03-28', 'Mario Pilares', 1, 'Policontuso leve, por descartar trauma abdominal cerrado', 'Policontuso', 1725, 'Leve', 1593, 1593, '2023-06-20', 84, 'Transigido', 'CERRADO', 'RVC'),
('1000946918', 2023, 'Marzo', 'LIMA', 'San Borja', null, '2023-03-28', '2023-03-28', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000947021', 2023, 'Marzo', 'LIMA', 'Santa Felicia', null, '2023-03-29', '2023-03-29', 'OU', 1, 'Cervicalgia, Latigazo', 'Cervicalgia', 2300, 'Leve', null, null, '2023-03-29', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000947033', 2023, 'Marzo', 'LIMA', 'LIMA', 'Petit Thouars', '2023-03-29', '2023-03-29', 'Pierina Ugaz', 1, 'Por determinar (se retira del hospital)', 'Policontuso', 1725, 'Leve', 2100, 1290, '2023-06-07', 70, 'Transigido', 'CERRADO', 'RVC'),
('1000947111', 2023, 'Marzo', 'LIMA', 'Miraflores', null, '2023-03-29', '2023-03-29', 'DS', 1, 'TEC Moderado y Fractura Metatarsianao', 'TEC Moderado', 11500, 'Grave', 12500, 12500, '2023-04-17', 19, 'Transigido', 'CERRADO', 'Abeo'),
('1000947148', 2023, 'Marzo', 'LIMA', 'Surquillo', null, '2023-03-29', '2023-03-29', 'DS', 1, 'Fractura de otros huesos metacarpianos', 'Policontuso', 1725, 'Grave', 12200, 7800, '2023-04-14', 16, 'Transigido', 'CERRADO', 'Abeo'),
('1000947380', 2023, 'Marzo', 'LIMA', 'Chacarilla', null, '2023-03-30', '2023-03-30', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000947388', 2023, 'Marzo', 'LIMA', 'PACHACAMAC', 'Manchay', '2023-03-29', '2023-03-29', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 5000, '2026-04-24', 1122, 'Transigido', 'CERRADO', 'RVC'),
('1000947452', 2023, 'Marzo', 'LIMA', 'San Isidro', null, '2023-03-30', '2023-03-30', 'JD', 1, 'TEC Moderado / Corte en Frente', 'TEC Moderado', 11500, 'Grave', 4000, 1000, '2023-04-11', 12, 'Transigido', 'CERRADO', 'Abeo'),
('1000992509', 2023, 'Julio', 'LIMA', 'JC Mariategui', null, '2023-07-11', '2023-07-11', 'OU', 1, 'NN (FUGA)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000947509', 2023, 'Marzo', 'LIMA', 'SJL', 'Canto Rey', '2023-03-29', '2023-03-29', 'Pierina Ugaz', 1, 'Politraumatismo TEC', 'TEC Leve', 5750, 'Leve', 0, 10000, '2023-05-25', 57, 'Rechazado', 'CERRADO', 'RVC'),
('1000947531', 2023, 'Marzo', 'LIMA', 'Lince', null, '2023-03-30', '2023-03-30', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 250, 1250, '2023-03-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000947544', 2023, 'Marzo', 'LIMA', 'Barranco', null, '2023-03-30', '2023-03-30', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000947602', 2023, 'Marzo', 'LIMA', 'SJL', 'La Huayrona', '2023-03-30', '2023-03-30', 'Pierina Ugaz', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 0, 15000, '2024-04-24', 391, 'Transigido', 'CERRADO', 'RVC'),
('1000947710', 2023, 'Marzo', 'LIMA', 'Lince', null, '2023-03-30', '2023-03-30', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000947827', 2023, 'Marzo', 'LIMA', 'Chacarilla', null, '2023-03-31', '2023-03-31', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1820, 3180, '2023-05-17', 47, 'Transigido', 'CERRADO', 'Abeo'),
('1000947957', 2023, 'Marzo', 'LIMA', 'SJL', 'Zarate', '2023-03-31', '2023-03-31', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2026-04-24', 1120, 'Transigido', 'CERRADO', 'RVC'),
('1000993235', 2023, 'Julio', 'LIMA', 'Pamplona', null, '2023-07-12', '2023-07-12', 'GC', 1, 'Hugo Fernandez Aguilar (sin lesiones)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000948044', 2023, 'Marzo', 'LIMA', 'LOS OLIVOS', 'Laura Caller', '2023-03-31', '2023-03-31', 'Mario Pilares', 2, 'Traumatismo / Traumatismo', 'Policontuso', 3450, 'Leve', 1500, 18500, '2023-05-08', 38, 'Transigido', 'CERRADO', 'RVC'),
('1000948092', 2023, 'Marzo', 'LIMA', 'Maranga', null, '2023-03-31', '2023-03-31', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-03-31', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000948231', 2023, 'Marzo', 'LIMA', 'EL AGUSTINO', 'El Agustino', '2023-03-31', '2023-03-31', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2274, 17726, '2023-06-13', 74, 'Transigido', 'CERRADO', 'RVC'),
('1000948296', 2023, 'Abril', 'LIMA', 'Santa Felicia', null, '2023-04-01', '2023-04-01', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000948438', 2023, 'Abril', 'LIMA', 'SJM', 'Comisaría de Lurin', '2023-04-02', '2023-04-02', 'Pierina Ugaz', 3, '-No se atiende en ningún lugar puesto que dio positivo en el dosaje y se queda detenido. /  Policontuso /  Policontuso', 'Policontuso', 5175, 'Leve', 0, 20000, '2026-04-24', 1118, 'Transigido', 'CERRADO', 'RVC'),
('1000948648', 2023, 'Abril', 'LIMA', 'Miraflores', null, '2023-04-03', '2023-04-03', 'GC', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 3000, 0, '2023-03-10', -24, 'Transigido', 'CERRADO', 'Abeo'),
('1000948673', 2023, 'Abril', 'LIMA', 'Jesus Maria', null, '2023-04-03', '2023-04-03', 'DS', 1, 'TEC Moderado', 'TEC Moderado', 11500, 'Grave', 8500, 1500, '2023-04-27', 24, 'Transigido', 'CERRADO', 'Abeo'),
('1000949368', 2023, 'Abril', 'LIMA', 'San Borja', null, '2023-04-03', '2023-04-03', 'JD', 1, 'Esguince de Tobillo Derecho / Policontusa', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000950227', 2023, 'Abril', 'CALLAO', 'CALLAO', 'Comisaría de Playa Rimac', '2023-04-04', '2023-04-04', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2026-04-24', 1116, 'Transigido', 'CERRADO', 'RVC'),
('1000950377', 2023, 'Abril', 'LIMA', 'Miraflores', null, '2023-04-05', '2023-04-05', 'JD', 1, 'Luxación de Hombro Derecho / Politraumatizada', 'Politraumatizado', 4000, 'Grave', 10000, 5000, '2023-04-15', 10, 'Transigido', 'CERRADO', 'Abeo'),
('1000950724', 2023, 'Abril', 'CALLAO', 'CALLAO', 'Comisaría de La legua', '2023-04-05', '2023-04-05', 'Mario Pilares', 1, 'Muerte inmediata', 'Fallecido', 65000, 'Grave', null, 100000, '2023-10-27', 205, 'Transigido', 'CERRADO', 'RVC'),
('1000950729', 2023, 'Abril', 'LIMA', 'Las Praderas', null, '2023-04-05', '2023-04-05', 'OU', 1, 'Politraumatismo, Trauma Tobillo', 'Politraumatizado', 4000, 'Leve', 2500, 2500, '2023-04-14', 9, 'Transigido', 'CERRADO', 'Abeo'),
('1000951033', 2023, 'Abril', 'LIMA', 'SJM', 'Comisaría de Laderas de Villa', '2023-04-05', '2023-04-05', 'Mario Pilares', 1, 'Traumatismo intracraneal severo', 'TEC Leve', 5750, 'Leve', 0, 10000, '2023-04-12', 7, 'Rechazado', 'CERRADO', 'RVC'),
('1000951040', 2023, 'Abril', 'LIMA', 'VMT', 'Comisaría de José Carlos Mariategui', '2023-04-06', '2023-04-06', 'Mario Pilares', 1, 'Contusión general', 'Policontuso', 1725, 'Leve', null, 10000, '2025-05-25', 780, 'Transigido', 'CERRADO', 'RVC'),
('1000951060', 2023, 'Abril', 'LIMA', 'Miraflores', null, '2023-04-06', '2023-04-06', 'OU', 1, 'Politraumatismo, Trauma Tobillo', 'Politraumatizado', 4000, 'Leve', 880, 4120, '2023-04-08', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000952533', 2023, 'Abril', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-04-10', '2023-04-10', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-04-10', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000952733', 2023, 'Abril', 'LIMA', 'La Molina', null, '2023-04-11', '2023-04-11', 'JD', 1, 'Esguince y rotura de ligamentos laterales de pierna izquierda', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000953171', 2023, 'Abril', 'LIMA', 'SMP', 'Comisaría de Laura Caller', '2023-04-11', '2023-04-11', 'Pierina Ugaz', 1, 'Muerte en hospital (Traumashok)', 'Fallecido', 65000, 'Grave', 18000, 22000, '2024-01-02', 266, 'Transigido', 'CERRADO', 'RVC'),
('1000953639', 2023, 'Abril', 'LIMA', 'Surquillo', null, '2023-04-12', '2023-04-12', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2600, 400, '2023-04-20', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000954982', 2023, 'Abril', 'LIMA', 'SJM', 'Comisaría de Laderas de Villa', '2023-04-14', '2023-04-14', 'Mario Pilares', 1, ': Muerte sin asistencia', 'Fallecido', 65000, 'Grave', 0, 40000, '2025-01-23', 650, 'Transigido', 'CERRADO', 'RVC'),
('1000955463', 2023, 'Abril', 'LIMA', 'Miraflores', null, '2023-04-16', '2023-04-16', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000955517', 2023, 'Abril', 'LIMA', 'EL AGUSTINO', 'Comisaría de Santoyo', '2023-04-16', '2023-04-16', 'Mario Pilares', 4, 'Contusión de torax /  Policontuso con traumatismo intracraneal /  Policontuso y contusión abdominal /  Contusión de hombro y brazo', 'TEC Leve', 23000, 'Grave', 0, 60000, '2023-06-19', 64, 'Rechazado', 'CERRADO', 'RVC'),
('1000955682', 2023, 'Abril', 'LIMA', 'Santa Felicia', null, '2023-04-17', '2023-04-17', 'JD', 1, '1 Múltiples Fracturas en Senos maxilares, fractura del piso de la órbita derecha, Fractura del Lado Derecho del Paladar Oseo, Fractura del Techo de la Articulación Témporo-Mandibular Derecha, Hematoma con Edema de zona facial derecha, 2 Policontusos', 'Policontuso', 1725, 'Grave', 8000, 10000, '2023-09-18', 154, 'Transigido', 'CERRADO', 'Abeo'),
('1000956057', 2023, 'Abril', 'LIMA', 'San Borja', null, '2023-04-18', '2023-04-18', 'OU', 1, 'Politraumatismo, Ecoriaciones', 'Politraumatizado', 4000, 'Leve', 150, 4850, '2023-04-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000956065', 2023, 'Abril', 'LIMA', 'SJL', 'Comisaría de Zárate', '2023-04-18', '2023-04-18', 'Pierina Ugaz', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000956159', 2023, 'Abril', 'LIMA', 'SJL', 'Comisaría de Huaycan', '2023-04-18', '2023-04-18', 'Pierina Ugaz', 1, 'Lesiones a la vista: Contusiones', 'Policontuso', 1725, 'Leve', null, 10000, '2023-04-18', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000957134', 2023, 'Abril', 'LIMA', 'LIMA', 'Comisaría de Monserrate', '2023-04-19', '2023-04-19', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 9500, '2023-04-21', 2, 'Transigido', 'CERRADO', 'RVC'),
('1000957138', 2023, 'Abril', 'LIMA', 'SMP', 'Comisaría de San Martin de Porres', '2023-04-20', '2023-04-20', 'Mario Pilares', 1, 'Fractura de columna', 'Fractura de columna', 20000, 'Grave', 8800, 5220, '2023-05-19', 29, 'Transigido', 'CERRADO', 'RVC'),
('1000957284', 2023, 'Abril', 'LIMA', 'Orrantia', null, '2023-04-20', '2023-04-20', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1200, 300, '2023-04-20', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000957303', 2023, 'Junio', 'CALLAO', 'CALLAO', 'Comisaría de Marquez', '2023-06-11', '2023-04-07', 'Pierina Ugaz', 1, 'Policontuso, traumatismo craneoencefálico', 'Policontuso', 1725, 'Grave', 8800, 2400, '2023-08-04', 54, 'Transigido', 'CERRADO', 'RVC'),
('1000957314', 2023, 'Abril', 'LIMA', 'RIMAC', 'Comisaría de Rimac', '2023-04-20', '2023-04-20', 'Javier Castañeda', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2500, 7500, '2023-09-01', 134, 'Transigido', 'CERRADO', 'RVC'),
('1000957630', 2023, 'Abril', 'LIMA', 'Santa Felicia', null, '2023-04-21', '2023-04-21', 'JD', 1, 'Politraumatizado / Corte en el Cuello', 'Politraumatizado', 4000, 'Leve', 700, 4300, '2023-04-22', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000957780', 2023, 'Abril', 'LIMA', 'La Molina', null, '2023-04-21', '2023-04-21', 'OU', 1, 'Fractura Tobillo, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000957911', 2023, 'Abril', 'LIMA', 'Pueblo Libre', null, '2023-04-22', '2023-04-22', 'OU', 2, 'Fractura Clavícula, Politraumatismo / Politraumatismo', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000958173', 2023, 'Abril', 'LIMA', 'Pamplona I', null, '2023-04-22', '2023-04-22', 'GC', 1, 'politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000958292', 2023, 'Abril', 'LIMA', 'Magdalena', null, '2023-04-23', '2023-04-23', 'OU', 1, 'Manifesta no presentar lesiones', 'Policontuso', 1725, 'Leve', 0, 0, '2023-04-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000958464', 2023, 'Abril', 'LIMA', 'Surquillo', null, '2023-04-22', '2023-04-22', 'OU', 1, 'Politraumatismo, Esguince Tobillo', 'Politraumatizado', 4000, 'Leve', 0, 20000, '2023-04-24', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000958636', 2023, 'Abril', 'LIMA', 'Santa Felicia', null, '2023-04-24', '2023-04-24', 'GC/OU', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 3500, -500, '2023-04-28', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000959350', 2023, 'Abril', 'LIMA', 'San Borja', null, '2023-04-25', '2023-04-25', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2000, -500, '2023-05-02', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000959364', 2023, 'Abril', 'LIMA', 'La planicie', null, '2023-04-25', '2023-04-25', 'GC', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 2000, 1000, '2023-04-27', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000959387', 2023, 'Abril', 'LIMA', 'JESUS MARIA', 'Comisaría de Jesús María', '2023-04-25', '2023-04-25', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000959757', 2023, 'Abril', 'LIMA', 'Monterrico', null, '2023-04-26', '2023-04-26', 'JD', 1, 'No hubo atención por lesiones a terceros.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000959949', 2023, 'Abril', 'LIMA', 'Sagitario', null, '2023-04-26', '2023-04-26', 'DS', 2, 'Politraumatizados', 'Politraumatizado', 8000, 'Grave', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000960060', 2023, 'Abril', 'CALLAO', 'CALLAO', 'Comisaría de Sarita Colonia', '2023-04-26', '2023-04-26', 'Pierina Ugaz', 1, 'Diagnostico: Sin diagnóstico', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-10-31', 188, 'Transigido', 'CERRADO', 'RVC'),
('1000960156', 2023, 'Abril', 'LIMA', 'Miraflores', null, '2023-04-26', '2023-04-26', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000960323', 2023, 'Abril', 'LIMA', 'San Borja', null, '2023-04-27', '2023-04-27', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 925, 4075, '2023-04-28', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000960478', 2023, 'Abril', 'LIMA', 'Barranco', null, '2023-04-27', '2023-04-27', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-04-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000960586', 2023, 'Abril', 'LIMA', 'Orrantia', null, '2023-04-27', '2023-04-27', 'GC', 1, 'politraumatizado', 'Politraumatizado', 4000, 'Leve', 4000, -1000, '2023-05-26', 29, 'Transigido', 'CERRADO', 'Abeo'),
('1000960766', 2023, 'Abril', 'LIMA', 'SAN MIGUEL', 'Comisaría de San Miguel', '2023-04-28', '2023-04-28', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '2023-05-22', 24, 'Transigido', 'CERRADO', 'RVC'),
('1000960971', 2023, 'Abril', 'LIMA', 'SAN MIGUEL', 'Comisaría de San Miguel', '2023-04-28', '2023-04-28', 'Pierina Ugaz', 1, 'Diagnostico: Policontuso', 'Policontuso', 1725, 'Leve', 2850, 7150, '2023-06-09', 42, 'Transigido', 'CERRADO', 'RVC'),
('1000961152', 2023, 'Abril', 'LIMA', 'CARABAYLLO', 'Comisaría de Carabayllo', '2023-04-28', '2023-04-28', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000961208', 2023, 'Abril', 'LIMA', 'Miraflores', null, '2023-04-29', '2023-04-29', 'GC', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000961519', 2023, 'Abril', 'LIMA', 'San borja', null, '2023-04-30', '2023-04-30', 'GC', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000961530', 2023, 'Abril', 'LIMA', 'SMP', 'Comisaría de Condevilla', '2023-04-30', '2023-04-30', 'Pierina Ugaz', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', 0, 15000, '2025-05-25', 756, 'Transigido', 'CERRADO', 'RVC'),
('1000961775', 2023, 'Mayo', 'LIMA', 'SJL', 'Comisaría de Santa Elizabeth', '2023-05-01', '2023-05-01', 'Pierina Ugaz', 1, 'Diagnostico: Se desconoce', 'Policontuso', 1725, 'Leve', 0, 5000, '2023-05-11', 10, 'Rechazado', 'CERRADO', 'RVC'),
('1000961793', 2023, 'Mayo', 'LIMA', 'Orrantia', null, '2023-05-01', '2023-05-01', 'DS', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 600, 2400, '2023-05-02', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000961891', 2023, 'Abril', 'LIMA', 'Lurin', null, '2023-04-30', '2023-04-30', 'DS', 3, 'Policontusos', 'Policontuso', 5175, 'Leve', 0, 6000, '2023-05-04', 4, 'Rechazado', 'CERRADO', 'Abeo'),
('1000962526', 2023, 'Mayo', 'LIMA', 'San Isidro', null, '2023-05-03', '2023-05-03', 'JD', 1, 'Fractura de Tobillo', 'Fractura Pierna', 17250, 'Grave', 38000, null, '2023-07-10', 68, 'En Negociación', 'CERRADO', 'Abeo'),
('1000962751', 2023, 'Mayo', 'LIMA', 'Santa Felicia', null, '2023-05-03', '2023-05-03', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-05-03', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000963804', 2023, 'Mayo', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-05-05', '2023-05-05', 'Mario Pilares', 1, 'Traumatismo por aplastamiento de órganos genitales externos', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-03-06', 671, 'Transigido', 'CERRADO', 'RVC'),
('1000963865', 2023, 'Mayo', 'LIMA', 'San Isidro', null, '2023-05-05', '2023-05-05', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-05-05', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000964011', 2023, 'Mayo', 'LIMA', 'Orrantia', null, '2023-05-05', '2023-05-05', 'DS', 1, 'Fractura Metatarsiano', 'Policontuso', 1725, 'Leve', 2100, 7900, '2023-05-26', 21, 'Transigido', 'CERRADO', 'Abeo'),
('1000964129', 2023, 'Mayo', 'LIMA', 'RIMAC', 'Comisaria de Ciudad y Campo', '2023-05-05', '2023-05-05', 'Mario Pilares', 1, 'Traumatismo por aplastamiento de la pierna', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000964333', 2023, 'Mayo', 'LIMA', 'LIMA', 'Comisaría de Petit Thouars', '2023-05-06', '2023-05-06', 'Mario Pilares', 1, 'Policontuso y contusión hombro y rodilla derecho', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000964688', 2023, 'Mayo', 'LIMA', 'COMAS', 'Comisaría de Universitaria // Santa Luzmila', '2023-05-08', '2023-05-08', 'Pierina Ugaz', 1, 'Fractura de fémur, tres costillas rotas', 'Fractura de costillas', 10000, 'Grave', 0, 25000, '2025-01-13', 616, 'Transigido', 'CERRADO', 'RVC'),
('1000964996', 2023, 'Mayo', 'LIMA', 'San Bartolo', null, '2023-05-08', '2023-05-08', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000965185', 2023, 'Mayo', 'LIMA', 'JESUS MARIA', 'Comisaría de Jesús María', '2023-05-09', '2023-05-09', 'Pierina Ugaz', 1, 'Traumatismo intracraneal, aplastamiento de torax', 'TEC Leve', 5750, 'Leve', null, 15000, '2024-01-22', 258, 'Transigido', 'CERRADO', 'RVC'),
('1000965393', 2023, 'Mayo', 'LIMA', 'Orrantia', null, '2023-05-09', '2023-05-09', 'JD', 2, 'Politraumatizados', 'Politraumatizado', 8000, 'Grave', 2100, null, '2023-05-10', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000965759', 2023, 'Junio', 'CALLAO', 'CARMEN DE LA LEGUA', 'Comisaría de Carmen de la Legua', '2023-06-08', '2023-03-31', 'Pierina Ugaz', 1, 'Policontuso con herida abierta en parte occipital del cráneo. Fracturas por descartar', 'Policontuso y corte', 2300, 'Grave', 9450, 8710, '2023-10-24', 138, 'Transigido', 'CERRADO', 'RVC'),
('1000965879', 2023, 'Mayo', 'LIMA', 'Santa Felicia', null, '2023-05-10', '2023-05-10', 'GC', 1, 'politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000966188', 2023, 'Mayo', 'LIMA', 'San Juan de Miraflores', null, '2023-05-11', '2023-05-11', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000966627', 2023, 'Mayo', 'LIMA', 'Miraflores', null, '2023-05-13', '2023-05-13', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Grave', 22000, -17000, '2023-07-03', 51, 'Transigido', 'CERRADO', 'Abeo'),
('1000966671', 2023, 'Mayo', 'LIMA', 'SMP', 'Comisaría de Condevilla', '2023-05-11', '2023-05-11', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-05-25', 745, 'Transigido', 'CERRADO', 'RVC'),
('1000966771', 2023, 'Mayo', 'LIMA', 'Surquillo', null, '2023-05-12', '2023-05-12', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 500, '2023-05-16', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000966791', 2023, 'Mayo', 'LIMA', 'EL AGUSTINO', 'Comisaría de El Agustino', '2023-05-12', '2023-05-12', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 20000, '2024-06-06', 391, 'Transigido', 'CERRADO', 'RVC'),
('1000966873', 2023, 'Mayo', 'LIMA', 'Petit Thouars', null, '2023-05-12', '2023-05-12', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-10-18', 159, 'Transigido', 'CERRADO', 'Abeo'),
('1000966908', 2023, 'Mayo', 'LIMA', 'Chacarrilla', null, '2023-05-12', '2023-05-12', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 5000, 0, '2023-06-19', 38, 'Transigido', 'CERRADO', 'Abeo'),
('1000966981', 2023, 'Mayo', 'LIMA', 'Surco', null, '2023-05-12', '2023-05-12', 'JD', 1, 'Politraumatizada / TEC Leve', 'TEC Leve', 5750, 'Leve', 1500, 3500, '2023-05-25', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1000967281', 2023, 'Mayo', 'LIMA', 'JESUS MARIA', 'Comisaría de Jesús María', '2023-05-13', '2023-05-13', 'Javier Castañeda', 1, 'Refiere golpes en el cuerpo por la caída', 'Policontuso', 1725, 'Leve', 1780, 0, '2023-06-06', 24, 'Transigido', 'CERRADO', 'RVC'),
('1000967394', 2023, 'Mayo', 'LIMA', 'Mateo Pumacahua', null, '2023-05-14', '2023-05-14', 'OU', 1, 'Politraumatismo, Latigazo', 'Politraumatizado', 4000, 'Leve', 3555, 1445, '2023-06-20', 37, 'Transigido', 'CERRADO', 'Abeo'),
('1000967405', 2023, 'Mayo', 'LIMA', 'Chacarilla', null, '2023-05-14', '2023-05-14', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1000967489', 2023, 'Mayo', 'CALLAO', 'CALLAO', 'Comisaría de Playa Rimac', '2023-05-14', '2023-05-14', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-05-15', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000967499', 2023, 'Mayo', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-05-14', '2023-05-14', 'Pierina Ugaz', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 5000, 2166, '2024-04-03', 325, 'Transigido', 'CERRADO', 'RVC'),
('1000967609', 2023, 'Mayo', 'LIMA', 'Surco', null, '2023-05-14', '2023-05-14', 'JD', 1, 'Fractura Muñeca Derecha', 'Policontuso', 1725, 'Leve', 0, 15000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000968000', 2023, 'Mayo', 'LIMA', 'Lince', null, '2023-05-15', '2023-05-15', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000969580', 2023, 'Mayo', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-05-18', '2023-05-18', 'Pierina Ugaz', 1, 'Fractura de tibia y peroné', 'Fractura de Peroné', 17250, 'Grave', null, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000969627', 2023, 'Mayo', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-05-17', '2023-05-17', 'Pierina Ugaz', 1, 'Fractura de pierna', 'Fractura Pierna', 17250, 'Grave', 30000, 0, '2024-08-01', 442, 'Transigido', 'CERRADO', 'RVC'),
('1000969827', 2023, 'Mayo', 'LIMA', 'SAN MIGUEL', 'Comisaría de Maranga', '2023-05-19', '2023-05-19', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 350, 4650, '2023-05-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000970046', 2023, 'Mayo', 'LIMA', 'San Isidro', null, '2023-05-19', '2023-05-19', 'JD', 1, 'Fractura de Tobillo Derecho', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000970703', 2023, 'Mayo', 'LIMA', 'PACHACAMAC', 'Comisaría de Manchay.', '2023-05-21', '2023-05-21', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 50000, '2025-05-25', 735, 'Transigido', 'CERRADO', 'RVC'),
('1000970751', 2023, 'Mayo', 'LIMA', 'LIMA', 'Comisaria de Mirones alto.', '2023-05-21', '2023-05-21', 'Pierina Ugaz', 1, 'Policontuso, fractura del brazo.', 'Policontuso', 1725, 'Grave', 7719, 1161, '2023-11-23', 186, 'Transigido', 'CERRADO', 'RVC'),
('1000971098', 2023, 'Mayo', 'LIMA', 'Monterrico', null, '2023-05-22', '2023-05-22', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 845, 4155, '2023-05-29', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000971099', 2023, 'Mayo', 'LIMA', 'Santa Felicia', null, '2023-05-22', '2023-05-22', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000971135', 2023, 'Mayo', 'LIMA', 'SAN MIGUEL', 'Comisaría de San Miguel', '2023-05-22', '2023-05-22', 'Pierina Ugaz', 1, 'Desgarro  de Meniscos, esguinces y torceduras de otra partes especificadas de la rodilla', 'Esguince', 2300, 'Leve', 1200, 14128, '2023-06-12', 21, 'Transigido', 'CERRADO', 'RVC'),
('1000971158', 2023, 'Mayo', 'LIMA', 'Miraflores', null, '2023-05-22', '2023-05-22', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 840, 660, '2023-07-21', 60, 'Transigido', 'CERRADO', 'Abeo'),
('1000971276', 2023, 'Mayo', 'LIMA', 'LA VICTORIA', 'Comisaría de la Victoria', '2023-05-22', '2023-05-22', 'Pierina Ugaz', 1, 'Policontuso - contusión craneal, quedando en  observación.', 'Policontuso', 1725, 'Leve', 0, 30000, '2026-03-19', 1032, 'Judicializado', 'CERRADO', 'RVC'),
('1000971384', 2023, 'Mayo', 'LIMA', 'Surco', null, '2023-05-23', '2023-05-23', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Grave', 10000, -7000, '2023-08-29', 98, 'Transigido', 'CERRADO', 'Abeo'),
('1000971453', 2023, 'Mayo', 'LIMA', 'LIMA', 'Comisaria de Mirones Alto.', '2023-05-23', '2023-05-23', 'Pierina Ugaz', 2, 'Herida en la cabeza /  Policontuso.', 'Policontuso y corte', 4600, 'Leve', 0, 10000, '2025-05-25', 733, 'Transigido', 'CERRADO', 'RVC'),
('1000971469', 2023, 'Mayo', 'LIMA', 'PTE. PIEDRA', 'Comisaría de Zapallal', '2023-05-22', '2023-05-22', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 300, 29700, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1000971514', 2023, 'Mayo', 'LIMA', 'Orrantía', null, '2023-05-28', '2023-05-28', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000971584', 2023, 'Mayo', 'LIMA', 'SMP', 'Comisaría de Barboncito.', '2023-05-23', '2023-05-23', 'Pierina Ugaz', 1, 'Policontuso, TEC por descartar, quedando en observacion.', 'TEC Leve', 5750, 'Grave', 8000, 9114, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1000972284', 2023, 'Mayo', 'LIMA', 'SJL', 'Comisaría de Zarate', '2023-05-25', '2023-05-25', 'Pierina Ugaz', 2, 'Policontuso /  Policontuso', 'Policontuso', 3450, 'Leve', 350, 14650, '2023-05-25', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000972599', 2023, 'Mayo', 'LIMA', 'Miraflores', null, '2023-05-25', '2023-05-25', 'OU', 2, 'Politraumatismo', 'Politraumatizado', 8000, 'Grave', 4000, 6000, '2023-05-26', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000973174', 2023, 'Mayo', 'LIMA', 'Curva de Villa', null, '2023-05-26', '2023-05-26', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 900, 600, '2023-05-31', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000973374', 2023, 'Mayo', 'LIMA', 'Chacarilla', null, '2023-05-26', '2023-05-26', 'OU', 2, 'Politraumatismo', 'Politraumatizado', 8000, 'Grave', 2800, 7200, '2023-07-05', 40, 'Transigido', 'CERRADO', 'Abeo'),
('1000973410', 2023, 'Mayo', 'LIMA', 'Miraflores', null, '2023-05-26', '2023-05-26', 'GC', 1, 'daño material', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000973576', 2023, 'Mayo', 'LIMA', 'Sagitario', null, '2023-05-27', '2023-05-27', 'GC', 1, 'Fractura de clavícula', 'Fractura de clavícula', 23000, 'Grave', null, 10000, '2023-09-27', 123, 'Transigido', 'CERRADO', 'Abeo'),
('1000973609', 2023, 'Mayo', 'LIMA', 'La Molina', null, '2023-05-27', '2023-05-27', 'DS', 1, 'Fractura de clavicula y rotula de rodilla', 'Fractura de clavícula', 23000, 'Grave', 25000, null, '2023-06-30', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1000973731', 2023, 'Mayo', 'LIMA', 'SMP', 'San Martin de Porres', '2023-05-28', '2023-05-28', 'Pierina Ugaz', 1, 'Refiere golpes leves', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-05-31', 3, 'Rechazado', 'CERRADO', 'RVC'),
('1000973827', 2023, 'Mayo', 'LIMA', 'ATE', 'SIN DENUNCIA POLICIAL', '2023-05-28', '2023-05-27', 'Pierina Ugaz', 2, ': Refiere golpes leves

- Se desconoce el lugar de su atención

 

- Conductor tercero: No brindó datos

- Diagnostico: Refiere corte en la frente

- Se desconoce el lugar de su atención', 'Policontuso', 3450, 'Leve', 0, 15000, '2023-08-23', 87, 'Transigido', 'CERRADO', 'RVC'),
('1000974116', 2023, 'Mayo', 'LIMA', 'SAN MIGUEL', 'Cía Maranga', '2023-05-29', '2023-05-29', 'Pierina Ugaz', 1, ': Policontuso', 'Policontuso', 1725, 'Leve', 800, 9200, '2023-05-30', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000974293', 2023, 'Mayo', 'CALLAO', 'CARMEN DE LA LEGUA', 'Comisaría de Carmen de la Legua Reynoso', '2023-05-30', '2023-05-30', 'Pierina Ugaz', 1, '- Conductor tercero: José Danny Ramos Cabezas

- Diagnostico: No se determina', 'Policontuso', 1725, 'Leve', null, 10000, '2024-09-17', 476, 'Transigido', 'CERRADO', 'RVC'),
('1000974750', 2023, 'Mayo', 'LIMA', 'SJL', 'Comisaría de Zarate', '2023-05-31', '2023-05-31', 'Pierina Ugaz', 1, 'Refiere golpes', 'Policontuso', 1725, 'Leve', null, 10000, '2023-07-05', 35, 'Transigido', 'CERRADO', 'RVC'),
('1000975630', 2023, 'Junio', 'LIMA', 'Chacarrilla', null, '2023-06-01', '2023-06-01', 'OU', 1, 'Politraumatismo, Herida Cortante Rostro', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '2023-06-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000975719', 2023, 'Junio', 'LIMA', 'BREÑA', 'Comisaría de Breña', '2023-06-01', '2023-06-01', 'Javier Castañeda', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-06-03', 2, 'Transigido', 'CERRADO', 'RVC'),
('1000976102', 2023, 'Junio', 'LIMA', 'SAN MIGUEL', 'Comisaría de San Miguel', '2023-06-02', '2023-06-02', 'Javier Castañeda', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '2026-04-24', 1057, 'Transigido', 'CERRADO', 'RVC'),
('1000976244', 2023, 'Junio', 'LIMA', 'JESUS MARIA', 'Comisaría Jesús María', '2023-06-02', '2023-06-02', 'Javier Castañeda', 1, 'Fractura de cúbito proximal derecho', 'Fractura de radio y cúbito', 17250, 'Grave', null, 18000, '2024-09-19', 475, 'Rechazado', 'CERRADO', 'RVC'),
('1000976344', 2023, 'Junio', 'LIMA', 'Lince', null, '2023-06-03', '2023-06-03', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000976430', 2023, 'Junio', 'LIMA', 'COMAS', 'Comisaría de Santa Luzmila', '2023-06-02', '2023-06-02', 'Pierina Ugaz', 2, 'Descartar fractura de pelvis /  Fractura humero derecho', 'Fractura de humero', 46000, 'Grave', 7220, 7220, '2023-11-29', 180, 'Transigido', 'CERRADO', 'RVC'),
('1000976920', 2023, 'Junio', 'LIMA', 'San Antonio', null, '2023-06-04', '2023-06-04', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000977035', 2023, 'Junio', 'LIMA', 'Villa el Salvador', null, '2023-06-05', '2023-06-05', 'DS', 2, 'Politraumatizados', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000977271', 2023, 'Junio', 'LIMA', 'Magdalena', null, '2023-06-05', '2023-06-05', 'DS', 2, 'Esguince en la Pierna y Fractura de Brazo', 'Esguince', 4600, 'Leve', 2000, 23000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000977287', 2023, 'Junio', 'LIMA', 'Orrantia', null, '2023-06-05', '2023-06-05', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 3000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000977322', 2023, 'Junio', 'LIMA', 'LIMA', 'Comisaría de Monserrat', '2023-06-05', '2023-06-05', 'Javier Castañeda', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 8800, 2400, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000977466', 2023, 'Junio', 'LIMA', 'Orrantia', null, '2023-06-06', '2023-06-06', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 800, 4200, '2023-06-06', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000978083', 2023, 'Junio', 'LIMA', 'San Borja', null, '2023-06-07', '2023-06-07', 'OU', 1, 'Fractura Muñeca, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000978289', 2023, 'Junio', 'LIMA', 'LIMA', 'Comisaría de Cotabambas', '2023-06-07', '2023-06-07', 'Javier Castañeda', 1, 'Fractura de muñeca', 'Fractura de muñeca', 17250, 'Grave', 0, 15000, '2023-09-11', 96, 'Transigido', 'CERRADO', 'RVC'),
('1000978621', 2023, 'Junio', 'LIMA', 'Surquillo', null, '2023-06-13', '2023-06-13', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 300, 1200, '2023-06-14', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000979534', 2023, 'Junio', 'LIMA', 'Urbanización Pachacamac', null, '2023-06-10', '2023-06-10', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 150, 1350, '2023-06-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000979921', 2023, 'Junio', 'LIMA', 'Miraflores', null, '2023-06-11', '2023-06-11', 'JD', 1, 'No hubo Lesionados', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000979990', 2023, 'Junio', 'LIMA', 'Manchay', null, '2023-06-10', '2023-06-10', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000980070', 2023, 'Junio', 'LIMA', 'LOS OLIVOS', 'Comisaría de Laura Caller', '2023-06-12', '2023-06-12', 'Pierina Ugaz', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', 0, 17000, '2024-09-25', 471, 'Transigido', 'CERRADO', 'RVC'),
('1000980118', 2023, 'Junio', 'LIMA', 'Surquillo', null, '2023-06-12', '2023-06-12', 'JD', 1, 'Fractura de Tobillo Derecho', 'Fractura Pierna', 17250, 'Grave', 1000, 14000, '2023-06-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000980130', 2023, 'Junio', 'LIMA', 'Sagitario', null, '2023-06-12', '2023-06-12', 'OU', 1, 'Politraumatismo, Herida Cortante Mano Derecha', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-06-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000980530', 2023, 'Junio', 'LIMA', 'San Borja', null, '2023-06-13', '2023-06-13', 'OU', 3, 'Policontusos', 'Policontuso', 5175, 'Leve', 3380, 4620, '2023-06-26', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1000980659', 2023, 'Junio', 'LIMA', 'EL AGUSTINO', 'Sin denuncia policial', '2023-06-13', '2023-06-12', 'Pierina Ugaz', 1, 'Refiere policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '2023-08-21', 69, 'Transigido', 'CERRADO', 'RVC'),
('1000981419', 2023, 'Junio', 'LIMA', 'SANTA ANITA', 'Comisaría de Santa Anita', '2023-06-14', '2023-06-14', 'Pierina Ugaz', 2, 'Lesionados Tercero y su ocupante', 'Policontuso', 3450, 'Leve', 0, 15000, '2025-05-25', 711, 'Transigido', 'CERRADO', 'RVC'),
('1000981458', 2023, 'Junio', 'LIMA', 'SAN MIGUEL', 'Comisaría de San Miguel', '2023-06-14', '2023-06-14', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 9500, '2023-06-14', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000981746', 2023, 'Junio', 'LIMA', 'PTE. PIEDRA', 'Comisaría de Zapallal', '2023-06-15', '2023-06-15', 'Mario Pilares', 1, 'Herida en cuero cabelludo región frontal, esquimosis en brazo derecho y glúteo, herida y esquimosis en la región crural derecha e izquierda.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000981763', 2023, 'Junio', 'LIMA', 'Surquillo', null, '2023-06-15', '2023-06-15', 'JD', 1, 'Fractura de Columna', 'Fractura de columna', 20000, 'Grave', 20000, 0, '2024-02-06', 236, 'Transigido', 'CERRADO', 'Abeo'),
('1000981816', 2023, 'Junio', 'LIMA', 'Lince', null, '2023-06-15', '2023-06-15', 'GC', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 1800, 1200, '2023-06-16', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000982040', 2023, 'Junio', 'LIMA', 'PTE. PIEDRA', 'Comisaría de Puente Piedra', '2023-06-16', '2023-06-16', 'Pierina Ugaz', 1, 'Descarte de fractura de hombro derecho, de pelvis y traumatismo abdominal cerrado', 'Fractura de pelvis', 15000, 'Grave', null, 9970, '2023-12-13', 180, 'Transigido', 'CERRADO', 'RVC'),
('1000982227', 2023, 'Junio', 'LIMA', 'RIMAC', 'Comisaría de Piedra Liza', '2023-06-16', '2023-06-16', 'Javier Castañeda', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Grave', 7700, 4020, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1000982242', 2023, 'Junio', 'LIMA', 'Miraflores', null, '2023-06-16', '2023-06-16', 'OU', 1, 'Heridas Cortantes Rostro, Politraumatismo, Pérdida Piezas Dentales', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000982441', 2023, 'Junio', 'LIMA', 'Magdalena', null, '2023-06-16', '2023-06-16', 'OU', 1, 'Fractura Clavícula', 'Policontuso', 1725, 'Leve', 400, 29600, '2023-06-16', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000982610', 2023, 'Junio', 'LIMA', 'Pamplona', null, '2023-06-16', '2023-06-16', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000982617', 2023, 'Junio', 'LIMA', 'CHACLACAYO', 'Comisaría de Chaclacayo', '2023-06-16', '2023-06-16', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2026-04-24', 1043, 'Transigido', 'CERRADO', 'RVC'),
('1000982685', 2023, 'Junio', 'LIMA', 'Chacarrilla', null, '2023-06-17', '2023-06-17', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 20000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001154308', 2024, 'Junio', 'Lima', 'San Miguel', 'Maranga', '2024-06-21', '2024-06-21', 'Pierina Ugaz', 1, 'TEC Leve', 'TEC Leve', 5750, 'Leve', null, 15000, '2026-06-03', 712, 'En Negociación', 'CERRADO', 'RVC'),
('1000982804', 2023, 'Junio', 'CALLAO', 'CALLAO', 'Comisaría de La Legua', '2023-06-17', '2023-06-17', 'Pierina Ugaz', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', null, 15000, '1970-01-01', -19525, 'Transigido', 'CERRADO', 'RVC'),
('1000982932', 2023, 'Junio', 'LIMA', 'SMP', 'Comisaría de Condevilla', '2023-06-18', '2023-06-18', 'Pierina Ugaz', 2, 'Policontuso, TEC trauma abdominal /  Contusión de muñeca', 'TEC Leve', 11500, 'Grave', 3700, 3146, '2023-08-12', 55, 'Transigido', 'CERRADO', 'RVC'),
('1000982985', 2023, 'Junio', 'LIMA', 'Santa Felicia', null, '2023-06-18', '2023-06-18', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000982988', 2023, 'Junio', 'LIMA', 'SANTA ANITA', 'Comisaría de Santa Anita', '2023-06-18', '2023-06-18', 'Mario Pilares', 2, 'Traumatismos superficiales / Policontuso', 'Policontuso', 3450, 'Grave', 7514, 7486, '2024-01-25', 221, 'Transigido', 'CERRADO', 'RVC'),
('1000983038', 2023, 'Junio', 'LIMA', 'Sagitario', null, '2023-06-18', '2023-06-18', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 990, 4010, '2023-06-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000983055', 2023, 'Junio', 'LIMA', 'Pueblo Libre', null, '2023-06-19', '2023-06-19', 'OU', 1, 'TEC, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000983268', 2023, 'Junio', 'LIMA', 'Chacarrilla', null, '2023-06-19', '2023-06-19', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-06-19', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000983308', 2023, 'Junio', 'LIMA', 'Sagitario', null, '2023-06-19', '2023-06-19', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000983890', 2023, 'Junio', 'LIMA', 'Orrantia', null, '2023-06-20', '2023-06-20', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-06-20', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000984343', 2023, 'Junio', 'LIMA', 'Orrantia', null, '2023-06-21', '2023-06-21', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 100, 4900, '2023-06-21', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000984565', 2023, 'Junio', 'LIMA', 'LOS OLIVOS', 'Comisaría Sol de Oro', '2023-06-22', '2023-06-22', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-03-06', 623, 'Transigido', 'CERRADO', 'RVC'),
('1000984590', 2023, 'Junio', 'LIMA', 'Pueblo Libre', null, '2023-06-22', '2023-06-22', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000984798', 2023, 'Junio', 'LIMA', 'Chacarilla', null, '2023-06-22', '2023-06-22', 'OU', 1, 'Fractura de codo', 'Policontuso', 1725, 'Grave', 9000, 21000, '2023-06-30', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1000984850', 2023, 'Junio', 'LIMA', 'SAN MIGUEL', 'Comisaría San Miguel', '2023-06-22', '2023-06-22', 'Mario Pilares', 1, 'Contusión de la región lumbosacra y otras partes', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-07-15', 23, 'Transigido', 'CERRADO', 'RVC'),
('1000985124', 2023, 'Junio', 'LIMA', 'Laderas de Villa', null, '2023-06-23', '2023-06-23', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 520, 4480, '2023-06-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000985188', 2023, 'Junio', 'LIMA', 'Villa el Salvador', null, '2023-06-23', '2023-06-23', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-06-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000985300', 2023, 'Junio', 'LIMA', 'San Antonio', null, '2023-06-23', '2023-06-23', 'DS', 1, 'Policontuso / Descartar Fractrura de Cadera, Trauma Abdominal, Fractura Lumbo Sacra, quedando en observación', 'Policontuso', 1725, 'Leve', 0, 5000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000985350', 2023, 'Junio', 'LIMA', 'Barranco', null, '2023-06-23', '2023-06-23', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 110, 1390, '2023-06-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000985449', 2023, 'Junio', 'LIMA', 'LOS OLIVOS', 'Comisaría Sol de Oro', '2023-06-24', '2023-06-24', 'Pierina Ugaz', 1, 'Diagnostico: Refiere golpes', 'Policontuso', 1725, 'Grave', 19300, -17400, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1000985577', 2023, 'Junio', 'LIMA', 'Barranco', null, '2023-06-24', '2023-06-24', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1500, 0, '2023-06-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000985726', 2023, 'Junio', 'CALLAO', 'CALLAO', 'Comisaría de Playa Rímac', '2023-06-24', '2023-06-24', 'Richard Rodriguez', 1, 'Policontuso en la pierna izquierda desde la cadera.', 'Policontuso', 1725, 'Leve', 1000, 4000, '2023-06-25', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000985761', 2023, 'Junio', 'LIMA', 'LIMA', 'Comisaría de Mirones Alto', '2023-06-25', '2023-06-25', 'Pierina Ugaz', 1, 'Fractura de pelvis', 'Fractura de pelvis', 15000, 'Grave', 0, 5000, '2023-07-10', 15, 'Transigido', 'CERRADO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1000985855', 2023, 'Junio', 'LIMA', 'San Isidro', null, '2023-06-25', '2023-06-25', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000985856', 2023, 'Junio', 'LIMA', 'San Antonio', null, '2023-06-25', '2023-06-25', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000986069', 2023, 'Junio', 'LIMA', 'Miraflores', null, '2023-06-26', '2023-06-26', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000986097', 2023, 'Junio', 'LIMA', 'La Molina', null, '2023-06-26', '2023-06-26', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000986717', 2023, 'Junio', 'LIMA', 'Chacarilla', null, '2023-06-27', '2023-06-27', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000986868', 2023, 'Junio', 'LIMA', 'Surco', null, '2023-06-27', '2023-06-27', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-06-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000986985', 2023, 'Junio', 'LIMA', 'Surco', null, '2023-06-27', '2023-06-27', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2023-06-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000987154', 2023, 'Junio', 'LIMA', 'Chorrillos', null, '2023-06-28', '2023-06-28', 'JD', 1, 'No hubo Lesionados', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000987363', 2023, 'Junio', 'LIMA', 'Orrantia', null, '2023-06-28', '2023-06-28', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 4837.5, 162.5, '2023-08-23', 56, 'Transigido', 'CERRADO', 'Abeo'),
('1000988140', 2023, 'Junio', 'LIMA', 'Miraflores', null, '2023-06-30', '2023-06-30', 'DS', 1, 'Esguince de Tobillo', 'Esguince', 2300, 'Leve', 0, 5000, '2023-06-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000988357', 2023, 'Julio', 'LIMA', 'San Antonio', null, '2023-07-01', '2023-07-01', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-07-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000988449', 2023, 'Julio', 'LIMA', 'Lince', null, '2023-07-01', '2023-07-01', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1100, 400, '2023-07-05', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000988764', 2023, 'Julio', 'LIMA', 'SJL', 'Comisaría de Zarate', '2023-07-02', '2023-07-02', 'Pierina Ugaz', 3, 'Traumatismos múltiples no especificados /  Traumatismos superficiales que afectan la cabeza con el cuello / Otras dorsalgias, lumbago no especificado', 'Politraumatizado', 12000, 'Grave', 0, 10000, '2023-07-17', 15, 'Rechazado', 'CERRADO', 'RVC'),
('1000989300', 2023, 'Julio', 'LIMA', 'LA PERLA', 'Comisaría de La Perla', '2023-07-04', '2023-07-04', 'Mario Pilares', 3, 'Policontuso /  Policontuso / Policontuso', 'Policontuso', 5175, 'Leve', null, 20000, '2024-02-24', 235, 'Transigido', 'CERRADO', 'RVC'),
('1000989325', 2023, 'Julio', 'LIMA', 'Surquillo', null, '2023-07-04', '2023-07-04', 'OU', 1, 'Esguince de Tobillo', 'Esguince', 2300, 'Leve', 2400, 2600, '2023-07-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000989545', 2023, 'Julio', 'LIMA', 'Lince', null, '2023-07-04', '2023-07-04', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 250, 4750, '2023-07-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000989661', 2023, 'Julio', 'LIMA', 'Miraflores', null, '2023-07-04', '2023-07-04', 'OU', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 0, 50000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000989675', 2023, 'Julio', 'LIMA', 'Santa Felicia', null, '2023-07-04', '2023-07-04', 'GC', 1, 'Ruben Bartolo Archi (sin lesiones)', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-07-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000989773', 2023, 'Julio', 'LIMA', 'LIMA', 'Comisaría de Cotabambas', '2023-07-04', '2023-07-04', 'Pierina Ugaz', 2, '-Policontuso, descarte de fractura/ Contusión región palpedral', 'Policontuso', 3450, 'Leve', 0, 15000, '2025-05-25', 691, 'Transigido', 'CERRADO', 'RVC'),
('1000989851', 2023, 'Julio', 'LIMA', 'Monterrico', null, '2023-07-05', '2023-07-05', 'OU', 1, 'Politraumatismo, Herida Cortante Cabeza', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-07-07', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1000989858', 2023, 'Julio', 'LIMA', 'Orrantia', null, '2023-07-05', '2023-07-05', 'OU', 1, 'Fractura Tobillo', 'Policontuso', 1725, 'Leve', 0, 30000, '2023-05-05', -61, 'Transigido', 'CERRADO', 'Abeo'),
('1000989859', 2023, 'Julio', 'LIMA', 'RIMAC', 'Comisaría de Ciudad y Campo', '2023-07-05', '2023-07-05', 'Richard Rodriguez', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 5000, '2023-07-05', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000990055', 2023, 'Julio', 'LIMA', 'Barranco', null, '2023-07-05', '2023-07-05', 'OU', 1, 'Esguince Dedo, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000990143', 2023, 'Julio', 'LIMA', 'San Borja', null, '2023-07-05', '2023-07-05', 'GC', 1, 'Fractura de Perone y Maleolo', 'Policontuso', 1725, 'Grave', 10000, 15000, '2023-07-24', 19, 'Transigido', 'CERRADO', 'Abeo'),
('1000990237', 2023, 'Julio', 'LIMA', 'Huaylas', null, '2023-07-05', '2023-07-05', 'DS', 1, 'Politraumatiazada', 'Policontuso', 1725, 'Leve', 4500, 500, '2023-07-06', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000991272', 2023, 'Julio', 'LIMA', 'SAN MIGUEL', 'Comisaría de Maranga', '2023-07-07', '2023-07-07', 'Richard Rodriguez', 2, 'Policontuso /  Policontuso', 'Policontuso', 3450, 'Leve', 1100, 3900, '2023-07-08', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000991471', 2023, 'Julio', 'LIMA', 'SMP', 'Comisaría de San Martín de Porres', '2023-07-08', '2023-07-08', 'Pierina Ugaz', 1, ': Contusión de pierna', 'Policontuso', 1725, 'Grave', 9000, 2200, '2023-09-12', 66, 'Transigido', 'CERRADO', 'RVC'),
('1000991737', 2023, 'Julio', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-07-09', '2023-07-09', 'Pierina Ugaz', 3, 'Policontuso / Policontuso /  Policontuso', 'Policontuso', 5175, 'Leve', null, 20000, '1970-01-01', -19547, 'Transigido', 'CERRADO', 'RVC'),
('1000991829', 2023, 'Julio', 'LIMA', 'San Borja', null, '2023-07-09', '2023-07-09', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000991952', 2023, 'Julio', 'LIMA', 'Las Praderas', null, '2023-07-10', '2023-07-10', 'JD', 1, 'Fractura Expuesta de Tibia y Peroné', 'Policontuso', 1725, 'Grave', 13500, 11500, '2023-08-31', 52, 'Transigido', 'CERRADO', 'Abeo'),
('1000991969', 2023, 'Julio', 'LIMA', 'SJL', 'Comisaría de La Huayrona', '2023-07-09', '2023-07-09', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1000992075', 2023, 'Julio', 'LIMA', 'LIMA', 'Comisaría de Cotabambas', '2023-07-10', '2023-07-10', 'Pierina Ugaz', 2, 'Contusión, posible fractura./  Policontuso', 'Policontuso', 3450, 'Leve', 0, 15000, '2025-05-25', 685, 'Transigido', 'CERRADO', 'RVC'),
('1001090906', 2024, 'Febrero', 'Lima', 'San Miguel', 'San Miguel', '2024-02-18', '2024-02-18', 'Pierina Ugaz', 7, '1-  Fractura de Epífisis de radio,
 2- Esguince y torcedura del codo,
3-    Traumatismo intracraneal no especificado, 
4-   Traumatismo intracraneal no especificado, 
5-   Traumatismos múltiples en la pierna, 
6- Policontuso.
7-  -Traumatismo en la rodilla derecha,', 'Fractura de radio y cúbito', 120750, 'Grave', null, 80000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1000992412', 2023, 'Julio', 'LIMA', 'SJL', 'Comisaría de Canto Rey', '2023-07-10', '2023-07-10', 'Pierina Ugaz', 3, 'Policontuso /  Policontuso / Policontuso', 'Policontuso', 5175, 'Leve', 1220, 8780, '2023-07-11', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000992473', 2023, 'Julio', 'LIMA', 'Orrantia', null, '2023-07-10', '2023-07-10', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1100, 3900, '2023-07-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000995668', 2023, 'Julio', 'LIMA', 'Santa Felicia', null, '2023-07-18', '2023-07-18', 'GC', 1, 'NN', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1000992709', 2023, 'Julio', 'LIMA', 'Chacarilla', null, '2023-07-11', '2023-07-11', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 1500, '2023-07-12', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000992850', 2023, 'Julio', 'LIMA', 'LIMA', 'Comisaría de Monserrate', '2023-07-11', '2023-07-11', 'Richard Rodriguez', 2, 'Policontuso /  Policontuso', 'Policontuso', 3450, 'Leve', 3736, 14944, '2024-01-22', 195, 'Transigido', 'CERRADO', 'RVC'),
('1000992950', 2023, 'Julio', 'LIMA', 'Chacarilla', null, '2023-07-12', '2023-07-12', 'DS', 1, 'Fractura de Humero Proximal / Fractura de hombro', 'Fractura de humero', 23000, 'Grave', 20000, 5000, '2023-08-08', 27, 'Transigido', 'CERRADO', 'Abeo'),
('1000993015', 2023, 'Julio', 'LIMA', 'PUEBLO LIBRE', 'Comisaría de Pueblo Libre', '2023-07-11', '2023-07-11', 'Mario Pilares', 1, 'TEC con edema cerebral', 'TEC Leve', 5750, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000993215', 2023, 'Julio', 'LIMA', 'Pamplona', null, '2023-07-12', '2023-07-12', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000996792', 2023, 'Julio', 'LIMA', 'Chacarilla', null, '2023-07-20', '2023-07-20', 'OU', 1, 'Politraumatimso, Heridas Cortantes Rostro', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1000993776', 2023, 'Julio', 'LIMA', 'ATE', 'Comisaría de Ate', '2023-07-13', '2023-07-13', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-05-25', 682, 'Transigido', 'CERRADO', 'RVC'),
('1000993907', 2023, 'Julio', 'CALLAO', 'CARMEN DE LA LEGUA', 'Comisaría de Carmen de la Legua', '2023-07-14', '2023-07-14', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 250, 9750, '2023-07-15', 1, 'Transigido', 'CERRADO', 'RVC'),
('1000994222', 2023, 'Julio', 'LIMA', 'SJM', null, '2023-07-14', '2023-07-14', 'OU', 1, 'Fractura Mano', 'Policontuso', 1725, 'Grave', 7500, 22500, '2023-07-21', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1000994921', 2023, 'Julio', 'LIMA', 'Miraflores', null, '2023-07-17', '2023-07-17', 'OU', 2, 'Fractura Clavícula y Politraumatismo', 'Politraumatizado', 8000, 'Grave', 37500, -2500, '2023-10-16', 91, 'Transigido', 'CERRADO', 'Abeo'),
('1000995091', 2023, 'Julio', 'LIMA', 'PETIT THOUARS', 'Comisaría de Petit Thouars', '2023-07-17', '2023-07-17', 'Pierina Ugaz', 1, 'Escoriaciones en miembros inferiores leves', 'Policontuso', 1725, 'Leve', 0, 5000, '2023-07-17', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000995201', 2023, 'Julio', 'LIMA', 'San Juan de Miraflores', null, '2023-07-17', '2023-07-17', 'DS', 1, 'Fractura de Humero', 'Fractura de humero', 23000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001025463', 2023, 'Septiembre', 'LIMA', 'Orrantia', null, '2023-09-26', '2023-09-26', 'JD', 1, 'Fractura de Dos Dedos de la Mano Derecha', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000996061', 2023, 'Julio', 'LIMA', 'Surquillo', null, '2023-07-19', '2023-07-19', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 3970, null, '2024-02-15', 211, 'Transigido', 'CERRADO', 'Abeo'),
('1000996168', 2023, 'Julio', 'LIMA', 'Miraflores', null, '2023-07-19', '2023-07-19', 'JD', 1, 'Fractura de Tibia', 'Fractura de tibia', 17250, 'Grave', 15000, 5000, '2023-08-31', 43, 'Transigido', 'CERRADO', 'Abeo'),
('1000996182', 2023, 'Julio', 'LIMA', 'San Isidro', null, '2023-07-19', '2023-07-19', 'OU', 1, 'Politraumatismo, Pérdida de Piezas Dentales', 'Politraumatizado', 4000, 'Grave', 55000, -25000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1000996260', 2023, 'Julio', 'LIMA', 'San Isidro', null, '2023-07-19', '2023-07-19', 'DS', 1, 'Desgarro en el Hombro', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-08-23', 35, 'Transigido', 'CERRADO', 'Abeo'),
('1000996600', 2023, 'Julio', 'CALLAO', 'CALLAO', 'Comisaría de Marquez', '2023-07-19', '2023-07-19', 'Pierina Ugaz', 1, 'Fractura desplazada de clavícula derecha, lesión en la articulación tibioperoneocalcanea', 'Fractura de clavícula', 23000, 'Grave', 10000, 8330, '2023-09-14', 57, 'Transigido', 'CERRADO', 'RVC'),
('1000996785', 2023, 'Julio', 'LIMA', 'RIMAC', 'Comisaría de Rímac', '2023-07-19', '2023-07-19', 'Pierina Ugaz', 1, 'Fractura de muñeca derecha – Politraumatizado TEC y fractura de tobillo izquierdo', 'Fractura Pierna', 17250, 'Grave', 50000, 11580, '2024-09-13', 422, 'Transigido', 'CERRADO', 'RVC'),
('1001026626', 2023, 'Septiembre', 'LIMA', 'Miraflores', null, '2023-09-28', '2023-09-28', 'DS', 1, 'Fractura Expuesta', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1000997013', 2023, 'Julio', 'LIMA', 'Lince', null, '2023-07-21', '2023-07-21', 'OU', 1, 'Fractura Huesos Pie y Mano', 'Policontuso', 1725, 'Grave', 8000, 22000, '2023-07-21', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000997060', 2023, 'Julio', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-07-21', '2023-07-21', 'Pierina Ugaz', 1, 'Fractura de clavícula', 'Fractura de clavícula', 23000, 'Grave', null, 20000, '2023-07-21', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000997062', 2023, 'Julio', 'LIMA', 'San Isidro', null, '2023-07-21', '2023-07-21', 'GC', 1, 'Politramatisado', 'Policontuso', 1725, 'Leve', 5000, -2000, '2023-07-26', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1000997614', 2023, 'Julio', 'LIMA', 'Huaylas', null, '2023-07-22', '2023-07-22', 'GC', 1, 'NN', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1000997935', 2023, 'Julio', 'LIMA', 'Chacarilla', null, '2023-07-23', '2023-07-23', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1000998058', 2023, 'Julio', 'LIMA', 'SAN MIGUEL', 'San Miguel  - Comisaria de Maranga', '2023-07-24', '2023-07-23', 'Pierina Ugaz', 1, 'No se indica diagnostica', 'Policontuso', 1725, 'Leve', null, 10000, '2023-08-29', 36, 'Rechazado', 'CERRADO', 'RVC'),
('1000999226', 2023, 'Julio', 'LIMA', 'Pueblo Libre', null, '2023-07-26', '2023-07-26', 'OU', 1, 'Politraumatismo; sin embargo desistió de atención', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-07-26', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1000999696', 2023, 'Julio', 'LIMA', 'San Antonio', null, '2023-07-27', '2023-07-27', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2023-07-28', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1000999836', 2023, 'Julio', 'LIMA', 'San Antonio', null, '2023-07-27', '2023-07-27', 'JD', 2, 'Politraumatizado y Politraumatizada / Esguince de Tobillo Izquierdo', 'Politraumatizado', 8000, 'Grave', 5330, 4670, '2023-08-07', 11, 'Transigido', 'CERRADO', 'Abeo'),
('1000999972', 2023, 'Julio', 'LIMA', 'Orrantia', null, '2023-07-28', '2023-07-28', 'GC', 1, 'Fractura de la Epifisis superior de la tibia', 'Policontuso', 1725, 'Leve', 1800, 8200, '2023-08-03', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001000035', 2024, 'Febrero', 'AREQUIPA', 'YURA', null, '2024-02-16', '2024-02-16', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19769, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001000240', 2023, 'Julio', 'LIMA', 'Pueblo Libre', null, '2023-07-29', '2023-07-29', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2023-08-07', 9, 'Transigido', 'CERRADO', 'Abeo'),
('1001000383', 2023, 'Julio', 'LIMA', 'Chacarilla', null, '2023-07-30', '2023-07-30', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001000507', 2023, 'Julio', 'LIMA', 'Pueblo Libre', null, '2023-07-30', '2023-07-30', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-07-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001001231', 2023, 'Agosto', 'LIMA', 'Barranco', null, '2023-08-01', '2023-08-01', 'JD', 1, 'TEC / Politraumatizado', 'Politraumatizado', 4000, 'Leve', 200, 4800, '2023-08-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001001294', 2023, 'Agosto', 'LIMA', 'SAN LUIS', 'Comisaría de San Luis', '2023-08-01', '2023-08-01', 'Pierina Ugaz', 2, ': Policontuso. /  Policontuso.', 'Policontuso', 3450, 'Leve', 0, 15000, '2023-08-01', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001001921', 2023, 'Agosto', 'LIMA', 'Monterrico', null, '2023-08-02', '2023-08-02', 'OU', 1, 'Politraumatismo, TEC', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001002419', 2023, 'Agosto', 'LIMA', 'LOS OLIVOS', 'Comisaría Laura Caller Iberico', '2023-08-03', '2023-08-03', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Grave', 10000, 5000, '2024-09-17', 411, 'Transigido', 'CERRADO', 'RVC'),
('1001002533', 2023, 'Agosto', 'LIMA', 'Santa Felicia', null, '2023-08-03', '2023-08-03', 'DS', 1, 'Policontusas', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-08-03', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001003071', 2023, 'Agosto', 'LIMA', 'LA VICTORIA', 'Comisaría de la Victoria', '2023-08-04', '2023-08-04', 'Richard Rodriguez', 2, 'Policontuso. /  Contusión de cadera, rodilla derecha y descartar factura de fémur.', 'Policontuso', 3450, 'Leve', null, 15000, '2025-05-25', 660, 'Transigido', 'CERRADO', 'RVC'),
('1001003203', 2023, 'Agosto', 'LIMA', 'San Antonio', null, '2023-08-05', '2023-08-05', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 500, '2023-09-18', 44, 'Transigido', 'CERRADO', 'Abeo'),
('1001003223', 2023, 'Agosto', 'LIMA', 'Orrantia', null, '2023-08-04', '2023-08-04', 'GC', 1, 'Politraumatizado – Tec Moderado', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001003260', 2023, 'Agosto', 'LIMA', 'Miraflores', null, '2023-08-05', '2023-08-05', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 200, 4800, '2023-08-07', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001003444', 2023, 'Agosto', 'LIMA', 'Chacarilla', null, '2023-08-05', '2023-08-05', 'JD', 1, 'Fractura de Costillas / Politraumatizado', 'Fractura de costillas', 10000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001003986', 2023, 'Agosto', 'LIMA', 'PUEBLO LIBRE', 'Comisaría de la Pueblo Libre', '2023-08-07', '2023-08-07', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-08-13', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001004328', 2023, 'Agosto', 'LIMA', 'Monterrico', null, '2023-08-08', '2023-08-08', 'OU', 1, 'Politraumatismo, Fractura Maxilar, Herida Bucal, Pieza Dental', 'Politraumatizado', 4000, 'Grave', 30000, 0, '2023-09-18', 41, 'Transigido', 'CERRADO', 'Abeo'),
('1001004424', 2023, 'Agosto', 'LIMA', 'Villa', null, '2023-08-08', '2023-08-08', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, 800, '2023-08-11', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001004552', 2023, 'Agosto', 'CALLAO', 'CALLAO', 'Comisaría La Legua', '2023-08-08', '2023-08-08', 'Richard Rodriguez', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 550, 14450, '2023-08-08', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001004686', 2023, 'Agosto', 'LIMA', 'VENTANILLA', 'Comisaría de Pachacutec', '2023-08-08', '2023-08-08', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Grave', 8000, 6560, '2023-11-15', 99, 'Transigido', 'CERRADO', 'RVC'),
('1001005295', 2023, 'Agosto', 'LIMA', 'Orrantia', null, '2023-08-10', '2023-08-10', 'GC', 1, 'Fractur de Humero', 'Policontuso', 1725, 'Leve', 1952, 3048, '2023-09-19', 40, 'Transigido', 'CERRADO', 'Abeo'),
('1001005582', 2023, 'Agosto', 'LIMA', 'SJL', 'Comisaría La Huayrona.', '2023-08-10', '2023-08-10', 'Pierina Ugaz', 2, 'Traumatismo Superficiales múltiples, no especificados./  Policontuso cervical – T.E.C.', 'Politraumatizado', 8000, 'Grave', null, 15000, '2023-08-12', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001005705', 2023, 'Agosto', 'LIMA', 'LIMA', 'Comisaría Alfonso Ugarte.', '2023-08-11', '2023-08-11', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 15000, '2023-08-11', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001005906', 2023, 'Agosto', 'LIMA', 'SMP', 'Comisaría de Barboncitos', '2023-08-11', '2023-08-11', 'Pierina Ugaz', 1, 'Policontuso. Trauma torácico cerrado por accidente de tránsito', 'Policontuso', 1725, 'Leve', 450, 14550, '2023-08-12', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001006036', 2023, 'Agosto', 'LIMA', 'Surquillo', null, '2023-08-11', '2023-08-11', 'OU', 1, 'TEC - Hemorragia Canal Auditivo, Politraumatismo', 'Politraumatizado', 4000, 'Grave', 35000, -5000, '2023-09-29', 49, 'Transigido', 'CERRADO', 'Abeo'),
('1001006393', 2023, 'Agosto', 'LIMA', 'Orrantia', null, '2023-08-12', '2023-08-12', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 150, 4850, '2023-08-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001006765', 2023, 'Agosto', 'LIMA', 'LIMA', 'Comisaría Cotabambas.', '2023-08-14', '2023-08-14', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-05-25', 650, 'Transigido', 'CERRADO', 'RVC'),
('1001006946', 2023, 'Agosto', 'LIMA', 'Surquillo', null, '2023-08-14', '2023-08-14', 'OU', 1, 'Esguince Rodilla Derecha, Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 30000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001007273', 2023, 'Agosto', 'LIMA', 'SMP', 'Comisaría San Martin de Porres.', '2023-08-15', '2023-08-15', 'Pierina Ugaz', 1, 'Contusión de muslo izquierdo.', 'Policontuso', 1725, 'Leve', 0, 15000, '2023-08-15', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001007532', 2023, 'Agosto', 'LIMA', 'RIMAC', 'Comisaría Rímac', '2023-08-15', '2023-08-15', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Grave', 27500, 2500, '2024-01-19', 157, 'Transigido', 'CERRADO', 'RVC'),
('1001007650', 2023, 'Agosto', 'LIMA', 'SAN MIGUEL', 'Comisaría San Miguel', '2023-08-15', '2023-08-15', 'Mario Pilares', 1, 'Contusión de muslo izquierdo.', 'Policontuso', 1725, 'Leve', 0, 15000, '2023-08-16', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001007867', 2023, 'Agosto', 'LIMA', 'EL AGUSTINO', 'Comisaría Villa Hermosa.', '2023-08-16', '2023-08-16', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 2500, 3214, '2024-01-22', 159, 'Transigido', 'CERRADO', 'RVC'),
('1001008022', 2023, 'Agosto', 'LIMA', 'SANTA ANITA', 'Comisaría Santa Anita.', '2023-08-16', '2023-08-16', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-05-25', 648, 'Transigido', 'CERRADO', 'RVC'),
('1001008125', 2023, 'Agosto', 'LIMA', 'LOS OLIVOS', 'Comisaría Sol de Oro.', '2023-08-16', '2023-08-16', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-03-06', 568, 'Transigido', 'CERRADO', 'RVC'),
('1001008127', 2023, 'Agosto', 'LIMA', 'Chacarilla', null, '2023-08-17', '2023-08-17', 'JD', 1, 'Policontusas', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001008447', 2023, 'Agosto', 'LIMA', 'Miraflores', null, '2023-08-17', '2023-08-17', 'OU', 1, 'Esguince Rodilla Derecha, Politraumatismo', 'Politraumatizado', 4000, 'Leve', 300, 4700, '2023-08-17', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001008577', 2023, 'Agosto', 'LIMA', 'SAN MIGUEL', 'Comisaría de San Miguel.', '2023-08-17', '2023-08-17', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 1500, 1511, '2023-09-29', 43, 'Transigido', 'CERRADO', 'RVC'),
('1001008636', 2023, 'Agosto', 'LIMA', 'VES', null, '2023-08-18', '2023-08-18', 'OU', 1, 'Politraumatismo, Trauma Mano Derecha', 'Politraumatizado', 4000, 'Leve', 800, 4200, '2023-08-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001008824', 2023, 'Agosto', 'LIMA', 'Miraflores', null, '2023-08-18', '2023-08-18', 'GC', 1, 'Fractura de fémur', 'Fractura de fémur', 23000, 'Grave', 0, 10000, '2023-08-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001008998', 2023, 'Agosto', 'LIMA', 'CHOSICA', 'Comisaria Chosica', '2023-08-18', '2023-08-18', 'Pierina Ugaz', 1, 'Corte en la Rodilla.', 'Policontuso', 1725, 'Leve', null, 15000, '2023-08-28', 10, 'Transigido', 'CERRADO', 'RVC'),
('1001009025', 2023, 'Agosto', 'LIMA', 'Santa Felicia', null, '2023-08-18', '2023-08-18', 'JD', 2, 'Esguince y Torcedura de Tobillo Derecho / Politraumatizada', 'Politraumatizado', 8000, 'Grave', 600, 9400, '2023-08-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001009026', 2023, 'Agosto', 'LIMA', 'COMAS', 'Comisaría Túpac Amaru Comas', '2023-08-18', '2023-08-18', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 1600, 458, '2023-10-09', 52, 'Transigido', 'CERRADO', 'RVC'),
('1001009396', 2023, 'Agosto', 'LIMA', 'Laderas de Villa', null, '2023-08-18', '2023-08-18', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001009596', 2023, 'Agosto', 'LIMA', 'LIMA', 'Comisaría Monserrate.', '2023-08-20', '2023-08-20', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001009792', 2023, 'Agosto', 'LIMA', 'San Borja', null, '2023-08-21', '2023-08-21', 'GC', 1, 'Esguince Cervical', 'Esguince', 2300, 'Grave', 7118.73, 2881.27, '2023-09-22', 32, 'Transigido', 'CERRADO', 'Abeo'),
('1001010056', 2023, 'Agosto', 'LIMA', 'Monterrico', null, '2023-08-22', '2023-08-22', 'DS', 1, 'TEC Moderado, Politraumatizado', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001010155', 2023, 'Agosto', 'LIMA', 'BREÑA', 'Comisaría Chacra Colorada', '2023-08-22', '2023-08-22', 'Pierina Ugaz', 2, 'Traumatismo. /  Contusiones múltiples.', 'Politraumatizado', 8000, 'Grave', 0, 1500, '2023-09-07', 16, 'Rechazado', 'CERRADO', 'RVC'),
('1001010333', 2023, 'Agosto', 'LIMA', 'Pueblo Libre', null, '2023-08-22', '2023-08-22', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-08-22', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001010609', 2023, 'Septiembre', 'LIMA', 'Orrantia', null, '2023-09-11', '2023-09-11', 'DS', 1, 'Fractura de una pieza dental', 'Policontuso', 1725, 'Grave', 6500, -1500, '2023-10-06', 25, 'Transigido', 'CERRADO', 'Abeo'),
('1001010694', 2024, 'Agosto', 'LIMA', 'JESUS MARIA', 'Comisaría de Jesús María', '2024-08-23', '2024-08-23', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 2050, 506, '2023-12-12', -255, 'Transigido', 'CERRADO', 'RVC'),
('1001010759', 2023, 'Agosto', 'LIMA', 'JESUS MARIA', 'Comisaría de Jesús María', '2023-08-23', '2023-08-23', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 15000, '2023-08-25', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001010943', 2023, 'Agosto', 'LIMA', 'SAN ISIDRO', 'Comisaría de Orrantia del Mar.', '2023-08-23', '2023-08-23', 'Richard Rodriguez', 1, 'Contusión.', 'Policontuso', 1725, 'Leve', 1000, 1140, '2024-01-15', 145, 'Transigido', 'CERRADO', 'RVC'),
('1001011126', 2023, 'Agosto', 'LIMA', 'Chacarilla', null, '2023-08-24', '2023-08-24', 'OU', 1, 'TEC, Politraumatismo', 'Politraumatizado', 4000, 'Grave', 10000, -5000, '2023-08-29', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1001011229', 2023, 'Agosto', 'LIMA', 'Mateo Pumacahua', null, '2023-08-24', '2023-08-24', 'GC', 1, 'Fractura de muñeca', 'Fractura de muñeca', 17250, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001011327', 2023, 'Agosto', 'LIMA', 'Magdalena', null, '2023-08-24', '2023-08-24', 'GC', 1, 'Esguince cervical', 'Esguince', 2300, 'Leve', 3700, 1300, '2023-09-07', 14, 'Transigido', 'CERRADO', 'Abeo'),
('1001011640', 2023, 'Agosto', 'LIMA', 'SAN MIGUEL', 'Comisaría de Maranga', '2023-08-25', '2023-08-25', 'Pierina Ugaz', 1, 'Policontuso hombro derecho, brazo derecho y  rodilla derecha.', 'Policontuso', 1725, 'Leve', null, 15000, '2023-10-10', 46, 'Transigido', 'CERRADO', 'RVC'),
('1001012463', 2023, 'Agosto', 'LIMA', 'Sagitario', null, '2023-08-27', '2023-08-27', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 1000, '2023-08-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001013224', 2023, 'Agosto', 'LIMA', 'BREÑA', 'Comisaría de Breña.', '2023-08-29', '2023-08-29', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 15000, '2023-08-25', -4, 'Transigido', 'CERRADO', 'RVC'),
('1001013340', 2023, 'Agosto', 'LIMA', 'Santa Felicia', null, '2023-08-30', '2023-08-30', 'OU', 1, 'Esguince, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001013767', 2023, 'Agosto', 'LIMA', 'Manchay', null, '2023-08-31', '2023-08-31', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001013820', 2023, 'Agosto', 'LIMA', 'SMP', 'Comisaría de San Martin de Porres.', '2023-08-31', '2023-08-31', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 2090, 1780, '2023-11-20', 81, 'Transigido', 'CERRADO', 'RVC'),
('1001013904', 2023, 'Agosto', 'LIMA', 'Monterrico', null, '2023-08-31', '2023-08-31', 'DS', 1, 'Traumatismo Severo en Columna, internada en UCI', 'Policontuso', 1725, 'Grave', 33000, 7000, '2023-10-20', 50, 'Transigido', 'CERRADO', 'Abeo'),
('1001014172', 2023, 'Septiembre', 'LIMA', 'Pueblo Libre', null, '2023-09-01', '2023-09-01', 'DS', 1, 'Fractura en el metatarsiano', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-09-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001014288', 2023, 'Septiembre', 'LIMA', 'Chorrillos', null, '2023-09-01', '2023-09-01', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 400, 4600, '2023-09-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001014685', 2023, 'Septiembre', 'LIMA', 'Villa El Salvador', null, '2023-09-01', '2023-09-01', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 300, 4700, '2023-09-07', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001015217', 2023, 'Septiembre', 'LIMA', 'SAN MIGUEL', 'La Perla.  (Sin denuncia policial)', '2023-03-09', '2023-03-09', 'Pierina Ugaz', 1, 'Refiere policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, '2023-09-14', 189, 'Transigido', 'CERRADO', 'RVC'),
('1001015371', 2023, 'Septiembre', 'LIMA', 'Sagitario', null, '2023-09-04', '2023-09-04', 'JD', 2, 'Esguince de Rodilla / Politraumatizada', 'Politraumatizado', 8000, 'Grave', 1750, 3250, '2023-10-18', 44, 'Transigido', 'CERRADO', 'Abeo'),
('1001015935', 2023, 'Septiembre', 'LIMA', 'Monterrico', null, '2023-09-05', '2023-09-05', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 500, '2023-09-07', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001016008', 2023, 'Septiembre', 'LIMA', 'LIMA', 'Petit Thouars.', '2023-05-09', '2023-05-09', 'Richard Rodriguez', 1, 'Traumatismo Intracraneal.', 'TEC Leve', 5750, 'Leve', 0, 15000, '2025-05-25', 747, 'Transigido', 'CERRADO', 'RVC'),
('1001016536', 2023, 'Septiembre', 'LIMA', 'Chacarilla', null, '2023-09-06', '2023-09-06', 'GC', 1, 'Fractura de Pierna', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001016742', 2023, 'Septiembre', 'LIMA', 'San Borja', null, '2023-09-06', '2023-09-06', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-09-06', 0, 'Rechazado', 'CERRADO', 'Abeo'),
('1001016937', 2023, 'Septiembre', 'LIMA', 'Chacarilla', null, '2023-09-07', '2023-09-07', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-09-07', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001017142', 2023, 'Septiembre', 'LIMA', 'Chacarilla', null, '2023-09-07', '2023-09-07', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 50, 4950, '2023-09-22', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1001017706', 2023, 'Septiembre', 'LIMA', 'San Isidro', null, '2023-09-08', '2023-09-08', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-09-08', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001017715', 2023, 'Septiembre', 'LIMA', 'San Isidro', null, '2023-09-08', '2023-09-08', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 750, 4250, '2023-09-08', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001017791', 2023, 'Septiembre', 'LIMA', 'Jose Carlos Mariategui', null, '2023-09-09', '2023-09-09', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001017808', 2023, 'Septiembre', 'LIMA', 'ATE VITARTE', 'Ate', '2023-09-09', '2023-09-09', 'Richard Rodriguez', 1, 'Policontuso en tobillo derecho.', 'Policontuso', 1725, 'Leve', 200, 14800, '2023-09-09', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001017827', 2023, 'Septiembre', 'LIMA', 'Surquillo', null, '2023-09-09', '2023-09-09', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001017936', 2023, 'Septiembre', 'LIMA', 'COMAS', 'la Pascana', '2023-09-09', '2023-09-09', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001018037', 2023, 'Septiembre', 'LIMA', 'LIMA', 'Conde de la Vega', '2023-09-09', '2023-09-09', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 1500, 1283, '2023-10-27', 48, 'Transigido', 'CERRADO', 'RVC'),
('1001018105', 2023, 'Septiembre', 'LIMA', 'San Isidro', null, '2023-09-10', '2023-09-10', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1300, 200, '2024-01-10', 122, 'Transigido', 'CERRADO', 'Abeo'),
('1001018317', 2023, 'Septiembre', 'LIMA', 'CALLAO', 'La Perla', '2023-09-09', '2023-09-09', 'Mario Pilares', 2, 'Policontuso. / Policontuso.', 'Policontuso', 3450, 'Leve', null, 20000, '2023-09-29', 20, 'Rechazado', 'CERRADO', 'RVC'),
('1001018809', 2023, 'Septiembre', 'LIMA', 'San Borja', null, '2023-09-11', '2023-09-11', 'GC', 1, 'Esguince Cervical', 'Esguince', 2300, 'Leve', 3377, 1623, '2023-09-19', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1001019217', 2023, 'Septiembre', 'LIMA', 'Miraflores', null, '2023-09-12', '2023-09-12', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001019512', 2023, 'Septiembre', 'LIMA', 'CALLAO', 'Sin denuncia policial', '2023-12-09', '2023-12-09', 'Pierina Ugaz', 1, 'Refiere Policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, '2023-09-21', -79, 'Rechazado', 'CERRADO', 'RVC'),
('1001019599', 2023, 'Septiembre', 'LIMA', 'CHACLACAYO', 'Chaclacayo', '2023-09-13', '2023-09-13', 'Pierina Ugaz', 2, ': Refiere policontuso /  Contusión de cadera, contusión lumbosacra', 'Policontuso', 3450, 'Leve', 200, 20000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001020480', 2023, 'Septiembre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2023-09-15', '2023-09-15', 'Pierina Ugaz', 1, 'Fractura del maléolo externo', 'Fractura de Peroné', 17250, 'Grave', 4250, 4285, '2024-05-18', 246, 'Transigido', 'CERRADO', 'RVC'),
('1001020741', 2023, 'Septiembre', 'LIMA', 'SANTA CLARA', 'Santa Clara', '2023-09-15', '2023-09-15', 'Richard Rodriguez', 1, 'Refiere policontuso', 'Policontuso', 1725, 'Leve', 200, 2460.07, '2023-09-16', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001020813', 2023, 'Septiembre', 'LIMA', 'SMP', 'Barboncitos', '2023-09-15', '2023-09-15', 'Pierina Ugaz', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', null, 25000, '2023-09-25', 10, 'Rechazado', 'CERRADO', 'RVC'),
('1001021017', 2023, 'Septiembre', 'LIMA', 'Curva de Villa', null, '2023-09-16', '2023-09-16', 'GC', 1, 'Fractura de quinto metatarsiano', 'Policontuso', 1725, 'Leve', 350, 4650, '2023-09-22', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001021485', 2023, 'Septiembre', 'LIMA', 'LIMA', 'Mirones Bajos.', '2023-09-17', '2023-09-17', 'Mario Pilares', 1, 'Fractura de muñeca izquierda.', 'Fractura de muñeca', 17250, 'Grave', 6086, 6086, '2024-01-20', 125, 'Transigido', 'CERRADO', 'RVC'),
('1001021511', 2023, 'Septiembre', 'LIMA', 'LIMA', 'Alfonso Ugarte.', '2023-09-17', '2023-09-17', 'Richard Rodriguez', 2, 'Policontuso. /  Policontuso.', 'Policontuso', 3450, 'Leve', null, 20000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001021812', 2023, 'Septiembre', 'LIMA', 'JESÚS MARIA', 'Jesús María.', '2023-09-18', '2023-09-18', 'Pierina Ugaz', 1, ': Policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, '2023-09-21', 3, 'Rechazado', 'CERRADO', 'RVC'),
('1001022034', 2023, 'Septiembre', 'LIMA', 'Monterrico', null, '2023-09-19', '2023-09-19', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001022361', 2023, 'Septiembre', 'LIMA', 'COMAS', 'Santa Luzmila.', '2023-09-19', '2023-09-19', 'Pierina Ugaz', 1, 'TEC moderado, contusión muslo, contusión tobillo derecho.', 'TEC Moderado', 11500, 'Grave', 1500, 18500, '2023-09-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001022456', 2023, 'Septiembre', 'LIMA', 'JESÚS MARIA', 'Jesús María.', '2023-09-19', '2023-09-19', 'Richard Rodriguez', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 4000, 250, '2024-01-11', 114, 'Transigido', 'CERRADO', 'RVC'),
('1001022770', 2023, 'Septiembre', 'LIMA', 'Lince', null, '2023-09-20', '2023-09-20', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001022905', 2023, 'Septiembre', 'LIMA', 'Miraflores', null, '2023-09-20', '2023-09-20', 'OU', 1, 'Politraumatismo, Esguince Tobillo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001023413', 2023, 'Septiembre', 'LIMA', 'COMAS', 'Tupac Amaru', '2023-09-21', '2023-09-21', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 500, 14500, '2023-12-21', 91, 'Transigido', 'CERRADO', 'RVC'),
('1001023680', 2023, 'Septiembre', 'LIMA', 'SJL', 'Santa Elizabeth.', '2023-09-21', '2023-09-21', 'Mario Pilares', 1, 'Politraumatizado.', 'Politraumatizado', 4000, 'Leve', null, 20000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001023730', 2023, 'Septiembre', 'LIMA', 'Vía Evitamiento', 'Santoyo.', '2023-09-22', '2023-09-22', 'Pierina Ugaz', 2, 'Muerte durante el traslado al hospital. /  Policontuso.', 'Fallecido', 130000, 'Grave', 70000, -8330, '2023-12-28', 97, 'Transigido', 'CERRADO', 'RVC'),
('1001023934', 2023, 'Septiembre', 'LIMA', 'Pachacamac', null, '2023-09-22', '2023-09-22', 'GC', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 1260, 1740, '2023-09-25', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001023978', 2023, 'Septiembre', 'LIMA', 'SJL', 'Zárate', '2023-09-22', '2023-09-22', 'Richard Rodriguez', 1, 'Refiere policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, '2023-09-22', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001024528', 2023, 'Septiembre', 'LIMA', 'Pueblo Libre', null, '2023-09-23', '2023-09-23', 'OU', 3, 'Policontuso / Politraumatismo / Policontuso', 'Politraumatizado', 12000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001024620', 2023, 'Septiembre', 'LIMA', 'Orrantia', null, '2023-09-24', '2023-09-24', 'OU', 1, 'Politraumatismo, TEC Moderado', 'TEC Moderado', 11500, 'Grave', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001024819', 2023, 'Septiembre', 'LIMA', 'SJL', 'la Huayrona.', '2023-09-23', '2023-09-23', 'Richard Rodriguez', 1, 'Fractura de epífisis inferior del radio del antebrazo   izquierdo.', 'Fractura de radio y cúbito', 17250, 'Grave', 4875, 4534.65, '2023-12-15', 83, 'Transigido', 'CERRADO', 'RVC'),
('1001024897', 2023, 'Septiembre', 'LIMA', 'Laderas de Villa', null, '2023-09-25', '2023-09-25', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001025197', 2023, 'Septiembre', 'LIMA', 'ATE', 'Santa Clara.', '2023-09-24', '2023-09-24', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 500, 14500, '2023-09-24', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001025318', 2023, 'Septiembre', 'LIMA', 'ATE', 'Salamanca.', '2023-09-25', '2023-09-25', 'Mario Pilares', 1, 'Trauma torácico, abdominal cerrado y contusión pélvica.', 'Policontuso', 1725, 'Leve', 150, 9850, '2023-09-26', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001035327', 2023, 'Octubre', 'LIMA', 'Ville el Salvador', null, '2023-10-21', '2023-10-21', 'JD', 3, 'Politraumatismo (x3)', 'Policontuso', 5175, 'Leve', 2300, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001025466', 2023, 'Septiembre', 'LIMA', 'San Isidro', null, '2023-09-26', '2023-09-26', 'OU', 2, 'Politraumatismo', 'Politraumatizado', 8000, 'Grave', 250, 9750, '2023-09-26', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001026067', 2023, 'Septiembre', 'LIMA', 'Chacarilla', null, '2023-09-27', '2023-09-27', 'OU', 2, 'Politraumatismo', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001041625', 2023, 'Noviembre', 'LIMA', 'Lurin', null, '2023-11-05', '2023-11-05', 'JD', 1, 'Fallecida', 'Policontuso', 1725, 'Grave', 49500, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001026945', 2023, 'Septiembre', 'LIMA', 'LA VICTORIA', 'La Victoria.', '2023-09-29', '2023-09-29', 'Mario Pilares', 2, 'Traumatismo múltiple no especificados. /Traumatismo múltiple no especificados.', 'Politraumatizado', 8000, 'Grave', 2500, 12500, '2023-09-29', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001027210', 2023, 'Septiembre', 'LIMA', 'San Isidro', null, '2023-09-29', '2023-09-29', 'DS', 1, 'Esguince de Tobillo', 'Esguince', 2300, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001027258', 2023, 'Septiembre', 'LIMA', 'Laderas de Villa', null, '2023-09-30', '2023-09-30', 'JD', 2, 'Múltiples Fracturas / Politraumatizada', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001027355', 2023, 'Septiembre', 'LIMA', 'LIMA', 'Mirones Alto', '2023-09-30', '2023-09-30', 'Mario Pilares', 1, 'Contusión de cabeza y tórax.', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001027381', 2023, 'Septiembre', 'LIMA', 'LIMA', 'Mirones Altos.', '2023-09-30', '2023-09-30', 'Mario Pilares', 1, ': Sin lesiones.', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001027575', 2023, 'Septiembre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2023-09-30', '2023-09-30', 'Pierina Ugaz', 2, 'Contusión de Rodilla pre tobillo izquierdo./Contusión y herida en la rodilla izquierda.', 'Policontuso', 3450, 'Leve', null, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001027695', 2023, 'Octubre', 'LIMA', 'LIMA', 'Petit Thuoars.', '2023-01-10', '2023-01-10', 'Richard Rodriguez', 2, 'Refiere Policontuso./ : Hipertensión arterial y lipotimia.', 'Policontuso', 3450, 'Leve', null, 15000, '2023-10-02', 265, 'Transigido', 'CERRADO', 'RVC'),
('1001027739', 2023, 'Octubre', 'LIMA', 'SMP', 'Condevilla.', '2023-01-10', '2023-01-10', 'Mario Pilares', 1, ': Policontuso inferior miembro izquierdo.', 'Policontuso', 1725, 'Leve', null, 7014, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001027828', 2023, 'Octubre', 'LIMA', 'Urbanización Pachacamac', null, '2023-10-02', '2023-10-02', 'DS', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', 0, 3000, '2023-10-02', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001027845', 2023, 'Octubre', 'LIMA', 'Surco', null, '2023-10-02', '2023-10-02', 'GC', 1, 'Esguince y corte en el pie', 'Esguince', 2300, 'Leve', null, null, '2023-10-05', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001028734', 2023, 'Octubre', 'LIMA', 'San Isidro', null, '2023-10-03', '2023-10-03', 'GC', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, '2023-10-10', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1001029099', 2023, 'Octubre', 'LIMA', 'Miraflores', null, '2023-10-04', '2023-10-04', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001029117', 2023, 'Octubre', 'LIMA', 'Magdalena', null, '2023-10-04', '2023-10-04', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001029124', 2023, 'Octubre', 'LIMA', 'Santa Felicia', null, '2023-10-04', '2023-10-04', 'OU', 2, 'Fractura Brazo / Politraumatismo', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001029335', 2023, 'Octubre', 'LIMA', 'ATE', 'Salamanca.', '2023-05-10', '2023-05-10', 'Pierina Ugaz', 1, 'Corte en la rodilla derecha - 4 puntos, descanso 7 días.', 'Policontuso', 1725, 'Leve', 900, 14100, '2023-10-05', 148, 'Transigido', 'CERRADO', 'RVC'),
('1001029386', 2023, 'Octubre', 'CALLAO', 'LA PERLA', 'La Perla', '2023-05-10', '2023-05-10', 'Mario Pilares', 1, 'Policontuso, descarte de fracturas.', 'Policontuso', 1725, 'Leve', 2250, 1680, '2024-02-19', 285, 'Transigido', 'CERRADO', 'RVC'),
('1001029518', 2023, 'Octubre', 'LIMA', 'Surquillo', null, '2023-10-05', '2023-10-05', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001029532', 2023, 'Octubre', 'LIMA', 'Miraflores', null, '2023-10-06', '2023-10-06', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001029599', 2023, 'Octubre', 'LIMA', 'Surquillo', null, '2023-10-06', '2023-10-06', 'JD', 2, 'Politraumatizados', 'Politraumatizado', 8000, 'Grave', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001029758', 2023, 'Octubre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2023-06-10', '2023-06-10', 'Mario Pilares', 1, 'Traumatismo de la pierna y tobillo derecho, contusiones múltiples.', 'Politraumatizado', 4000, 'Leve', null, 10000, '2023-10-10', 122, 'Rechazado', 'CERRADO', 'RVC'),
('1001029999', 2023, 'Octubre', 'LIMA', 'Sagitario', null, '2023-10-07', '2023-10-07', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2500, 2500, '2023-10-20', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1001030067', 2023, 'Octubre', 'LIMA', 'Magdalena', null, '2023-10-08', '2023-10-08', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001030131', 2023, 'Octubre', 'LIMA', 'PUEBLO LIBRE', 'Pueblo Libre', '2023-07-10', '2023-07-10', 'Richard Rodriguez', 1, 'Heridas y raspaduras con sangre. El efectivo policial indica que se quedará internado para su evaluación.', 'Policontuso y corte', 2300, 'Leve', null, 25000, '2025-05-25', 685, 'Transigido', 'CERRADO', 'RVC'),
('1001030143', 2023, 'Octubre', 'LIMA', 'San Isidro', null, '2023-10-07', '2023-10-07', 'OU', 1, 'Politraumatismo, Meniscos', 'Politraumatizado', 4000, 'Leve', null, null, '2023-10-19', 12, 'Transigido', 'CERRADO', 'Abeo'),
('1001030396', 2023, 'Octubre', 'LIMA', 'Surco', null, '2023-10-09', '2023-10-09', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-10-10', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001031043', 2023, 'Octubre', 'LIMA', 'Surco', null, '2023-10-11', '2023-10-11', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 4951, 49, '2023-11-16', 36, 'Transigido', 'CERRADO', 'Abeo'),
('1001031628', 2023, 'Octubre', 'LIMA', 'CARABAYLLO', 'Santa Isabel.', '2023-12-10', '2023-12-10', 'Pierina Ugaz', 1, 'Contusión en pierna izquierda y tobillo izquierdo.', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001031650', 2023, 'Octubre', 'LIMA', 'La Molina', null, '2023-10-12', '2023-10-12', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001031777', 2023, 'Octubre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro.', '2023-12-10', '2023-12-10', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, '2024-03-08', 89, 'Transigido', 'CERRADO', 'RVC'),
('1001032090', 2023, 'Octubre', 'LIMA', 'LOS OLIVOS', 'Laura Caller.', '2023-10-13', '2023-10-13', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001032170', 2023, 'Octubre', 'LIMA', 'Miraflores', null, '2023-10-13', '2023-10-13', 'GC', 1, 'Fractura de muñeca', 'Fractura de muñeca', 17250, 'Grave', 2000, null, '2023-10-19', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001032292', 2023, 'Octubre', 'LIMA', 'Chacarilla', null, '2023-10-13', '2023-10-13', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001032342', 2023, 'Octubre', 'LIMA', 'LA VICTORIA', 'Cotabambas.', '2023-10-13', '2023-10-13', 'Mario Pilares', 1, 'Diagnostico UCI.', 'Policontuso', 1725, 'Grave', 15000, 4560, '2023-11-21', 39, 'Transigido', 'CERRADO', 'RVC'),
('1001032634', 2023, 'Octubre', 'LIMA', 'Monterrico', null, '2023-10-14', '2023-10-14', 'DS', 1, 'Policontuso y Herida Superficial Abierta, 7 dias de descanso médico', 'Policontuso', 1725, 'Leve', 2000, 3000, '2023-11-13', 30, 'Transigido', 'CERRADO', 'Abeo'),
('100103301', 2023, 'Octubre', 'LIMA', 'Orrantia', null, '2023-10-16', '2023-10-16', 'GC', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001033373', 2023, 'Octubre', 'LIMA', 'San Isidro', null, '2023-10-17', '2023-10-17', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-10-17', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001033637', 2023, 'Octubre', 'LIMA', 'Lince', null, '2023-10-17', '2023-10-17', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'En Investigación', 'CERRADO', 'Abeo'),
('1001033980', 2023, 'Octubre', 'LIMA', 'JESUS MARIA', 'Jesús María.', '2023-10-18', '2023-10-18', 'Pierina Ugaz', 1, 'Contusión de rodilla, herida de rodilla, contusión del hombro y del brazo y heridas en otras partes del brazo.', 'Policontuso', 1725, 'Leve', 2500, 2660.12, '2023-11-10', 23, 'Transigido', 'CERRADO', 'RVC'),
('1001034214', 2023, 'Octubre', 'LIMA', 'LIMA', 'UV3.', '2023-10-18', '2023-10-18', 'Richard Rodriguez', 1, 'TEC. Moderado y policontuso.', 'TEC Leve', 5750, 'Leve', 5500, 2845, '2024-01-21', 95, 'Transigido', 'CERRADO', 'RVC'),
('1001034219', 2023, 'Octubre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro.', '2023-10-18', '2023-10-18', 'Pierina Ugaz', 2, 'Policontuso./ Traumatismo intracraneal.', 'TEC Leve', 11500, 'Grave', 2000, 5147.98, '2024-05-13', 208, 'Transigido', 'CERRADO', 'RVC'),
('1001034225', 2023, 'Octubre', 'LIMA', 'San Isidro', null, '2023-10-19', '2023-10-19', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 5000, null, '2023-12-21', 63, 'Transigido', 'CERRADO', 'Abeo'),
('1001034232', 2023, 'Octubre', 'LIMA', 'JESUS MARIA', 'Jesús María.', '2023-10-19', '2023-10-19', 'Pierina Ugaz', 3, 'Traumatismo superficial múltiple./ Traumatismo Superficial./ Traumatismo del tórax.', 'Politraumatizado', 12000, 'Grave', 5100, 6400, '2023-11-16', 28, 'Transigido', 'CERRADO', 'RVC'),
('1001064556', 2023, 'Diciembre', 'LIMA', 'San Antonio', null, '2023-12-26', '2023-12-26', 'DS', 1, 'Fractura en la cabeza', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001035849', 2023, 'Octubre', 'LIMA', 'Magadalena', null, '2023-10-22', '2023-10-22', 'DS', 1, 'Fractura', 'Policontuso', 1725, 'Grave', 17000, null, '2024-08-28', 311, 'Transigido', 'CERRADO', 'Abeo'),
('1001064813', 2023, 'Diciembre', 'CALLAO', 'CALLAO', 'Sarita Colonia.', '2023-12-27', '2023-12-27', 'Pierina Ugaz', 1, 'Traumatismo superficiales múltiples.', 'Politraumatizado', 4000, 'Leve', null, 1500, '2026-06-03', 889, 'Archivado', 'CERRADO', 'RVC'),
('1001036589', 2023, 'Octubre', 'LIMA', 'ATE VITARTE', 'Ate Vitarte.', '2023-10-23', '2023-10-23', 'Pierina Ugaz', 1, 'Refiere policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001036610', 2023, 'Octubre', 'LIMA', 'San Isidro', null, '2023-10-24', '2023-10-24', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001036866', 2023, 'Octubre', 'LIMA', 'LURIGANCHO', 'Huachipa.', '2023-10-24', '2023-10-24', 'Pierina Ugaz', 1, ': Se desconoce diagnóstico.', 'Policontuso', 1725, 'Leve', null, 10000, '2023-10-26', 2, 'Rechazado', 'CERRADO', 'RVC'),
('1001036887', 2023, 'Octubre', 'LIMA', 'PUEBLO LIBRE', 'Mirones Altos.', '2023-10-24', '2023-10-24', 'Pierina Ugaz', 1, 'Policontuso pierna inferior izquierdo.', 'Policontuso', 1725, 'Leve', 400, 9600, '2023-10-24', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001038371', 2023, 'Octubre', 'LIMA', 'Chacarilla', null, '2023-10-27', '2023-10-27', 'GC', 1, 'Fractura de tibia y peroné', 'Fractura de tibia', 17250, 'Grave', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001038606', 2023, 'Octubre', 'LIMA', 'San Isidro', null, '2023-10-27', '2023-10-27', 'OU', 1, 'Cervicalgia', 'Cervicalgia', 2300, 'Leve', 5000, null, '2024-01-22', 87, 'Transigido', 'CERRADO', 'Abeo'),
('1001038702', 2023, 'Octubre', 'LIMA', 'Villa El Salvador', null, '2023-10-27', '2023-10-27', 'DS', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001038735', 2023, 'Octubre', 'LIMA', 'Barranco', null, '2023-10-28', '2023-10-28', 'OU', 1, 'No se confirma lesión', 'Policontuso', 1725, 'Leve', null, null, '2023-10-28', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001039181', 2023, 'Octubre', 'LIMA', 'Mateo Pumacahua', null, '2023-10-29', '2023-10-29', 'GC', 1, 'Politraumatizado y Tec Severo', 'TEC Grave', 23000, 'Grave', 0, 15000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001039182', 2023, 'Octubre', 'LIMA', 'LURIN', 'Lurín.', '2023-10-28', '2023-10-28', 'Pierina Ugaz', 1, 'Fractura de la muñeca izquierda.', 'Fractura de muñeca', 17250, 'Grave', null, 5000, '2023-10-31', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001039266', 2023, 'Octubre', 'CALLAO', 'LA PERLA', 'La Perla.', '2023-10-30', '2023-10-26', 'Pierina Ugaz', 1, 'Refiere policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, '2023-11-02', 3, 'Rechazado', 'CERRADO', 'RVC'),
('1001039270', 2023, 'Octubre', 'LIMA', 'COMAS', 'Santa Isabel.', '2023-10-30', '2023-10-30', 'Pierina Ugaz', 1, 'Politraumatizado, TEC, descartar traumatismo cervical, con pronóstico reservado.', 'TEC Leve', 5750, 'Grave', 9500, 6942, '2024-04-20', 173, 'Transigido', 'CERRADO', 'RVC'),
('1001039379', 2023, 'Octubre', 'LIMA', 'ATE', 'Ate.', '2023-10-30', '2023-10-30', 'Richard Rodriguez', 2, 'Policontuso./: Herida en parte frontal de cabeza.', 'Policontuso y corte', 4600, 'Leve', 600, 4400, '2023-10-30', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001039526', 2023, 'Octubre', 'LIMA', 'Laderas', null, '2023-10-30', '2023-10-30', 'OU', 1, 'Cervicalgia, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1001039727', 2023, 'Octubre', 'LIMA', 'LA MOLINA', 'Santa Felicia.', '2023-10-31', '2023-10-31', 'Richard Rodriguez', 1, 'Policontuso por accidente de tránsito.', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-05-25', 572, 'Transigido', 'CERRADO', 'RVC'),
('1001039741', 2023, 'Octubre', 'LIMA', 'José Carlos Mariategui', null, '2023-10-31', '2023-10-31', 'OU', 1, 'Politraumatismo, Herida Cortante Pierna', 'Politraumatizado', 4000, 'Leve', null, null, '2023-10-31', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001039845', 2023, 'Octubre', 'LIMA', 'Surquillo', null, '2023-10-31', '2023-10-31', 'GC', 1, 'herida contusa en el cuello', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Tercero No Coopera', 'CERRADO', 'Abeo'),
('1001039864', 2023, 'Octubre', 'CALLAO', 'CALLAO', 'Ramón Castilla.', '2023-10-31', '2023-10-31', 'Pierina Ugaz', 1, 'Fractura de la epífisis inferior del cubito y del radio.', 'Fractura de radio y cúbito', 17250, 'Grave', 5000, 4256, '2023-12-22', 52, 'Transigido', 'CERRADO', 'RVC'),
('1001039931', 2023, 'Octubre', 'LIMA', 'PUEBLO LIBRE', 'Pueblo Libre.', '2023-10-31', '2023-10-31', 'Mario Pilares', 1, 'Contusión de rodilla.', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001039932', 2023, 'Octubre', 'LIMA', 'PUEBLO LIBRE', 'Pueblo Libre.', '2023-10-31', '2023-10-31', 'Mario Pilares', 1, 'Contusión de rodilla.', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001060428', 2023, 'Diciembre', 'LIMA', 'LIMA', 'Cotabambas', '2023-12-17', '2023-12-17', 'Mario Pilares', 1, 'Politraumatismo, contusión.', 'Politraumatizado', 4000, 'Leve', null, 15000, '2025-05-25', 525, 'Archivado', 'CERRADO', 'RVC'),
('1001040315', 2023, 'Noviembre', 'LIMA', 'JESUS MARIA', 'Jesús María.', '2023-01-11', '2023-01-11', 'Pierina Ugaz', 1, 'Golpes múltiples, TEC, descarte de fractura en el hombro derecho.', 'TEC Leve', 5750, 'Leve', 1500, 18500, '2023-11-02', 295, 'Transigido', 'CERRADO', 'RVC'),
('1001040855', 2023, 'Noviembre', 'LIMA', 'BREÑA', 'Breña.', '2023-03-11', '2023-03-11', 'Mario Pilares', 1, 'Contusión de hombro y pierna izquierda.', 'Policontuso', 1725, 'Leve', 700, 4300, '2023-11-03', 237, 'Transigido', 'CERRADO', 'RVC'),
('1001041041', 2023, 'Noviembre', 'LIMA', 'La Planicie', null, '2023-11-03', '2023-11-03', 'OU', 1, 'TEC, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001041138', 2023, 'Noviembre', 'LIMA', 'Santa Felicia', null, '2023-11-03', '2023-11-03', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 240, 4760, '2023-11-03', 0, 'Transigido', 'CERRADO', 'Abeo'),
('9801165', 2023, 'Julio', 'Yauli', 'La Oroya', 'La Oroya', null, '2023-11-05', 'Alejandro Rodríguez', 3, null, 'Policontuso', 5175, 'Grave', 46000, null, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('1001041635', 2023, 'Noviembre', 'LIMA', 'Monterrico', null, '2023-11-05', '2023-11-05', 'OU', 1, 'Politraumatismo, Heridas Cortantes', 'Politraumatizado', 4000, 'Leve', 4000, 1000, '2023-11-09', 4, 'Transigido', 'CERRADO', 'Abeo');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001041677', 2023, 'Noviembre', 'LIMA', 'SMP', 'San Martin de Porres.', '2023-05-11', '2023-05-11', 'Mario Pilares', 1, 'Politraumatizado, con estado crítico.', 'Politraumatizado', 4000, 'Leve', 3000, 12000, '2023-12-01', 204, 'Transigido', 'CERRADO', 'RVC'),
('1001041730', 2023, 'Noviembre', 'LIMA', 'Chacarrilla', null, '2023-11-05', '2023-11-05', 'OU', 3, 'Politraumatismo, Policontuso y Politraumatismo, Trauma Muñeca', 'Politraumatizado', 12000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001041916', 2023, 'Noviembre', 'LIMA', 'LIMA', 'Petit Thouars.', '2023-06-11', '2023-06-11', 'Pierina Ugaz', 1, 'Policontuso, fractura expuesta de índice derecho.', 'Policontuso', 1725, 'Grave', 15000, 28900, '2023-12-14', 186, 'Transigido', 'CERRADO', 'RVC'),
('1001042285', 2023, 'Noviembre', 'LIMA', 'La Planicie', null, '2023-11-06', '2023-11-06', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-11-07', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001044187', 2023, 'Noviembre', 'LIMA', 'Sagitario', null, '2023-11-10', '2023-11-10', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-11-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001044404', 2023, 'Noviembre', 'LIMA', 'Monterrico', null, '2023-11-11', '2023-11-11', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001059835', 2023, 'Diciembre', 'LIMA', 'SMP.', 'SMP.', '2023-12-16', '2023-12-16', 'Richard Rodriguez', 1, 'Traumatismo craneal cerrado y contusiones múltiples.', 'TEC Leve', 5750, 'Leve', null, 8650, '2026-06-03', 900, 'Archivado', 'CERRADO', 'RVC'),
('1001044722', 2023, 'Noviembre', 'LIMA', 'SMP.', 'SMP.', '2023-12-11', '2023-12-11', 'Richard Rodriguez', 1, 'Refiere policontuso.', 'Policontuso', 1725, 'Leve', 0, 20000, '2024-08-02', 235, 'Transigido', 'CERRADO', 'RVC'),
('1001044814', 2023, 'Noviembre', 'LIMA', 'Nueva Esperanza', null, '2023-11-11', '2023-11-11', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, '2023-11-12', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001044819', 2023, 'Noviembre', 'CALLAO', 'CALLAO', 'Ingunza', '2023-11-11', '2023-11-11', 'Richard Rodriguez', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 250, 9750, '2023-11-13', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001045426', 2023, 'Noviembre', 'LIMA', 'San Antonio', null, '2023-11-14', '2023-11-14', 'DS', 1, 'Esguince de tobillo', 'Esguince', 2300, 'Leve', 700, 4300, '2023-11-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001045589', 2023, 'Noviembre', 'LIMA', 'Miraflores', null, '2023-11-14', '2023-11-14', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001045676', 2023, 'Noviembre', 'LIMA', 'Santa Felicia', null, '2023-11-14', '2023-11-14', 'JD', 1, 'TEC Grave / Fractura de Muñeca y de Pierna', 'TEC Grave', 23000, 'Grave', 9000, null, '2023-12-04', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1001045677', 2023, 'Noviembre', 'LIMA', 'Miraflores', null, '2023-11-14', '2023-11-14', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '2023-11-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001046583', 2023, 'Noviembre', 'CALLAO', 'CALLAO', 'Juan Ingunza Valdivia.', '2023-11-16', '2023-11-16', 'Mario Pilares', 1, 'Herida cortante en cabeza.', 'Policontuso', 1725, 'Leve', 400, 9600, '2023-11-17', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001046606', 2023, 'Noviembre', 'LIMA', 'San Antonio', null, '2023-11-16', '2023-11-16', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, '2023-11-17', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001046935', 2023, 'Noviembre', 'CALLAO', 'CALLAO', 'Playa Rímac.', '2023-11-17', '2023-11-17', 'Pierina Ugaz', 1, 'Policontuso TEC.', 'TEC Leve', 5750, 'Leve', 1950, 4070, '2024-03-22', 126, 'Transigido', 'CERRADO', 'RVC'),
('1001047083', 2023, 'Noviembre', 'LIMA', 'Jose Galvez', null, '2023-11-17', '2023-11-17', 'GC', 1, 'Politraumatizado y fractura de tabique', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001047518', 2023, 'Noviembre', 'LIMA', 'SURCO', 'Salamanca.', '2023-11-19', '2023-11-19', 'Richard Rodriguez', 1, 'Refiere policontuso.', 'Policontuso', 1725, 'Leve', null, 5000, '2023-11-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001047576', 2023, 'Noviembre', 'LIMA', 'Barranco', null, '2023-11-19', '2023-11-19', 'DS', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 0, 20000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001048042', 2023, 'Noviembre', 'LIMA', 'Miraflores', null, '2023-11-20', '2023-11-20', 'JD', 1, 'Fracturas de Dedos de la Mano / Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001048348', 2023, 'Noviembre', 'LIMA', 'Villa', null, '2023-11-21', '2023-11-21', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 300, 4700, '2023-11-21', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001048507', 2023, 'Noviembre', 'LIMA', 'Lince', null, '2023-11-21', '2023-11-21', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 2000, '2023-11-24', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001048588', 2023, 'Noviembre', 'LIMA', 'Magdalena', null, '2023-11-22', '2023-11-22', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001048711', 2023, 'Noviembre', 'LIMA', 'Santa Felicia', null, '2023-11-22', '2023-11-22', 'OU', 1, 'Politraumatismo, Trauma Tobillo', 'Politraumatizado', 4000, 'Leve', 200, 4800, '2023-11-22', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001048716', 2023, 'Noviembre', 'LIMA', 'Magdalena', null, '2023-11-22', '2023-11-22', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001049103', 2023, 'Noviembre', 'LIMA', 'EL AGUSTINO', 'Santoyo.', '2023-11-22', '2023-11-22', 'Mario Pilares', 1, 'Policontuso, contusión en la cara, anterior tórax.', 'Policontuso', 1725, 'Leve', 1000, 14000, '2023-12-04', 12, 'Transigido', 'CERRADO', 'RVC'),
('1001049634', 2023, 'Noviembre', 'LIMA', 'Magdalena', null, '2023-11-23', '2023-11-23', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1270, 3730, '2023-11-29', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001049726', 2023, 'Noviembre', 'LIMA', 'Miraflores', null, '2023-11-23', '2023-11-23', 'GC', 3, 'Policontusos', 'Policontuso', 5175, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001050034', 2023, 'Noviembre', 'LIMA', 'Cieneguilla', null, '2023-11-24', '2023-11-24', 'JD', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 55000, null, '2024-02-15', 83, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001050268', 2023, 'Noviembre', 'LIMA', 'Miraflores', null, '2023-11-25', '2023-11-25', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001050336', 2023, 'Noviembre', 'LIMA', 'Santa Felicia', null, '2023-11-25', '2023-11-25', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '2023-11-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001050342', 2023, 'Noviembre', 'LIMA', 'Surco', null, '2023-11-25', '2023-11-25', 'OU', 1, 'Fractura Tobillo, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001051077', 2023, 'Noviembre', 'LIMA', 'SMP', 'Inpendencia', '2023-11-27', '2023-11-27', 'Mario Pilares', 1, 'Traumatismo superficial múltiples, traumatismo intracraneal y fractura de radio en extremidad superior derecha, quedando en observación para otros exámenes.', 'Fractura de radio y cúbito', 17250, 'Grave', 3500, 6660, '2023-12-29', 32, 'Transigido', 'CERRADO', 'RVC'),
('1001051105', 2023, 'Noviembre', 'LIMA', 'SMP', 'SMP.', '2023-11-27', '2023-11-27', 'Pierina Ugaz', 1, 'Contusión en el brazo izquierdo y dolor en la columna.', 'Policontuso', 1725, 'Grave', 7250, 1392.45, '2024-01-26', 60, 'Transigido', 'CERRADO', 'RVC'),
('1001051791', 2023, 'Noviembre', 'LIMA', 'ATE', 'Huaycan.', '2023-11-29', '2023-11-29', 'Pierina Ugaz', 4, 'Policontuso, fractura de mano derecha, descarte de T.E.C. / Policontuso, herida en scalp, descarte de T.E.C. /  Policontuso, herida de cabeza, descarte de T.E.C leve, descartar fractura de cráneo. / Policontuso, descarte de T.E.C leve.', 'Policontuso', 6900, 'Grave', 37550, 15493.22, '2025-03-05', 462, 'Transigido', 'CERRADO', 'RVC'),
('1001051905', 2023, 'Noviembre', 'LIMA', 'RIMAC', 'El Manzano.', '2023-11-29', '2023-11-28', 'Pierina Ugaz', 1, 'Policontuso con descarte de fractura en el codo izquierdo, quedando en observación.', 'Policontuso', 1725, 'Leve', 2000, 3000, '2023-11-30', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001051919', 2023, 'Noviembre', 'LIMA', 'ATE', 'Ate.', '2023-11-29', '2023-11-29', 'Pierina Ugaz', 1, 'Policontuso, por descartar luxación del hombro izquierdo, quedando en observación.', 'Torcedura', 3450, 'Leve', 1700, -209.93, '2024-02-14', 77, 'Transigido', 'CERRADO', 'RVC'),
('1001052381', 2023, 'Noviembre', 'LIMA', 'LA VICTORIA', 'La Victoria.', '2023-11-30', '2023-11-30', 'Mario Pilares', 3, 'Contusión de hombro y de brazo izquierdo. /  Traumatismo policontuso. / Traumatismo policontuso.', 'Policontuso', 5175, 'Leve', 2000, 28000, '2023-12-01', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001052427', 2023, 'Noviembre', 'LIMA', 'SAN MIGUEL', 'San Miguel.', '2023-11-30', '2023-11-30', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001052444', 2023, 'Noviembre', 'CALLAO', 'VENTANILLA', 'Ventanilla.', '2023-11-30', '2023-11-30', 'Richard Rodriguez', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, '2023-12-01', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001052577', 2023, 'Diciembre', 'LIMA', 'Magdalena', null, '2023-12-01', '2023-12-01', 'JD', 1, 'Esguince Tobillo Derecho / Politraumatizada', 'Politraumatizado', 4000, 'Leve', 300, 4700, '2023-12-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001052695', 2023, 'Noviembre', 'LIMA', 'COMAS', 'Santa Luzmila.', '2023-01-12', '2023-01-12', 'Pierina Ugaz', 1, 'Politraumatizado, quedando internada.', 'Politraumatizado', 4000, 'Grave', 7000, 3910, '2023-01-28', 16, 'Transigido', 'CERRADO', 'RVC'),
('1001052794', 2023, 'Diciembre', 'LIMA', 'Chacarrilla', null, '2023-12-01', '2023-12-01', 'OU', 1, 'Fractura Huesos Nariz, Politraumatismo', 'Politraumatizado', 4000, 'Grave', 13500, 16500, '2023-12-27', 26, 'Transigido', 'CERRADO', 'Abeo'),
('1001053291', 2023, 'Diciembre', 'LIMA', 'Surco', null, '2023-12-02', '2023-12-02', 'OU', 1, 'Fractura Costillas, Politraumatismo', 'Politraumatizado', 4000, 'Grave', 10000, 20000, '2023-12-05', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001053528', 2023, 'Diciembre', 'LIMA', 'SMP', 'Alfonso Ugarte.', '2023-03-12', '2023-03-12', 'Richard Rodriguez', 1, 'Contusión de cabeza y policontuso quedando en observación.', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001053583', 2023, 'Diciembre', 'LIMA', 'San Borja', null, '2023-12-03', '2023-12-03', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 600, 4400, '2023-12-03', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001054043', 2023, 'Diciembre', 'LIMA', 'La Planicie', null, '2023-12-04', '2023-12-04', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001054072', 2023, 'Diciembre', 'LIMA', 'SAN MIGUEL', 'Maranga', '2023-04-12', '2023-04-12', 'Richard Rodriguez', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 200, 4800, '2023-12-04', 236, 'Transigido', 'CERRADO', 'RVC'),
('1001054348', 2023, 'Diciembre', 'LIMA', 'CERCADO DE LIMA', 'Alfonso Ugarte.', '2023-05-12', '2023-05-12', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 2150, 4728.16, '2024-08-07', 453, 'Transigido', 'CERRADO', 'RVC'),
('1001054892', 2023, 'Diciembre', 'LIMA', 'JESÚS MARIA', 'Jesús María', '2023-06-12', '2023-06-12', 'Mario Pilares', 2, 'Policontuso, contusión de oído derecho y cervical, síndrome latigazo. /Trauma abdominal cerrado.', 'Politraumatizado', 8000, 'Grave', null, 15000, '2024-01-03', 205, 'Transigido', 'CERRADO', 'RVC'),
('1001054969', 2023, 'Diciembre', 'LIMA', 'RÍMAC', 'Rímac.', '2023-06-12', '2023-06-12', 'Richard Rodriguez', 1, 'Trauma Abdominal, politraumatizado, quedando en observación.', 'Politraumatizado', 4000, 'Leve', null, 15000, '2024-03-01', 263, 'Transigido', 'CERRADO', 'RVC'),
('1001054983', 2023, 'Diciembre', 'LIMA', 'San Juan de Miraflores', null, '2023-12-06', '2023-12-06', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001055016', 2023, 'Diciembre', 'LIMA', 'Monterrico', null, '2023-12-06', '2023-12-06', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2400, 2600, '2024-12-07', 367, 'Transigido', 'CERRADO', 'Abeo'),
('1001055949', 2024, 'Marzo', 'ICA', 'LOS AQUIJES', null, '2024-03-01', '2023-12-08', 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, '1970-01-01', -19783, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001055957', 2023, 'Diciembre', 'LIMA', 'SAN MIGUEL', 'Maranga.', '2023-08-12', '2023-08-12', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 12770, '2025-01-20', 527, 'Transigido', 'CERRADO', 'RVC'),
('1001056204', 2023, 'Diciembre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro.', '2023-08-12', '2023-11-26', 'Pierina Ugaz', 1, 'Politraumatizado, fractura expuesta de fémur.', 'Fractura de fémur', 23000, 'Grave', 21000, 9260, '2024-08-05', 359, 'Transigido', 'CERRADO', 'RVC'),
('1001056534', 2023, 'Diciembre', 'LIMA', 'LIMA', 'Petit Thouars', '2023-09-12', '2023-09-12', 'Richard Rodriguez', 2, 'Policontuso descarte fractura pierna derecha y trauma abdominal cerrado./ Policontuso y contusión en mano y codo derecho.', 'Fractura Pierna', 34500, 'Grave', null, 15000, '2025-08-22', 710, 'Transigido', 'CERRADO', 'RVC'),
('1001056830', 2023, 'Diciembre', 'CALLAO', 'CALLAO', 'Bocanegra', '2023-08-12', '2023-08-12', 'Pierina Ugaz', 1, 'Policontuso espalda y pierna izquierda.', 'Policontuso', 1725, 'Leve', null, 5000, '2023-12-09', 119, 'Transigido', 'CERRADO', 'RVC'),
('1001056858', 2023, 'Diciembre', 'LIMA', 'Monterrico', null, '2023-12-11', '2023-12-11', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001057245', 2023, 'Diciembre', 'LIMA', 'HUACHIPA', 'Huachipa.', '2023-11-12', '2023-11-12', 'Pierina Ugaz', 1, 'Fractura en el brazo.', 'Fractura de humero', 23000, 'Grave', 11000, 13624.53, '2024-03-08', 117, 'Transigido', 'CERRADO', 'RVC'),
('1001057314', 2023, 'Diciembre', 'LIMA', 'Orrantia', null, '2023-12-11', '2023-12-11', 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 750, 4250, '2024-12-12', 367, 'Transigido', 'CERRADO', 'Abeo'),
('1001057356', 2023, 'Diciembre', 'CALLAO', 'CALLAO', 'Ingunza.                                      Sin denuncia policial.', '2023-11-12', '2023-11-12', 'Pierina Ugaz', 2, 'Refiere policontuso. / Refiere policontuso.', 'Policontuso', 3450, 'Leve', null, 5000, '2023-12-19', 37, 'Transigido', 'CERRADO', 'RVC'),
('1001057480', 2023, 'Diciembre', 'LIMA', 'Barranco', null, '2023-12-12', '2023-12-12', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001057598', 2023, 'Diciembre', 'LIMA', 'Chacarrilla', null, '2023-12-12', '2023-12-12', 'JD', 1, 'Fractura de Muñeca', 'Fractura de muñeca', 17250, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001057937', 2023, 'Diciembre', 'LIMA', 'JESÚS MARIA', 'esús María.', '2023-11-12', '2023-11-12', 'Pierina Ugaz', 1, 'Politraumatizado y quedando en observación.', 'Politraumatizado', 4000, 'Grave', 30000, 23035, '2024-06-21', 222, 'Transigido', 'CERRADO', 'RVC'),
('1001058295', 2023, 'Diciembre', 'LIMA', 'San Luis', null, '2023-12-13', '2023-12-13', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 2000, 3000, '2023-12-14', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001059137', 2023, 'Diciembre', 'LIMA', 'Magdalena', null, '2023-12-15', '2023-12-15', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2023-12-16', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001059766', 2023, 'Diciembre', 'LIMA', 'Miraflores', null, '2023-12-15', '2023-12-15', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001044675', 2023, 'Noviembre', 'LIMA', 'SMP', 'Barboncito.', '2023-12-11', '2023-12-11', 'Mario Pilares', 1, 'Politraumatismo.', 'Politraumatizado', 4000, 'Leve', null, 10000, '2026-06-03', 905, 'Archivado', 'CERRADO', 'RVC'),
('1001060371', 2023, 'Diciembre', 'LIMA', 'ATE', 'Salamanca.', '2023-12-17', '2023-12-17', 'Richard Rodriguez', 2, 'Contusiones múltiples./ Fractura conduxación de la muñeca izquierda.', 'Fractura de muñeca', 34500, 'Grave', null, 30000, '2024-05-23', 158, 'Transigido', 'CERRADO', 'RVC'),
('1001040144', 2023, 'Noviembre', 'LIMA', 'COMAS', 'Santa Luzmila.', '2023-01-11', '2023-01-11', 'Pierina Ugaz', 7, 'Policontuso./  Policontuso./Contusión de hombro. TEC./ Contusión del hombro y brazo izquierdo./ Traumatismo superficiales de la cabeza./ Traumatismo de cráneo.', 'TEC Leve', 40250, 'Grave', null, 40000, '2023-10-26', 288, 'Archivado', 'CERRADO', 'RVC'),
('1001060734', 2023, 'Diciembre', 'LIMA', 'Orrantia', null, '2023-12-18', '2023-12-18', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-12-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001060971', 2023, 'Diciembre', 'CALLAO', 'CALLAO', 'Oquendo.', '2023-12-18', '2023-10-18', 'Pierina Ugaz', 1, 'Muerte en trayecto al hospital.', 'Fallecido', 65000, 'Grave', 0, 5000, '2025-10-15', 667, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001061118', 2023, 'Diciembre', 'LIMA', 'Monterrico', null, '2023-12-19', '2023-12-19', 'JD', 1, 'Politraumatizado / Corte en Dedo de Mano', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001061365', 2023, 'Diciembre', 'LIMA', 'LIMA', 'Alfonso Ugarte.', '2023-12-18', '2023-12-18', 'Richard Rodriguez', 1, 'Traumatismo encéfalo craneano, contusión frontal, fractura del arco cigomático derecho, fractura maxilar            inferior, policontuso, queda hospitalizado en UCI.', 'Fractura de mandíbula', 17250, 'Grave', null, 21758, '2024-07-18', 213, 'Transigido', 'CERRADO', 'RVC'),
('1001061671', 2023, 'Diciembre', 'LIMA', 'JESÚS MARIA', 'Jesús María.', '2023-12-20', '2023-12-18', 'Pierina Ugaz', 1, 'Traumatismo encéfalo craneano y fractura costal, quedando en observación.', 'TEC Leve', 5750, 'Leve', 2500, 1450, '2024-11-19', 335, 'Transigido', 'CERRADO', 'RVC'),
('1001061834', 2023, 'Diciembre', 'LIMA', 'Miraflores', null, '2023-12-20', '2023-12-20', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, '2024-12-20', 366, 'Transigido', 'CERRADO', 'Abeo'),
('1001062200', 2023, 'Diciembre', 'LIMA', 'RIMAC', 'El Manzano.', '2023-12-21', '2023-12-21', 'Pierina Ugaz', 1, 'Esguinces y torcedura de la columna cervical, quedando en observación.', 'Cervicalgia', 2300, 'Leve', 6000, 824, '2024-01-22', 32, 'Transigido', 'CERRADO', 'RVC'),
('1001062531', 2023, 'Diciembre', 'LIMA', 'Sagitario', null, '2023-12-21', '2023-12-21', 'DS', 4, 'Cervicalgia operación de columna; Politraumatizada Paciento oncologica, Policontusos', 'Politraumatizado', 16000, 'Grave', 38000, 2000, '2024-03-14', 84, 'Transigido', 'CERRADO', 'Abeo'),
('1001063525', 2023, 'Diciembre', 'LIMA', 'San Antonio', null, '2023-12-23', '2023-12-23', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-12-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001063783', 2023, 'Diciembre', 'LIMA', 'Miraflores', null, '2023-12-25', '2023-12-25', 'JD', 2, 'Trauma Abdominal Cerrado/Herida en Labio Superior/Politraumatizado; TEC Leve / Poitraumatizada', 'TEC Leve', 11500, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001063829', 2023, 'Diciembre', 'LIMA', 'COMAS', 'Santa Luzmila.', '2023-12-25', '2023-12-25', 'Pierina Ugaz', 1, 'Policontusa, descarte fractura de diáfisis humeral izquierdo, queda en observación.', 'Policontuso', 1725, 'Leve', null, 1500, '2023-12-25', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001064147', 2023, 'Diciembre', 'LIMA', 'San Borja', null, '2023-12-23', '2023-12-23', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001064304', 2023, 'Diciembre', 'LIMA', 'Laderas de Villa', null, '2023-12-26', '2023-12-26', 'OU', 1, 'NN', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001064458', 2023, 'Diciembre', 'LIMA', 'Mateo Pumacahua', null, '2023-12-26', '2023-12-26', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2085, 2915, '2024-01-03', 8, 'Transigido', 'CERRADO', 'Abeo'),
('10001162992', 2024, 'Julio', 'LIMA', 'San Luis', null, '2024-07-12', '2024-07-12', 'GC', 1, 'Gabriel Andres Reyes Chavez', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001036368', 2023, 'Octubre', 'LIMA', 'SJL', 'La Huayrona.', '2023-10-23', '2023-10-23', 'Mario Pilares', 1, 'Herida en la cabeza, fractura de cráneo en presuntivo', 'Policontuso', 1725, 'Leve', 1000, 14000, '2026-06-03', 954, 'Transigido', 'CERRADO', 'RVC'),
('1001065811', 2023, 'Diciembre', 'LIMA', 'Curva de Villa', null, '2023-12-29', '2023-12-29', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1001066515', 2023, 'Diciembre', 'LIMA', 'CARABAYLLO', 'San Pedro de Carabayllo.', '2023-12-30', '2023-12-30', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito, en el hombro derecho.', 'Policontuso', 1725, 'Grave', 6100, 2360, '2024-08-07', 221, 'Transigido', 'CERRADO', 'RVC'),
('1001066900', 2024, 'Enero', 'LIMA', 'Surco', null, '2024-01-01', '2024-01-01', 'GC', 1, 'Christian Manuel Grabiel Anampa (Tec Moderado)', 'TEC Moderado', 11500, 'Grave', 0, 0, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001067012', 2024, 'Enero', 'LIMA', 'San Borja', null, '2024-01-02', '2024-01-02', 'DS', 1, 'Virginia Vilchez Manzo (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001067579', 2024, 'Enero', 'LIMA', 'Surquillo', null, '2024-01-03', '2024-01-03', 'DS', 1, 'Dkarla Susana Ninaquispe Rodriguez (TEC Moderado)', 'TEC Moderado', 11500, 'Grave', 5000, 5000, '2024-01-05', 2, 'Transigido', 'CERRADO', 'Abeo'),
('100106777', 2024, 'Enero', 'Callao', 'Pachacútec', 'Puente Piedra', '2024-01-03', '2024-01-03', 'Richard Rodriguez', 1, 'Policontuso en el hombro derecho.', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-01-03', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001068107', 2024, 'Enero', 'Callao', 'Callao', 'Bocanegra', '2024-01-04', '2024-01-04', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2800, 12123.41, '2024-10-15', 285, 'Transigido', 'CERRADO', 'RVC'),
('1001068414', 2024, 'Enero', 'LIMA', 'Cieneguilla', null, '2024-01-04', '2024-01-04', 'JD', 1, 'Jamel Rojas Llimpe (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001068454', 2024, 'Enero', 'LIMA', 'San Antonio', null, '2024-01-04', '2024-01-04', 'OU', 1, 'Juan José Núñez Trigueros (Atricción Esguince y Fisura Pie Derecho, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1710, 3290, '2024-01-05', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001068632', 2024, 'Enero', 'LIMA', 'San Isidro', null, '2024-01-05', '2024-01-05', 'OU', 1, 'Gustavo Adolfo Moreno Borja (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1650, 3350, '2024-01-05', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001068714', 2024, 'Enero', 'LIMA', 'Curva', null, '2024-01-05', '2024-01-05', 'GC', 1, 'Antony Alexander Alfonso Paz Mayuri (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-01-05', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001068965', 2024, 'Enero', 'Lima', 'SMP', 'San Martín de Porres', '2024-01-05', '2024-01-05', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-02-19', 45, 'Transigido', 'CERRADO', 'RVC'),
('1001069670', 2024, 'Enero', 'LIMA', 'Lurin', null, '2024-01-08', '2024-01-08', 'DS', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 0, 30000, '1970-01-01', -19730, 'Otros', 'CERRADO', 'Abeo'),
('1001069726', 2024, 'Enero', 'LIMA', 'San Isidro', null, '2024-01-08', '2024-01-08', 'GC', 1, 'Ricardo Julio López Vega (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-01-08', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001070098', 2024, 'Enero', 'LIMA', 'Surco', null, '2024-01-08', '2024-01-08', 'DS', 1, 'David Allpos Huamani (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-01-08', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001071681', 2024, 'Enero', 'LIMA', 'Miraflores', null, '2024-01-11', '2024-01-11', 'OU', 1, 'Oscar David Arriechi Mendoza (Esguince Pie Derecho, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2024-01-11', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001071690', 2024, 'Enero', 'ICA', 'SANTIAGO', null, '2024-01-15', '2024-12-23', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19737, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001071839', 2024, 'Enero', 'Lima', 'La Victoria', 'Apolo', '2024-01-11', '2024-01-11', 'Mario Pilares', 1, 'Policontuso Leve.', 'Policontuso', 1725, 'Leve', 300, 9700, '2024-01-13', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001071917', 2024, 'Enero', 'Lima', 'San Miguel', 'Maranga', '2024-01-11', '2024-01-11', 'Richard Rodriguez', 2, ': Policontuso, 



 

- Ocupante tercero: Khamila Arias Delboy. (24)

- Diagnostico: Policontuso, quedando en observación.

- Atendido en la clínica San Gabriel.', 'Policontuso', 3450, 'Leve', 6000, 4000, '2024-08-16', 218, 'Transigido', 'CERRADO', 'RVC'),
('1001072036', 2024, 'Enero', 'LIMA', 'Miraflores', null, '2024-01-12', '2024-01-12', 'GC', 1, 'Jonhy Martin Laynez Garcia (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 4784, 216, '2024-02-14', 33, 'Transigido', 'CERRADO', 'Abeo'),
('1001072262', 2024, 'Enero', 'Lima', 'Comas', 'Santa Luzmila', '2024-01-12', '2024-01-12', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-01-30', 18, 'Transigido', 'CERRADO', 'RVC'),
('1001072309', 2024, 'Enero', 'HUAMANGA', 'JESUS NAZARENO', null, '2024-01-13', '2024-01-12', 'JOEL HUAHUACONDORI', 5, 'Policontuso', 'Policontuso', 8625, 'Grave', null, 12917.35, '1970-01-01', -19735, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001072852', 2024, 'Enero', 'Lima', 'Lima', 'San Andrés', '2024-01-13', '2024-01-13', 'Richard Rodriguez', 1, 'Contusión de glúteo izquierdo.', 'Policontuso', 1725, 'Leve', 700, 4300, '2024-01-15', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001073499', 2024, 'Enero', 'LIMA', 'Lurin', null, '2024-01-15', '2024-01-15', 'DS', 1, 'NN (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-01-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001073806', 2024, 'Enero', 'LIMA', 'Monterrico', null, '2024-01-16', '2024-01-16', 'OU', 1, 'Jesus Benjamín Cardenas Sanchez Díaz (Cervicalgia)', 'Cervicalgia', 2300, 'Leve', null, null, '2024-04-12', 87, 'Transigido', 'CERRADO', 'Abeo'),
('1001074051', 2024, 'Enero', 'LIMA', 'Surquillo', null, '2024-01-16', '2024-01-16', 'OU', 1, 'Julio Francisco Gonzáles Ríos (Fractura Tibia, Politraumatismo)', 'Politraumatizado', 4000, 'Grave', 12000, 18000, '2024-01-24', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1001074860', 2024, 'Enero', 'Callao', 'Callao', 'Sarita Colonia', '2024-01-18', '2024-01-18', 'Pierina Ugaz', 2, 'Policontuso, rostro y brazo (heridas).



 

- Ocupante Tercero: Mercedes Avecilla Solís. (74)

- Diagnostico: Policontuso por accidente de tránsito.

- Atendido en la clínica San Gabriel.', 'Policontuso y corte', 4600, 'Leve', null, 15000, '1970-01-01', -19740, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001074944', 2024, 'Enero', 'TAMBOPATA', 'INAMBARI', null, '2024-01-19', '2024-01-18', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19741, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001075202', 2024, 'Enero', 'AREQUIPA', 'YURA', null, '2024-01-25', '2024-01-18', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19747, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001075338', 2024, 'Enero', 'Lima', 'SMP', 'Sol de Oro', '2024-01-19', '2024-01-19', 'Pierina Ugaz', 1, 'Se queda en la clínica para su atención.', 'Policontuso', 1725, 'Leve', 850, 14010, '2025-03-05', 411, 'Transigido', 'CERRADO', 'RVC'),
('1001075720', 2024, 'Enero', 'Lima', 'S.J.L', 'Canto Rey', '2024-01-19', '2024-01-19', 'Mario Pilares', 1, 'Herida abierta en el tobillo derecho, contusión en la rodilla', 'Policontuso', 1725, 'Leve', 500, 9500, '2024-01-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001075752', 2024, 'Enero', 'Lima', 'Lima', 'Alfonso Ugarte', '2024-01-19', '2024-01-19', 'Pierina Ugaz', 2, '- Contusiones costal y descarte de cuerpos extraños en ambos ojos
- Policontuso y herida en la pierna izquierda,', 'Policontuso y corte', 4600, 'Leve', 0, 25000, '2025-03-21', 427, 'Transigido', 'CERRADO', 'RVC'),
('1001075846', 2024, 'Enero', 'LIMA', 'Miraflores', null, '2024-01-19', '2024-01-19', 'JD', 1, 'Luzmila Mercedes Buendía García (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001075994', 2025, 'Octubre', 'LIMA', 'LIMA', 'Las Praderas', '2025-10-07', null, 'GC', 1, 'Ricardo Jesus Balzcazar Jesus (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001076160', 2024, 'Enero', 'Lima', 'Cercado de Lima', 'Monserrate', '2024-01-20', '2024-01-20', 'Richard Rodriguez', 1, 'Politraumatizado,', 'Politraumatizado', 4000, 'Leve', 2300, 2409.13, '2024-03-22', 62, 'Transigido', 'CERRADO', 'RVC'),
('1001076557', 2024, 'Enero', 'LIMA', 'Miraflores', null, '2024-01-22', '2024-01-22', 'JD', 1, 'D´jango Daniel Ventura Chacón (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001076920', 2024, 'Enero', 'Lima', 'Los Olivos', 'Laura Caller.', '2024-01-22', '2024-01-22', 'Pierina Ugaz', 1, 'Latigazo cervical, policontuso', 'Policontuso', 1725, 'Leve', 500, 9500, '2024-01-23', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001077251', 2024, 'Enero', 'LIMA', 'Miraflores', null, '2024-01-23', '2024-01-23', 'OU', 1, 'Luis Angel Torres Camayo (Politraumatismo, Herida Cortante Rodilla)', 'Politraumatizado', 4000, 'Leve', 290, 4710, '2024-01-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001077523', 2024, 'Enero', 'LIMA', 'Sagitario', null, '2024-01-23', '2024-01-23', 'DS', 1, 'Johan Giovani Coronación Quispe (Herida Cortante en la pierna)', 'Policontuso', 1725, 'Leve', 3000, 2000, '2024-02-01', 9, 'Transigido', 'CERRADO', 'Abeo'),
('1001077759', 2024, 'Enero', 'CORONEL PORTILLO', 'PUCALLPA', null, '2024-01-23', '2024-01-23', 'JOEL HUAHUACONDORI', 1, 'Injerto de Piel (tamaños pequeños) + Policontuso', 'Policontuso', 1725, 'Leve', null, 7400, '1970-01-01', -19745, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001078034', 2024, 'Enero', 'LIMA', 'Monterrico', null, '2024-01-24', '2024-01-24', 'DS', 1, 'Moises Bartolomé Vilchez Cajamarca (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001078035', 2024, 'Enero', 'CERRO COLORADO', 'ZAMACOLA', null, '2024-01-24', '2024-01-24', 'RUTH HUAHUACONDORI', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, 1000, '1970-01-01', -19746, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001078296', 2023, 'Enero', 'Lima', 'San Miguel', 'Maranga.', '2023-01-24', '2023-01-24', 'Mario Pilares', 1, 'TEC leve, herida en cuero cabelludo y contusión codo derecho', 'TEC Leve', 5750, 'Leve', 1500, 3500, '2024-01-27', 368, 'Transigido', 'CERRADO', 'RVC'),
('1001078787', 2024, 'Enero', 'LIMA', 'San Isidro', null, '2024-01-25', '2024-01-25', 'JD', 1, 'Mabel de Lourdes Cárdenas Huamán (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-01-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001078826', 2024, 'Enero', 'Lima', 'Los Olivos', 'Sol de Oro.', '2024-01-25', '2024-01-25', 'Mario Pilares', 1, 'Sin diagnóstico, quedo internado en la clínica.', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-03-25', 60, 'Rechazado', 'CERRADO', 'RVC'),
('1001079401', 2024, 'Enero', 'LIMA', 'Miraflores', null, '2024-01-26', '2024-01-26', 'OU', 1, 'Gianmarco Salinas Vento (Politraumatismo, Luxación y Rotura Ligamento de Rodilla)', 'Politraumatizado', 4000, 'Grave', 44600, -14600, '2024-03-14', 48, 'Transigido', 'CERRADO', 'Abeo'),
('1001079433', 2024, 'Enero', 'Callao', 'Callao', 'Callao.', '2024-01-26', '2024-01-26', 'Pierina Ugaz', 1, 'contusión en región costal y cervico dorsal izquierdos', 'Policontuso', 1725, 'Leve', 3900, 1662.47, '2024-09-12', 230, 'Transigido', 'CERRADO', 'RVC'),
('1001079625', 2024, 'Enero', 'Callao', 'La Perla', 'la Perla', '2024-01-27', '2024-01-27', 'Pilar Dextre', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 9000, 100, '2024-11-26', 304, 'Transigido', 'CERRADO', 'RVC'),
('1001079852', 2024, 'Enero', 'LIMA', 'Laderas de Villa', null, '2024-01-27', '2024-01-27', 'OU', 1, 'Thaily De La Cruz De La Cruz (Aparente Politraumatismo, no habría pasado atención médica)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001079991', 2024, 'Enero', 'LIMA', 'Lurin', null, '2024-01-27', '2024-01-27', 'GC', 1, 'Rene Anderson Requejo Fernandez (Multiples fracturas)', 'Policontuso', 1725, 'Leve', 0, null, '2025-03-26', 424, 'Archivado', 'CERRADO', 'Abeo'),
('1001080155', 2024, 'Enero', 'PADRE ABAD', 'PADRE ABAD', null, '2024-01-28', '2024-01-27', 'JOEL HUAHUACONDORI', 2, 'Politraumatizado', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001080344', 2024, 'Enero', 'LIMA', 'Chacarrilla', null, '2024-01-29', '2024-01-29', 'GC', 1, 'Joel Angulo Gabambo (Fractura de mano y brazo)', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-04-13', 75, 'Archivado', 'CERRADO', 'Abeo'),
('1001080731', 2024, 'Enero', 'Lima', 'Lima', 'Monserrate.', '2024-01-29', '2024-01-29', 'Pilar Dextre', 1, '-  Policontuso, corte en la cabeza', 'Policontuso y corte', 2300, 'Leve', 0, 10000, '2024-03-12', 43, 'Transigido', 'CERRADO', 'RVC'),
('1001080736', 2024, 'Enero', 'Callao', 'Ventanilla', 'Ventanilla.', '2024-01-29', '2024-01-29', 'Pierina Ugaz', 6, '- 1.- Policontuso por accidente de tránsito, contricción dorso lumbar.

- 2.-  Policontuso por accidente de tránsito, contusión de brazo izquierdo.

- 3. Policontuso por accidente de tránsito, contusión de rodilla bilateral, descarte de fractura nasal.
-
- 4. Policontuso por accidente de tránsito, descarte de fractura costal izquierdo, contusión de cabeza.

- 5.-  Policontuso por accidente de tránsito, contusión ramumbar, descarte de fractura del tobillo izquierdo.

- 6.- Policontuso por accidente de tránsito, contusión cervical, contusión en cráneo, contusión en rodilla derecha.', 'Fractura de columna', 120000, 'Grave', null, 10938, '1970-01-01', -19751, 'En Negociación', 'ABIERTO', 'RVC'),
('1001080820', 2024, 'Enero', 'LIMA', 'Monterrico', null, '2024-01-30', '2024-01-30', 'GC', 1, 'Yoselyn Maryluz Arenas Tunque (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 700, 2300, '2024-01-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001080890', 2024, 'Enero', 'Callao', 'Carmen de La Legua', 'Carmen de La Legua', '2024-01-30', '2024-01-30', 'Pierina Ugaz', 1, 'Diagnostico: No refiere', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-02-21', 22, 'Rechazado', 'CERRADO', 'RVC'),
('1001080929', 2024, 'Enero', 'LIMA', 'San Isidro', null, '2024-01-30', '2024-01-30', 'DS', 1, 'Henry Alejandro Andrade Quiaro (Fractura de Tibia y Perone)', 'Fractura de tibia', 17250, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001081022', 2024, 'Enero', 'LIMA', 'San Isidro', null, '2024-01-29', '2024-01-29', 'OU', 2, 'Jorge Luis Napa Vargas (Politraumatismo) y Roberto Carlos Verastegui Malca (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001081055', 2024, 'Enero', 'LIMA', 'Monterrico', null, '2024-01-30', '2024-01-30', 'JD', 1, 'Javier Ccama Guzmán (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2256.74, 2743.26, '2024-02-07', 8, 'Transigido', 'CERRADO', 'Abeo'),
('1001081451', 2024, 'Enero', 'LIMA', 'Orrantia', null, '2024-01-31', '2024-01-31', 'DS', 1, 'Nathaly Dayana Altamirano Gonzales (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2024-01-31', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001081591', 2024, 'Enero', 'ACOBAMBA', 'PAUCARA', null, '2024-01-31', null, 'JOEL HUAHUACONDORI', 1, 'Politraumatizado + Policontuso', 'Politraumatizado', 4000, 'Leve', null, 700, '1970-01-01', -19753, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001082021', 2024, 'Febrero', 'Lima', 'San Miguel', 'San Miguel.', '2024-02-01', '2024-02-01', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito, quedando en observación.', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-03-12', 40, 'Transigido', 'CERRADO', 'RVC'),
('10001178623', 2024, 'Agosto', 'LIMA', 'San Borja', null, '2024-08-17', '2024-08-17', 'DS', 1, 'Nancy Cecilia Menendez de Gonzales (Politraumatiazada)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001083045', 2024, 'Febrero', 'Lima', 'Jesús María', 'Jesús María', '2024-02-02', '2024-02-02', 'Pierina Ugaz', 2, 'Policontuso 
Policontuso', 'Policontuso', 3450, 'Leve', 0, 15000, '2025-02-28', 392, 'Transigido', 'CERRADO', 'RVC'),
('1001083603', 2024, 'Febrero', 'LIMA', 'Laderas de Villa', null, '2024-02-03', '2024-02-03', 'GC', 1, 'Emanuel José Carrasco Padilla (Fallecido)', 'Fallecido', 65000, 'Grave', 45000, -20000, '2024-08-17', 196, 'Transigido', 'CERRADO', 'Abeo'),
('1001083662', 2024, 'Febrero', 'LIMA', 'Miraflores', null, '2024-02-05', '2024-02-05', 'JD', 2, 'Benjamin Andrés Lozada Chira (Politraumatizado), Liliana Noelia Sabina López Berenguel (TEC Moderado / Politraumatizada)', 'TEC Moderado', 23000, 'Grave', 7736, 2264, '2024-02-22', 17, 'Transigido', 'CERRADO', 'Abeo'),
('1001084567', 2024, 'Febrero', 'HUANCAYO', 'SAN JERONIMO DE TUNAN', null, '2024-02-06', '2024-01-24', 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, 11000, '1970-01-01', -19759, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001085197', 2024, 'Febrero', 'LIMA', 'San Isidro', null, '2024-02-07', '2024-02-07', 'DS', 1, 'Oscar Elias Quispe Gomez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-02-07', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001086630', 2024, 'Febrero', 'Lima', 'Cercado de Lima', 'Petit Thouars', '2024-02-09', '2024-02-09', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 900, 9100, '2024-02-17', 8, 'Transigido', 'CERRADO', 'RVC'),
('1001087109', 2024, 'Febrero', 'LIMA', 'Chacarrilla', null, '2024-02-10', '2024-02-10', 'DS', 1, 'Danny Mamami (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-02-11', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001087261', 2024, 'Febrero', 'LIMA', 'Mateo Pumacahua', null, '2024-02-11', '2024-02-11', 'DS', 2, 'Andres Bermudez Guariguata (Policontuso) y Liz Mary Andreina Flores Jimenez (Policontusa)', 'Policontuso', 3450, 'Leve', 0, 3000, '2024-02-11', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001087362', 2024, 'Febrero', 'LIMA', 'Monterrico', null, '2024-02-12', '2024-02-12', 'DS', 1, 'Stefany del Pilar Escudero Diaz (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-04-29', 77, 'Transigido', 'CERRADO', 'Abeo'),
('1001087377', 2024, 'Febrero', 'Lima', 'Ate', 'Vitarte', '2024-02-10', '2024-02-10', 'Pierina Ugaz', 1, 'Traumatismos superficiales que afectan otras combinaciones de región del examinado.', 'Policontuso', 1725, 'Leve', 5600, 4012.64, '2024-11-06', 270, 'Transigido', 'CERRADO', 'RVC'),
('1001087759 / 176890', 2024, null, null, null, null, '2024-02-13', null, 'Emily', 2, 'Policontuso', 'Policontuso', 3450, 'Grave', 14000, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001087889', 2024, 'Febrero', 'CAJAMARCA', 'LA ENCAÑADA', null, '2024-02-14', '2024-02-12', 'JOEL HUAHUACONDORI', 2, 'Fallecido', 'Fallecido', 130000, 'Grave', null, 8510, '1970-01-01', -19767, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001087968 / 176808', 2024, null, null, null, null, '2024-02-13', null, 'Emily', 2, 'Politraumatizado', 'Politraumatizado', 8000, 'Grave', 18290, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001087992', 2024, 'Febrero', 'LIMA', 'San Isidro', null, '2024-02-13', '2024-02-13', 'JD', 1, 'José Miguel Pereda Alva (TEC Moderado / Politraumatizado)', 'TEC Moderado', 11500, 'Grave', 3800, 1200, '2024-03-16', 32, 'Transigido', 'CERRADO', 'Abeo'),
('1001088017', 2024, 'Febrero', 'LIMA', 'Orrantia', null, '2024-02-13', '2024-02-13', 'OU', 1, 'Jessica Paola Llanos Morales (Fractura Craneo, TEC, Politraumatismo)', 'Politraumatizado', 4000, 'Grave', 10000, 20000, '2024-05-07', 84, 'Transigido', 'CERRADO', 'Abeo'),
('1001088400', 2024, 'Febrero', 'Lima', 'La Victoria', 'La Victoria', '2024-02-13', '2024-02-13', 'Pierina Ugaz', 1, 'Traumatismo superficial múltiple.', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-02-14', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001088645', 2024, 'Febrero', 'LIMA', 'Lurin', null, '2024-02-13', '2024-02-13', 'GC', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001088650', 2024, 'Febrero', 'Lima', 'Lima', 'Mirones Altos', '2024-02-14', '2024-02-14', 'Pierina Ugaz', 1, 'Hemorragia Intracraneal y Policontuso por accidente de tránsito', 'Policontuso', 1725, 'Leve', 2000, 4214, '2024-10-25', 254, 'Transigido', 'CERRADO', 'RVC'),
('1001088656', 2024, 'Febrero', 'LIMA', 'La Planicie', null, '2024-02-14', '2024-02-14', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19767, 'Otros', 'CERRADO', 'Abeo'),
('1001185243', 2024, 'Septiembre', 'Lima', 'Ate.', 'Salamanca.', '2024-08-26', '2024-08-26', 'Maritza Nizama', 1, 'Traumatismo encéfalo craneano, fractura en miembro inferior derecho y mano', 'Policontuso', 1725, 'Leve', null, 35000, null, null, 'Asegurado No Paga Deducible', 'ABIERTO', 'RVC'),
('1001089107', 2024, 'Febrero', 'LIMA', 'Chacarrilla', null, '2024-02-14', '2024-02-14', 'DS', 1, 'Dayana Stina Jaramillo Bustamante (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19767, 'Transigido', 'CERRADO', 'Abeo'),
('1001089243', 2024, 'Febrero', 'LIMA', 'La Praderas', null, '2024-02-14', '2024-02-14', 'GC', 1, 'María Christina Burneo Guevara (Politraumatizada)', 'Politraumatizado', 4000, 'Grave', 8000, -3000, '2024-06-26', 133, 'Transigido', 'CERRADO', 'Abeo'),
('1001089461', 2024, 'Febrero', 'LIMA', 'San Isidro', null, '2024-02-15', '2024-02-15', 'GC', 1, 'Gianfranco Canepa Escobar (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-02-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001089499', 2024, 'Febrero', 'AREQUIPA', 'LA JOYA', null, '2024-02-25', '2024-01-02', 'RUTH HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', null, null, '1970-01-01', -19778, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001089859', 2024, 'Febrero', 'LIMA', 'Huaylas', null, '2024-02-15', '2024-02-15', 'DS', 1, 'Rafael Rivas Cordero (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-02-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001089910', 2024, 'Febrero', 'Lima', 'Lima', 'UV3', '2024-02-16', '2024-02-16', 'Pierina Ugaz', 2, '-1.- Policontuso. 
-2.- Esguinces y torceduras del tobillo.', 'Esguince', 4600, 'Leve', 3200, 7828, '2024-04-06', 50, 'Transigido', 'CERRADO', 'RVC'),
('1001090175', 2024, 'Febrero', 'LIMA', 'Chacarrilla', null, '2024-02-16', '2024-02-16', 'DS', 1, 'Ulises Oswaldo Chacarria Vasquez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-02-16', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001090255', 2024, 'Febrero', 'ANTA', 'CACHIMAYO', null, '2024-02-16', '2024-02-17', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 1500, null, null, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001090705', 2024, 'Abril', 'Lima', 'Cercado de Lima', 'UV Mirones.', '2024-02-18', '2024-02-18', 'Pierina Ugaz', 3, '1.-  Traumatismo en miembro inferior.  
 2.-  Policontuso, 
 3.- Traumatismo Múltiple', 'Politraumatizado', 12000, 'Grave', 0, 35000, '2024-08-02', 166, 'Transigido', 'CERRADO', 'RVC'),
('1001090811', 2024, 'Febrero', 'Lima', 'Jesús María', 'Jesús María', '2024-02-18', '2024-02-18', 'Maritza Nizama', 1, 'Herida en lado derecho de la cara.
-', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-02-28', 10, 'Transigido', 'CERRADO', 'RVC'),
('1000992226', 2023, 'Julio', 'LIMA', 'PUEBLO LIBRE', 'Comisaría de Pueblo Libre', '2023-07-10', '2023-07-10', 'Pierina Ugaz', 1, 'Contusión en rodilla derecha, herida cortante en rodilla derecha', 'Policontuso', 1725, 'Leve', 0, 15000, '2026-04-24', 1019, 'Transigido', 'CERRADO', 'RVC'),
('1001082422', 2024, 'Febrero', 'LIMA', 'Villa', null, '2024-02-01', '2024-02-01', 'DS', 1, 'No identificado (Fractura de Brazo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001091197', 2024, 'Febrero', 'Lima', 'San Miguel', 'San Miguel', '2024-02-19', '2024-02-19', 'Pierina Ugaz', 1, 'Refiere un dolor en el cuello', 'Cervicalgia', 2300, 'Leve', 3300, 3066, '2024-06-13', 115, 'Transigido', 'CERRADO', 'RVC'),
('1001091638', 2024, 'Febrero', 'LIMA', 'Huaylas', null, '2024-02-20', '2024-02-20', 'OU', 1, 'Cesar Manuel Aguilar Rojas (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('1001092009', 2024, 'Febrero', 'LIMA', 'Santa Felicia', null, '2024-02-20', '2024-02-20', 'GC', 1, 'Felix Luis Obispo Ponte (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2024-04-01', 41, 'Archivado', 'CERRADO', 'Abeo'),
('1001092059', 2024, 'Febrero', 'LIMA', 'Chacarrilla', null, '2024-02-20', '2024-02-20', 'DS', 1, 'Gianmarco Andres Lopez Tovar (TEC Grave)', 'TEC Grave', 23000, 'Grave', 9581.81, 15418.19, '2024-03-20', 29, 'Transigido', 'CERRADO', 'Abeo'),
('1001093039', 2024, 'Febrero', 'LIMA', 'Santa Felicia', null, '2024-02-22', '2024-02-22', 'DS', 1, 'Stivin Guerrero (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-03-08', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1001093164', 2024, 'Febrero', 'Callao', 'Bellavista', 'Maranga.', '2024-02-22', '2024-02-22', 'Maritza Nizama', 2, '1.- Traumatismo superficiales múltiples, no especificado.
  2.- Contusión de la pared abdominal, contusión de tórax, herida de la rodilla.', 'Politraumatizado', 8000, 'Grave', 9300, 6188, '2025-01-08', 321, 'Transigido', 'CERRADO', 'RVC'),
('1001093721', 2024, 'Febrero', 'LIMA', 'Barranco', null, '2024-02-23', '2024-02-23', 'JD', 1, 'Rafael Sucualaya Diógenes (Fallecido)', 'Fallecido', 65000, 'Grave', 0, 50000, '1970-01-01', -19776, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001093919', 2024, 'Febrero', 'LIMA', 'Pachacamac', null, '2024-02-23', '2024-02-23', 'OU', 1, 'Luis Quispe Solier (Heridas Cortantes Rostro, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001094314', 2024, 'Febrero', 'BAGUA', 'IMAZA', null, '2024-02-23', '2024-02-23', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 300, '1970-01-01', -19776, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001094727', 2024, 'Febrero', 'Lima', 'Jesús María', 'Jesús María', '2024-02-25', '2024-02-25', 'Mario Pilares', 2, 'Cervical.
 Lumbago No especificado.', 'Lumbalgia', 6900, 'Grave', 6600, 1714, '2024-05-13', 78, 'Transigido', 'CERRADO', 'RVC'),
('1001088854', 2024, 'Febrero', 'LIMA', 'Orrantia', null, '2024-02-14', '2024-02-14', 'OU', 1, 'Angel Gabriel Martinez Camacho (Fractura Fragmentada Huesos del Pie)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001094905', 2024, 'Febrero', 'LIMA', 'San Borja', null, '2024-02-26', '2024-02-26', 'GC', 1, 'Jyuz Angel Tello Ledezma (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1235, 3765, '2024-03-04', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1001095245 / 181305', 2024, null, null, null, null, '2024-02-27', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001095385', 2024, 'Febrero', 'LIMA', 'Miraflores', null, '2024-02-26', '2024-02-26', 'GC', 1, 'David Antonio Sanchez Peralta (Policotnuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001095427', 2024, 'Febrero', 'Lima', 'Lima', 'Alfonso Ugarte', '2024-02-26', '2024-02-26', 'Maritza Nizama', 5, '1.- Policontuso.
2.-   Policontuso.  3.-Policontuso, 
  -4. Hipertensiva, policontuso, 

  5.Policontuso, quedando en observación.', 'Policontuso', 8625, 'Grave', 0, 50000, '2024-02-29', 3, 'Rechazado', 'CERRADO', 'RVC'),
('1001096641', 2024, 'Febrero', 'LIMA', 'Lince', null, '2024-02-29', '2024-02-29', 'JD', 1, 'Gladys Bautista Cuellar de Carlos (Politraumatizada / Fisura en Brazo Derecho)', 'Politraumatizado', 4000, 'Leve', 4000, 6000, '1970-01-01', -19782, 'Transigido', 'CERRADO', 'Abeo'),
('1001097012', 2024, 'Marzo', 'HUAURA', 'SAYAN', null, '2024-03-01', '2024-02-28', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 500, '1970-01-01', -19783, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001097970', 2024, 'Marzo', 'LIMA', 'San Bartolo', null, '2024-03-02', '2024-03-02', 'GC', 1, 'Armando Mauricio Martínez Siles (Policontuso)', 'Policontuso', 1725, 'Leve', 2000, -500, '2024-04-25', 54, 'Transigido', 'CERRADO', 'Abeo'),
('1001098407', 2024, 'Marzo', 'Lima', 'Lima', 'Alfonso Ugarte', '2024-03-03', '2024-03-03', 'Pierina Ugaz', 2, '1.-Politraumatismo, fractura de clavícula izquierda, atricción de rodilla y pierna izquierda,
  2.-  Policontuso, traumatismo cérvico abdominal alto por descartar fractura de muñeca,', 'Fractura de clavícula', 46000, 'Grave', 6935, 7533, '2024-08-15', 165, 'Transigido', 'CERRADO', 'RVC'),
('1001098781', 2024, 'Marzo', 'LIMA', 'Sagitario', null, '2024-03-04', '2024-03-04', 'DS', 1, 'Jose Raul Luyo Sanchez (Fractura de Peroné)', 'Fractura de Peroné', 17250, 'Grave', 32000, 18000, '2024-03-14', 10, 'Transigido', 'CERRADO', 'Abeo'),
('1001098945', 2024, 'Marzo', 'LIMA', 'San Isidro', null, '2024-03-04', '2024-03-04', 'GC', 1, 'Christian Aron Benavides Celiz (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-03-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001099057', 2024, 'Marzo', 'Lima', ', San Luis', 'Yerbateros', '2024-03-04', '2024-03-04', 'Pierina Ugaz', 1, 'Se desconoce
  -', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-03-12', 8, 'Transigido', 'CERRADO', 'RVC'),
('1001099069', 2024, 'Marzo', 'Lima', 'Los Olivos', 'Pro', '2024-03-02', '2024-03-02', 'Pierina Ugaz', 1, 'Fractura expuesta del tobillo y pie izquierdo, herida en pierna derecha por descartar fractura de fémur distal, 
  -', 'Fractura de fémur', 23000, 'Grave', 38000, 26800, '2024-08-19', 170, 'Transigido', 'CERRADO', 'RVC'),
('1001099126', 2024, 'Marzo', 'Callao', 'Bellavista', 'La Legua', '2024-03-04', '2024-03-04', 'Mario Pilares', 1, 'Policontuso por accidente de tránsito,', 'Policontuso', 1725, 'Leve', 4950, 4950, '2024-06-15', 103, 'Transigido', 'CERRADO', 'RVC'),
('1001099807', 2024, 'Marzo', 'Lima', 'Comas', 'Santa Luzmila', '2024-03-05', '2024-03-05', 'Pierina Ugaz', 2, '1.-: Contusión de rodilla lado derecho, 
  2.-  Contusión del extremo inferiores lado derecho', 'Policontuso', 3450, 'Leve', 2000, 23000, '2024-03-21', 16, 'Transigido', 'CERRADO', 'RVC'),
('1001099852', 2024, 'Marzo', 'LIMA', 'Sagitario', null, '2024-03-05', '2024-03-05', 'JD', 2, 'Miguel Angel Aquice Ccasani (Politraumatizado), Stephany Salvador San Martín (Politraumatizado)', 'Politraumatizado', 8000, 'Grave', 0, 10000, '1970-01-01', -19787, 'Transigido', 'CERRADO', 'Abeo'),
('1001099853', 2024, 'Marzo', 'Lima', 'Jesús María -', 'Jesús María', '2024-03-05', '2024-03-05', 'Pierina Ugaz', 1, 'No refiere.', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-03-12', 7, 'Rechazado', 'CERRADO', 'RVC'),
('1001100164', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-06', '2024-03-06', 'OU', 1, 'Elmer Fernando Pérez Rodriguez (Politraumatismo, Esguince Tobillo)', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2024-03-12', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001100394', 2024, 'Marzo', 'LIMA', 'Pachacamac', null, '2024-03-06', '2024-03-06', 'GC', 1, 'Carlos Calcina Martinez (Policontuso)', 'Policontuso', 1725, 'Leve', 5970.59, -4470.59, '2024-05-27', 82, 'Transigido', 'CERRADO', 'Abeo'),
('1001100617', 2024, 'Marzo', 'LIMA', 'Lurin', null, '2024-03-07', '2024-03-07', 'JD', 1, 'Camilo Manuel Flores (Fallecido)', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001100653', 2024, 'Marzo', 'Callao', 'Callao', 'Ciudadela Chalaca', '2024-03-07', '2024-03-07', 'Pierina Ugaz', 2, '1.- Traumatismo superficial que afectan múltiples regiones de su cuerpo.
 2.-   Policontuso', 'Politraumatizado', 8000, 'Grave', 50, 14950, '2024-03-14', 7, 'Transigido', 'CERRADO', 'RVC'),
('1001100879', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-07', '2024-03-07', 'GC', 1, 'Andrea Gianella Otazu Yauri (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1981.26, 3018.74, '2024-03-19', 12, 'Transigido', 'CERRADO', 'Abeo'),
('1001100995', 2024, 'Marzo', 'LIMA', 'Pueblo Libre', null, '2024-03-07', '2024-03-07', 'DS', 2, 'Pablo Cesar Carrillo Llanos, Libia del Aguila del Aguila  (Policontusos)', 'Policontuso', 3450, 'Leve', 0, 3000, '2024-03-07', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001101517', 2024, 'Marzo', 'Lima', 'San Miguel', 'San Miguel', '2024-03-08', '2024-03-08', 'Pierina Ugaz', 4, 'Policontuso.
  Policontuso.
   Contusión de hombro derecho.
   Trauma cerebral leve.', 'Policontuso', 6900, 'Grave', 4655, 347, '2024-04-25', 48, 'Transigido', 'CERRADO', 'RVC'),
('1001101889', 2024, 'Marzo', 'LIMA', 'San Luis', null, '2024-03-09', '2024-03-09', 'DS', 1, 'Jaime Junior Fernandez Aguilar (TEC Severo)', 'TEC Grave', 23000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001101987', 2024, 'Marzo', 'LIMA', 'Santa María', null, '2024-03-09', '2024-03-09', 'GC', 1, 'Felipe Roberto Alcantara Nopo (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001102308', 2024, 'Marzo', 'Lima', 'Jesús María', 'Petit Thouars', '2024-03-09', '2024-03-09', 'Mario Pilares', 1, 'Policontuso y herida en el brazo izquierdo y cerca a la cadera del mismo lado', 'Policontuso y corte', 2300, 'Leve', 3050, 1705, '2024-04-17', 39, 'Transigido', 'CERRADO', 'RVC'),
('1001102627', 2024, 'Marzo', 'LIMA', 'San Antonio', null, '2024-03-09', '2024-03-09', 'JD', 1, 'Jordan Alexander Huaranga Balboa (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2800, 2200, '2024-03-11', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001103286', 2024, 'Marzo', 'Callao', 'Ventanilla', 'Ventanilla', '2024-03-11', '2024-03-11', 'Pierina Ugaz', 2, 'Policontuso.
 Policontuso.', 'Policontuso', 3450, 'Leve', 0, 5000, '2024-08-04', 146, 'Rechazado', 'CERRADO', 'RVC'),
('1001103296', 2024, 'Marzo', 'LIMA', 'San Antonio', null, '2024-03-11', '2024-03-11', 'DS', 1, 'Andrei Renee Ojeda Condella (Fractura de Rodilla)', 'Policontuso', 1725, 'Leve', 6000, 14000, '2024-03-12', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001103318', 2024, 'Marzo', 'Lima', 'Jesús María', 'Jesús María', '2024-03-12', '2024-03-12', 'Pierina Ugaz', 2, '1.- Traumatismo superficial múltiple, no especificado.
2.-Traumatismo superficial múltiple, no especificado.', 'Politraumatizado', 8000, 'Grave', 2875, 262, '2024-11-04', 237, 'Transigido', 'CERRADO', 'RVC'),
('1001103595', 2024, 'Marzo', 'LIMA', 'San Isidro', null, '2024-03-12', '2024-03-12', 'JD', 1, 'Lorena Campos Morales (Fractura de Dedo de Pie Derecho)', 'Policontuso', 1725, 'Leve', 808.6, 4191.4, '2024-03-17', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1001103618', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-12', '2024-03-12', 'JD', 2, 'María Antonieta Rojas Bolivar (Politraumatizada)', 'Politraumatizado', 8000, 'Grave', 0, 0, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001104338', 2024, null, null, null, null, '2024-03-13', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 282.98, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001104423', 2024, 'Marzo', 'LIMA', 'Lince', null, '2024-03-13', '2024-03-13', 'GC', 1, 'Renato Virgilio Ruda Riguetti (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 4000, 1000, '2024-03-26', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1001104793', 2024, 'Marzo', 'Lima', 'Comas', 'Santa Luzmila', '2024-03-13', '2024-03-13', 'Pilar Dextre', 2, '1.-Presenta lesiones en ambas rodillas, 
   2.- Policontuso.', 'Policontuso', 3450, 'Leve', 1000, 2900, '2025-03-04', 356, 'Transigido', 'CERRADO', 'RVC'),
('1001104957', 2024, 'Marzo', 'Lima', 'Cercado de Lima', 'Chacra Colorado', '2024-03-14', '2024-03-14', 'Maritza Nizama', 1, 'Contusión sacro coxis y erosión del hombro.', 'Policontuso', 1725, 'Leve', 0, 5000, '2025-03-12', 363, 'Transigido', 'CERRADO', 'RVC'),
('1001104966', 2024, 'Marzo', 'LIMA', 'San Borja', null, '2024-03-13', '2024-03-13', 'GC', 1, 'Oscar Luis Martínez Campos (Policontuso)', 'Policontuso', 1725, 'Leve', 739, 761, '2024-04-18', 36, 'Transigido', 'CERRADO', 'Abeo'),
('1001105139', 2024, 'Marzo', 'LIMA', 'San Borja', null, '2024-03-13', '2024-03-13', 'GC', 1, 'Miguel Angel Lazo Otaloga (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2024-03-28', 15, 'Archivado', 'CERRADO', 'Abeo'),
('1001105588', 2024, 'Marzo', 'Lima', 'S.J.L', 'Canto Rey.', '2024-03-15', '2024-03-15', 'Pierina Ugaz', 1, 'Contusión en rodilla izquierda y dado de alta.', 'Policontuso', 1725, 'Leve', 0, 20000, '2024-08-04', 142, 'Rechazado', 'CERRADO', 'RVC'),
('1001105667', 2024, 'Marzo', 'Lima', 'Ancón', 'Ancón.', '2024-03-14', '2024-03-14', 'Pierina Ugaz', 5, 'TEC
  2.-.Policontuso 
 3.- Policontuso 
 4. Policontuso 
 5.Policontuso', 'TEC Leve', 28750, 'Grave', null, 100000, '2025-08-01', 505, 'Judicializado', 'CERRADO', 'RVC'),
('1001105939', 2024, 'Marzo', 'Lima', 'Chosica', 'Chosica', '2024-03-16', '2024-03-16', 'Pierina Ugaz', 2, '1. Policontuso', 'Policontuso', 3450, 'Leve', 1400, 18600, '2024-03-18', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001106217', 2024, 'Marzo', 'Lima', 'Jesús María', 'Jesús María', '2024-03-16', '2024-03-16', 'Maritza Nizama', 1, 'Subluxación en cadera', 'Torcedura', 3450, 'Leve', null, 15000, '2026-04-24', 769, 'Transigido', 'CERRADO', 'RVC'),
('1001106507', 2024, 'Marzo', 'LIMA', 'Chacarilla', null, '2024-03-17', '2024-03-17', 'JD', 1, 'Yolanda Choque Guerrero (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 2403, 2597, '2024-03-19', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001106691', 2024, 'Marzo', 'LIMA', 'San Juan de Miraflores', null, '2024-03-18', '2024-03-18', 'JD', 1, 'Luis Miguel Cuellar Pérez (TEC Moderado / Corte en Cabeza / Politraumatizado', 'TEC Moderado', 11500, 'Grave', 800, 4200, '2024-04-01', 14, 'Transigido', 'CERRADO', 'Abeo'),
('1001106731', 2024, 'Marzo', 'Lima', 'Ate', 'Salamanca', '2024-03-18', '2024-03-18', 'Maritza Nizama', 1, '1.- Fisura de hombro derecho

-', 'Policontuso', 1725, 'Leve', 4860, -653, '2024-04-26', 39, 'Transigido', 'CERRADO', 'RVC'),
('1001106768', 2024, 'Marzo', 'LIMA', 'San Antonio', null, '2024-03-18', '2024-03-18', 'OU', 1, 'Stephany Johana Espinoza Ladron de Guevara (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-03-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001107971', 2024, 'Marzo', 'Lima', 'Independencia', 'Independencia.', '2024-03-20', '2024-03-20', 'Pierina Ugaz', 1, 'Atricción severa en pie izquierdo,', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-05-17', 58, 'Transigido', 'CERRADO', 'RVC'),
('1001108167', 2024, 'Marzo', 'Lima', 'Cercado de Lima', 'Mirones Bajos.', '2024-03-20', '2024-03-20', 'Pierina Ugaz', 1, '1.- Policontuso por accidente de tránsito,', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-04-25', 36, 'Transigido', 'CERRADO', 'RVC'),
('1001108179', 2024, 'Marzo', 'LIMA', 'Chacarilla', null, '2024-03-20', '2024-03-20', 'DS', 1, 'Ana Gabriela Pisfil Barreto (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-03-21', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001108651', 2024, 'Marzo', 'CORONGO', 'LA PAMPA', null, '2024-03-21', '2024-03-21', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, null, '1970-01-01', -19803, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001108698', 2024, 'Marzo', 'LIMA', 'Chacarilla', null, '2024-03-20', '2024-03-20', 'JD', 1, 'Clever Josue Flor Verástegui (Politraumatizado / Corte Profundo en Rostro que Requirió intervención quirúrgica)', 'Politraumatizado', 4000, 'Leve', 3000, 2000, '2024-03-26', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001108735', 2024, 'Marzo', 'Lima', 'San Miguel', 'San Miguel.', '2024-03-21', '2024-03-21', 'Mario Pilares', 1, '1. traumatismo superficiales múltiples especificados.', 'Politraumatizado', 4000, 'Leve', 200, 4800, '2024-03-22', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001108740', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-21', '2024-03-21', 'DS', 2, 'Ronald Richar Valdivia Suarez, Christian Espinoza Falcon (Politraumatizados)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001109018', 2024, 'Marzo', 'LIMA', 'San Luis', null, '2024-03-21', '2024-03-21', 'OU', 1, 'Maria Giron (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001109038', 2024, 'Marzo', 'LIMA', 'San Isidro', null, '2024-03-21', '2024-03-21', 'JD', 1, 'Miguel Angel Gutierrez Mamani (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '1970-01-01', -19803, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001109054', 2024, 'Marzo', 'LIMA', 'Surquillo', null, '2024-03-21', '2024-03-21', 'JD', 1, 'Rodrigo Alonzo Niño Herrera (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3900, 1100, '2024-03-27', 6, 'Transigido', 'CERRADO', 'Abeo');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001109265', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-21', '2024-03-21', 'DS', 1, 'Igor Zlatar Castratt (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001109429', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-22', '2024-03-22', 'JD', 1, 'Nanci Angélica Mori Encina de Elias (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2024-04-12', 21, 'Transigido', 'CERRADO', 'Abeo'),
('1001090999', 2024, 'Febrero', 'LIMA', 'Orrantia', null, '2024-02-19', '2024-02-19', 'JD', 1, 'Raúl Anthony Cámara Tavanama', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Daño Material', 'CERRADO', 'Abeo'),
('1001109631', 2024, 'Marzo', 'LIMA', 'San Antonio', null, '2024-03-22', '2024-03-22', 'OU', 2, 'Yara Julia Vaillant Sanchez (Politraumatismo, Heridas Cortantes Pierna)', 'Politraumatizado', 8000, 'Grave', 19000, -14000, '2024-05-28', 67, 'Transigido', 'CERRADO', 'Abeo'),
('1001109692', 2024, 'Marzo', 'Lima', 'San Miguel', 'San Miguel', '2024-03-22', '2024-03-22', 'Pierina Ugaz', 1, 'Múltiple fractura en la pelvis', 'Fractura de pelvis', 15000, 'Grave', 9000, 25140, '2024-05-23', 62, 'Transigido', 'CERRADO', 'RVC'),
('1001110312', 2024, 'Marzo', 'Lima', 'San Miguel', 'de San Miguel', '2024-03-24', '2024-03-24', 'Maritza Nizama', 1, 'Policontuso pierna derecha,', 'Policontuso', 1725, 'Leve', 1000, 4000, '2024-04-25', 32, 'Transigido', 'CERRADO', 'RVC'),
('1001110524', 2024, 'Marzo', 'Callao', 'Callao', 'de La Legua', '2024-03-24', '2024-03-24', 'Maritza Nizama', 1, 'Fractura de la opifisis interior del cubito del radio.', 'Fractura de radio y cúbito', 17250, 'Grave', 6500, 6040, '2024-06-28', 96, 'Transigido', 'CERRADO', 'RVC'),
('1001110961', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-25', '2024-03-25', 'GC', 1, 'Angel Bastian Sarria Paredes (policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001111018', 2024, 'Marzo', 'LIMA', 'San Borja', null, '2024-03-25', '2024-03-25', 'OU', 1, 'Wendell Howard Hopkins Fernández (Politraumatismo, Fractura Brazo)', 'Politraumatizado', 4000, 'Leve', 0, 30000, '2024-03-27', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001111602', 2024, 'Marzo', 'LIMA', 'Monterrico', null, '2024-03-26', '2024-03-26', 'DS', 1, 'Javier Maximo Victoria Perez (TEC Moderado)', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001112350', 2024, 'Marzo', 'HUARAZ', 'INDEPENDENCIA', null, '2024-03-28', '2024-03-28', 'JOEL HUAHUACONDORI', 2, 'Fallecido + Politraumatizado', 'Fallecido', 130000, 'Grave', null, null, null, null, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001112434', 2024, 'Marzo', 'YUNGAY', 'MANCOS', null, '2024-03-28', '2024-03-28', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001112783', 2024, 'Marzo', 'Lima', 'Carabayllo', 'Santa Isabel.', '2024-03-29', '2024-03-29', 'Mario Pilares', 1, 'Fractura expuesta en tobillo izquierdo,', 'Fractura Pierna', 17250, 'Grave', 0, 20000, '2024-05-23', 55, 'Rechazado', 'CERRADO', 'RVC'),
('1001112831', 2024, 'Abril', 'HUANCAYO', 'SAN JERONIMO', null, '2024-04-03', '2024-03-29', 'JOEL HUAHUACONDORI', 6, 'Fractura de muñeca + Policontuso', 'Fractura de muñeca', 103500, 'Grave', null, 8250, '1970-01-01', -19816, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001112957', 2024, 'Marzo', 'LIMA', 'Chorrillos', null, '2024-03-03', '2024-03-03', 'GC', 2, 'Steven Rafael Brazon Villabona (Policontuso) Melanny Ruby Vivanco Flores (Esguince DE PIERNA)', 'Esguince', 4600, 'Leve', 550, 4450, '2024-03-04', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001113363', 2024, 'Marzo', 'Lima', 'Carabayllo', 'Santa Isabel', '2024-03-31', '2024-03-31', 'Maritza Nizama', 1, 'Contusión pélvica, contusión de miembros inferiores, por accidente de tránsito,', 'Policontuso', 1725, 'Leve', null, 15000, '1970-01-01', -19813, 'Otros', 'ABIERTO', 'RVC'),
('1001113379', 2024, 'Marzo', 'LIMA', 'Santa Felicia', null, '2024-03-31', '2024-03-31', 'GC', 1, 'Harold Aldair Chihua Ordinola (Policontuso)', 'Policontuso', 1725, 'Leve', 100, 1400, '2024-04-01', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001113438', 2024, 'Abril', 'LIMA', 'Surquillo', null, '2024-04-01', '2024-04-01', 'GC', 1, 'Brillith Tatiana Montejo Monja (policontusa)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-04-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001113692', 2024, 'Abril', 'Lima', 'Rímac', 'Piedra Lisa', '2024-04-01', '2024-04-01', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 490, 4510, '2024-04-01', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001114045', 2024, 'Abril', 'AREQUIPA', 'MIRAFLORES', null, '2024-04-03', '2024-04-02', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 1000, '1970-01-01', -19816, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001114130', 2024, 'Abril', 'LIMA', 'San Borja', null, '2024-04-02', '2024-04-02', 'DS', 1, 'Josue Adrian Vasquez Lara (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 400, 4600, '2024-04-05', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001114794', 2024, 'Abril', 'AREQUIPA', 'CERRO COLORADO', null, '2024-04-03', '2024-04-03', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19816, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001115097', 2024, 'Abril', 'LIMA', 'Monterrico', null, '2024-04-04', '2024-04-04', 'OU', 1, 'Michel Raul Cóndor Huaman (Politraumatismo, Esguince Rodilla)', 'Politraumatizado', 4000, 'Leve', 6000, -1000, '2024-04-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001115357', 2024, 'Abril', 'Lima', 'Jesús María Rímac', 'Jesús María.', '2024-04-04', '2024-04-04', 'Pierina Ugaz', 1, 'Traumatismo superficiales múltiples no especificado.', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-04-04', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001116451', 2024, 'Abril', 'LIMA', 'Chacarrilla', null, '2024-04-05', '2024-04-05', 'GC', 1, 'Carlos Alberto Elias Figueroa (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-04-05', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001117326', 2024, 'Abril', 'Lima', 'SJL', 'Huachipa.', '2024-04-07', '2024-04-07', 'Mario Pilares', 1, 'Policontuso ,con herida punzo cortante en la ceja izquierda y corte en la frente', 'Policontuso y corte', 2300, 'Leve', 1500, 8500, '2024-05-31', 54, 'Transigido', 'CERRADO', 'RVC'),
('1001117441', 2024, 'Abril', 'LIMA', 'San Antonio', null, '2024-04-07', '2024-04-07', 'DS', 1, 'Eliowall Antonio Carruyo Camacho (Fractura de tibia y Perona)', 'Fractura de tibia', 17250, 'Grave', 0, 20000, '2024-04-09', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001117716', 2024, 'Abril', 'LIMA', 'Miraflores', null, '2024-04-08', '2024-04-08', 'DS', 1, 'Guissella Miluska Rojo Ormeño (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2025-03-27', 353, 'Transigido', 'CERRADO', 'Abeo'),
('1001117742', 2024, 'Abril', 'Lima', 'Carabayllo', 'Santa Isabel', '2024-04-07', '2024-04-07', 'Pierina Ugaz', 1, 'Traumatismo superficial que afectan múltiples regiones de los miembros inferiores, quedándose en observación.', 'Politraumatizado', 4000, 'Leve', 0, 30000, '2024-04-15', 8, 'Rechazado', 'CERRADO', 'RVC'),
('1001117856', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-08', '2024-04-08', 'JD', 1, 'Anthony Jeferson Medina Gutierrez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19821, 'Daño Material', 'CERRADO', 'Abeo'),
('1001118100', 2024, 'Abril', 'AREQUIPA', 'CERRO COLORADO', null, null, '2024-04-08', 'RUTH HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, 500, '1970-01-01', null, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001118389', 2024, 'Abril', 'LIMA', 'Curva de Villa', null, '2024-04-09', '2024-04-09', 'OU', 1, 'Aury Luw Narvaez Puchuc (Latigazo, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 2400, 2600, '2024-04-12', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001118471', 2024, 'Abril', 'Lima', 'San Miguel', 'San Miguel.', '2024-04-09', '2024-04-09', 'Mario Pilares', 1, 'Traumatismo encéfalo craneano leve,', 'TEC Leve', 5750, 'Leve', 800, 9200, '2024-04-19', 10, 'Transigido', 'CERRADO', 'RVC'),
('1001118969', 2024, 'Abril', 'LIMA', 'San Borja', null, '2024-04-10', '2024-04-10', 'GC', 1, 'Carlos Manuel Diaz Farfan  (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '2024-04-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001119041', 2024, 'Abril', 'Lima', 'Puente Piedra', 'Puente Piedra', '2024-04-11', '2024-04-11', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, '2024-09-10', 152, 'Transigido', 'CERRADO', 'RVC'),
('1001119721', 2024, 'Abril', 'LIMA', 'Miraflores', null, '2024-04-11', '2024-04-11', 'DS', 1, 'Americio Carpio Hoyos (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 500, 4500, '2024-04-13', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001121196', 2024, 'Abril', 'LIMA', 'Pueblo Libre', null, '2024-04-15', '2024-04-15', 'JD', 1, 'Luis Ricardo Barzola Calva (Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001121208', 2024, 'Abril', 'Lima', 'Puente Piedra', 'Puente Piedra', '2024-04-14', '2024-04-14', 'Pierina Ugaz', 1, 'Fractura de clavícula, derivada a evaluación por traumatología.', 'Fractura de clavícula', 23000, 'Grave', 3000, 12000, '2024-04-16', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001121274', 2024, 'Abril', 'LIMA', 'Lince', null, '2024-04-15', '2024-04-15', 'OU', 1, 'Toribio Tapsa Florian (Esguince Tobillo, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 600, 9400, '2024-04-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001121329', 2024, 'Abril', 'Callao', 'Callao', 'Ciudadela Chalaca', '2024-04-15', '2024-04-15', 'Pierina Ugaz', 1, 'Policontuso a descartar, trauma torácico cerrado', 'Policontuso', 1725, 'Leve', 0, 20000, '2024-05-24', 39, 'Transigido', 'CERRADO', 'RVC'),
('1001121335 / 197359', 2024, null, null, null, null, '2024-04-15', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 800, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001121640', 2024, 'Abril', 'LIMA', 'Villa El Salvador', null, '2024-04-15', '2024-04-15', 'OU', 1, 'Victor Arambulo Carrion (Politraumatismo, Herida Cortante Profunda Brazo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001121703', 2024, 'Abril', 'LIMA', 'Surquillo', null, '2024-04-15', '2024-04-15', 'GC', 1, 'Juan Emilio Diego Sevilla Chavez (Fractura clavícula izquierda, y fractura costal múltiple)', 'Policontuso', 1725, 'Leve', 0, 15000, '1970-01-01', -19828, 'Rechazado', 'CERRADO', 'Abeo'),
('1001122033', 2024, 'Abril', 'Lima', 'Los Olivos', 'Sol de Oro', '2024-04-16', '2024-04-16', 'Maritza Nizama', 1, 'Policontuso, 
.', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-08-09', 115, 'Transigido', 'CERRADO', 'RVC'),
('1001122137', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-16', '2024-04-16', 'OU', 1, 'Anggie Belle Milagros Espinoza Leiva (Politraumatismo, TEC)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-04-17', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001122447', 2024, 'Marzo', 'LIMA', 'La Molina', null, '2024-03-30', '2024-03-30', 'GC', 1, 'Cristian Bonifacio Romani (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2024-04-17', 18, 'Transigido', 'CERRADO', 'Abeo'),
('1001122499', 2024, 'Abril', 'Lima', 'Jesús María', 'Magdalena.', '2024-04-17', '2024-04-17', 'Mario Pilares', 1, 'Policontuso, contusión costal derecha, herida en la muñeca izquierda, 
   -', 'Policontuso y corte', 2300, 'Leve', 300, 9700, '2024-04-19', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001122743', 2024, 'Abril', 'LIMA', 'San Juan de Miraflores', null, '2024-04-17', '2024-04-17', 'DS', 1, 'Josue Lucumi Roalcaba (Fractura de muñeca derecha)', 'Fractura de muñeca', 17250, 'Grave', 3500, 16500, '2024-04-18', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001123021', 2024, 'Abril', 'LIMA', 'Miraflores', null, '2024-04-18', '2024-04-18', 'DS', 1, 'Jorge Luis Ruiz Alegre', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-04-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001123347', 2024, 'Abril', 'LIMA', 'Sagitario', null, '2024-04-18', '2024-04-18', 'GC', 1, 'Jianntte Garcia Silva (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 4800, 200, '2024-07-16', 89, 'Transigido', 'CERRADO', 'Abeo'),
('1001123362', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-18', '2024-04-18', 'OU', 1, 'Luis Enrique Saldaña Torres (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 200, 4800, '2024-04-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001123422 / 198591', 2024, null, null, null, null, '2024-04-18', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Chacon'),
('1001123695', 2024, 'Abril', 'LIMA', 'Villa El Salvador', null, '2024-04-19', '2024-04-19', 'GC', 1, 'María de Los ángeles Palpa Torres (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2024-09-13', 147, 'Archivado', 'CERRADO', 'Abeo'),
('1001123823', 2024, 'Abril', 'LIMA', 'San Borja', null, '2024-04-19', '2024-04-19', 'OU', 1, 'Adair Thiago Apaza Huaquisaca (Politraumatismo, Heridas Cortantes Rostro y Cuerpo)', 'Politraumatizado', 4000, 'Leve', 4000, 1000, '2024-04-25', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001123851', 2024, 'Abril', 'LIMA', 'Chacarrilla', null, '2024-04-19', '2024-04-19', 'GC', 1, 'Joel Delgado Flores (Politraumatizado))', 'Politraumatizado', 4000, 'Leve', 0, 0, '2024-04-19', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001123964', 2024, 'Abril', 'LIMA', 'Monterrico', null, '2024-04-20', '2024-04-20', 'OU', 1, 'Carla Rocio Del Castillo Bello y Luis Alberto Eduardo Cordova Llanos (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 4000, '2024-04-20', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001123985', 2024, 'Abril', 'Lima', 'La Victoria', 'Apolo', '2024-04-20', '2024-04-20', 'Maritza Nizama', 2, '1.- Policontuso leve, 
  2.- Policontuso leve,', 'Policontuso', 3450, 'Leve', 0, 20000, '2024-06-09', 50, 'Transigido', 'CERRADO', 'RVC'),
('1001124088', 2024, 'Abril', 'LIMA', 'La Molina', null, '2024-04-20', '2024-04-20', 'GC', 1, 'Erica Mary Flores Rodríguez ( Fractura del Maleolo externo, contusión rodilla, Herida en Rodilla y Tobillo.)', 'Policontuso', 1725, 'Grave', 6500, 18500, '2024-05-26', 36, 'Transigido', 'CERRADO', 'Abeo'),
('1001124183', 2024, 'Abril', 'LIMA', 'Pachacamac', null, '2024-04-20', '2024-04-20', 'OU', 1, 'Anthony Bryan Lizaraso Mendoza (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1800, 3200, '2024-04-24', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1001124479', 2024, 'Abril', 'LIMA', 'Chacarrilla', null, '2024-04-21', '2024-04-21', 'OU', 1, 'Jesus Aníbal Pico Hernández (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '2024-04-30', 9, 'Transigido', 'CERRADO', 'Abeo'),
('1001124598', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-21', '2024-04-21', 'GC', 1, 'Neyser Vasquez Coronel (Policontuso)', 'Policontuso', 1725, 'Leve', 300, 1200, '2024-04-21', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001124744', 2024, 'Abril', 'LIMA', 'Chacarrilla', null, '2024-04-21', '2024-04-21', 'OU', 1, 'Kevin Etson Velasquez Rivera (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 3390, 1610, '2024-04-23', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001124768', 2024, 'Abril', 'Lima', 'San Martin de Porres', 'Breña.', '2024-04-21', '2024-04-21', 'Pierina Ugaz', 1, '1.  Fractura en peroné y tibia lado izquierdo', 'Fractura de Peroné', 17250, 'Grave', 0, 70000, '2024-04-23', 2, 'Rechazado', 'CERRADO', 'RVC'),
('1001124795', 2024, 'Abril', 'Lima', 'San Miguel', 'San Miguel', '2024-04-22', '2024-04-22', 'Pierina Ugaz', 1, 'Contusión de hombro izquierdo
   -', 'Policontuso', 1725, 'Leve', 4395, 850, '2024-06-13', 52, 'Transigido', 'CERRADO', 'RVC'),
('1001124832', 2024, 'Abril', 'LIMA', 'Orrantia', null, '2024-04-21', '2024-04-21', 'DS', 6, 'Asegurado Maria Alejandra Caso Melquiades, Cayetana Castillo Caso, Silvana Caso Melquiades, Margarita Caso Alzamora (Policontusas) Tercero Willy GermanOrna Herrera (Politraumatizado) y Crisitna Aurora de la Cruz Farfan (Policontusa)', 'Politraumatizado', 24000, 'Grave', 0, 12000, '1970-01-01', -19834, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001125039', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-22', '2024-04-22', 'OU', 1, 'Michel Owen Quiroz Jara (Politraumatismo, Trauma Rodilla y Tobillo Izquierdo)', 'Politraumatizado', 4000, 'Leve', 3500, 1500, '2024-04-23', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001125556', 2024, 'Abril', 'Lima', 'Cercado de Lima', 'Mirones Bajos', '2024-04-23', '2024-04-23', 'Pierina Ugaz', 1, 'Cefalea.', 'Policontuso', 1725, 'Grave', 8500, 2187, '2025-03-28', 339, 'Transigido', 'CERRADO', 'RVC'),
('1001125587', 2024, 'Abril', 'LIMA', 'Lince', null, '2024-04-29', '2024-04-29', 'JD', 1, 'Luis Fernando Asencio Marcos (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 350, 4650, '2024-04-29', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001125674', 2024, 'Abril', 'LIMA', 'Surquillo', null, '2024-04-23', '2024-04-23', 'DS', 2, 'Jose Salvador Baldeon Sanchez (fractura de clavícula izquierda); Giancarlo Gonzalo Ojeda Cornejo (fractura de cúbito izquierdo)', 'Fractura de clavícula', 46000, 'Grave', 47000, 13000, '2024-05-14', 21, 'Transigido', 'CERRADO', 'Abeo'),
('1001125895', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-24', '2024-04-24', 'DS', 1, 'Orlando Contreras (Politraumatizado)', 'Politraumatizado', 4000, 'Grave', 18000, -13000, '2024-06-03', 40, 'Transigido', 'CERRADO', 'Abeo'),
('10011261215', 2025, 'Febrero', 'LIMA', 'LIMA', 'Santa Felicia', '2025-02-19', null, 'GC', 1, 'Jose David Modesto Ramirez (Triple fractura de pierna)', 'Fractura Pierna', 17250, 'Grave', 8150, 11850, '2025-02-20', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001126143', 2024, 'Abril', 'Lima', 'Comas', 'Santa Luzmila', '2024-04-24', '2024-04-24', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-09-04', 133, 'Transigido', 'CERRADO', 'RVC'),
('1001126461', 2024, 'Abril', 'LIMA', 'Orrantia', null, '2024-04-24', '2024-04-24', 'JD', 1, 'Yuliana Paola Cárdenas Delgado (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001126592', 2024, 'Mayo', 'Callao', 'Callao', 'Sarita Colonia.', '2024-04-24', '2024-04-24', 'Maritza Nizama', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-05-16', 22, 'Transigido', 'CERRADO', 'RVC'),
('1001126659', 2024, 'Abril', 'LIMA', 'Lince', null, '2024-04-25', '2024-04-25', 'JD', 2, 'Jhair Jhonnel Carlos Mancisidor (Politraumatizado), Angela Katherin Huamani Cruz (Politraumatizada)', 'Politraumatizado', 8000, 'Grave', 1300, 8700, '2024-04-27', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001126712', 2024, 'Abril', 'LIMA', 'Orrantia', null, '2024-04-25', '2024-04-25', 'JD', 1, 'María Cereda (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001127124', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-26', '2024-04-26', 'OU', 1, 'Patricia Victoria Barrón Huarcaya y Johanny Patricia Gonzáles Barrón (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 800, 9200, '2024-04-27', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001127185', 2024, 'Abril', 'LIMA', 'Sagitario', null, '2024-04-26', '2024-04-26', 'OU', 1, 'Johana Ysabel Alzamora Murillo (Politraumatismo, Trauma Columna)', 'Politraumatizado', 4000, 'Leve', 6000, -1000, '2024-05-03', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1001127274', 2024, 'Abril', 'Lima', 'Cercado de Lima', 'Pethit Thouars', '2024-04-24', '2024-04-24', 'Pierina Ugaz', 1, 'Refiere fractura en pierna derecha,', 'Fractura Pierna', 17250, 'Grave', 56313, 43172.79, '2024-08-02', 100, 'Transigido', 'CERRADO', 'RVC'),
('1001127404', 2024, 'Abril', 'LIMA', 'Monterrico', null, '2024-04-26', '2024-04-26', 'OU', 1, 'Rolo Alexander Cachique Arias (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2024-04-27', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001127509', 2024, 'Abril', 'LIMA', 'Surquillo', null, '2024-04-27', '2024-04-27', 'GC', 1, 'Viviana Pozadas Tobar y Austin Prat (Policontusos)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-04-26', -1, 'Transigido', 'CERRADO', 'Abeo'),
('1001127560 / 201022', 2024, null, null, null, null, '2024-04-26', null, 'Emily', 2, 'Politraumatizado', 'Politraumatizado', 8000, 'Grave', 20000, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001127692', 2024, 'Abril', 'JAUJA', 'JAUJA', null, '2024-04-26', '2024-04-26', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 1500, '1970-01-01', -19839, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001128288', 2024, 'Abril', 'Lima', 'Comas', 'Santa Isabel', '2024-04-28', '2024-04-28', 'Maritza Nizama', 2, '- 1.- : Atención por prevención.  
 2.- Atención por prevención.', 'Policontuso', 3450, 'Leve', 0, 10000, '2024-06-22', 55, 'Transigido', 'CERRADO', 'RVC'),
('1001128428', 2024, 'Abril', 'Lima', 'Comas', 'Santa Luzmila', '2024-04-27', '2024-04-27', 'Pierina Ugaz', 1, 'Policontuso para descartar factura de radio', 'Policontuso', 1725, 'Leve', null, 10300, '1970-01-01', -19840, 'Transigido', 'CERRADO', 'RVC'),
('1001128430', 2024, 'Abril', 'Lima', 'Cercado de Lima', 'Maranga.', '2024-04-28', '2024-04-28', 'Pierina Ugaz', 4, '1. Traumatismo superficial múltiple
 2.-  Traumatismo superficial en la nariz y en la cabeza
   -   3.- Luxación de cadera izquierda,  
 4.-  Contusión superficial de cráneo.', 'Politraumatizado', 16000, 'Grave', 0, 100000, '2024-08-02', 96, 'Rechazado', 'CERRADO', 'RVC'),
('1001128441', 2024, 'Abril', 'URUBAMBA', 'URUBAMBA', null, '2024-04-29', '2024-04-26', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19842, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001128596', 2024, 'Abril', 'Lima', 'SMP', 'Barboncito', '2024-04-29', '2024-04-29', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 5000, '1970-01-01', -19842, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001129235', 2024, 'Abril', 'LIMA', 'Orrantia', null, '2024-04-30', '2024-04-30', 'DS', 1, 'Wilbert Orellana Ulfe (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-04-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001129569', 2024, 'Abril', 'LIMA', 'San Borja', null, '2024-04-30', '2024-04-30', 'GC', 1, 'Jean Franco Andre Sanchez Canales (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2800, 2200, '2024-05-13', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1001129883', 2024, 'Mayo', 'LIMA', 'San Borja', null, '2024-05-01', '2024-05-01', 'OU', 1, 'Melanio Ruiz Huansi (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001129907', 2024, 'Mayo', 'CORONEL PORTILLO', 'CAMPOVERDE', null, '2024-05-01', '2024-05-01', 'JOEL HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, null, '1970-01-01', -19844, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001130074', 2024, 'Mayo', 'LIMA', 'Surquillo', null, '2024-05-01', '2024-05-01', 'JD', 1, 'Cervando Lorenzo Inocente Torres (TEC Grave, Fractura Clavícula)', 'TEC Grave', 23000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001130080', 2024, 'Mayo', 'LIMA', 'Chacarrilla', null, '2024-05-02', '2024-05-02', 'GC', 1, 'SANTHER MENDOZA SERNA (Politruamatizado)', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-05-02', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001130106', 2024, 'Mayo', 'LIMA', 'Monterrico', null, '2024-05-02', '2024-05-02', 'DS', 1, 'Edwin Robins Ramirez Infante (Fractura Expuesta Tibia)', 'Policontuso', 1725, 'Grave', 10000, 15000, '2024-06-06', 35, 'Transigido', 'CERRADO', 'Abeo'),
('1001130194', 2024, 'Mayo', 'LIMA', 'Barranco', null, '2024-05-02', '2024-05-02', 'OU', 1, 'Daniel Junior Suárez Antunez (TEC, Politraumatismo, Luxo Fractura Clavícula)', 'Politraumatizado', 4000, 'Grave', 18000, 12000, '1970-01-01', -19845, 'Transigido', 'CERRADO', 'Abeo'),
('1001130491', 2024, 'Mayo', 'Lima', 'Ate.', 'Ate.', '2024-04-30', '2024-04-30', 'Pierina Ugaz', 2, '1.  Policontuso, traumatismo, encéfalo craneano.  
   2. Policontuso.', 'TEC Leve', 11500, 'Grave', null, 10350, '2025-09-28', 516, 'Judicializado', 'CERRADO', 'RVC'),
('1001130999', 2024, 'Mayo', 'Lima', 'San Miguel', 'San Miguel.', '2024-05-03', '2024-05-03', 'Mario Pilares', 1, 'Policontuso leve', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-05-23', 20, 'Transigido', 'CERRADO', 'RVC'),
('1001131049', 2024, 'Mayo', 'LIMA', 'Lince', null, '2024-05-03', '2024-05-03', 'DS', 1, 'Victor Humberto Tafur Barboza (Policontuo)', 'Policontuso', 1725, 'Leve', 1180, 320, '1970-01-01', -19846, 'Transigido', 'CERRADO', 'Abeo'),
('1001131230', 2024, 'Mayo', 'LIMA', 'Lince', null, '2024-05-04', '2024-05-04', 'GC', 1, 'Mac Gyver Valentín Tunque Saravia (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-06-06', 33, 'Archivado', 'CERRADO', 'Abeo'),
('1001131273', 2024, 'Mayo', 'LIMA', 'Monterrico', null, '2024-05-04', '2024-05-04', 'DS', 1, 'Robert Andersson Perez Hernandez (Policuntuso)', 'Policontuso', 1725, 'Leve', 1200, 300, '1970-01-01', -19847, 'Transigido', 'CERRADO', 'Abeo'),
('1001131376', 2024, 'Mayo', 'Lima', 'Av. Lurigancho', 'Zarate.', '2024-05-04', '2024-05-04', 'Maritza Nizama', 2, '-1. Politraumatizado, 
   -2-     -', 'Politraumatizado', 8000, 'Grave', 0, 30000, '2024-06-18', 45, 'Transigido', 'CERRADO', 'RVC'),
('1001132051', 2024, 'Mayo', 'Lima', 'Rímac', 'El Manzano.', '2024-05-06', '2024-05-06', 'Pierina Ugaz', 4, '1.-  Se desconoce.  
 
   -2.-No refiere.  
   
   3.  No refiere.  
   
   -4.- No refiere.', 'Policontuso', 6900, 'Grave', 5000, 5560, '2024-06-25', 50, 'Transigido', 'CERRADO', 'RVC'),
('1001132728', 2024, 'Mayo', 'LIMA', 'Surquillo', null, '2024-05-07', '2024-05-07', 'DS', 1, 'Manuel Smith Acevedo Cieza (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1400, 3600, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001132829', 2024, 'Mayo', 'Lima', 'SJL', 'Mariscal Cáceres.', '2024-05-05', '2024-05-05', 'Pierina Ugaz', 1, '1: Policontuso', 'Policontuso', 1725, 'Grave', 8554, 8956, '2024-07-30', 86, 'Transigido', 'CERRADO', 'RVC'),
('1001132871', 2024, 'Mayo', 'LIMA', 'Santa Felicia', null, '2024-05-07', '2024-05-07', 'OU', 1, 'Cesar Milton Marca Jaime (Politraumatismo, TEC, Herida Cortante Rostro y Oreja)', 'Politraumatizado', 4000, 'Leve', 400, 4600, '1970-01-01', -19850, 'Transigido', 'CERRADO', 'Abeo'),
('1001132921', 2024, 'Mayo', 'Lima', 'Lima', 'Cotabambas.', '2024-05-07', '2024-05-07', 'Pierina Ugaz', 2, '1.- Contusión en rodilla de la pierna izquierda
  2.-  Policontuso en región lumbosacra', 'Policontuso', 3450, 'Leve', 700, 34300, '2024-09-05', 121, 'Transigido', 'CERRADO', 'RVC'),
('1001133081', 2024, 'Mayo', 'LIMA', 'San juan de Miraflores', null, '2024-05-08', '2024-05-08', 'OU', 1, 'Helen Yohanis Toledo Saldaña (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '1970-01-01', -19851, 'Archivado', 'CERRADO', 'Abeo'),
('1001133199', 2024, 'Mayo', 'LIMA', 'Orrantia', null, '2024-05-08', '2024-05-08', 'GC', 1, 'Manuel Alfonso Cumpa Sanchez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-05-08', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001133945', 2024, 'Mayo', 'AREQUIPA', 'JOSE BUSTAMANTE', null, '2024-05-09', '2024-05-09', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 2000, '1970-01-01', -19852, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001134109', 2024, 'Mayo', 'LIMA', 'San Borja', null, '2024-05-09', '2024-05-09', 'DS', 1, 'Angelita Gallegos Jara ( fractura de humero proximal,)', 'Fractura de humero', 23000, 'Grave', 15000, 5000, '2024-08-29', 112, 'Transigido', 'CERRADO', 'Abeo'),
('1001134134', 2024, 'Mayo', 'LIMA', 'San Isidro', null, '2024-05-09', '2024-05-09', 'JD', 1, 'Sandra Lucia Candela Kanagusuki (Esguince de Tobillo y Codo Izquierdo / Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001134421', 2024, 'Mayo', 'LIMA', 'Lurin', null, '2024-05-10', '2024-05-10', 'DS', 5, 'NN (Fallecido); 4 Personas Lesionadas', 'Fallecido', 325000, 'Grave', 0, 70000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001134651', 2024, 'Mayo', 'LIMA', 'Chacarrilla', null, '2024-05-10', '2024-05-10', 'GC', 1, 'Moises Briceño Massoni (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001134695', 2024, 'Mayo', 'LIMA', 'Miraflores', null, '2024-05-10', '2024-05-10', 'JD', 1, 'Italo Luis Yungarima Sansone (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001134868', 2024, 'Mayo', 'Lima', 'El Agustino', 'Villa Hermosa.', '2024-05-10', '2024-05-10', 'Pierina Ugaz', 1, '1.  Contusión de hombre izquierdo.', 'Policontuso', 1725, 'Leve', 500, 14500, '2024-07-05', 56, 'Rechazado', 'CERRADO', 'RVC'),
('1001135139', 2024, 'Mayo', 'LIMA', 'Santa Felicia', null, '2024-05-11', '2024-05-11', 'JD', 1, 'Mónica Claudia Navarro Mauriño (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001135363', 2024, 'Mayo', 'LIMA', 'Miraflores', null, '2024-05-12', '2024-05-12', 'JD', 1, 'Jhon Guillermo Martínez Serrano (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 300, 4700, '1970-01-01', -19855, 'Transigido', 'CERRADO', 'Abeo'),
('1001135440', 2024, 'Mayo', 'LIMA', 'Villa', null, '2024-05-12', '2024-05-12', 'JD', 1, 'Adriana Barreto Alegre (Politraumatizada), Sofía Rojas Alegre (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001135827', 2024, 'Mayo', 'SAN MARTIN', 'TARAPOTO', null, '2024-05-13', '2024-05-13', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19856, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001135928', 2024, 'Mayo', 'Lima', 'Santa Anita', 'Santa Anita.', '2024-05-13', '2024-05-13', 'Pierina Ugaz', 1, '1.  Muerte por atropello', 'Fallecido', 65000, 'Grave', 0, 70000, '2024-09-06', 116, 'Rechazado', 'CERRADO', 'RVC'),
('1001135935', 2024, 'Mayo', 'CARAVELI', 'CHALA', null, '2024-05-13', '2024-05-13', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001136697', 2024, 'Mayo', 'Lima', 'La Victoria', 'San Andrés.', '2024-02-26', '2024-02-26', 'Pierina Ugaz', 1, '1.- Policontuso por accidente de tránsito, dado de alta.', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-03-11', 379, 'Rechazado', 'CERRADO', 'RVC'),
('1001137271', 2024, 'Mayo', 'LIMA', 'San Borja', null, '2024-05-16', '2024-05-16', 'DS', 4, 'Silvia Karina Villavicencio Fretell (Cervicalgia- Traumatismo superficial de lugar no especificado,); Deisy Liset Chiclla Taype (fractura avulsiva de pubis, fractura de pilar anterior acetábulo); Saul Fernandez Vásquez (Trauma Craneo Encefalico) y Orlando Pinedo (Policontuso)', 'Cervicalgia', 9200, 'Grave', 16000, 15500, '2024-12-23', 221, 'Transigido', 'CERRADO', 'Abeo'),
('1001137485', 2024, 'Mayo', 'Lima', 'Cercado de Lima', 'Conde de la Vega.', '2024-05-16', '2024-05-16', 'Maritza Nizama', 1, '1. Policontuso por accidente de tránsito, dado de alta.', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-03-07', 295, 'Transigido', 'CERRADO', 'RVC'),
('1001137752', 2024, 'Mayo', 'Lima', 'SJL', 'Santa Elizabeth.', '2024-05-17', '2024-05-17', 'Maritza Nizama', 2, '-1.-  Lumbalgia, dado de alta.  
      - 2.-Traumatismo intracraneal, no especificado, esguinces y torcedura de la columna cervical, traumatismos superficiales, no especificados, quedando en observación.  
   -3.-  Lumbago no especificado, quedando en observación.', 'TEC Leve', 11500, 'Grave', null, 35000, '1970-01-01', -19860, 'Otros', 'ABIERTO', 'RVC'),
('1001137767', 2024, 'Mayo', 'LIMA', 'San Isidro', null, '2024-05-17', '2024-05-17', 'JD', 1, 'Jose William Bardalez Choy (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '1970-01-01', -19860, 'Transigido', 'CERRADO', 'Abeo'),
('1001094793', 2024, 'Febrero', 'LIMA', 'Miraflores', null, '2024-02-26', '2024-02-26', 'OU', 1, 'Freddy Carlos Garay Sánchez (Herida Cortante Profunda Brazo Izquierdo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001139399', 2024, 'Mayo', 'LIMA', 'Chacarrilla', null, '2024-05-20', '2024-05-20', 'DS', 1, 'Yordy Alexis Ecoavil Olortegui (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-05-20', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001139650', 2024, 'Mayo', 'Lima', 'Puente Piedra', 'Puente Piedra.', '2024-05-21', '2024-05-21', 'Maritza Nizama', 1, 'Por actualizar', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-10-21', 153, 'Transigido', 'CERRADO', 'RVC'),
('1001140176', 2024, 'Mayo', 'LIMA', 'Miraflores', null, '2024-05-22', '2024-05-22', 'JD', 1, 'Antonio José Belmonte Torrelles (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '1970-01-01', -19865, 'Transigido', 'CERRADO', 'Abeo'),
('1001140221', 2024, 'Mayo', 'LIMA', 'Miraflores', null, '2024-05-22', '2024-05-22', 'JD', 1, 'Steven Daves Romero Gutierrez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001140335', 2024, 'Mayo', 'LIMA', 'San Isidro', null, '2024-05-22', '2024-05-22', 'DS', 1, 'Luis Alberto Ferrer Torres (Esguince en el tobillo derecho)', 'Esguince', 2300, 'Leve', 3500, 1500, '2024-05-22', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001140348', 2024, 'Mayo', 'Lima', 'SMP', 'Sol de Oro', '2024-05-22', '2024-05-22', 'Pierina Ugaz', 2, '1.-  Policontuso por accidente de tránsito, quedando en observación. 

2.-  Policontuso por accidente de tránsito, quedando en observación.', 'Policontuso', 3450, 'Leve', null, 25000, '2025-03-06', 288, 'Transigido', 'CERRADO', 'RVC'),
('1001140581', 2024, 'Mayo', 'LIMA', 'Chacarrilla', null, '2024-05-22', '2024-05-22', 'JD', 1, 'Maribel Yajaira Mendoza Tupia (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1700, 3300, '1970-01-01', -19865, 'Transigido', 'CERRADO', 'Abeo'),
('1001141099', 2024, 'Mayo', 'LIMA', 'Lince', null, '2024-05-23', '2024-05-23', 'OU', 1, 'Mercedes Orsini De Vigo (Fractura Tibia y Peroné) y Alde De Vigo Pascual (Fractura Cadera)', 'Fractura de cadera', 12000, 'Grave', 18200, 41800, '2024-08-16', 85, 'Transigido', 'CERRADO', 'Abeo'),
('1001141288', 2024, 'Mayo', 'LIMA', 'Monterrico', null, '2024-05-24', '2024-05-24', 'OU', 1, 'Bernie Daniel Montero Ventura (Esguince Tobillo)', 'Esguince', 2300, 'Leve', 1500, 3500, '1970-01-01', -19867, 'Transigido', 'CERRADO', 'Abeo'),
('1001141471', 2024, 'Mayo', 'LIMA', 'Villa El salvador', null, '2024-05-24', '2024-05-24', 'GC', 2, 'Magalet Paucar Roncano(Politraumatizado)', 'Politraumatizado', 8000, 'Grave', 3000, 2000, '2024-07-18', 55, 'Transigido', 'CERRADO', 'Abeo'),
('1001141714', 2024, 'Mayo', 'ILO', 'ILO', null, '2024-05-25', '2024-05-24', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 2600, '1970-01-01', -19868, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001141736', 2024, 'Mayo', 'Lima', 'San Martin', 'Lamas', '2024-05-24', '2024-05-24', 'Raúl Vásquez Vela', 0, 'No hay lesionados', 'Policontuso', 0, 'Leve', 0, 10000, '2024-05-29', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001141855', 2024, 'Mayo', 'Lima', 'Jesús María.', 'Jesús María.', '2024-05-24', '2024-05-24', 'Pierina Ugaz', 2, '1        Policontuso por accidente de tránsito, de alta 

-2.- Fractura nasal con herida contusa de la nariz, queda en observación.', 'Policontuso y corte', 4600, 'Leve', 5000, 15000, '2024-10-21', 150, 'Transigido', 'CERRADO', 'RVC'),
('1001142059', 2024, 'Mayo', 'LIMA', 'Monterrico', null, '2024-05-25', '2024-05-25', 'GC', 1, 'Luigui Anthony Chura Alvarado (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 4720, 280, '2024-07-22', 58, 'Transigido', 'CERRADO', 'Abeo'),
('1001142329', 2024, 'Mayo', 'Lima', 'Callao', 'La Legua.', '2024-05-26', '2024-05-26', 'Mario Pilares', 1, '1.  Traumatismo superficial múltiple-2.- TEC', 'TEC Leve', 5750, 'Leve', 0, 5000, '2024-05-28', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001142371', 2024, 'Mayo', 'Lima', 'Huachipa', 'Huachipa.', '2024-05-26', '2024-05-26', 'Maritza Nizama', 2, '1. Muerte.

2.-Politraumatizado, TEC severo', 'Fallecido', 130000, 'Grave', 95000, 0, '2025-05-15', 354, 'Transigido', 'CERRADO', 'RVC'),
('1001142506', 2024, 'Mayo', 'Callao', 'Callao', 'Monserrat.', '2024-05-27', '2024-05-27', 'Mario Pilares', 1, '1. Contusión de hombro, rodilla y pierna derecha, herida del dedo de la mano derecha y herida pierna.', 'Policontuso', 1725, 'Leve', 50, 4950, '2024-05-27', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001143022', 2024, 'Mayo', 'LIMA', 'Manchay', null, '2024-05-27', '2024-05-27', 'OU', 1, 'Alenia Landacay Montes (Contusión Hombro y Brazo)', 'Policontuso', 1725, 'Leve', null, 2000, '1970-01-01', -19870, 'Transigido', 'CERRADO', 'Abeo'),
('1001143159', 2024, 'Mayo', 'LIMA', 'Pueblo Libre', null, '2024-05-28', '2024-05-28', 'DS', 1, 'Jose Alberto Lorza Carmona (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-05-28', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001143553', 2024, 'Mayo', 'Lima', 'Cercado de Lima', 'Alfonso Ugarte.', '2024-05-29', '2024-05-29', 'Mario Pilares', 1, '1. Herida cortante en la zona plantar del pie izquierdo.', 'Policontuso', 1725, 'Leve', 400, 9600, '2024-05-31', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001143563', 2024, 'Mayo', 'LIMA', 'José Gálvez', null, '2024-05-29', '2024-05-29', 'JD', 1, 'VA: Jovita Niquen Chávez (Politraumatizado), Alexis Jesús Purihuampan Niquen (8 / Politraumatizado), Buenaventura Samanes Garfias (Politraumatizado), Natali Pamela Moreno Gutierrez (Politraumatizado), Elena Tello Valqui (Politraumatizada). VT: Víctor Arce Nahuis (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 25000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001143812', 2024, 'Mayo', 'Lima', 'Los Olivos', 'Sol de Oro', '2024-05-27', '2024-05-27', 'Pierina Ugaz', 1, '1.  Fractura del extremo proximal del cubito derecho.', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-10-06', 132, 'Rechazado', 'CERRADO', 'RVC'),
('1001144142', 2024, 'Mayo', 'Lima', 'Jesús María', 'Jesús María', '2024-05-30', '2024-05-30', 'Mario Pilares', 1, '1. Traumatismo encéfalo craneano, policontuso, quedando en observación.', 'TEC Leve', 5750, 'Leve', 0, 10000, '2024-05-30', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001109547', 2024, 'Marzo', 'LIMA', 'Orrantia', null, '2024-03-22', '2024-03-22', 'OU', 1, '-', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Daño Material', 'CERRADO', 'Abeo'),
('1001144534', 2024, 'Mayo', 'LIMA', 'Mateo Pumacahua', null, '2024-05-30', '2024-05-30', 'GC', 1, 'Licet Miriam Donayre Ramirez (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001144562', 2024, 'Mayo', 'Lima', 'SMP', 'San Martin de Porres', '2024-05-30', '2024-05-30', 'Pierina Ugaz', 1, '1. Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 25000, '2024-07-24', 55, 'Transigido', 'CERRADO', 'RVC'),
('1001144613', 2024, 'Mayo', 'LIMA', 'Laderas de Villa', null, '2024-05-30', '2024-05-30', 'GC', 1, 'Ovando Usca Flores (policontuso)', 'Policontuso', 1725, 'Leve', 1100, 400, '2024-06-20', 21, 'Transigido', 'CERRADO', 'Abeo'),
('1001144780', 2024, 'Mayo', 'LIMA', 'Lince', null, '2024-05-31', '2024-05-31', 'JD', 1, 'Estefany Paola Novoa Lavy (15 / Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001145316', 2024, 'Junio', 'LIMA', 'Surquillo', null, '2024-06-01', '2024-06-01', 'JD', 1, 'Camila Medina Valdivia (Politraumatizada), Valery Arias Amado ((Politraumatizada), Ruth Segil Huayllasco (Politraumatizada), Maralicia Huayllasco de Segil (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001145364', 2024, 'Junio', 'LIMA', 'San Juan de Miraflores', null, '2024-06-01', '2024-06-01', 'DS', 2, 'Elias Djandji Djandji (Policontuso) y Pio Pelagio Yapo Quispe (Politraumatizado)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('1001145574', 2024, 'Junio', 'LIMA', 'Chorrillos', null, '2024-06-02', '2024-06-02', 'DS', 1, 'Katherine Salcedo Quispe (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001145716', 2024, 'Junio', 'Callao', 'Callao', 'Callao', '2024-06-01', '2024-06-01', 'Pierina Ugaz', 1, '1.Traumatismo intracraneal y traumatismo superficiales múltiples, siendo dada de alta.', 'TEC Leve', 5750, 'Leve', 500, 9500, '2024-06-03', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001145811', 2024, 'Junio', 'YAULI', 'LA OROYA', null, '2024-06-03', '2024-06-02', 'JOEL HUAHUACONDORI', 1, 'Fractura de fémur', 'Fractura de fémur', 23000, 'Grave', null, 10000, '1970-01-01', -19877, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001145945', 2024, 'Junio', 'LIMA', 'San Isidro', null, '2024-06-03', '2024-06-03', 'DS', 1, 'Diego Pablo Lopez Chong (Fractura de Vertebra Toraxica)', 'Policontuso', 1725, 'Grave', 50000, 0, '1970-01-01', -19877, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001146341', 2024, 'Junio', 'LIMA', 'Lince', null, '2024-06-04', '2024-06-04', 'JD', 1, 'Henry Patiño Quevedo (Esguince de Tobillo Izquierdo)', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001146807', 2024, 'Junio', 'LIMA', 'Villa el Salvador', null, '2024-06-05', '2024-06-05', 'OU', 1, 'Christofer Alexander Giménez Medina (Esguince Tobillo)', 'Esguince', 2300, 'Leve', 0, 5000, '1970-01-01', -19879, 'Archivado', 'CERRADO', 'Abeo'),
('1001146852', 2024, 'Junio', 'Lima', 'Jesús María', 'Jesús María.', '2024-06-05', '2024-05-05', 'Mario Pilares', 2, '1.-  Traumatismo intracraneal no especificado, contusión de la región lumbosacra y de la pelvis, traumatismo superficial del abdomen de la región lumbosacra y de la pelvis parte no especificada.

2.-  Traumatismo especificados que afectan múltiples regiones del cuerpo.', 'TEC Leve', 11500, 'Grave', 1000, 19000, '2024-06-06', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001146866', 2024, 'Junio', 'LIMA', 'San Isidro', null, '2024-06-05', '2024-06-05', 'JD', 1, 'Marco Antonio Huayhua Ruiz (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3000, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001147070', 2024, 'Junio', 'AREQUIPA', 'CERRO COLORADO', null, '2024-06-05', '2024-06-05', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19879, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001147507', 2024, 'Junio', 'LIMA', 'Monterrico', null, '2024-06-08', '2024-06-08', 'GC', 1, 'Leonardo carrasco huaroc (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001147760', 2024, 'Junio', 'Lima', 'Comas', 'Santa Isabel', '2024-06-07', '2024-06-07', 'Pierina Ugaz', 1, 'Se observa herida (raspado) en la pierna derecha.', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-01-29', 236, 'Daño Material', 'CERRADO', 'RVC'),
('1001147954', 2024, 'Junio', 'Lima', 'San Miguel', 'San Miguel', '2024-06-07', '2024-06-07', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito en el tobillo lado derecho, quedando en observación', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-10-06', 121, 'Transigido', 'CERRADO', 'RVC'),
('1001148095', 2024, 'Junio', 'Lima', 'Chosica', 'Chaclacayo', '2024-06-08', '2024-06-08', 'Micaela Solis', 4, '1.-  Por actualizar.
2.-   Por actualizar.
3.-   Por actualizar.
 4.-  Por actualizar.', 'Policontuso', 6900, 'Grave', 0, 40000, '2024-08-08', 61, 'Transigido', 'CERRADO', 'RVC'),
('1001148343', 2024, 'Junio', 'RIOJA', 'RIOJA', null, '2024-06-08', '2024-06-08', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 1600, '1970-01-01', -19882, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001148517', 2024, 'Junio', 'Lima', 'San Isidro', 'No realizo', '2024-06-05', '2024-06-05', 'Pierina Ugaz', 1, '1.  Refiere policontuso.', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-09-06', 93, 'Transigido', 'CERRADO', 'RVC'),
('1001148545', 2024, 'Junio', 'LIMA', 'Surco', null, '2024-06-09', '2024-06-09', 'JD', 1, 'Micaela Angela Espichan Villegas (Corte en la Frente / Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '1970-01-01', -19883, 'Transigido', 'CERRADO', 'Abeo'),
('1001148981', 2024, 'Junio', 'LIMA', 'San Isidro', null, '2024-06-10', '2024-06-10', 'OU', 1, 'Miguel Alonso Cabrera Moresco, Stephanie Rosines Hoyos Sanguineti y Paloma Rocio Pelagio Olaya (Policontusos)', 'Policontuso', 1725, 'Leve', 0, 6000, '1970-01-01', -19884, 'Archivado', 'CERRADO', 'Abeo'),
('1001149320', 2024, 'Mayo', 'LIMA', 'Monterrico', null, '2024-05-22', '2024-05-22', 'DS', 1, 'Elias David Choque Poemape (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-05-23', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001149407', 2024, 'Junio', 'LIMA', 'Monterrico', null, '2024-06-11', '2024-06-11', 'OU', 1, 'Cinthia Paola Gutierrez Tovar (Politraumatismo, TEC, Herida Cortante Rostro)', 'Politraumatizado', 4000, 'Leve', 5500, -500, '1970-01-01', -19885, 'Transigido', 'CERRADO', 'Abeo'),
('1001149416', 2024, 'Junio', 'AREQUIPA', 'YANAHUARA', null, '2024-06-12', '2024-06-11', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001139072', 2024, 'Mayo', 'LIMA', 'Lurin', null, '2024-05-20', '2024-05-20', 'GC', 1, 'Augusto Jose Bernardo Tenorio Cevallos (Fractura de mano izquierda)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1001149540', 2024, 'Junio', 'LIMA', 'Urbanización Pachacamac', null, '2024-06-11', '2024-06-11', 'JD', 1, 'Genesis Bulguera Bulguera (Politraumatizada), Sofía Ortiz Bulguera (7 / Politraumatizada / Corte en Labio)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '1970-01-01', -19885, 'Transigido', 'CERRADO', 'Abeo'),
('1001149625', 2024, 'Junio', 'Lima', 'Agustino', 'Villa Hermosa.', '2024-06-09', '2024-06-09', 'Maritza Nizama', 2, 'Policontuso por accidente de tránsito, quedando en observación por tratamiento con analgésico.

Policontuso por accidente de tránsito, saliendo de alta con tratamiento ambulatorio.', 'Policontuso', 3450, 'Leve', 0, 25000, '2024-06-19', 10, 'Transigido', 'CERRADO', 'RVC'),
('1001150096', 2024, 'Junio', 'LIMA', 'Surquillo', null, '2024-06-12', '2024-06-12', 'GC', 1, 'Alexander Erick Prado Caballero (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 4109, 891, '2024-07-16', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1001150188', 2024, 'Junio', 'LIMA', 'Surquillo', null, '2024-06-12', '2024-06-12', 'DS', 1, 'Leli Roberto Neira Vizcardo (Policontuso)', 'Policontuso', 1725, 'Leve', 800, 700, '1970-01-01', -19886, 'Transigido', 'CERRADO', 'Abeo'),
('1001150429', 2024, 'Junio', 'LIMA', 'Chorrillos', null, '2024-06-12', '2024-06-12', 'JD', 1, 'Joaquin Alonso Bazán Gastañadui (Politraumatizado), Rocío Alexandra Martínez Cerda (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1001144298', 2024, 'Mayo', 'LIMA', 'La Molina', null, '2024-05-30', '2024-05-30', 'OU', 1, 'Luis Alberto Ccorimanya Ccama (Contusión tobillo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001150794', 2024, 'Junio', 'Lima', 'Los Olivos', 'Laura Caller', '2024-06-13', '2024-06-13', 'Maritza Nizama', 4, '1.  Contusión por accidente de tránsito.

2. Policontuso.

3.  Policontuso.
4. -  Policontuso.', 'Policontuso', 6900, 'Grave', 0, 45000, '2024-07-04', 21, 'Transigido', 'CERRADO', 'RVC'),
('1001150973', 2024, 'Junio', 'Lima', 'Chaclayo', 'Comisaria de Chaclayo.', '2024-06-14', '2024-06-14', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-07-01', 17, 'Transigido', 'CERRADO', 'RVC'),
('1001150983', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-14', '2024-06-14', 'JD', 1, 'Felix Alberto Gutierrez Zavaleta (Politraumatizado), Christian Edgard Gutierrez Perez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001151049', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-14', '2024-06-14', 'OU', 1, 'Renzo José Solis Camacho (Politraumatismo, Esguince Tobillo)', 'Politraumatizado', 4000, 'Leve', 1150, 3850, '1970-01-01', -19888, 'Transigido', 'CERRADO', 'Abeo'),
('1001151153', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-15', '2024-06-15', 'OU', 1, 'Mauricio Stefano Cherre Mendoza (Fractura Tibia y Peroné, Politraumatismo)', 'Politraumatizado', 4000, 'Grave', 24000, 6000, '2024-09-05', 82, 'Transigido', 'CERRADO', 'Abeo'),
('1001151161', 2024, 'Junio', 'LIMA', 'Miraflores', null, '2024-06-15', '2024-06-15', 'GC', 1, 'Melissa Paola La rosa Aviles (Politraumatizado y fractura nasal)', 'Politraumatizado', 4000, 'Leve', 2300, 7700, '2024-06-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001151254', 2024, 'Junio', 'LIMA', 'Miraflores', null, '2024-06-15', '2024-06-15', 'GC', 1, 'Hector Javier Renteria Choik (policontuso)', 'Policontuso', 1725, 'Leve', 1300, 1300, '2025-01-06', 205, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001151260', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-15', '2024-06-15', 'OU', 1, 'Richard Reyes Rodriguez (Politraumatismo, Esguince Tobillo)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-06-15', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001151319', 2024, 'Junio', 'LIMA', 'San Juan de Miraflores', null, '2024-06-17', '2024-06-17', 'OU', 1, 'Bertha Jackeline Solano Quiñones - Policontuso (presuntivo, no pasó atención médica)', 'Policontuso', 1725, 'Leve', 0, 2000, '1970-01-01', -19891, 'Archivado', 'CERRADO', 'Abeo'),
('1001151356', 2024, 'Junio', 'LIMA', 'Monterrico', null, '2024-06-15', '2024-06-15', 'DS', 1, 'Ana Cabrera Espinoza (Politraumatiazada)', 'Policontuso', 1725, 'Leve', 2500, 2500, '2024-06-16', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001151382', 2024, 'Junio', 'Lima', 'Miraflores', 'Ciudadela Chalaca', '2024-06-17', '2024-06-17', 'Pierina Ugaz', 1, 'Traumatismo superficial múltiples, no especificado, - Herida del labio y de la cavidad bucal,', 'Politraumatizado', 4000, 'Leve', 0, 30000, '2024-11-06', 142, 'Transigido', 'CERRADO', 'RVC'),
('1001151614', 2024, 'Junio', 'LIMA', 'Mateo Pumacahua', null, '2024-06-18', '2024-06-18', 'GC', 1, 'Fátima Soto Quispe (Fractura de nariz)', 'Policontuso', 1725, 'Leve', 0, null, '2024-06-20', 2, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001149441', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-11', '2024-06-11', 'GC', 1, 'Arian Wu Pereda (Fractura de la mano)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001152775 / 210841', 2024, null, null, null, null, '2024-05-28', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('1001153454', 2024, 'Junio', 'LIMA', 'Lince', null, '2024-06-20', '2024-06-20', 'OU', 1, 'Neilyn Gabriela Mora Uzcategui (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 500, 4500, '1970-01-01', -19894, 'Transigido', 'CERRADO', 'Abeo'),
('1001153935', 2024, 'Junio', 'Lima', 'cercado de Liam', 'Mirones Alto', '2024-06-21', '2024-06-21', 'Richard Rodriguez', 1, '1. fractura de diafisiaria de tibia izquierda y requiere hospitalización de 5 días', 'Fractura de tibia', 17250, 'Grave', 5100, 19900, '2024-06-27', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001154022', 2024, 'Junio', 'Lima', 'Los Olivos', 'Laura Caller', '2024-06-21', '2024-06-21', 'Maritza Nizama', 1, '1.  Traumatismo encéfalo craneano leve, fue dado de alta.', 'TEC Leve', 5750, 'Leve', 1500, 13500, '1970-01-01', -19895, 'En Negociación', 'ABIERTO', 'RVC'),
('1000982728', 2023, 'Junio', 'LIMA', 'MAGDALENA DEL MAR', 'Comisaría de Magdalena', '2023-06-17', '2023-06-17', 'Mario Pilares', 2, 'Policontuso / Contusión Cervical', 'Politraumatizado', 8000, 'Grave', null, 25000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001154337', 2024, 'Junio', 'LIMA', 'San Isidro', null, '2024-06-22', '2024-06-22', 'GC', 1, 'Rafael Adriano Jimenez Vera (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001155133', 2024, 'Junio', 'SAN ROMAN', 'JULIACA', null, '2024-06-25', '2024-06-24', 'JOEL HUAHUACONDORI', 10, 'Policontuso', 'Policontuso', 17250, 'Grave', null, 19217, '1970-01-01', -19899, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001155340', 2024, 'Junio', 'LIMA', 'Magdalena', null, '2024-06-25', '2024-06-25', 'DS', 1, 'Jair Edwin Vilca Delzo (herida cortante en el rostro)', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-06-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001155350', 2024, 'Junio', 'Lima', 'Cercado de Lima', 'UV3', '2024-06-24', '2024-06-24', 'Pierina Ugaz', 1, 'Traumatismo Encéfalo Cráneo, Policontuso', 'Policontuso', 1725, 'Leve', 700, 16300, '2024-10-07', 105, 'Transigido', 'CERRADO', 'RVC'),
('1001155352', 2024, 'Junio', 'LIMA', 'Lince', null, '2024-06-24', '2024-06-24', 'DS', 1, 'Mery Luz Peralta Limache (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001155916', 2024, 'Junio', 'LIMA', 'San Isidro', null, '2024-06-26', '2024-06-26', 'JD', 1, 'Antony Pool Belleza Cueva (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 500, 4500, '2024-06-26', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001156072', 2024, 'Junio', 'Lima', 'Los Olivos', 'Laura Caller', '2024-06-26', '2024-06-26', 'Pierina Ugaz', 1, 'Traumatismo craneal y traumatismo superficial.', 'TEC Leve', 5750, 'Leve', 3500, 2218, '2024-09-04', 70, 'Transigido', 'CERRADO', 'RVC'),
('1001156285', 2024, 'Junio', 'Lima', 'Jesús María', 'Jesús María', '2024-06-26', '2024-06-26', 'Pierina Ugaz', 1, 'desistió de toda atención médica', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-07-02', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001156718', 2024, 'Junio', 'LIMA', 'Urbanización Pachacamac', null, '2024-06-27', '2024-06-27', 'GC', 1, 'Roxana Julca Ramos y Esmeralda Alegría Julca (Policontusos)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19901, 'Transigido', 'CERRADO', 'Abeo'),
('1001156915', 2024, 'Junio', 'VITOR', 'VITOR', null, '2024-06-28', '2024-06-27', 'RUTH HUAHUACONDORI', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', null, null, '1970-01-01', -19902, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001157057', 2024, 'Junio', 'Lima', 'San Miguel', 'San Miguel', '2024-06-28', '2024-06-28', 'Pierina Ugaz', 1, 'Policontuso en varias zonas del cuerpo quedando en observación.', 'Policontuso', 1725, 'Leve', 700, 14300, '2024-07-10', 12, 'Transigido', 'CERRADO', 'RVC'),
('1001157222', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-28', '2024-06-28', 'DS', 1, 'Diana CArolina Duran Magallanes (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 3000, 2000, '1970-01-01', -19902, 'Transigido', 'CERRADO', 'Abeo'),
('1001157362', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-29', '2024-06-29', 'DS', 2, 'Miguel Angel Trigoso Curihuaman y Gabriel Maria Rodriguez Tumilian (Policobtusos)', 'Policontuso', 3450, 'Leve', 0, 3000, '2024-06-29', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001157724', 2024, 'Junio', 'LIMA', 'Cieneguilla', null, '2024-06-30', '2024-06-30', 'DS', 1, 'Maria Jesusa Parco Julca (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '2024-07-02', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001158092', 2024, 'Julio', 'Lima', 'Miraflores', 'Miraflores', '2024-07-01', '2024-07-01', 'Pierina Ugaz', 1, 'Policontuso, Contusión en zona Lumbar.', 'Policontuso', 1725, 'Leve', 4000, 11000, '2024-08-03', 33, 'Transigido', 'CERRADO', 'RVC'),
('1001158253', 2024, 'Julio', 'CHUMBIVILCAS', 'SANTO TOMAS', null, '2024-07-01', '2024-07-01', 'JOEL HUAHUACONDORI', 1, 'Policontuso y corte', 'Policontuso y corte', 2300, 'Leve', null, null, '1970-01-01', -19905, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001158377', 2024, 'Julio', 'Lima', 'Alfonso Ugarte', 'Alfonso Ugarte', '2024-04-01', '2024-04-01', 'Maritza Nizama', 1, 'Fractura de Tibia.', 'Fractura de tibia', 17250, 'Grave', 3000, 17000, '1970-01-01', -19814, 'En Negociación', 'ABIERTO', 'RVC'),
('1001158985', 2024, 'Julio', 'Lima', 'Carmen de la Legua', 'Carmen de la Legua', '2024-07-02', '2024-07-02', 'Maritza Nizama', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, 15000, '2025-08-22', 416, 'Transigido', 'CERRADO', 'RVC'),
('1001159141', 2024, 'Julio', 'LIMA', 'Miraflores', null, '2024-07-03', '2024-07-03', 'OU', 1, 'Anthonny Michael Estrada Farias (Esguince Cervical)', 'Esguince', 2300, 'Leve', 0, 5000, '1970-01-01', -19907, 'Transigido', 'CERRADO', 'Abeo'),
('1001159206', 2024, 'Julio', 'LIMA', 'Orrantia', null, '2024-07-03', '2024-07-03', 'JD', 1, 'Brenda Stephanie Reynoso Ricce (Esguince Cervical)', 'Esguince', 2300, 'Grave', 7000, 3000, '2024-08-06', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1001159550', 2024, 'Julio', 'LIMA', 'San Borja', null, '2024-07-03', '2024-07-03', 'GC', 1, 'David Junior Mendoza Garay', 'Policontuso', 1725, 'Leve', 200, 2800, '2024-07-08', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1001159882', 2024, 'Julio', 'Lima', 'San Miguel', 'San Miguel', '2024-07-04', '2024-07-04', 'Pierina Ugaz', 1, 'Policontuso, fractura pierna Izqueirday Brazo Izquierdo', 'Fractura Pierna', 17250, 'Grave', 0, 20000, '2024-09-07', 65, 'Transigido', 'CERRADO', 'RVC'),
('1001159963', 2024, 'Julio', 'LIMA', 'Surquillo', null, '2024-07-04', '2024-07-04', 'DS', 1, 'Fernando Steven Paz Franco (Fallecido)', 'Fallecido', 65000, 'Grave', 0, 40000, '1970-01-01', -19908, 'Otros', 'CERRADO', 'Abeo'),
('1001159984', 2024, 'Julio', 'Lima', 'San Miguel', 'San Miguel', '2024-07-04', '2024-07-04', 'Mario Pilares', 2, '1.- Policontuso, Traumatismo Abdominal Cerrado y TEC. Moderado, en observación. 
        2.-  Policontuso, fractura de rodilla derecha a descartar en observación.', 'Fractura Pierna', 34500, 'Grave', 16831, 25829, '2024-09-04', 62, 'Transigido', 'CERRADO', 'RVC'),
('1001161034', 2024, 'Julio', 'LIMA', 'San Antonio', null, '2024-07-07', '2024-07-07', 'JD', 1, 'José María Rondón Paiva (Fractura de Clavícula / Fractura de Costilla)', 'Fractura de clavícula', 23000, 'Grave', 0, 20000, '2024-07-13', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001162245', 2024, 'Julio', 'Callao', 'Callao', 'Callao', '2024-07-10', '2024-07-10', 'Pierina Ugaz', 1, 'Policontuso Rodilla Derecha y Hombro Derecho', 'Policontuso', 1725, 'Leve', 847, 1080, '2024-08-15', 36, 'Transigido', 'CERRADO', 'RVC'),
('1001162258', 2024, 'Julio', 'Lima', 'San Miguel', 'Maranga', '2024-07-10', '2024-07-10', 'Pierina Ugaz', 1, 'Fractura de Epífisis Inferior de la Tibia, Esguinces y Torceduras del Tobillo', 'Fractura de tibia', 17250, 'Grave', 3150, 4550, '2024-08-07', 28, 'Transigido', 'CERRADO', 'RVC'),
('1001162508', 2024, 'Julio', 'Lima', 'Jesus Maria', 'Jesus Maria', '2024-07-11', '2024-07-11', 'Pierina Ugaz', 1, 'Policontuso, contusión de cráneo', 'Policontuso', 1725, 'Leve', 0, 74000, '2025-01-06', 179, 'Transigido', 'CERRADO', 'RVC'),
('1001162966', 2024, 'Julio', 'Lima', 'Cercado de Lima', 'San Andres', '2024-07-12', '2024-07-12', 'Pierina Ugaz', 1, 'Diagnóstico Traumatismo Superficial Múltiple', 'Politraumatizado', 4000, 'Leve', 5800, 12200, '2024-09-09', 59, 'Transigido', 'CERRADO', 'RVC'),
('1001163022', 2024, 'Julio', 'AREQUIPA', 'HUNTER', null, '2024-07-12', '2024-07-12', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 1500, '1970-01-01', -19916, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001163303', 2024, 'Julio', 'LIMA', 'San Isidro', null, '2024-07-12', '2024-07-12', 'OU', 1, 'Jhonatan Manuel Pintado Ayala (Fractura Epífisis Interior Fémur, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1200, 28800, '2024-07-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001163782', 2024, 'Julio', 'Lima', 'Pro', 'Tupac Amaru', '2024-07-17', '2024-07-17', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-07-17', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001163821', 2024, 'Julio', 'LIMA', 'Pamplona', null, '2024-07-14', '2024-07-14', 'OU', 1, 'Luis Miguel Reyna Chumpitaz y Rita Itala Huahuasoncco Sifuentes (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001163908', 2024, 'Julio', 'LIMA', 'La Molina', null, '2024-07-14', '2024-07-14', 'OU', 1, 'Miguel Eduardo Espinoza Heredia', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-07-14', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001163936', 2024, 'Julio', 'LIMA', 'Orrantia', null, '2024-07-15', '2024-07-15', 'OU', 1, 'Andre Quispe Galvez (Esguince Cervical)', 'Esguince', 2300, 'Leve', 0, 5000, '2024-08-07', 23, 'Archivado', 'CERRADO', 'Abeo'),
('1001164068', 2024, 'Julio', 'CUSCO', 'SANTIAGO', null, '2024-07-14', '2024-07-13', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 4983, '1970-01-01', -19918, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001164098', 2024, 'Julio', 'Callao', 'Ventanilla', 'Zapallal', '2024-03-10', '2024-03-10', 'Pierina Ugaz', 1, 'Traumatismo intracraneal y policontuso.', 'TEC Leve', 5750, 'Leve', null, 20000, '2025-08-25', 533, 'Transigido', 'CERRADO', 'RVC'),
('1001164202', 2024, 'Julio', 'Ica', 'Ica', 'Los Aquijes', null, '2024-07-15', 'Alejandro Rodríguez', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'Alejandro'),
('1001164510', 2024, 'Julio', 'Huaura', 'Vegueta', 'Vegueta', null, '2024-07-16', 'Alejandro Rodríguez', 5, 'Fractura de Peroné + Fractura de muñeca', 'Fractura de Peroné', 86250, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Alejandro'),
('1001164730', 2024, 'Julio', 'Lima', 'SMP', 'Condevilla', '2024-07-16', '2024-07-16', 'Pierina Ugaz', 1, 'Policontuso por accidente de Tránsito.', 'Policontuso', 1725, 'Leve', 5000, 1421, '2024-08-24', 39, 'Transigido', 'CERRADO', 'RVC'),
('1001165011', 2024, 'Julio', 'LIMA', 'Monterrico', null, '2024-07-17', '2024-07-17', 'DS', 1, 'Jhon Erick Rodriguez Villegas (Fractura en el brazo)', 'Policontuso', 1725, 'Leve', 2000, 3000, '1970-01-01', -19921, 'Transigido', 'CERRADO', 'Abeo'),
('1001165552', 2024, 'Julio', 'LIMA', 'Miraflores', null, '2024-07-18', '2024-07-18', 'JD', 1, 'Oscar Fabrizzio Zamorano Campos', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19922, 'Daño Material', 'CERRADO', 'Abeo'),
('1001165572', 2024, 'Julio', 'LIMA', 'Santa Felicia', null, '2024-07-18', '2024-07-18', 'JD', 1, 'Yerson Fernando Carbajal Pomalazo (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1800, 3200, '2024-07-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001165701', 2024, 'Julio', 'LIMA', 'San Borja', null, '2024-07-18', '2024-07-18', 'OU', 1, 'Doris Esther Orellana Villa De Aliaga (Esguince Cervical)', 'Esguince', 2300, 'Leve', 3000, 2000, '2024-07-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001165834', 2024, 'Julio', 'LIMA', 'San Isidro', null, '2024-07-18', '2024-07-18', 'OU', 1, 'Victor David Jaimes Cuervo y Keyla Saret Chávez Timana (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 10000, '2024-07-18', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001166100', 2024, 'Julio', 'SANTA', 'CHIMBOTE', null, '2024-07-19', '2024-07-18', 'JOEL HUAHUACONDORI', 2, 'Fractura Pierna + Policontuso', 'Fractura Pierna', 34500, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001166229', 2024, 'Julio', 'LIMA', 'Curva de Villa', null, '2024-07-19', '2024-07-19', 'OU', 1, 'KENDRY José Tovar Vilchez (Politraumatismo, Esguince Rodilla)', 'Politraumatizado', 4000, 'Leve', 400, 4600, '2024-07-19', 0, 'Transigido', 'CERRADO', 'Abeo');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001166640', 2024, 'Julio', 'Callao', 'Callao', 'La Perla', '2024-07-20', '2024-07-20', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-08-13', 24, 'Transigido', 'CERRADO', 'RVC'),
('1001166999', 2024, 'Julio', 'LIMA', 'Miraflores', null, '2024-07-21', '2024-07-21', 'GC', 1, 'Nilton Frank Medina Canchominia (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3500, 1500, '2024-08-01', 11, 'Transigido', 'CERRADO', 'Abeo'),
('1001167101', 2024, 'Julio', 'LIMA', 'Lince', null, '2024-07-22', '2024-07-22', 'GC', 1, 'John Joe Barriga Sanchez  (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3300, 1700, '2024-08-01', 10, 'Transigido', 'CERRADO', 'Abeo'),
('1001167392', 2024, 'Julio', 'Lima', 'Los Olivos', 'Sol de Oro', '2024-07-22', '2024-07-22', 'Pierina Ugaz', 1, 'Fractura de Costilla, Traumatismos Múltiples  y Traumatismo Intracraneal, un coágulo de la cabeza queda en UCI', 'Fractura de costillas', 10000, 'Grave', 12500, 3144.59, '2025-04-04', 256, 'Transigido', 'CERRADO', 'RVC'),
('1001167399', 2024, 'Julio', 'LIMA', 'San Borja', null, '2024-07-22', '2024-07-22', 'DS', 1, 'Fernando Anchorin Olazaval (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1000, 4000, '1970-01-01', -19926, 'Transigido', 'CERRADO', 'Abeo'),
('1001167870', 2024, 'Julio', 'LIMA', 'Pueblo Libre', null, '2024-07-24', '2024-07-24', 'JD', 1, 'Andrés Felipe Torero García (Politraumatizado / TEC Leve)', 'TEC Leve', 5750, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001168070', 2024, 'Julio', 'Lima', 'Los Olivos', 'Sol de Oro.', '2024-07-24', '2024-07-24', 'Pierina Ugaz', 3, '1.  Traumatismo superficial múltiple no especificado por accidente de tránsito quedando en observación.

2. Policontuso por accidente de tránsito, quedando en observación.

3. Policontuso por accidente de tránsito.', 'Politraumatizado', 12000, 'Grave', 6250, 1157, '2024-09-06', 44, 'Transigido', 'CERRADO', 'RVC'),
('1001168168', 2024, 'Julio', 'LIMA', 'Magdalena', null, '2024-07-24', '2024-07-24', 'OU', 1, 'María Haydee Veliz Barmiento y Fernando David Salvatierra Ordóñez (Esguince Cervical, TIC)', 'Esguince', 2300, 'Leve', 1500, 8500, '2024-07-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001168809', 2024, 'Julio', 'Lima', 'San Miguel', 'Maranga', '2024-07-25', '2024-07-25', 'Mario Pilares', 1, 'Esguince en tobillo Izquierdo de 2do Grado.', 'Esguince', 2300, 'Leve', 0, 10000, '2024-08-12', 18, 'Transigido', 'CERRADO', 'RVC'),
('1001168900', 2024, 'Julio', 'Lima', 'Cercado de Lima', 'Mirones Altos', '2024-07-25', '2024-07-25', 'Mario Pilares', 1, 'Esguince, torcedura de tobillo y dedos del pie, traumatismos superficiales múltiples', 'Politraumatizado', 4000, 'Leve', 1800, 4000, '2024-08-26', 32, 'Transigido', 'CERRADO', 'RVC'),
('1001169568', 2024, 'Julio', 'LIMA', 'Huaylas', null, '2024-07-27', '2024-07-27', 'DS', null, 'Daños materiales', 'Policontuso', 0, 'Leve', 0, 1500, '2026-07-27', 730, 'Transigido', 'CERRADO', 'Abeo'),
('1001169591', 2024, 'Julio', 'ICA', 'ICA', null, '2024-07-28', '2024-07-27', 'JOEL HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, null, '1970-01-01', -19932, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001169651', 2024, 'Julio', 'LIMA', 'San Juan de Miraflores', null, '2024-07-27', '2024-07-27', 'GC', 1, 'Jonathan Velasquez Velandía (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3000, 2000, '2024-08-15', 19, 'Transigido', 'CERRADO', 'Abeo'),
('1001169684', 2024, 'Julio', 'LIMA', 'Pamplona', null, '2024-07-27', '2024-07-27', 'DS', 1, 'Dayanna Fiorella Soto Olivera (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19931, 'Transigido', 'CERRADO', 'Abeo'),
('1001169911', 2024, 'Julio', 'Lima', 'Rímac', 'Ciudad del Campo', '2024-07-28', '2024-07-28', 'Mario Pilares', 1, 'Traumatismo de pie.', 'Policontuso', 1725, 'Leve', 2225, 4319, '2024-08-27', 30, 'Transigido', 'CERRADO', 'RVC'),
('1001170014', 2024, 'Julio', 'LIMA', 'San Isidro', null, '2024-07-28', '2024-07-28', 'DS', 1, 'Maycler Reder Cardenas Farfan (Policontuiso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-07-28', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001170121', 2024, 'Julio', 'LIMA', 'Sagitario', null, '2024-07-29', '2024-07-29', 'DS', 1, 'Anatolia Mejia Paredes (Fractura expuesta de dedo pulgar, Fractura de Pelvis y región sacro lumbrar)', 'Fractura de pelvis', 15000, 'Grave', 30000, 20000, '1970-01-01', -19933, 'Transigido', 'CERRADO', 'Abeo'),
('1001170319', 2024, 'Julio', 'LIMA', 'Surquillo', null, '2024-07-30', '2024-07-30', 'OU', 1, 'Rosalinda Awa Nisihara Vda. De Rodríguez (Politraumatismo, Trauma Pie)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001171726', 2024, 'Agosto', 'ANTA', 'LIMATAMBO', null, '2024-08-05', '2024-08-01', 'JOEL HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, 13050, '1970-01-01', -19940, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001171903', 2024, 'Agosto', 'LIMA', 'San Antonio', null, '2024-08-02', '2024-08-02', 'JD', 1, 'Nixon Alberto Nieto Manzanilla (28)', 'Policontuso', 1725, 'Leve', 120, 1880, '2024-08-03', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001171979', 2024, 'Agosto', 'AREQUIPA', 'UCHUMAYO', null, '2024-08-03', '2024-08-02', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001172460', 2024, 'Agosto', 'Lima', 'Independencia', 'Tahuantinsuyo', '2024-08-03', '2024-08-03', 'Pierina Ugaz', 1, 'Policontuso (contusion de antebrazo)', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-08-26', 23, 'Transigido', 'CERRADO', 'RVC'),
('1001172556', 2024, 'Agosto', 'LIMA', 'San Borja', null, '2024-08-04', '2024-08-04', 'JD', 1, 'Marcia Paula Torrejón Rueda (20 / Fabiola Ortiz Cuentas), Fabiola Ortiz Cuentas (Traumatismo Intracerebral y Síndrome de Latigazo), Raúl Alberto Gamboa Flores (41 / Policontuso), Katherine Vejarano Tribeño (Policontuso), Raúl Ignacio Gamboa Vejarano (07 / Policontuso), Dakota Catalina Gamboa Vejarano (5 / Policontuso).', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001173112', 2024, 'Agosto', 'LIMA', 'San Borja', null, '2024-08-05', '2024-08-05', 'OU', 1, 'Alexander Milar Julca Cordova (TEC, Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001173315', 2024, 'Agosto', 'LIMA', 'Pueblo Libre', null, '2024-08-06', '2024-08-06', 'OU', 1, 'Randy Steven Jiménez Lonzoy (Fractura Húmero Proximal Derecho) y Harold Justin Espinoza Jiménez (Contusión Rodilla Izquierda y Traumatismo Cuádriceps Izquierdo)', 'Policontuso', 1725, 'Leve', 0, 21500, '1970-01-01', -19941, 'Archivado', 'CERRADO', 'Abeo'),
('1001173423', 2024, 'Agosto', 'HUAROCHIRI', 'MATUCANA', null, '2024-08-08', '2024-08-06', 'JOEL HUAHUACONDORI', 12, 'Policontuso', 'Policontuso', 20700, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001173635', 2024, 'Agosto', 'CHUPACA', 'CHUPACA', null, '2024-08-07', '2024-08-07', 'JOEL HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, 1600, '1970-01-01', -19942, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001173951', 2024, 'Agosto', 'LIMA', 'San Borja', null, '2024-08-07', '2024-08-07', 'DS', 1, 'Fiorella Antonella Montes Boret (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001174475', 2024, 'Agosto', 'LIMA', 'San Borja', null, '2024-08-08', '2024-08-08', 'JD', 1, 'Diego Arturo Kuan Bonet ( TEC Moderado / Hematoma en la Cabeza / Policontuso)', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001174499 / 232731', 2024, null, null, null, null, '2024-08-08', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Rechazado', 'CERRADO', 'Chacon'),
('1001174665', 2024, 'Agosto', 'Lima', 'San Miguel', '(NO DENUNCIA)', '2024-08-08', '2024-08-08', 'Pierina Ugaz', 1, 'Contusión del tórax, rodilla y otros traumatismos  superficiales de lado anterior del tórax.', 'Policontuso', 1725, 'Leve', 400, 9600, '2024-09-08', 31, 'Transigido', 'CERRADO', 'RVC'),
('1001174805', 2024, 'Agosto', 'Lima', 'Cercado de Lima', 'Unidad vecinal mirones', '2024-08-09', '2024-08-09', 'Pierina Ugaz', 1, 'Fractura de tibia y peroné proximal derecho con compromiso articular.', 'Fractura de Peroné', 17250, 'Grave', 8000, 1020, '2024-12-10', 123, 'Transigido', 'CERRADO', 'RVC'),
('1001174837', 2024, 'Agosto', 'Lima', 'Jesus Maria', 'Jesus María', '2024-08-09', '2024-08-09', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito.', 'Policontuso', 1725, 'Leve', 1100, 148900, '2024-08-13', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001174956', 2024, 'Agosto', 'LIMA', 'Santa Felicia', null, '2024-08-08', '2024-08-08', 'DS', 1, 'Cristian Segundo Tapia Olaya (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001174964', 2024, 'Agosto', 'Chincha', 'Chincha', 'Chincha', null, '2024-08-02', 'Alejandro Rodríguez', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 300, '1970-01-01', null, 'Cerrado s/detalle', 'CERRADO', 'Alejandro'),
('1001175211', 2024, 'Agosto', 'Lima', 'Los Olivos', 'Sol de Oro', '2024-08-10', '2024-08-10', 'Pierina Ugaz', 1, 'Edema cerebral traumático', 'TEC Grave', 23000, 'Grave', 230, 29770, '2024-08-29', 19, 'Transigido', 'CERRADO', 'RVC'),
('1001175358', 2024, 'Agosto', 'Lima', 'Independencia', 'Independencia', '2024-08-10', '2024-08-10', 'Pierina Ugaz', 1, 'Contusión de muñeca y brazo izquierdo', 'Policontuso', 1725, 'Leve', 350, 19650, '2024-08-29', 19, 'Transigido', 'CERRADO', 'RVC'),
('1001175400', 2024, 'Agosto', 'Callao', 'Callao', 'La Perla.', '2024-08-10', '2024-08-10', 'Elizabeth Monzon', 1, 'TEC Leve', 'TEC Leve', 5750, 'Leve', 4000, 36000, '2024-10-30', 81, 'Transigido', 'CERRADO', 'RVC'),
('1001175685', 2024, 'Agosto', 'Lima', 'Ate', 'Salamanca', '2024-08-09', '2024-08-09', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito', 'Policontuso', 1725, 'Leve', 1000, 19000, '2024-08-16', 7, 'Transigido', 'CERRADO', 'RVC'),
('1001175804', 2024, 'Agosto', 'CARAVELI', 'ACHANIZO', null, '2024-08-11', '2024-08-11', 'JOEL HUAHUACONDORI', 2, 'Fractura de cadera + Policontuso', 'Fractura de cadera', 24000, 'Grave', null, 22500, null, null, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001175838', 2024, 'Agosto', 'Callao', 'Callao', 'La Perla', '2024-08-11', '2024-08-11', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito', 'Policontuso', 1725, 'Leve', 1200, 18800, '2024-08-16', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001175855', 2024, 'Agosto', 'CAÑETE', 'CERRO AZUL', null, '2024-08-10', '2024-08-10', 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Grave', 27000, null, '2024-12-05', 117, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001176107', 2024, 'Agosto', 'LIMA', 'Orrantia', null, '2024-08-12', '2024-08-12', 'DS', 1, 'Marisol Leonor Ponce de Leon Velando y Mariano Giorgio Urrutia Ponce de León  (Policontusos)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001176132', 2024, 'Agosto', 'LIMA', 'Chacarrilla', null, '2024-08-12', '2024-08-12', 'JD', 1, 'Osmary Mariana Blanco Moreno (25 / TEC Leve / Contusión en Cabeza / Corte en Cabeza / Politraumatizada)', 'TEC Leve', 5750, 'Leve', 4500, 500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001176135', 2024, 'Agosto', 'Lima', 'San Miguel', 'San Miguel', '2024-08-12', '2024-08-12', 'Micaela Solis', 4, '1: Policontuso

    2.-Policontuso

        3:  Policontuso 

            4: Policontuso', 'Policontuso', 6900, 'Grave', null, 50000, '2025-05-05', 266, 'Transigido', 'CERRADO', 'RVC'),
('1001176463', 2024, 'Agosto', 'LIMA', 'San Antonio', null, '2024-08-13', '2024-08-13', 'GC', 1, 'Pedro Huracacallo Atamari (Fractura de tibia)', 'Fractura de tibia', 17250, 'Grave', 20000, 15000, '1970-01-01', -19948, 'Judicializado', 'CERRADO', 'Abeo'),
('1001176826', 2024, 'Agosto', 'LIMA', 'Monterrico', null, '2024-08-13', '2024-08-13', 'DS', 1, 'Jeanpierre Quispe Perez (Politraumatizado, Traumatismos Múltiples quedando en observación)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001176950', 2024, 'Agosto', 'LIMA', 'Lince', null, '2024-08-14', '2024-08-14', 'JD', 1, 'José Antonio Abanto Valdivieso (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-08-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001177325', 2024, 'Agosto', 'LIMA', 'San Isidro', null, '2024-08-14', '2024-08-14', 'DS', 1, 'Christopher Rodas Jurado (Fractura en la Pierna)', 'Policontuso', 1725, 'Leve', 0, null, '2025-01-02', 141, 'Archivado', 'CERRADO', 'Abeo'),
('1001177670', 2024, 'Agosto', 'LIMA', 'Surquillo', null, '2024-08-15', '2024-08-15', 'OU', 1, 'Jorge Gaspar Chávez Figueroa (Traumatismo Pie y Tobillo Izquierdo)', 'Policontuso', 1725, 'Leve', 1054, 3946, '1970-01-01', -19950, 'Transigido', 'CERRADO', 'Abeo'),
('1001177806', 2024, 'Agosto', 'Lima', 'Los Olivos', 'Sol de oro.', '2024-08-15', '2024-08-15', 'Pierina Ugaz', 1, 'distensión del tobillo derecho', 'Torcedura', 3450, 'Leve', 0, 15000, '2025-03-06', 203, 'Transigido', 'CERRADO', 'RVC'),
('1001177853', 2024, 'Agosto', 'LIMA', 'Punta Negra', null, '2024-08-15', '2024-08-15', 'GC', 1, 'Zaida Mercedes Valladares Rogel (Fracturas de costillas)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001178024', 2024, 'Agosto', 'Callao', 'Callao', 'Carmen de la Legua y Reynoso', '2024-08-15', '2024-08-15', 'Micaela Solis', 4, '1:  Policontuso
 2:  Policontuso
3: Policontuso
 4:  Policontuso', 'Policontuso', 6900, 'Grave', 0, 45000, '2024-10-02', 48, 'Transigido', 'CERRADO', 'RVC'),
('1001178099', 2024, 'Agosto', 'LIMA', 'San Isidro', null, '2024-08-16', '2024-08-16', 'OU', 1, 'Luna Elvira Montalvan Aguirre (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001178134', 2024, 'Agosto', 'LIMA', 'Sagitario', null, '2024-08-16', '2024-08-16', 'GC', 1, 'Jean Piero Vargas Bravo (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19951, 'Transigido', 'CERRADO', 'Abeo'),
('1001178675', 2024, 'Agosto', 'Lima', 'Comas', 'UIAT Norte', '2024-08-18', '2024-08-18', 'Pierina Ugaz', 1, 'Persona sin signos vitales', 'Fallecido', 65000, 'Grave', 0, 80000, '2024-08-19', 1, 'Rechazado', 'CERRADO', 'RVC'),
('1001178759', 2024, 'Agosto', 'LIMA', 'Miraflores', null, '2024-08-18', '2024-08-18', 'GC', 1, 'Alicia Edid Linares Carbajal (Esguince de Tobillo)', 'Esguince', 2300, 'Leve', 0, null, '2024-09-23', 36, 'En Evaluación', 'CERRADO', 'Abeo'),
('1001178951', 2024, 'Agosto', 'LIMA', 'Laderas de Villa', null, '2024-08-19', '2024-08-19', 'GC', 1, 'Filemon Jacob Espinoza Maggino (Esguince y torcedura de la columna vertebral.', 'Torcedura', 3450, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001179299', 2024, null, null, null, null, '2024-08-19', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('1001179564', 2024, 'Agosto', 'Huaura', 'Huaura', 'Huaura', null, '2024-08-20', 'Alejandro Rodríguez', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Alejandro'),
('1001179779', 2024, 'Agosto', 'Lima', 'Sta. Anita', 'Santa Anita', '2024-08-20', '2024-08-20', 'Pierina Ugaz', 2, '1.- Policontusa  2.- Policontusa', 'Policontuso', 3450, 'Grave', 7400, 5277.8, '2025-01-20', 153, 'Transigido', 'CERRADO', 'RVC'),
('1001179878', 2024, 'Agosto', 'LIMA', 'Lince', null, '2024-08-20', '2024-08-20', 'JD', 1, 'Lizeth Tanicuprima Sajaiti (32 / Politraumatizada), César Alfredo Rivadeneyra Tanicuprima (7 meses / Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1001180048', 2024, 'Agosto', 'LIMA', 'Sagitario', null, '2024-08-21', '2024-08-21', 'JD', 1, 'Miguel Ángel Anzualdo Trejo (22 / Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001180252', 2024, 'Agosto', 'LIMA', 'Lurin', null, '2024-08-21', '2024-08-21', 'GC', 1, 'Kety LIsbeth Rosales (Policontusa)', 'Policontuso', 1725, 'Leve', 0, null, '2024-08-25', 4, 'Archivado', 'CERRADO', 'Abeo'),
('1001150680', 2024, 'Junio', 'LIMA', 'Magdalena', null, '2024-06-13', '2024-06-13', 'GC', 1, 'Gonzalo Alejandro Sanchez Villanueva  (No registro atención médica)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Daño Material', 'CERRADO', 'Abeo'),
('1001181932', 2024, 'Agosto', 'LIMA', 'Orrantia', null, '2024-08-25', '2024-08-25', 'DS', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001181985', 2024, 'Agosto', 'LIMA', 'Sagitario', null, '2024-08-25', '2024-08-25', 'GC', 1, 'Esthefania Alejandra Navarro Vincent (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 2000, 3000, '2024-09-09', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1001182069', 2024, null, null, null, null, '2024-08-25', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'En Investigación', 'CERRADO', 'Chacon'),
('1001182166', 2024, 'Agosto', 'LIMA', 'San Borja', null, '2024-08-26', '2024-08-26', 'OU', 1, 'Lisseth Andreina Perotti Maestre (Cervicalgia)', 'Cervicalgia', 2300, 'Leve', 0, 5000, '1970-01-01', -19961, 'Archivado', 'CERRADO', 'Abeo'),
('1001183764', 2024, 'Agosto', 'LIMA', 'San Isidro', null, '2024-08-29', '2024-08-29', 'GC', 1, 'William Silva Calvay (Policontuso)', 'Policontuso', 1725, 'Leve', 400, 1100, '2024-08-29', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001183836', 2024, 'Agosto', 'LIMA', 'La Molina', null, '2024-08-29', '2024-08-29', 'DS', 1, 'Erik Edson Estrada Ortiz (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001183964', 2024, 'Agosto', 'LIMA', 'Miraflores', null, '2024-08-29', '2024-08-29', 'DS', 1, 'Fernando Calla Apaza (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3000, null, '2025-04-09', 223, 'Transigido', 'CERRADO', 'Abeo'),
('1001184120', 2024, 'Agosto', 'MARISCAL NIETO', 'MOQUEGUA', null, '2024-08-30', '2024-08-29', 'JOEL HUAHUACONDORI', 2, 'TEC Leve + Politraumatizado + Policontuso + Perdida total + perdida de ojo', 'TEC Leve', 11500, 'Grave', 80000, null, '2024-10-04', 35, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001184123', 2024, 'Agosto', 'Lima', 'SJL', 'Santa Elizabeth', '2024-08-29', '2024-08-29', 'Micaela Solis', 2, '1:  Policontusa  
2. Cráneo radiológicamente conservado

·', 'Policontuso', 3450, 'Leve', 0, 25000, '2024-12-24', 117, 'Transigido', 'CERRADO', 'RVC'),
('1001152277', 2024, 'Junio', 'LIMA', 'San Borja', null, '2024-06-18', '2024-06-18', 'DS', 2, 'Hector Roca Fernandez y Norma Roca Fernandez (Fractura)', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001184300', 2024, 'Agosto', 'LIMA', 'Magdalena', null, '2024-08-30', '2024-08-30', 'GC', 1, 'Alma Jazmin Mendoza Flores (Contusión cervical)', 'Policontuso', 1725, 'Leve', 0, null, '2024-09-27', 28, 'En Evaluación', 'CERRADO', 'Abeo'),
('1001184330', 2024, 'Agosto', 'LIMA', 'Chorrillos', null, '2024-08-30', '2024-08-30', 'OU', 1, 'Sofía Mateo Meza (10 / Policontuso)', 'Policontuso', 1725, 'Leve', 0, 2000, '1970-01-01', -19965, 'Archivado', 'CERRADO', 'Abeo'),
('1001184355', 2024, 'Agosto', 'LIMA', 'San Borja', null, '2024-08-30', '2024-08-30', 'OU', 1, 'Nicole Gonzalez Canales, Daniela Quijandría Peñaranda, Seneca Claudia Davalos Baca, Maria José Quijandría Peñaranda (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001184622', 2024, null, null, null, null, '2024-08-31', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('1001184644', 2024, 'Agosto', 'LIMA', 'Lince', null, '2024-08-31', '2024-08-31', 'GC', 1, 'Fredy Cesar Ortiz Zegarra (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 400, 4600, '2024-09-03', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001184844', 2024, 'Septiembre', 'Callao', 'Callao.', 'Bellavista', '2024-09-01', '2024-09-01', 'Pierina Ugaz', 2, '1.-  Policontuso

·   2.-   Policontuso TEC

·', 'TEC Leve', 11500, 'Grave', 6050, 13490, '2024-10-30', 59, 'Transigido', 'CERRADO', 'RVC'),
('1001184971', 2024, 'Septiembre', 'LIMA', 'Santa Felicia', null, '2024-09-02', '2024-09-02', 'JD', 1, 'Ghinna Edith Chamorro Fabián (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001184977', 2024, 'Septiembre', 'Chimbote', 'Chimbote', 'Chimbote', null, '2024-09-02', 'Alejandro Rodríguez', 1, 'TEC Moderado + Policontuso', 'TEC Moderado', 11500, 'Grave', null, 1900, '1970-01-01', null, 'Cerrado s/detalle', 'CERRADO', 'Alejandro'),
('1001184997', 2024, 'Septiembre', 'LIMA', 'San Antonio', null, '2024-09-02', '2024-09-02', 'GC', 1, 'Walter Romero Hoyos (Politraumatismo, Fractura en Humero Izquierdo, Fractura de Pelvis)', 'Fractura de pelvis', 15000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001185179', 2024, 'Septiembre', 'Lima', 'Comas', 'Universitaria.', '2024-09-02', '2024-09-02', 'Maritza Nizama', 2, '1.-  Policontuso
2.- Policontuso', 'Policontuso', 3450, 'Leve', 0, 40000, '2024-09-24', 22, 'Transigido', 'CERRADO', 'RVC'),
('1001185212', 2024, 'Septiembre', 'Callao', 'Callao', 'Ciudad del Pescador.', '2024-09-02', '2024-09-02', 'Pierina Ugaz', 1, 'Sin diagnóstico', 'Policontuso', 1725, 'Leve', 0, 20000, '2024-09-05', 3, 'Transigido', 'CERRADO', 'RVC'),
('1000947483', 2023, 'Marzo', 'LIMA', 'SMP', 'San Martin de Porres', '2023-03-30', '2023-03-30', 'Pierina Ugaz', 3, 'Policontuso, descarte de huesos de la nariz / TEC moderado, trauma toraco abdominal cerrado, fractura de femur derecho, fractura costal y laterales / Policontuso, sindrome de latigazo', 'Fractura de fémur', 69000, 'Grave', null, 20000, '2026-06-03', 1161, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001185435', 2024, 'Septiembre', 'Lima', 'San Miguel.', 'Maranga', '2024-09-03', '2024-09-03', 'Micaela Solis', 2, '1. Contusión de tórax por accidente de tránsito.

2.  Esguince cervical región frontal y policontuso por accidente de tránsito.', 'Cervicalgia', 4600, 'Leve', 0, 35000, '2026-03-24', 567, 'Transigido', 'CERRADO', 'RVC'),
('1001185916', 2024, 'Septiembre', 'Lima', 'Breña', 'Chacra Colorada- Breña', '2024-09-03', '2024-09-03', 'Micaela Solis', 2, '1.-Contusión de rodilla izquierda y lumbar

2.-  Policontuso

·', 'Policontuso', 3450, 'Leve', 0, 25000, '2024-09-28', 25, 'Transigido', 'CERRADO', 'RVC'),
('1001186430', 2024, 'Septiembre', 'LIMA', 'San Borja', null, '2024-09-04', '2024-09-04', 'DS', 1, 'Daniel Zuasnabad Alvarez (Esguince de muñeca)', 'Esguince', 2300, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001186932', 2024, 'Septiembre', 'LIMA', 'Barranco', null, '2024-09-05', '2024-09-05', 'JD', 1, 'Gabriel David Marbal Lorenzo (TEC Moderado)', 'TEC Moderado', 11500, 'Grave', 1000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001187248', 2024, 'Septiembre', 'LIMA', 'Lince', null, '2024-09-06', '2024-09-06', 'JD', 1, 'Héctor Junior Bartolo Modesto (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001187353', 2024, 'Septiembre', 'LIMA', 'Monterrico', null, '2024-09-06', '2024-09-06', 'DS', 1, 'Henrry Yefferson Cantalicio Garcia (Traumatismo Intracraneal)', 'Policontuso', 1725, 'Leve', 1000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001187355', 2024, 'Septiembre', 'Lima', 'Cercado de Lima', 'Palomino', '2024-09-06', '2024-09-06', 'Maritza Nizama', 0, 'No se registró en el acta policial.', 'Policontuso', 0, 'Leve', 0, 5000, '2024-11-28', 83, 'Daño Material', 'CERRADO', 'RVC'),
('1001187459', 2024, 'Septiembre', 'LIMA', 'Lurin', null, '2024-09-06', '2024-09-06', 'GC', 1, 'Olalo Mauricio Limas Navarro (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001187538', 2024, 'Septiembre', 'AREQUIPA', 'SACHACA', null, '2024-09-06', '2024-09-06', 'RUTH HUAHUACONDORI', 2, 'TEC Leve + Policontuso', 'TEC Leve', 11500, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001187567', 2024, 'Septiembre', 'ESPINAR', null, null, '2024-09-07', '2024-09-07', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001187610', 2024, 'Septiembre', 'CHANCHAMAYO', 'LA MERCED', null, '2024-09-07', '2024-09-07', 'JOEL HUAHUACONDORI', 1, 'Fractura de Peroné', 'Fractura de Peroné', 17250, 'Grave', null, 4100, '1970-01-01', -19973, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001187729', 2024, 'Septiembre', 'Lima', 'La Victoria', 'La Victoria', '2024-09-07', '2024-09-07', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-09-10', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001187841', 2024, 'Septiembre', 'LIMA', 'Miraflores', null, '2024-09-07', '2024-09-07', 'OU', 1, 'Oswaldo Francisco Petrovic Hernández (Fractura Platillo Tibial Izquierdo)', 'Policontuso', 1725, 'Grave', 20000, 20000, '2024-12-13', 97, 'Transigido', 'CERRADO', 'Abeo'),
('1001187892', 2024, 'Septiembre', 'LIMA', 'Curva de Villa', null, '2024-09-08', '2024-09-08', 'OU', 2, 'Andrid Javier Bravo Colmenares (Fractura Fémur Derecho, TEC, Policontuso) y Roxana Carolina Santos Ferreira (Policontuso)', 'Policontuso', 3450, 'Grave', 10000, 10000, '2024-10-16', 38, 'Transigido', 'CERRADO', 'Abeo'),
('1001187992', 2024, 'Septiembre', 'AREQUIPA', 'PAUCARPATA', null, '2024-09-08', '2024-09-08', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 520, '1970-01-01', -19974, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001188567', 2024, 'Septiembre', 'LIMA', 'Surco', null, '2024-09-09', '2024-09-09', 'GC', 1, 'Jhoger Jesus Luque Bello  (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 800, 800, '2024-09-14', 5, 'Transigido', 'CERRADO', 'Abeo'),
('1001188814', 2024, 'Septiembre', 'LIMA', 'Surquillo', null, '2024-09-10', '2024-09-10', 'GC', 1, 'Luis Felipe Soto Ricci (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 850, 850, '2024-09-10', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001189309', 2024, 'Septiembre', 'Chincha', 'Chincha', 'Chincha', null, '2024-09-10', 'Alejandro Rodríguez', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, '1970-01-01', null, 'Cerrado s/detalle', 'CERRADO', 'Alejandro'),
('1001189325', 2024, 'Septiembre', 'LIMA', 'San Antonio', null, '2024-09-11', '2024-09-11', 'JD', 1, 'Eddi Alonso Artica Salazar (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 100, 100, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001189406', 2024, 'Septiembre', 'PADRE ABAD', 'NESHUYA', null, '2024-09-11', '2024-09-11', 'JOEL HUAHUACONDORI', 2, 'Policontuso y corte', 'Policontuso y corte', 4600, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001189428', 2024, 'Septiembre', 'LIMA', 'Miraflores', null, '2024-09-11', '2024-09-11', 'DS', 1, 'Eduardo Aguayo Ugaz (TEC Moderado, Policontuso, Herida Contuzo en el Cuero Cabelludo, Herida Auricular derecha, Esguince Cervical)', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001189439', 2024, 'Septiembre', 'LIMA', 'Villa', null, '2024-09-11', '2024-09-11', 'JD', 1, 'Sofia Vanessa Deyvis (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001189857', 2024, 'Septiembre', 'LIMA', 'Barranco', null, '2024-09-12', '2024-09-12', 'GC', 1, 'Ernesto José Chávez Escalona (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001190330', 2024, 'Septiembre', 'LIMA', 'Miraflores', null, '2024-09-13', '2024-09-13', 'OU', 1, 'J.J.C.S. (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001190538', 2024, 'Septiembre', 'AREQUIPA', 'MARIANO MELGAR', null, '2024-09-13', '2024-09-13', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 5150, '1970-01-01', -19979, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001190571', 2024, 'Septiembre', 'LIMA', 'Miraflores', null, '2024-09-13', '2024-09-13', 'OU', 1, 'Wilder Jeferson Hinostroza Choque (Trauma tobillo derecho)', 'Policontuso', 1725, 'Leve', 172, 172, '2024-09-13', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001190575', 2024, 'Septiembre', 'LIMA', 'San Antonio', null, '2024-09-13', '2024-09-13', 'GC', 1, 'Juan Homar Ortiz Suyo (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1500, 1500, '2024-09-19', 6, 'Transigido', 'CERRADO', 'Abeo'),
('1001190714', 2024, 'Septiembre', 'LIMA', 'San Borja', null, '2024-09-14', '2024-09-14', 'JD', 2, 'Luis Fernando Alache Palacios (Politraumatizado), Milagros Cahuana Huayana (Fractura  de Costillas)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001190863', 2024, 'Septiembre', 'LIMA', 'San Isidro', null, '2024-09-14', '2024-09-14', 'DS', 2, 'Maria del Carmen Garcia Burga y Donalda Burga Malca (Policontusas)', 'Policontuso', 3450, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001191111', 2024, 'Septiembre', 'LIMA', 'Santa Felicia', null, '2024-09-15', '2024-09-15', 'JD', 2, 'Axel Raúl Elespuru Reyes (Politraumatizado), Diana Carolina Barrón Liñan ( Fractura Expuesta Pierna Derecha / Fractura Pierda Izquierda)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001191170', 2024, 'Septiembre', 'LIMA', 'Las Praderas', null, '2024-09-15', '2024-09-15', 'DS', 1, 'Joel Peña (Fractura en la pierna)', 'Policontuso', 1725, 'Leve', 4000, 4000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001191207', 2024, 'Septiembre', 'LIMA', 'Pueblo Libre', null, '2024-09-16', '2024-09-16', 'GC', 1, 'Axcer Americo Rodriguez Sanddoval (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2024-11-16', 61, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001191317', 2024, 'Septiembre', 'Lima', 'La Victoria', 'Apolo', '2024-09-16', '2024-09-16', 'Pierina Ugaz', 1, 'Golpe en el brazo izquierdo', 'Policontuso', 1725, 'Leve', 200, 9800, '2024-09-19', 3, 'Transigido', 'CERRADO', 'RVC'),
('100119142', 2024, 'Octubre', 'LIMA', 'Chacarrilla', null, '2024-10-03', '2024-10-03', 'GC', 1, 'Melvis Anderson Gonzales (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001191830', 2024, 'Septiembre', 'Lima', 'Callao', 'Cuidadela Chalaca', '2024-09-16', '2024-09-16', 'Mario Pilares', 2, '1. Policontuso                    2.- Policontuso', 'Policontuso', 3450, 'Grave', 17300, 6221, '2024-11-19', 64, 'Transigido', 'CERRADO', 'RVC'),
('1001191854', 2024, 'Septiembre', 'LIMA', 'Villa Alejandro', null, '2024-09-17', '2024-09-17', 'DS', 1, 'Rina Lorena Ruiz Chavez (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001191892', 2024, 'Septiembre', 'Lima', 'El Agustino', 'Santoyo', '2024-09-17', '2024-09-17', 'Pierina Ugaz', 1, 'Contusión +Esquince Acromio clavicular izquierdo.               Fractura de Manubrio Esternal. Pendiente la interconsulta con cirugía           de tórax. Herida suturada en la región temporal izquierda, en forma de T.', 'Policontuso', 1725, 'Grave', 10000, 1270, '2025-02-20', 156, 'Transigido', 'CERRADO', 'RVC'),
('1001191982', 2024, 'Septiembre', 'LIMA', 'Las Praderas', null, '2024-09-17', '2024-09-17', 'JD', 1, 'Rosa Floria Zorilla Morris (Fractura de Rótula de Rodilla Izquierda)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001192083', 2024, 'Septiembre', 'LIMA', 'San Borja', null, '2024-09-17', '2024-09-17', 'JD', 1, 'Martha Vara Lara (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001192179', 2024, 'Septiembre', 'Lima', 'Callao', 'Ciudadela Chalaca', '2024-09-17', '2024-09-17', 'Pierina Ugaz', 2, '1. Policontuso                    2.- No dx', 'Policontuso', 3450, 'Leve', 0, 25000, '2025-04-04', 199, 'Transigido', 'CERRADO', 'RVC'),
('1001192272', 2024, 'Septiembre', 'Lima', 'Santa Anita', 'Santa Anita', '2024-09-18', '2024-09-18', 'Pierina Ugaz', 1, 'TEC leve', 'TEC Leve', 5750, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001192292', 2024, 'Septiembre', 'Lima', 'El Agustino', 'Santoyo', '2024-09-18', '2024-09-18', 'Maritza Nizama', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, '2024-09-18', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001193248', 2024, 'Septiembre', 'LIMA', 'San Antonio', null, '2024-09-19', '2024-09-19', 'JD', 1, 'Jean Carlos Espinoza Viloria (Fractura Meñique Mano Izquierda)', 'Policontuso', 1725, 'Leve', 3680, 3680, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001193412', 2024, 'Septiembre', 'LIMA', 'Surco', null, '2024-09-19', '2024-09-19', 'DS', 1, 'Emely Nohemi Figueroa Arroyo (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001193557', 2024, 'Septiembre', 'LIMA', 'Chacarrilla', null, '2024-09-20', '2024-09-20', 'JD', 1, 'William Alexander Zavaleta Saenz (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001193743', 2024, 'Septiembre', 'Lima', 'Lince', 'Petit Thuars', '2024-09-20', '2024-09-19', 'Pierina Ugaz', 1, 'traumatismo superficial no especificado del hombre y del brazo .', 'Policontuso', 1725, 'Leve', 680, 418, '2024-11-26', 67, 'Transigido', 'CERRADO', 'RVC'),
('1001193830', 2024, 'Septiembre', 'Lima', 'Jesús María', 'Jesús María', '2024-09-21', '2024-09-20', 'Pierina Ugaz', 1, 'Laceraciones múltiples.', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-03-21', 181, 'Daño Material', 'CERRADO', 'RVC'),
('1001193925', 2024, 'Septiembre', 'LIMA', 'San Juan de Miraflores', null, '2024-09-21', '2024-09-21', 'DS', 1, 'Bett Aurea Fernandez de Ruiz (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001181100', 2024, 'Agosto', 'Chincha', 'Grocio Prado', 'Grocio Prado', null, '2024-08-22', 'Alejandro Rodríguez', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('1001194333', 2024, 'Septiembre', 'Lima', 'Jesús María', 'Jesús María', '2024-09-23', '2025-09-23', 'Pierina Ugaz', 1, 'Fractura de Cadera', 'Fractura de cadera', 12000, 'Grave', null, 35000, '1970-01-01', -19989, 'En Negociación', 'ABIERTO', 'RVC'),
('1001194386', 2024, 'Septiembre', 'LIMA', 'San Juan de Miraflores', null, '2024-09-22', '2024-09-22', 'DS', 1, 'Francisco Javeir Arabia Acevedo (Esguince de Rodilla)', 'Esguince', 2300, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001194571', 2024, 'Septiembre', 'LIMA', 'Lince', null, '2024-09-22', '2024-09-22', 'JD', 1, 'Bryan Ruiz Figueroa (Fractura 3ro, 4to y 5to Metatarsiano Pie Derecho y 5to Metatarsiano Mano Derecha)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001194989', 2024, 'Septiembre', 'LIMA', 'Miraflores', null, '2024-09-23', '2024-09-23', 'DS', 1, 'Gonzalo Clever Corrales Hermoza (Herida cortante en el Brazo, Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001194995', 2024, 'Septiembre', 'Lima', 'Calloa', 'Bellavista', '2024-09-23', '2024-09-23', 'Pierina Ugaz', 1, 'Politraumatizado.', 'Politraumatizado', 4000, 'Leve', 2650, 2462, '2025-01-24', 123, 'Transigido', 'CERRADO', 'RVC'),
('1001195010', 2024, 'Septiembre', 'LIMA', 'San Isidro', null, '2024-09-23', '2024-09-23', 'JD', 1, 'Pedro Josue Huamán Andrade (Esguince Tobillo Derecho)', 'Esguince', 2300, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('100118422', 2024, 'Agosto', 'LIMA', 'Monterrico', null, '2024-08-30', '2024-08-30', 'GC', 1, 'Jerson Bravo Vargas Gongora (Fractura de mano)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001195025', 2024, 'Septiembre', 'LIMA', 'Lince', null, '2024-09-24', '2024-09-24', 'JD', 1, 'Frank José Navarro Carhuancho (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001195372', 2024, 'Agosto', 'ISLAY', 'ISLAY', null, '2024-08-10', '2024-08-10', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19945, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001195532', 2024, 'Septiembre', 'AREQUIPA', 'YANAHUARA', null, '2024-09-25', '2024-09-25', 'RUTH HUAHUACONDORI', 1, 'Esguince', 'Esguince', 2300, 'Leve', null, null, null, null, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001195615', 2024, 'Septiembre', 'LIMA', 'Surquillo', null, '2024-09-25', '2024-09-25', 'OU', 1, 'Roger Edgardo Evangelista Huaman (Politraumatismo, TEC)', 'Politraumatizado', 4000, 'Leve', 500, 500, '2024-09-26', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001195680', 2024, 'Septiembre', 'Lima', 'Vitarte', 'Vitarte', '2024-09-25', '2024-09-25', 'Maritza Nizama', 1, 'Traumatismo superficial múltiple, no     especificado.', 'Politraumatizado', 4000, 'Leve', 0, 20000, '2024-10-28', 33, 'Transigido', 'CERRADO', 'RVC'),
('1001195749', 2024, 'Septiembre', 'LIMA', 'San Luis', null, '2024-09-25', '2024-09-25', 'GC', 1, 'Armando Tesorero Acosta (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, null, '2024-11-13', 49, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001196171', 2024, 'Septiembre', 'LIMA', 'Chacarilla', null, '2024-09-26', '2024-09-26', 'GC', 1, 'Edwin Manuel Bazan Moreno (Policontuso)', 'Policontuso', 1725, 'Leve', 600, 600, '2024-09-27', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001196449', 2024, 'Septiembre', 'LIMA', 'Chorrillos', null, '2024-09-27', '2024-09-27', 'DS', 1, 'Eder Jhair Veliz Bravo (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 900, 900, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001196646', 2024, 'Septiembre', 'Lima', 'Lima', 'Petit Thouars.', '2024-09-27', null, 'Pierina Ugaz', 2, 'Policontuso, traumatismo múltiple.', 'Politraumatizado', 8000, 'Grave', 0, 25000, '2024-11-20', 54, 'Transigido', 'CERRADO', 'RVC'),
('1001196813', 2024, 'Septiembre', 'Lima', 'Breña', 'Breña', '2024-09-27', '2024-09-27', 'Maritza Nizama', 1, 'Fractura', 'Policontuso', 1725, 'Grave', 13500, 21500, '2025-02-27', 153, 'Transigido', 'CERRADO', 'RVC'),
('1001197285', 2024, 'Septiembre', 'Lima', 'SMP', 'San Martín de Porres', '2024-09-29', '2024-09-29', 'Maritza Nizama', 2, 'Politraumatizado.', 'Politraumatizado', 8000, 'Grave', 0, 25000, '2025-03-12', 164, 'Transigido', 'CERRADO', 'RVC'),
('1001197484', 2024, 'Septiembre', 'LIMA', 'San Borja', null, '2024-09-30', '2024-09-30', 'JD', 1, 'Indira Gabriela Saaravia Samanamú (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001197508', 2024, 'Septiembre', 'Lima', 'Lima', 'Cotabambas', '2024-09-30', '2024-09-30', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 600, 19400, '2024-10-10', 10, 'Transigido', 'CERRADO', 'RVC'),
('1001197778', 2024, 'Septiembre', 'LIMA', 'Las Praderas', null, '2024-09-30', '2024-09-30', 'GC', 1, 'Gabriel Antonio Lachira Huillahuari (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, null, '2024-10-22', 22, 'En Evaluación', 'CERRADO', 'Abeo'),
('1001197782', 2024, 'Septiembre', 'LIMA', 'Chacarilla', null, '2024-09-30', '2024-09-30', 'OU', 1, 'Johnny Pool Castillo Polo (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 700, 700, '2024-09-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001197982', 2024, 'Octubre', 'LIMA', 'San Antonio', null, '2024-10-01', '2024-10-01', 'OU', 1, 'Zoe Fiol Maldonado (Fractura Dedo Mano Derecha)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-10-01', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001198462', 2024, 'Octubre', 'Lima', 'Lima', 'Monserrat', '2024-10-02', '2024-10-02', 'Pierina Ugaz', 1, 'Policontuso y fractura de muñeca quedando en observación', 'Fractura de muñeca', 17250, 'Grave', 1800, 23200, '2024-12-11', 70, 'Transigido', 'CERRADO', 'RVC'),
('1001199678', 2024, 'Octubre', 'Lima', 'La Victoria.', 'La Victoria.', '2024-10-04', '2024-10-04', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 5000, '2024-10-07', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001194211', 2024, 'Septiembre', 'LIMA', 'Miraflores', null, '2024-09-21', '2024-09-21', 'JD', 1, 'Ximena Verónica Gimenez Salazar (Fractura Tobillo Derecho)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001199725', 2024, 'Octubre', 'Lima', 'Lima', 'San Andrés', '2024-10-04', '2024-10-04', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-11-25', 52, 'Transigido', 'CERRADO', 'RVC'),
('1001199818', 2024, 'Octubre', 'LIMA', 'San Isidro', null, '2024-10-04', '2024-10-04', 'OU', 1, 'Diana Elizabeth Sauceso Pantaleón (Policontuso, Herida Rodilla)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-10-04', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001199950', 2024, 'Octubre', 'LIMA', 'Santa Felicia', null, '2024-10-05', '2024-10-05', 'OU', 1, 'Ricardo Adolfo Soria López (Fractura Muñeca, Politraumatismo, Herida Pierna Izquierda)', 'Politraumatizado', 4000, 'Leve', 5500, 5500, '2024-10-17', 12, 'Transigido', 'CERRADO', 'Abeo'),
('1001200153', 2024, 'Octubre', 'LIMA', 'Chacarrilla', null, '2024-10-05', '2024-10-05', 'GC', 1, 'Soyher Saul Saromo Salazar (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, '2024-11-11', 37, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001200251', 2024, 'Octubre', 'LIMA', 'Lince', null, '2024-10-05', '2024-10-05', 'DS', 1, 'Jarol Sinahy Oliveros Lugo (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001200304', 2024, 'Octubre', 'Lima', 'Ate.', 'Salamanca.', '2024-10-05', '2024-10-05', 'Maritza Nizama', 1, 'Policontuso en pierna izquierda y cadera', 'Policontuso', 1725, 'Leve', 1070, 13930, '2024-11-08', 34, 'Transigido', 'CERRADO', 'RVC'),
('1001200446', 2024, 'Octubre', 'LIMA', 'Orrantia', null, '2024-10-06', '2024-10-06', 'GC', 2, 'Joysi Yajaira Zevallos Hurayari y Edith Clarivet Tejada Kueconamuy (Policontuso)', 'Policontuso', 3450, 'Leve', 0, null, '2024-11-19', 44, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001200582', 2024, 'Octubre', 'LIMA', 'San Antonio', null, '2024-10-06', '2024-10-06', 'OU', 1, 'Pablo Wilfredo Vasquez Poma (Fractura Pie)', 'Policontuso', 1725, 'Grave', 10000, 10000, '2024-11-11', 36, 'Transigido', 'CERRADO', 'Abeo'),
('1001201326', 2024, 'Octubre', 'BARRANCA', 'PATIVILCA', null, '2024-10-11', '2024-10-07', 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001201393', 2024, 'Octubre', 'LAURICOCHA', 'JESUS', null, '2024-10-06', '2024-10-06', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001201724', 2024, 'Octubre', 'LIMA', 'Surco', null, '2024-10-09', '2024-10-09', 'DS', 1, 'Kathia Yadira Dunes Garcia (Esguince Cervical)', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001201773', 2024, 'Octubre', 'LIMA', 'Orrantia', null, '2024-10-09', '2024-10-09', 'JD', 1, 'Narela Quispe Quispe (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001201869', 2024, 'Octubre', 'LIMA', 'Surquillo', null, '2024-10-14', '2024-10-14', 'DS', 2, 'Japo Yaki Uraco Ubidia (Atricción en tercer y cuarto dedo de la mano izquierda, fractura distal del tercer dedo de la mano) y Abighail Yaylu Vasquez Uraco (Policontusa)', 'Policontuso', 3450, 'Leve', 3000, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001201884', 2024, 'Octubre', 'LIMA', 'Miraflores', null, '2024-10-09', '2024-10-09', 'DS', 1, 'Rocio Bentes Sotomayor (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001202529', 2024, 'Octubre', 'Lima', 'Comas', 'Santa Luzmila', '2024-10-10', '2024-10-10', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-03-04', 145, 'Transigido', 'CERRADO', 'RVC'),
('1001202863', 2024, 'Octubre', 'LIMA', 'Sagitario', null, '2024-10-11', '2024-10-11', 'OU', 1, 'Sofia Estefania Egüés Cuaresmayo - Politraumatismo (Pie y Tobillo)', 'Policontuso', 1725, 'Leve', 2200, 2200, '2024-10-11', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001202888', 2024, 'Octubre', 'LIMA', 'San Isidro', null, '2024-10-11', '2024-10-11', 'GC', 1, 'Jeremy Miguel Valdivia Correa (Politraumatizado y Cervicalgia)', 'Politraumatizado y Cervicalgia', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001203153', 2024, 'Octubre', 'Lima', 'San Miguel', 'San Miguel', '2024-10-12', '2024-10-12', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2200, 2010, '2025-03-31', 170, 'Transigido', 'CERRADO', 'RVC'),
('1001203266', 2024, 'Octubre', 'LIMA', 'Surco', null, '2024-10-12', '2024-10-12', 'GC', 1, 'Manuel Fortunato Segura Sarmiento(Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, '2024-10-14', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001203282', 2024, 'Octubre', 'Lima', 'San Miguel', 'San Miguel', '2024-10-12', '2024-10-12', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1444.65, 1120, '2024-11-19', 38, 'Transigido', 'CERRADO', 'RVC'),
('1001203686', 2024, 'Octubre', 'Lima', 'Independencia.', 'Independencia.', '2024-10-14', '2024-10-14', 'Maritza Nizama', 1, 'TEC leve', 'TEC Leve', 5750, 'Leve', 5500, 6463, '2025-03-28', 165, 'Transigido', 'CERRADO', 'RVC'),
('1001203856', 2024, 'Octubre', 'LIMA', 'Chacarrilla', null, '2024-10-14', '2024-10-14', 'DS', 1, 'Luis Miguel  Sausa Noriega (TEC Moderado)', 'TEC Moderado', 11500, 'Grave', 15000, 15000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001203953', 2024, 'Octubre', 'Callao', 'Callao', 'Ingunza', '2024-10-14', '2024-10-14', 'Pierina Ugaz', 2, 'TEC leve y Esguince', 'TEC Leve', 11500, 'Grave', 9500, 3980, '2024-11-27', 44, 'Transigido', 'CERRADO', 'RVC'),
('1001203961', 2024, 'Octubre', 'LIMA', 'La Molina', null, '2024-10-14', '2024-10-14', 'JD', 1, 'Aldo Cárdenas Huancari (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1500, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001195022', 2024, 'Septiembre', 'LIMA', 'San Borja', null, '2024-09-23', '2024-09-23', 'OU', 2, 'Patricia Milagros Aparicio Vargas (Contusiones Múltiples, Trauma Nariz) y Rocío Elizabeth Napaico Meza (Contusiones Múltiples, Trauma Cabeza)', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001204343', 2024, 'Octubre', 'Lima', 'Lima', 'Jesús Maria', '2024-10-14', '2024-10-14', 'Maritza Nizama', 1, 'Tec moderado politraumatizado', 'TEC Moderado', 11500, 'Grave', 0, 15000, '2024-10-21', 7, 'Transigido', 'CERRADO', 'RVC'),
('1001204225', 2024, 'Octubre', 'AREQUIPA', 'SACHACA', null, '2024-10-14', '2024-10-14', 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001204587', 2024, null, null, null, null, '2024-10-14', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 3500, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001211531', 2024, 'Octubre', 'LIMA', 'Santa Felicia', null, '2024-10-29', '2024-10-29', 'OU', 1, 'Roberto Manuel Cortez Zegarra (Fractura Tobillo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001205104', 2024, 'Octubre', 'TRUJILLO.', 'Paiján.', 'Paiján.', '2024-10-16', '2024-10-16', 'Celso Hoyos / Pierina Ugaz.', 1, 'Fractura pierna derecha .', 'Fractura Pierna', 17250, 'Grave', 3000, 47000, '2024-10-21', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001205147', 2024, 'Octubre', 'LIMA', 'San Antonio', null, '2024-10-16', '2024-10-16', 'OU', 1, 'Jony Christian Gómez Gutierrez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-10-17', 1, 'Archivado', 'CERRADO', 'Abeo'),
('1001205183', 2024, 'Octubre', 'Lima', 'chaclacayo', 'chaclacayo', '2024-10-16', '2024-10-16', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '1970-01-01', -20012, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001205966', 2024, 'Octubre', 'LIMA', 'Monterrico', null, '2024-10-17', '2024-10-17', 'GC', 1, 'Alvaro Scarneo Cisneros (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-10-19', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001206011', 2024, 'Octubre', 'LIMA', 'La Molina', null, '2024-10-18', '2024-10-18', 'DS', 2, 'Aldair Flores Paredes (Policontuso) y July Rivera Neira (Paciente en UCI)', 'Policontuso', 3450, 'Leve', 2800, 2800, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001206363', 2024, 'Octubre', 'Lima', 'San Juan de Lurigancho', 'Zarate', '2024-10-18', '2024-10-17', 'Micaela Solis', 1, 'Fractura de tobillo del pie derecho.', 'Fractura Pierna', 17250, 'Grave', 0, 20000, '2024-12-05', 48, 'Rechazado', 'CERRADO', 'RVC'),
('1001206453', 2024, 'Octubre', 'LIMA', 'San Juan de Miraflores', null, '2024-10-18', '2024-10-18', 'DS', 1, 'Jose Angel Rangel Rangel (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001206500', 2024, 'Octubre', 'LIMA', 'Surco', null, '2024-10-18', '2024-10-18', 'JD', 1, 'Leonardo Franklyn Carrillo Ramírez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001206582', 2024, 'Octubre', 'Lima', 'Breña', 'Breña', '2024-10-18', '2024-10-18', 'Pierina Ugaz', 1, 'Amputación del dedo anular de falange distal.', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-10-23', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001206788', 2024, 'Octubre', 'Lima', 'San Juan de Lurigancho.', 'Huayrona.', '2024-10-19', '2024-10-19', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '2025-08-22', 307, 'Transigido', 'CERRADO', 'RVC'),
('1001206857', 2024, 'Octubre', 'LIMA', 'Miraflores', null, '2024-10-19', '2024-10-19', 'DS', 1, 'Pierina Angely Diluca Hu (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001206912', 2024, 'Octubre', 'LIMA', 'Chacarrilla', null, '2024-10-19', '2024-10-19', 'DS', 1, 'Luis Antonio Chuque Gonzales (Fractura en la nariz, TEC)', 'Policontuso', 1725, 'Grave', 8000, 8000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001207208', 2024, 'Octubre', 'TRUJILLO.', 'Ayacucho', 'Ayacucho', '2024-10-21', '2024-10-20', 'Celso Hoyos León', 1, 'Contusión Abdominal', 'Policontuso', 1725, 'Leve', 200, 9800, '2024-10-25', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001207830', 2024, 'Octubre', 'Lima', 'SMP', 'Barboncito', '2024-10-22', '2024-10-22', 'Micaela Solis', 2, 'Contusión de cadera              Contusión de tórax y cadera.', 'Policontuso', 3450, 'Leve', null, 30000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001208033', 2024, 'Octubre', 'LIMA', 'Pueblo Libre', null, '2024-10-22', '2024-10-22', 'JD', 1, 'Andy Paul Vásquez Lora (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001208148', 2024, 'Octubre', 'LIMA', 'Surco', null, '2024-10-22', '2024-10-22', 'OU', 1, 'Angelo Sebastian Leveroni Suárez (Policontuso, Trauma Torácico Abdominal', 'Policontuso', 1725, 'Leve', 500, 500, '2024-10-22', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001209499', 2024, 'Octubre', 'LIMA', 'San Antonio', null, '2024-10-25', '2024-10-25', 'DS', 1, 'Lalo Pezo Paredes (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001210341', 2024, 'Octubre', 'LIMA', 'Urbanización Pachacamac', null, '2024-10-27', '2024-10-27', 'JD', 2, 'Jenner Camarena Limachi (Politraumatizado), Gerardo Carrillo Girón (Fallecido)', 'Fallecido', 130000, 'Grave', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001210854', 2024, 'Octubre', 'LIMA', 'Santa Felicia', null, '2024-10-28', '2024-10-28', 'OU', 1, 'Edicson Alexander Echevarría Román (Politraumatismo)', 'Politraumatizado', 4000, 'Grave', 7500, 7500, '2024-01-03', -299, 'Transigido', 'CERRADO', 'Abeo'),
('1001211025', 2024, 'Octubre', 'LIMA', 'San Isidro', null, '2024-10-28', '2024-10-28', null, 1, 'Alvaro Enrique Rios Diaz (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001211318', 2024, 'Octubre', 'LIMA', 'Las Praderas', null, '2024-10-29', '2024-10-29', null, 1, 'Cesar PeredaVillanueva (policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Otros', 'CERRADO', 'Abeo'),
('1001211631', 2024, 'Octubre', 'LIMA', 'San Antonio', null, '2024-10-30', '2024-10-30', 'JD', 1, 'Angel DIego Samanamú Rojas (Fractura de Dedo Gordo del Pie / Fractura de Codo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001225202', 2024, 'Diciembre', 'LIMA', 'Monterrico', null, '2024-12-01', '2024-12-01', 'OU', 3, 'Zaida Aguilar Mamani: Múltiples contusiones, descartar fractura tibia, luxación dedo pie; Richard Rivas Ochoa: Contusión tórax y rodilla; Luis Fernando Ccerhuayo Puma: Contusión pared abdominal', 'Policontuso', 5175, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001211805', 2024, 'Octubre', 'LIMA', 'Miraflores', null, '2024-10-30', '2024-10-30', 'DS', 1, 'Dominick Ricardo Allpas Chuquimango (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001211825', 2024, 'Octubre', 'Lima', 'Lima', 'Mirones Bajos.', '2024-10-30', '2024-10-30', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-11-11', 12, 'Transigido', 'CERRADO', 'RVC'),
('1001211866', 2024, 'Octubre', 'LIMA', 'Las Praderas', null, '2024-10-30', '2024-10-30', 'JD', 1, 'Javier Vargas Chávez (Fractura Brazo Derecho)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001212112', 2024, 'Octubre', 'LIMA', 'San Borja', null, '2024-10-31', '2024-10-31', 'JD', 1, 'Areli Zumiel Celis Paredes (Politraumatiada)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001212804', 2024, 'Noviembre', 'LIMA', 'Surquillo', null, '2024-11-01', '2024-11-01', 'OU', 2, 'Andrea Bejarano Bermudez y Almendra Echevarría Bejarano (Policontusos)', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001212940', 2024, null, null, null, null, '2024-11-06', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('1001212983', 2024, 'Noviembre', 'LIMA', 'Surquillo', null, '2024-11-02', '2024-11-02', 'OU', 1, 'Julio Cesar Martinez Barsallo (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001213952', 2024, 'Noviembre', 'LIMA', 'San Isidro', null, '2024-11-04', '2024-11-04', 'GC', 1, 'Ronald Gutierrez Pardo(Policontuso)', 'Policontuso', 1725, 'Leve', 785, 785, '2024-11-11', 7, 'Transigido', 'CERRADO', 'Abeo'),
('1001214019', 2024, 'Noviembre', 'LIMA', 'San Antonio', null, '2024-11-04', '2024-11-04', 'DS', 1, 'Julian Eliazar Figueroa Chavez (Fractura de Tibia y Perone)', 'Fractura de tibia', 17250, 'Grave', 17000, 17000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001214715', 2024, 'Noviembre', 'LIMA', 'La Molina', null, '2024-11-06', '2024-11-06', 'DS', 1, 'Alejandro Ucharima Vicente (Policotnuso)', 'Policontuso', 1725, 'Leve', 1200, 1200, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001215032', 2024, 'Noviembre', 'LIMA', 'Surquillo', null, '2024-11-06', '2024-11-06', 'JD', 1, 'Yurema Zúñiga Fernández Baca (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001215109', 2024, 'Noviembre', 'LIMA', 'San Borja', null, '2024-11-07', '2024-11-07', 'OU', 1, 'Catherine Romero Ponce (Fractura Pie Derecho, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001215713', 2024, 'Noviembre', 'LIMA', 'Chacarilla', null, '2024-11-08', '2024-11-08', 'OU', 1, 'Alessandro Cevasco Nuñez Brown (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 0, '2024-12-06', 28, 'Rechazado', 'CERRADO', 'Abeo'),
('1001216465', 2024, 'Noviembre', 'LIMA', 'San Isidro', null, '2024-11-09', '2024-11-09', 'JD', 1, 'Santos Edilberto Falconi Venero (Fractura de Brazo y Muñeca Izquierda)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001216505', 2024, 'Noviembre', 'LIMA', 'San Antonio', null, '2024-11-09', '2024-11-09', 'DS', 1, 'Jose David Odiaga Lopez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001216515', 2024, 'Noviembre', 'Lima', 'Zárate', 'Zárate', '2024-11-09', '2024-11-09', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '2024-11-11', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001216817', 2024, 'Noviembre', 'LIMA', 'Miraflores', null, '2024-11-11', '2024-11-11', 'GC', 1, 'Juan Carlos Lapa Oyola (Policontuso)', 'Policontuso', 1725, 'Leve', 1300, 1300, '2024-11-26', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1001216822', 2024, 'Noviembre', 'LIMA', 'Surco', null, '2024-11-10', '2024-11-10', 'GC', 1, 'David Christian Caccha Muñoz(Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2024-11-22', 12, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001217505', 2024, 'Noviembre', 'LIMA', 'San Isidro', null, '2024-11-12', '2024-11-12', 'JD', 1, 'Piter Taylor Auqui Colos (Herida Cortante en Dedo de Mano Izquierda / Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001217958', 2024, 'Noviembre', 'LIMA', 'Lince', null, '2024-11-13', '2024-11-13', 'OU', 1, 'Fernando Alfredo Meléndez Tomás (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 0, '2024-11-13', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001217980', 2024, 'Noviembre', 'LIMA', 'San Isidro', null, '2024-11-13', '2024-11-13', 'JD', 1, 'Cristian Omar Ochoa Cruz (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001218256', 2024, 'Noviembre', 'LIMA', 'Miraflores', null, '2024-11-14', '2024-11-14', 'OU', 1, 'Ricardo Rosendo Elorriaga Parreño (Fractura ambos tobillos)', 'Policontuso', 1725, 'Grave', 70000, 70000, '2024-01-07', -312, 'Transigido', 'CERRADO', 'Abeo'),
('1001218270', 2024, 'Noviembre', 'LIMA', 'Magdalena', null, '2024-11-14', '2024-11-14', 'DS', 1, 'Marcelo Carranza Arbulu (Fractura de Cuello de Femur)', 'Policontuso', 1725, 'Leve', 900, null, '2026-02-10', 453, 'Transigido', 'CERRADO', 'Abeo'),
('1001218402', 2024, 'Noviembre', 'LIMA', 'Villa Maria del Triunfo', null, '2024-11-14', '2024-11-14', 'DS', 1, 'Dora Ermelinda Grandados Santacurz (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001218720', 2024, 'Noviembre', 'LIMA', 'Orrantia', null, '2024-11-15', '2024-11-15', 'GC', 1, 'Renzo Villarrubia Correa(Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-11-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001218849', 2024, 'Noviembre', 'LIMA', 'Orrantia', null, '2024-11-15', '2024-11-15', 'GC', 1, 'Christopher Brando Jones Díaz  (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-11-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001219235', 2024, 'Noviembre', 'LIMA', 'San Isidro', null, '2024-11-16', '2024-11-16', 'DS', 1, 'Giordani Fabian Chacon Vasquez (Policontuos)', 'Policontuso', 1725, 'Leve', 1000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001219556', 2024, 'Noviembre', 'Lima', 'Ventanilla', 'Ventanilla', '2024-11-16', '2024-11-16', 'Pierina Ugaz', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1785, 771, '2025-04-22', 157, 'Transigido', 'CERRADO', 'RVC'),
('1001220484', 2024, 'Noviembre', 'LIMA', 'Lurin', null, '2024-11-20', '2024-11-20', 'OU', 1, 'NN (Fatal)', 'Policontuso', 1725, 'Leve', null, null, '2024-12-06', 16, 'En Evaluación', 'CERRADO', 'Abeo'),
('1001220663', 2024, 'Noviembre', 'LIMA', 'Punta Negra', null, '2024-11-20', '2024-11-20', 'OU', 1, 'Luis Enrique Zevallos Veliz (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 0, '2024-11-24', 4, 'Archivado', 'CERRADO', 'Abeo'),
('1001221341', 2024, 'Noviembre', 'Lima', 'SMP', 'SMP', '2024-11-21', '2024-11-21', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2500, 1448, '2025-04-01', 131, 'Transigido', 'CERRADO', 'RVC'),
('1001221661', 2024, 'Noviembre', 'LIMA', 'Sagitario', null, '2024-11-22', '2024-11-22', 'DS', 1, 'Violeta Mancerine Izquierdo Espinoza (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1600, 1600, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001221759', 2024, 'Noviembre', 'LIMA', 'San Isidro', null, '2024-11-22', '2024-11-22', 'JD', 1, 'Syndi Diana Acero Palomino (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001222041', 2024, null, null, null, null, '2024-11-22', null, 'Emily', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 1500, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('1001222281', 2024, 'Noviembre', 'LIMA', 'Miraflores', null, '2024-11-23', '2024-11-23', 'JD', 1, 'Giordano Molero Vizcarra (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1340, 1340, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001222626', 2024, 'Noviembre', 'Lima', 'Bellavista', 'Bellavista', '2024-11-23', '2024-11-23', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-11-23', 0, 'Transigido', 'CERRADO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001222800', 2024, 'Noviembre', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2024-11-25', '2024-11-25', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-12-25', 30, 'Transigido', 'CERRADO', 'RVC'),
('1001222965', 2024, 'Noviembre', 'LIMA', 'Laderas de Villa', null, '2024-11-25', '2024-11-25', 'OU', 1, 'Rosa Isabel Gonzáles Villafuerte (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, '2024-11-28', 3, 'Transigido', 'CERRADO', 'Abeo'),
('1001223511', 2024, 'Noviembre', 'LIMA', 'Miraflores', null, '2024-11-26', '2024-11-26', 'GC', 1, 'Miguelina del Carmen Daniela Cuevas Maitan (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 500, 500, '2024-12-18', 22, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001223524', 2024, 'Noviembre', 'LIMA', 'José Gálvez', null, '2024-11-27', '2024-11-27', 'GC', 2, 'Dannis Fabian Elias Duran Y Alexander Huartas Ancajima  (Policontusos)', 'Policontuso', 3450, 'Leve', 0, 0, '2024-11-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001224011', 2024, 'Noviembre', 'Lima', 'Lima', 'Salamanca.', '2024-11-27', '2024-11-27', 'Pilar Dextre', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 15000, '2025-08-22', 268, 'Transigido', 'CERRADO', 'RVC'),
('1001224442', 2024, 'Noviembre', 'Lima', 'Lima', 'Breña', '2024-11-28', '2024-11-28', 'Pierina Ugaz', 1, 'Esguince', 'Esguince', 2300, 'Leve', 200, 4800, '2024-12-05', 7, 'Transigido', 'CERRADO', 'RVC'),
('1001224463', 2024, 'Noviembre', 'Lima', 'Lima', 'Chosica', '2024-11-29', '2024-11-29', 'Maritza Nizama', 3, 'Politraumatismo', 'Politraumatizado', 12000, 'Grave', 0, 25000, '2025-01-24', 56, 'Transigido', 'CERRADO', 'RVC'),
('1001225122', 2024, 'Noviembre', 'Lima', 'Lima', 'Sin denuncia policial', '2024-11-30', '2024-11-30', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-12-03', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001225168', 2024, 'Diciembre', 'LIMA', 'Barranco', null, '2024-12-01', '2024-12-01', 'OU', 1, 'Grey Luis José Rodríguez Salazar: Contusión Rodilla', 'Policontuso', 1725, 'Leve', 0, 0, '2024-11-30', -1, 'Archivado', 'CERRADO', 'Abeo'),
('1001227478', 2024, 'Diciembre', 'LIMA', 'San Isidro', null, '2024-12-06', '2024-12-06', 'OU', 1, 'Rafael José Carmona Aular', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001225215', 2024, 'Diciembre', 'Lima', 'Pueblo Libre', 'Pueblo libre', '2024-12-01', '2024-01-12', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 25000, -10000, '2025-06-26', 207, 'Transigido', 'CERRADO', 'RVC'),
('1001225615', 2024, 'Diciembre', 'Lima', 'La victoria', 'La victoria', '2024-12-02', '2024-02-12', 'Pierina Ugaz', 1, 'Politraumatizado, con descarte de factura', 'Politraumatizado', 4000, 'Leve', 0, 40000, '2025-01-01', 30, 'Transigido', 'CERRADO', 'RVC'),
('1001226292', 2024, 'Diciembre', 'Lima', 'Rímac', 'Ciudad y campo', '2024-12-03', '2024-03-12', 'Micaela Solis', 1, 'Contusión en muslo Izquierdo.', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-12-10', 7, 'Transigido', 'CERRADO', 'RVC'),
('1001226481', 2024, 'Diciembre', 'Lima', 'SMP', 'San Martín de Porras', '2024-12-03', '2024-03-12', 'Pierina Ugaz', 1, 'Politraumatismo en miembro superior y rodilla izquierda.', 'Politraumatizado', 4000, 'Leve', null, 20000, '2025-08-22', 262, 'Transigido', 'CERRADO', 'RVC'),
('1001226570', 2024, 'Diciembre', 'LIMA', 'San Borja', null, '2024-12-04', '2024-12-04', 'DS', 1, 'Daniella Corina Quiroz Nuñez del Arco (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001226632', 2024, 'Diciembre', 'Lima', 'San Miguel', 'Maranga', '2024-12-04', '2024-04-12', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-01-08', 35, 'Transigido', 'CERRADO', 'RVC'),
('1001226727', 2024, 'Diciembre', 'LIMA', 'Barranco', null, '2024-12-04', '2024-12-04', 'JD', 1, 'Silvia Margarita Herrera Mora(Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001227203', 2024, 'Diciembre', 'LIMA', 'Monterrico', null, '2024-12-06', '2024-12-06', 'OU', 1, 'Nuria del Rocio Esparch Fernández: Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001227275', 2024, 'Diciembre', 'LIMA', 'Miraflores', null, '2024-12-05', '2024-12-05', 'JD', 2, 'Adolfo Quevedo Toro Lira (Fractura de 5to Metatarsiano de Mano Derecha), Nidia Raquel Rivera Nava (Politraumatizada)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001227751', 2024, 'Diciembre', 'LIMA', 'Miraflores', null, '2024-12-07', '2024-12-07', 'DS', 1, 'Yenny Isabel Mosquera Maza (Fractura de Hueso de Metatarso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001227522', 2024, 'Diciembre', 'LIMA', 'Cieneguilla', null, '2024-12-06', '2024-12-06', 'DS', 5, 'Piero Alejandro Martinez Goyoneche (fractura diafisaria de humero izquierdo); Maria Elena Villalobos Ruiz, Maira Segevel Bueno Diaz Mori, Fabiola Antoinette Reyes Coronado y Miguel Javier Huamani Bravo (Policontusos)', 'Policontuso', 8625, 'Grave', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001228437', 2024, 'Diciembre', 'LIMA', 'Jesús María', null, '2024-12-08', '2024-12-08', 'GC', 1, 'Jalil Sotomayor Mardini (Trauma Cervical, intercraneal y Abdominal)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001227866', 2024, 'Diciembre', 'LIMA', 'Chacarilla', null, '2024-12-07', '2024-12-07', 'JD', 1, 'Rebeca Lucila Domínguez Goyo (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001227982', 2024, 'Diciembre', 'LIMA', 'San Isidro', null, '2024-12-07', '2024-12-07', 'OU', 1, 'Diego Martín Sesoko Alva', 'Policontuso', 1725, 'Leve', 0, 0, '2024-12-07', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001228863', 2024, 'Diciembre', 'LIMA', 'Sagitario', null, '2024-12-10', '2024-12-10', 'DS', 1, 'Luis Carlos Godoy Ccoyllo (Fractura)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001234862', 2024, 'Diciembre', 'LIMA', 'Villa El Salvador', null, '2024-12-22', '2024-12-22', 'OU', 1, 'Angel Giancarlos Jiménez Cordova: Fractura Fémur y Mandíbula', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001229151', 2024, 'Diciembre', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2024-12-10', '2024-10-12', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '1970-01-01', -20067, 'Otros', 'ABIERTO', 'RVC'),
('1001229174', 2024, 'Diciembre', 'LIMA', 'San Borja', null, '2024-12-10', '2024-12-10', 'GC', 1, 'Jeremy Luis Huerto Najera (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, null, '2025-01-11', 32, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001229368', 2024, 'Diciembre', 'Lima', 'SMP', 'Sol de Oro', '2024-12-11', '2024-11-12', 'Pierina Ugaz', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 1500, 23500, '2025-02-04', 55, 'Transigido', 'CERRADO', 'RVC'),
('1001229463', 2025, 'Mayo', 'Lima', 'La Perla', 'La Perla', '2025-05-29', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001229588', 2024, 'Diciembre', 'LIMA', 'Monterrico', null, '2024-12-11', '2024-12-11', 'JD', 1, 'Reyñeiro Mayel Ñaupa Ramírez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001229874', 2024, 'Diciembre', 'LIMA', 'Monterrico', null, '2024-12-11', '2024-12-11', 'JD', 3, 'Hugo Edgar Quispe Navarro (Politraumatizado), Fredi Loyaga Rivera (Politraumatizado), Mario de la Cruz Melendez (Politraumatizado)', 'Politraumatizado', 12000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001230099', 2024, 'Diciembre', 'Lima', 'SJL', 'Canto Rey', '2024-12-11', '2024-11-12', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 200, 9800, '2025-01-08', 28, 'Transigido', 'CERRADO', 'RVC'),
('1001230367', 2024, 'Diciembre', 'Lima', 'La Victoria', 'San Isidro', '2024-12-13', '2024-12-13', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-01-16', 34, 'Transigido', 'CERRADO', 'RVC'),
('1001230389', 2024, 'Diciembre', 'LIMA', 'Miraflores', null, '2024-12-13', '2024-12-13', 'DS', 1, 'Carmen Lara Rios (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001230436', 2024, 'Diciembre', 'LIMA', 'Magdalena', null, '2024-12-13', '2024-12-13', 'GC', 1, 'Víctor Ramos Castillo (Politraumatizado).', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001230522', 2024, 'Diciembre', 'Lima', 'SMP', 'San Martín de Porres', '2024-12-13', '2024-12-13', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '2025-08-22', 252, 'Transigido', 'CERRADO', 'RVC'),
('1001230741', 2024, 'Diciembre', 'LIMA', 'Santa Felicia', null, '2024-12-13', '2024-12-13', 'DS', 1, 'Eliceo Enrique Balza Gonzalez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001232296', 2024, 'Diciembre', 'LIMA', 'Villa', null, '2024-12-17', '2024-12-17', 'JD', 1, 'Cristian Osorio Castañeda (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001232544', 2024, 'Diciembre', 'Lima', 'Independencia', 'Independencia.', '2024-12-17', '2024-12-17', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 14500, '2024-12-17', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001232675', 2024, 'Diciembre', 'LIMA', 'Lurin', null, '2024-12-18', '2024-12-18', 'OU', 1, 'Gabriel Iturri De Orbegoso: Policontuso', 'Policontuso', 1725, 'Leve', 0, 0, '2024-12-18', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001232846', 2024, 'Diciembre', 'LIMA', 'Surquillo', null, '2024-12-18', '2024-12-18', 'GC', 1, 'Ricardo Jair Isaac Barrientos Ayala.(policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-12-19', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001233014', 2024, 'Diciembre', 'Lima', 'Jesús María', 'Jesús María', '2024-12-19', '2024-12-18', 'Maritza Nizama', 2, 'Esguince Cervical', 'Cervicalgia', 4600, 'Leve', 700, 3224, '2025-06-02', 165, 'Transigido', 'CERRADO', 'RVC'),
('1001233379', 2024, 'Diciembre', 'LIMA', 'Orrantia', null, '2024-12-19', '2024-12-19', 'DS', 1, 'Deborah Antonella Mora Muñoz (Policontusa)', 'Policontuso', 1725, 'Leve', 1500, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001233595', 2024, 'Diciembre', 'Lima', 'San Martín de Porres', 'San Martín de Porres', '2024-12-20', '2024-12-20', 'Pierina Ugaz', 1, 'Fractura', 'Policontuso', 1725, 'Leve', null, 10000, '2025-08-22', 245, 'Transigido', 'CERRADO', 'RVC'),
('1001233664', 2024, 'Diciembre', 'Lima', 'Callao', 'La Legua', '2024-12-20', '2024-12-20', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '2026-04-24', 490, 'Transigido', 'CERRADO', 'RVC'),
('1001233679', 2024, 'Diciembre', 'LIMA', 'Chacarilla', null, '2024-12-19', '2024-12-19', 'GC', 1, 'Miguel Anderson Celis Ñahuirima (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2647, 2647, '2024-12-19', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001233736', 2024, 'Diciembre', 'LIMA', 'Surquillo', null, '2024-12-20', '2024-12-20', 'DS', 1, 'Hector Manuel Ansatacio Salazar (Fractura Metatarso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001233921', 2024, 'Diciembre', 'LIMA', 'Villa', null, '2024-12-20', '2024-12-20', 'GC', 1, 'Rodrigo A Diaz W. (policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2024-12-20', 0, 'Archivado', 'CERRADO', 'Abeo'),
('16284596', 2024, 'Febrero', 'LIMA', 'San Borja', null, '2024-02-04', '2024-02-04', 'DS', 1, 'Carla Llontop de Muñoz (Fractura de Brazo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('1001235098', 2024, 'Diciembre', 'LIMA', 'Monterrico', null, '2024-12-22', '2024-12-22', 'JD', 1, 'Carmen Rosa Huamán Anaya (Fractura de Coxis)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001235351', 2024, 'Diciembre', 'Lima', 'Breña', 'Chacra Colorada', '2024-12-23', '2024-12-23', 'Pierina Ugaz', 2, 'Traumatismo', 'Policontuso', 3450, 'Leve', null, 25000, '2025-06-13', 172, 'Transigido', 'CERRADO', 'RVC'),
('1001235440', 2024, 'Diciembre', 'LIMA', 'San Isidro', null, '2024-12-23', '2024-12-23', 'GC', 1, 'Jesús Gilberto Tovar Liendo (fractura de clavícula)', 'Fractura de clavícula', 23000, 'Grave', 7000, 7000, '2025-01-07', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1001235515', 2024, 'Diciembre', 'LIMA', 'Mateo Pumacahua', null, '2024-12-23', '2024-12-23', 'DS', 2, 'Rodrigo Agusto Robles Cercedo (Fractura operación) y Helica Maritza Cercedo Miraval (Policontusa)', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001235824', 2024, 'Diciembre', 'LIMA', 'San Antonio', null, '2024-12-24', '2024-12-24', 'OU', 1, 'Jean Patrick Aquituari Mass: Presunto Policontuso', 'Policontuso', 1725, 'Leve', 1000, 1000, '2024-12-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001235902', 2024, 'Diciembre', 'Lima', 'Santa Anita', 'Salamanca', '2024-12-24', '2024-12-24', 'Pierina Ugaz', 3, 'Politraumatizado', 'Politraumatizado', 12000, 'Grave', null, 40000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001236003', 2024, 'Diciembre', 'Lima', 'Rimac', 'El Manzano', '2024-12-25', '2024-12-25', 'Maritza Nizama', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, 25000, '2025-07-12', 199, 'Transigido', 'CERRADO', 'RVC'),
('1001236641', 2024, 'Diciembre', 'LIMA', 'Monterrico', null, '2024-12-27', '2024-12-27', 'JD', 2, 'Fernando Ricardo La Rosa Amado (Politraumatizado), Yersi Huansi Vitiri (Politraumatizado)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001236811', 2024, 'Diciembre', 'LIMA', 'San Borja', null, '2024-12-27', '2024-12-27', 'JD', 1, 'Katherine Saldaña Velásquez (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001236882', 2024, 'Diciembre', '-', 'San Isidro', null, '2024-12-27', '2024-12-27', 'OU', 1, 'Liliana Margarita Carranza Salanitro: no pasó atención médica en el momento', 'Policontuso', 1725, 'Leve', 0, null, '2025-02-28', 63, 'Archivado', 'CERRADO', 'Abeo'),
('1001236889', 2024, 'Diciembre', 'Lima', 'SMP', 'San Martín de Porres', '2024-12-27', '2024-12-27', 'Pierina Ugaz', 2, 'Fractura / policontuso', 'Policontuso', 3450, 'Leve', null, 35000, '2025-08-22', 238, 'Transigido', 'CERRADO', 'RVC'),
('1001237728', 2024, 'Diciembre', 'Fatal', 'Mateo Pumacahua', null, '2024-12-29', '2024-12-29', 'OU', 2, 'Elvis Alberto Malimba Mantilla: Fatal y Nicole Yudith Curtihuanca Mendoza: TEC, Politraumatismo, Herida Cortante Rostro', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001237873', 2024, 'Diciembre', 'Lima', 'Oyon', 'Churin', '2024-12-29', '2024-12-29', 'Pierina Ugaz', 2, 'Fractura', 'Policontuso', 3450, 'Leve', 0, 25000, '2025-01-25', 27, 'Transigido', 'CERRADO', 'RVC'),
('1001238319', 2024, 'Diciembre', 'Lima', 'Callao', 'Ciudadela Chalaca', '2024-12-30', '2024-12-30', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-02-23', 55, 'Transigido', 'CERRADO', 'RVC'),
('1001238742', 2025, 'Diciembre', 'Leves', 'Barranco', null, '2025-12-31', '2025-12-31', 'DS', 1, 'Yerson Jose Gonzalez Gonzalez (Polucontuso)', 'Policontuso', 1725, 'Leve', 0, 0, '2025-12-31', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001238814 / 276837', 2024, 'Enero', null, null, null, '2024-12-31', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001238872', 2025, 'Enero', 'LIMA', 'LIMA', 'Pamplona', '2025-01-01', null, 'DS', 3, 'Jose Luis Reymundo Chavez (Esguince en rodilla), Maria Ines Hichcas Cuadros (Politraumatizada) y Isabella Sofia Reymundo Llanos (Policontusa)', 'Politraumatizado', 12000, 'Grave', 1000, 7000, '2025-01-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001239321', 2025, 'Enero', 'LIMA', 'LIMA', 'Monterrico', '2025-01-02', null, 'OU', 1, 'Exequiel Jacinto Inga Correa Traumatismo Intracraneal, Traumatismos Múltiples no Especificados', 'Policontuso', 1725, 'Leve', 3800, 4200, '2025-01-02', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001239440', 2025, 'Enero', 'Lima', 'Cercado de Lima', 'Palomino', '2025-01-03', null, 'Pierina Ugaz', 1, 'TEC', 'Policontuso', 1725, 'Leve', 1300, 13700, '2025-01-14', 11, 'Transigido', 'CERRADO', 'RVC'),
('1001239645', 2025, 'Enero', 'LIMA', 'LIMA', 'San Antonio', '2025-01-03', null, 'OU', 1, 'Efrain Jose Mayo Salazar Policontuso, Heridas Cortantes Rostro', 'Policontuso', 1725, 'Leve', 1000, 3000, '2025-01-03', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001240143', 2025, 'Enero', null, 'PICHIGUA', 'ESPINAR', '2025-01-04', null, 'JOEL HUAHUACONDORI', 3, 'Politraumatizado + Policontuso', 'Politraumatizado', 12000, 'Grave', 0, 3000, '2025-10-24', 293, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001240419', 2025, 'Enero', 'LIMA', 'LIMA', 'Monterrico', '2025-01-04', null, 'GC', 1, 'Olger Ramón Murillo (fractura de pie)', 'Fractura Pierna', 17250, 'Grave', 1000, 9000, '2025-04-17', 103, 'Transigido', 'CERRADO', 'Abeo'),
('1001240637', 2025, 'Enero', 'LIMA', 'LIMA', 'San Luis', '2025-01-04', null, 'DS', 1, 'Elias Josue Hernandez Castillo (Traumatismos múltiples no especificados quedando en observación)', 'Policontuso', 1725, 'Leve', 3200, -200, '2025-01-05', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001241071', 2025, 'Enero', 'Lima', 'Jesús María', 'Jesús María', '2025-01-06', null, 'Pierina Ugaz', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', 4000, 3233, '2025-02-12', 37, 'Transigido', 'CERRADO', 'RVC'),
('1001241302', 2025, 'Enero', 'LIMA', 'LIMA', 'Lince', '2025-01-06', null, 'DS', 1, 'Roswer Javier Orozco Jauregui (TEC Severo)', 'TEC Grave', 23000, 'Grave', 6000, -1000, '2025-01-07', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001241508', 2025, 'Enero', null, 'MOLLEPATA', 'UPIAT CUSCO', '2025-01-07', null, 'JOEL HUAHUACONDORI', 5, 'Politraumatizado + Policontuso', 'Politraumatizado', 20000, 'Grave', 0, 69000, '2025-04-28', 111, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001241916', 2025, 'Enero', 'LIMA', 'LIMA', 'Chacarrilla', '2025-01-07', null, 'JD', 1, 'Lourdes Castillo de Ordinola (Fractura de Peroné, TEC Moderado, Politraumatismo)', 'Fractura de Peroné', 17250, 'Grave', 15000, 11000, '2025-01-22', 15, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001242494', 2025, 'Enero', 'LIMA', 'LIMA', 'San Antonio', '2025-01-09', null, 'OU', 1, 'Sebastián Higaki Rodríguez (Fractura Clavícula)', 'Policontuso', 1725, 'Grave', 10000, 0, '2025-02-12', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1001242810', 2025, 'Enero', 'Lima', 'Lima', 'Petit Thouars', '2025-01-09', null, 'Micaela Solis', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 450, 14550, '2025-01-12', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001242958', 2025, 'Enero', 'Lima', 'Callao', 'Juan Ingunza Valdivia', '2025-01-09', null, 'Pierina Ugaz', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 6000, 4410, '2025-03-21', 71, 'Transigido', 'CERRADO', 'RVC'),
('1001243372', 2025, 'Enero', 'Lima', 'El Agustino', 'Santoyo', '2025-01-10', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1300, 23700, '2025-01-16', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001244216', 2025, 'Enero', 'LIMA', 'LIMA', 'San Isidro', '2025-01-12', null, 'DS', 1, 'Francisco Aldair Jarrin Lama (TEC)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-01-12', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001244280', 2025, 'Enero', 'LIMA', 'LIMA', 'Monterrico', '2025-01-13', null, 'DS', 1, 'NN (Fallecido)', 'Fallecido', 65000, 'Grave', 100000, 55000, '2025-08-15', 214, 'Transigido', 'CERRADO', 'Abeo'),
('1001244853', 2025, 'Enero', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-01-14', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-01-16', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001244854', 2025, 'Enero', 'LIMA', 'LIMA', 'San Isidro', '2025-01-14', null, 'JD', 1, 'Miriam Sofia Campos Huamanlazo (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, '2025-01-14', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001244879', 2025, 'Enero', 'Lima', 'Ventanilla', 'Ventanilla', '2025-01-14', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1350, 13650, '2025-02-11', 28, 'Transigido', 'CERRADO', 'RVC'),
('1001245118', 2025, 'Enero', null, 'PUCCHUN', 'PUCCHUN', '2025-01-14', null, 'RUTH HUAHUACONDORI', 2, 'TEC Leve + Policontuso', 'TEC Leve', 11500, 'Grave', 0, 4000, '2025-05-22', 128, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001245306', 2025, 'Febrero', 'Lima', 'Cercado de Lima', 'Petit Thouars', '2025-02-11', null, 'Pierina Ugaz', 2, 'Policontuso por accidente de tránsito y superficial del abdomen Dolor de cuello y cabeza', 'Policontuso', 3450, 'Leve', 2650, 2918, '2025-04-30', 78, 'Transigido', 'CERRADO', 'RVC'),
('1001245348', 2025, 'Enero', 'LIMA', 'LIMA', 'San Juan de Miraflores', '2025-01-15', null, 'GC', 1, 'Jose Luis Moron Muñoz (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001245383', 2025, 'Enero', 'LIMA', 'LIMA', 'Miraflores', '2025-01-15', null, 'OU', 2, 'Nils Padilla Bailon y Harley Gerardo Cobeñas Suarez - Policontusos y Justino Quispe Asto Fractura Costillas, Policontuso', 'Policontuso', 3450, 'Leve', 1900, 17100, '2025-02-25', 41, 'Transigido', 'CERRADO', 'Abeo'),
('1001245519', 2025, 'Enero', 'Callao', 'Huaycan', 'Huaycan', '2025-01-15', null, 'Pierina Ugaz', 1, 'Contusión', 'Policontuso', 1725, 'Leve', 2500, 560, '2025-03-06', 50, 'Transigido', 'CERRADO', 'RVC'),
('1001246809', 2025, 'Enero', 'Lima', 'Comas', 'Santa Luzmila', '2025-01-18', null, 'Pierina Ugaz', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', 0, 20000, '2025-02-14', 27, 'Transigido', 'CERRADO', 'RVC'),
('1001247049', 2025, 'Enero', 'Callao', 'Callao', 'Márquez', '2025-01-18', null, 'Maritza Nizama', 1, 'Traumatismo', 'Policontuso', 1725, 'Leve', 3300, 5333, '2025-06-18', 151, 'Transigido', 'CERRADO', 'RVC'),
('1001247561', 2025, 'Enero', 'Callao', 'Callao', 'Sarita Colonia', '2025-01-20', null, 'Micaela Solis', 3, 'Policontuso', 'Politraumatizado', 12000, 'Grave', 23000, 2957, '2025-03-07', 46, 'Transigido', 'CERRADO', 'RVC'),
('1001247571', 2025, 'Enero', 'LIMA', 'LIMA', 'San Antonio', '2025-01-18', null, 'JD', 1, 'Segundo Sánchez León (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-01-18', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001247627', 2025, 'Enero', 'Callao', 'Callao', 'La Legua', '2025-01-20', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 3950, 6547.6, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001247770', 2025, 'Enero', 'LIMA', 'LIMA', 'Miraflores', '2025-01-20', null, 'JD', 1, 'Guillermo Payes Consilla (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, '2025-01-20', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001249443', 2025, 'Enero', null, 'SANTA LUCIA', 'SANTA LUCIA', '2025-01-23', null, 'JOEL HUAHUACONDORI', 4, 'Politraumatizado', 'Politraumatizado', 16000, 'Grave', 62500, -7500, '2025-03-19', 55, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001249446', 2025, 'Enero', 'Lima', 'VMT', 'Villa María del Triunfo', '2025-01-23', null, 'Pierina Ugaz', 2, 'TEC', 'Politraumatizado', 8000, 'Grave', 370, 14630, '2025-01-28', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001249803', 2025, 'Enero', 'Lima', 'VMT', 'Villa María del Triunfo', '2025-01-23', null, 'Pierina Ugaz', 2, 'TEC', 'Policontuso', 3450, 'Leve', 300, 14700, '2025-01-24', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001249805', 2025, 'Enero', null, 'CHINCHAO', 'ACOMAYO', '2025-01-23', null, 'JOEL HUAHUACONDORI', 4, 'Policontuso', 'Policontuso', 6900, 'Grave', 11900, 87100, '2025-10-03', 253, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001250063', 2025, 'Enero', 'LIMA', 'LIMA', 'Surquillo', '2025-01-24', null, 'OU', 1, 'Valentin Abram Nuñez Olarte TEC, Fractura Escafoides', 'Policontuso', 1725, 'Grave', 6315.06, 6684.94, '2024-02-03', -356, 'Transigido', 'CERRADO', 'Abeo'),
('1001250225', 2025, 'Enero', 'LIMA', 'LIMA', 'Monterrico', '2025-01-25', null, 'OU', 5, 'Manuel Nakachi Uechi, Patricia Inés Fernández Ortiz de Cardenas, Gerónimo Manuel Aguilar Barbadillo, Fátima Del Pilar Cárdenas Fernández, Patricia Silvia Cardenas Fernández - Policontusos', 'Policontuso', 8625, 'Grave', 0, 15000, '2024-01-25', -366, 'Archivado', 'CERRADO', 'Abeo'),
('1001250237', 2025, 'Enero', null, 'SAN SEBASTIÁN', 'SAN SEBASTIAN', '2025-01-25', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 600, -600, '2025-01-28', 3, 'Daño Material', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001250395', 2025, 'Enero', 'Lima', 'Jesus Maria', 'Jesus Maria', '2025-01-25', null, 'Maritza Nizama', 3, 'Fractura expuesta', 'Politraumatizado', 12000, 'Grave', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001250407', 2025, 'Enero', 'Chincha', 'Tambo de Mora', 'Tambo de Mora', '2025-01-25', null, 'Pilar Dextre', 4, 'Policontuso', 'Policontuso', 6900, 'Grave', 0, 20000, '2025-03-01', 35, 'Transigido', 'CERRADO', 'RVC'),
('1001250511', 2025, 'Abril', null, 'CERRO COLORADO', 'MARISCAL CASTILLA', '2025-04-09', null, 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 5000, -2000, '2025-04-23', 14, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001250548', 2025, 'Enero', 'Lima', 'Rimac', 'Flor de Amancaes', '2025-01-26', null, 'Maritza Nizama', 3, 'Policontuso / politraumatizado', 'Politraumatizado', 12000, 'Grave', 0, 20000, '2025-02-03', 8, 'Transigido', 'CERRADO', 'RVC'),
('1001251316', 2025, 'Enero', 'Lima', 'Comas', 'Santa Luzmila', '2025-01-27', null, 'Micaela Solis', 4, 'Policontuso', 'Policontuso', 6900, 'Grave', null, 45000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001251317', 2025, 'Enero', null, 'SAN RAFAEL', 'SAN RAFAEL', '2025-01-27', null, 'JOEL HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', 0, 13000, '2025-01-29', 2, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16510924', 2024, 'Julio', 'LIMA', 'Chacarrilla', null, '2024-07-11', '2024-07-11', 'DS', 1, 'Juan Carlos Villegas Llorona (Herida Cortante en el Rostro)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001251789', 2025, 'Enero', 'Lima', 'SJL', 'Canto Rey', '2025-01-28', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 200, 9800, '2025-01-29', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001252244', 2025, 'Enero', 'LIMA', 'LIMA', 'San Antonio', '2025-01-29', null, 'OU', 1, 'Eduardo Sergio Neira Changa - Fisura brazo derecho, Policontuso', 'Fractura de brazo expuesto', 23000, 'Grave', 1000, 3000, '2025-01-29', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001252258', 2025, 'Enero', 'LIMA', 'LIMA', 'Barranco', '2025-01-30', null, 'JD', 4, 'Felicita Iparraguirre Ortega (Politraumatizado), Pedro Enrique Palomino Carmona (Politraumatizado), Domingo Antonio García Segama (Policontuso), Domingo Antonio García Segama (Policontuso)', 'Politraumatizado', 16000, 'Grave', 9283.2, 2716.8, '2025-07-02', 153, 'Transigido', 'CERRADO', 'Abeo'),
('1001252719', 2025, 'Enero', 'LIMA', 'LIMA', 'Monterrico', '2025-01-31', null, 'OU', 1, 'Maricela Arbildo Vargas - Policontuso, trauma brazo', 'Policontuso', 1725, 'Leve', 0, 6000, '2025-01-31', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001252787', 2025, 'Enero', 'LIMA', 'LIMA', 'Surquillo', '2025-01-31', null, 'DS', 1, 'Chiara Vieira Ballon de Cordava (Cervicalgia)', 'Cervicalgia', 2300, 'Leve', 0, 5000, '2025-03-25', 53, 'Transigido', 'CERRADO', 'Abeo'),
('1001253085', 2025, 'Enero', 'LIMA', 'LIMA', 'San Isidro', '2025-01-31', null, 'GC', 1, 'Huachin Lopez Egusquiza (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001253164', 2025, 'Febrero', 'Huarochirí', 'Chicla', 'Casapalca', '2025-02-02', null, 'Pilar Dextre', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 5000, 15000, '2025-02-13', 11, 'Transigido', 'CERRADO', 'RVC'),
('1001253260', 2025, 'Febrero', 'Callao', 'Callao', 'Ciudad del Pescador', '2025-02-01', null, 'Pierina Ugaz', 1, 'Contusión', 'Fallecido', 65000, 'Grave', 3000, 6965, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001253362', 2025, 'Febrero', null, 'HUAYLLAY', 'HUAYLLAY', '2025-02-03', null, 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 1600, 4400, '2025-02-03', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001253788', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Isidro', '2025-02-01', null, 'GC', 1, 'Eddy Ronaldo Matos Torres (Politruamatizado)', 'Policontuso', 1725, 'Leve', 2454, 546, '2025-02-21', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1001253794 / 287133', 2025, 'Febrero', null, null, null, '2025-02-02', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Daño Material', 'CERRADO', 'Chacon'),
('1001254408', 2025, 'Febrero', 'Cañete', 'Mala', 'San Antonio', '2025-02-03', null, 'Pierina Ugaz', 1, 'Politraumatizado', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-05-02', 88, 'Transigido', 'CERRADO', 'RVC'),
('1001254736', 2025, 'Febrero', 'LIMA', 'LIMA', 'Surquillo', '2025-02-04', null, 'JD', 1, 'Elizabeth Miluska Sampe Miranda (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001255223', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Isidro', '2025-02-05', null, 'JD', 1, 'Sergio Vilcatoma Santana (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001256061', 2025, 'Febrero', 'LIMA', 'LIMA', 'Miraflores', '2025-02-07', null, 'GC', 2, 'Jose Luis Vasquez Palacios Y Samantha Alicia San Roman Vargas (Politruamatizados)', 'Policontuso', 3450, 'Leve', 2000, 4000, '2025-02-08', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001256206', 2025, 'Febrero', 'LIMA', 'LIMA', 'Monterrico', '2025-02-07', null, 'DS', 1, 'Alejandro Rodriguez Andia (Esguince de Ligamentos de la Rodilla, Traumatismo Suoerficial de Tobillo)', 'Esguince', 2300, 'Leve', 0, 3000, '2026-01-17', 344, 'Transigido', 'CERRADO', 'Abeo'),
('1001256963', 2025, 'Febrero', null, 'HUASAHUASI', 'HUASAHUASI', '2025-02-09', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 16000, null, null, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001257031', 2025, 'Febrero', 'LIMA', 'LIMA', 'Villa', '2025-02-09', null, 'DS', 1, 'Patricia Milagros Quispe Flores (Fractura del metatarsiano)', 'Policontuso', 1725, 'Grave', 14000, -4000, '2025-04-07', 57, 'Transigido', 'CERRADO', 'Abeo'),
('1001257222', 2025, 'Febrero', 'Lima', 'Cercado de Lima', 'Mirones Altos', '2025-02-10', null, 'Micaela Solis', 1, 'Fractura', 'Policontuso', 1725, 'Grave', 12000, 10264, '2025-03-21', 39, 'Transigido', 'CERRADO', 'RVC'),
('1001257362', 2025, 'Febrero', 'Callao', 'San Miguel', 'Pueblo Libre', '2025-02-11', null, 'Pierina Ugaz', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 2960, 1863, '2025-03-18', 35, 'Transigido', 'CERRADO', 'RVC'),
('1001257407', 2025, 'Febrero', 'Lima', 'Ate', 'Salamanca', '2025-02-11', null, 'Pierina Ugaz', 1, 'Contusión de codo Izquierdo', 'Policontuso', 1725, 'Leve', null, 5000, '2025-02-12', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001257422', 2025, 'Febrero', 'LIMA', 'LIMA', 'Santa Felicia', '2025-02-10', null, 'GC', 1, 'Francisco Javier Chavez Coaquira (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001257449', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Isidro', '2025-02-10', null, 'JD', 1, 'Elizabeth Lucia de la Cruz Mantilla de Quinto (Politraumatismo / Cervicalgia)', 'Politraumatizado', 4000, 'Leve', null, 6000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001257466', 2025, 'Febrero', 'LIMA', 'LIMA', 'Orrantía', '2025-02-10', null, 'OU', 1, 'Aracelli Irene Barrera Herrera (Policontusión, pared abdominal, tobillo, cadera y rodilla)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-02-16', 6, 'Archivado', 'CERRADO', 'Abeo'),
('1001257628', 2025, 'Febrero', 'LIMA', 'LIMA', 'Barranco', '2025-02-11', null, 'OU', null, 'No se.registró información', 'Policontuso', 0, 'Leve', 0, 0, '2025-02-11', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001257700', 2025, 'Febrero', 'Lima', 'La Victoria', 'Yerbateros', '2025-02-11', null, 'Pierina Ugaz', 2, 'Fractura de peroné izquierdo, fractura en la fisis tibia  proximal izquierda, quedando en observación', 'Fractura de Peroné', 34500, 'Grave', 5200, 1300, '2025-05-28', 106, 'Transigido', 'CERRADO', 'RVC'),
('1001257727', 2025, 'Febrero', 'LIMA', 'LIMA', 'Miraflores', '2025-02-12', null, 'OU', 1, 'Felipe Omar Nicolás Bakus Nalvarte (Policontusión, pared abdominal, tobillo, cadera y rodilla)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-02-12', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001257745', 2025, 'Febrero', 'Lima', 'Subtanjalla', 'Subtanjalla', '2025-02-12', null, 'Pilar Dextre', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 9500, '2025-05-08', 85, 'Transigido', 'CERRADO', 'RVC'),
('1001257901', 2025, 'Febrero', 'LIMA', 'LIMA', 'Surco', '2025-02-12', null, 'OU', 1, 'Lisset Stefany Baez Condori (Fractura Metatarso)', 'Policontuso', 1725, 'Leve', 2500, 7500, '2025-02-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001258143', 2025, 'Febrero', null, 'PUQUIO', 'PUQUIO', '2025-02-14', null, 'JOEL HUAHUACONDORI', 1, 'TEC Leve + Esguince + Policontuso y corte + Policontuso', 'TEC Leve', 5750, 'Grave', 158000, -139000, '2025-07-01', 137, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001258572', 2025, 'Febrero', 'Lima', 'Huaral', 'Aucallama', '2025-02-14', null, 'Pilar Dextre', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 6000, 9000, '2025-12-05', 294, 'Transigido', 'CERRADO', 'RVC'),
('1001259391', 2025, 'Febrero', 'Lima', 'San  Miguel', 'San Miguel', '2025-02-14', null, 'Noelia', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 25000, '2025-11-28', 287, 'Transigido', 'CERRADO', 'RVC'),
('1001259723', 2025, 'Febrero', 'Lima', 'Mala', 'San Antonio', '2025-02-16', null, 'Micaela Solis', 1, 'Muerte', 'Policontuso', 1725, 'Leve', 0, 80000, '2025-03-20', 32, 'Transigido', 'CERRADO', 'RVC'),
('1001259788 / 291738', 2025, 'Febrero', null, null, null, '2025-02-16', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Cerrado s/detalle', 'CERRADO', 'Chacon'),
('1001259840', 2025, 'Febrero', 'Lima', 'La Perla', 'La Perla', '2025-02-16', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-03-05', 17, 'Transigido', 'CERRADO', 'RVC'),
('1001259892 / 291855', 2025, 'Febrero', null, null, null, '2025-02-16', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, '2025-02-16', 0, 'Daño Material', 'CERRADO', 'Chacon'),
('1001260040', 2025, 'Febrero', 'Lima', 'Jesus María', 'Jesus María', '2025-02-17', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 530, 14470, '2025-02-24', 7, 'Transigido', 'CERRADO', 'RVC'),
('1001260063', 2025, 'Febrero', 'LIMA', 'LIMA', 'Surquillo', '2025-02-17', null, 'JD', 1, 'Tamara Corrales Fernández (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001260553', 2025, 'Febrero', null, 'CASMA', 'CASMA', '2025-02-18', null, 'JOEL HUAHUACONDORI', 2, 'Policontuso y corte', 'Policontuso y corte', 4600, 'Leve', 0, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001260948', 2025, 'Febrero', 'LIMA', 'LIMA', 'Surco', '2025-02-18', null, 'GC', 1, 'Juan Sebastian La Torre Falcon', 'Policontuso', 1725, 'Leve', 0, 0, '2025-02-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001261886', 2025, 'Febrero', null, 'SAN JERONIMO DE TUNAN', 'SAN JERONIMO DE TUNAN', '2025-02-20', null, 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 8000, -2000, '2025-03-04', 12, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001261892', 2025, 'Febrero', 'Lima', 'Callao', 'La Legua', '2025-02-18', null, 'Pierina Ugaz', 4, null, 'Policontuso', 6900, 'Grave', null, 3000, '2025-05-03', 74, 'Cerrado s/detalle', 'CERRADO', 'RVC'),
('1001261939', 2025, 'Febrero', 'Lima', 'Jesús María', 'Jesús Maria', '2025-02-20', null, 'Pierina Ugaz', 1, 'Policonstuso', 'Politraumatizado', 4000, 'Leve', 550, 9450, '2025-02-26', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001261975', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Borja', '2025-02-21', null, 'JD', 1, 'Jhonatan Jesús Goyea Lozada (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001262758 / 16861585', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Antonio Mala', '2025-02-22', null, 'OU', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 55000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001263053 / 293979', 2025, 'Febrero', null, null, null, '2025-02-23', null, 'Eduardo', 1, null, 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Daño Material', 'CERRADO', 'Chacon'),
('1001263143', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Luis', '2025-02-23', null, 'GC', 1, 'Christian Eugenio Sanchez Vicente (Fractura expuesta de tibia y perone)', 'Policontuso', 1725, 'Grave', 30000, -10000, '2026-01-05', 316, 'En Negociación', 'CERRADO', 'Abeo'),
('1001263286', 2025, 'Febrero', 'LIMA', 'LIMA', 'Surquillo', '2025-02-24', null, 'DS', 1, 'Jose Walter Escalante Lucero (Fractura del Maleolo del Peroné derecho)', 'Policontuso', 1725, 'Grave', 17000, 3000, '2025-04-22', 57, 'Transigido', 'CERRADO', 'Abeo'),
('1001263308', 2025, 'Febrero', 'LIMA', 'LIMA', 'Orrantía', '2025-02-24', null, 'OU', 1, 'Benjamín Lauro Calderón Laura (Politraumatismo, contusión codo, muñeca, mano y rodilla', 'Politraumatizado', 4000, 'Leve', 0, 3000, '2025-02-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001263669', 2025, 'Febrero', 'LIMA', 'LIMA', 'Surquillo', '2025-02-25', null, 'DS', 1, 'Angie Tatiana Flores Mendez (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 3000, '2025-02-25', 0, 'Transigido', 'CERRADO', 'Abeo'),
('16578684', 2024, 'Agosto', 'LIMA', 'Villa El Salvador', null, '2024-08-22', '2024-08-22', 'JD', 1, 'Max Humberto Gutierrez Inca (Amputación de pierna)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('1001263936', 2025, 'Febrero', 'LIMA', 'LIMA', 'La Planicie', '2025-02-25', null, 'DS', 2, 'Mileny Fiorella Trillo Castillo y Letizia Margarita Jara Valverde (Policontussas)', 'Policontuso', 3450, 'Leve', 0, 6000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001264167 / 294642', 2025, 'Febrero', null, null, null, '2025-02-25', null, 'Eduardo', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', null, 0, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Chacon'),
('1001264223', 2025, 'Febrero', 'Lima', 'San Miguel', 'Maranga', '2025-02-25', null, 'Pierina Ugaz', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 3800, 16200, '2025-02-27', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001264377', 2025, 'Febrero', 'Lima', 'Callao', 'Ramón Castilla', '2025-02-26', null, 'Pilar Dextre', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', 200, 9800, '2025-03-07', 9, 'Transigido', 'CERRADO', 'RVC'),
('1001264414', 2025, 'Febrero', 'Lima', 'Callao', 'Ciudadela Chalaca', '2025-02-26', null, 'Pilar Dextre', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 5045, 7095, '2025-03-09', 11, 'Transigido', 'CERRADO', 'RVC'),
('1001264529', 2025, 'Febrero', 'Lima', 'Pueblo Libre', 'Pueblo libre', '2025-02-26', null, 'Pilar Dextre', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', null, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001264531', 2025, 'Febrero', 'LIMA', 'LIMA', 'Chacarrilla', '2025-02-26', null, 'DS', 1, 'Emilio Charles Quispe Panche (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, '2025-02-27', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001264865', 2025, 'Febrero', 'Lima', 'Los Olivos', 'LAURA CALLER', '2025-02-27', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-03-20', 21, 'Transigido', 'CERRADO', 'RVC'),
('1001265187', 2025, 'Febrero', 'Ancash', 'Casma', 'Casma', '2025-02-28', null, 'Maritza Nizama', 2, 'Fractura', 'Policontuso', 3450, 'Leve', 0, 30000, '2025-04-14', 45, 'Transigido', 'CERRADO', 'RVC'),
('1001265285', 2025, 'Febrero', null, 'TIABAYA', 'TIABAYA', '2025-02-28', null, 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 500, '2025-03-03', 3, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001265296', 2025, 'Febrero', 'Lima', 'Ate', 'Salamanca', '2025-02-27', null, 'Maritza Nizama', 1, 'Fractura', 'Politraumatizado', 4000, 'Leve', 5800, 3568, '2025-03-25', 26, 'Transigido', 'CERRADO', 'RVC'),
('1001265405', 2025, 'Febrero', 'LIMA', 'LIMA', 'Monterrico', '2025-02-28', null, 'OU', 1, 'Carmen Crisálida Hurtado Tello (Policontuso, Discopatia Columna)', 'Policontuso', 1725, 'Leve', 6000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001265522', 2025, 'Febrero', 'Chincha', 'Ica', 'Sunampe', '2025-02-28', null, 'Pierina Ugaz', 1, 'Contusión del tórax, de hombro, brazo y cadera', 'Policontuso', 1725, 'Leve', 200, 4800, '2025-03-11', 11, 'Transigido', 'CERRADO', 'RVC'),
('1001265737', 2025, 'Marzo', 'Lima', 'Ate', 'Vitarte', '2025-03-01', null, 'Micaela Solis', 2, 'Policontuso', 'Politraumatizado', 8000, 'Grave', 900, 24100, '2025-03-12', 11, 'Transigido', 'CERRADO', 'RVC'),
('1001265807', 2025, 'Marzo', 'LIMA', 'LIMA', 'Sagitario', '2025-03-01', null, 'GC', null, 'sin lesiones', 'Policontuso', 0, 'Leve', 0, 0, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001266021', 2025, 'Marzo', 'Lima', 'SMP', 'Condevilla', '2025-03-02', null, 'Pierina Ugaz', 1, 'quemadura', 'Politraumatizado', 4000, 'Leve', 200, 4800, '2025-03-07', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001266716', 2025, 'Marzo', 'LIMA', 'LIMA', 'Monterrico', '2025-03-03', null, 'DS', 2, 'Erik Javier Ramirez Chipana (Fractura) y Jackelin Jesus Guerra Heredia (Politraumatizada)', 'Politraumatizado', 8000, 'Grave', 22000, -9000, '2025-06-03', 92, 'En Negociación', 'CERRADO', 'Abeo'),
('1001266741', 2025, 'Marzo', null, null, null, '2025-02-03', null, 'Eduardo', 1, 'Politraumatizado + Policontuso', 'Politraumatizado', 4000, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001266947', 2025, 'Marzo', 'LIMA', 'LIMA', 'Monterrico', '2025-03-04', null, 'DS', 1, 'Rosa Milagros Alcides Carrión (Cervicalgía)', 'Policontuso', 1725, 'Leve', 0, 5000, '2025-03-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001267116', 2025, 'Marzo', null, 'TARAPOTO', 'TARAPOTO', '2025-03-05', null, 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 0, 2000, '2025-03-07', 2, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001267475', 2025, 'Marzo', 'Lima', 'San Miguel', 'Maranga', '2025-03-05', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 3545, 734.2, '2025-05-22', 78, 'Transigido', 'CERRADO', 'RVC'),
('1001267528', 2025, 'Marzo', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-03-05', null, 'Pilar Dextre', 1, 'Policontuso', 'Esguince', 2300, 'Leve', 2500, 7500, '2025-05-31', 87, 'Transigido', 'CERRADO', 'RVC'),
('1001267746', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Isidro', '2025-02-25', null, 'JD', 1, 'Jorge Luciano Quiñe Bobadilla (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001267832', 2025, 'Marzo', 'Lima', 'Los Olivos', 'Pro', '2025-03-05', null, 'Micaela Solis', 1, 'Fractura', 'Policontuso', 1725, 'Grave', 15000, -1420, '2025-12-22', 292, 'Transigido', 'CERRADO', 'RVC'),
('1001267910', 2025, 'Marzo', 'LIMA', 'LIMA', 'Sagitario', '2025-03-05', null, 'OU', 2, 'Ayllen Fiorella Arata Valiante (Politraumatismo) y Andrea Maldonado Zanetty (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', 2000, 4000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001267992', 2025, 'Marzo', 'Lima', 'La Victoria', 'La Victoria', '2025-03-06', null, 'Pilar Dextre', 2, 'Traumatismo', 'Policontuso', 3450, 'Leve', null, 20000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001268593', 2025, 'Marzo', 'LIMA', 'LIMA', 'Miraflores', '2025-03-07', null, 'GC', 1, 'Rodrigo Gutíerrez Liza (Fallecido)', 'Fallecido', 65000, 'Grave', 90000, -35000, '2025-03-26', 19, 'Transigido', 'CERRADO', 'Abeo'),
('1001268734', 2025, 'Marzo', 'LIMA', 'LIMA', 'Cieneguilla', '2025-03-07', null, 'OU', 1, 'Marijose Natsumi Limas Gutiérrez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001269191', 2025, 'Marzo', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2025-03-07', null, 'Pilar Dextre', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1200, 3800, '2025-03-12', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001269561', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Antonio', '2025-03-08', null, 'GC', 1, 'Miguelina del Carmen Daniela Cuevas Maitan ( Fractura de mano)', 'Policontuso', 1725, 'Leve', 500, 9500, '2025-03-09', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001269583', 2025, 'Marzo', 'LIMA', 'LIMA', 'Magdalena', '2025-03-08', null, 'DS', 1, 'Emilio Jose Mendoza Sanvchez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001270637', 2025, 'Marzo', null, 'CERCADO', 'PALACIO VIEJO', '2025-03-11', null, 'RUTH HUAHUACONDORI', 2, 'Fallecido + Politraumatizado', 'Fallecido', 130000, 'Grave', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001270867', 2025, 'Marzo', null, 'SANTIAGO DE PUPUJA', 'JOSE DOMINGO CHOQUEHUANCA', '2025-03-10', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 45000, -42000, '2025-07-01', 113, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001271407', 2025, 'Marzo', 'Lima', 'Santa Clara', 'Santa Clara', '2025-03-12', null, 'Pilar Dextre', 2, 'Politraumatismo', 'Policontuso', 3450, 'Leve', 2000, 24877.6, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001271456', 2025, 'Marzo', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2025-03-12', null, 'Pilar Dextre', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 600, 19400, '2025-03-20', 8, 'Transigido', 'CERRADO', 'RVC'),
('1001271675', 2025, 'Marzo', 'LIMA', 'LIMA', 'Lurin', '2025-03-12', null, 'GC', 1, 'Orlando Magdiel Tanchiva Horna (Fallecido)', 'Fallecido', 65000, 'Grave', null, 55000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001271819', 2025, 'Marzo', null, 'SICAYA', 'SICAYA', '2025-03-14', null, 'JOEL HUAHUACONDORI', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Grave', 190000, -176000, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001272038', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Isidro', '2025-03-13', null, 'DS', 1, 'Sergio Pedro Cerasuolo Cabero (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001272086', 2025, 'Marzo', 'Lima', 'Prolongación Quinta Avenida, Jicamarca.', 'Jicamarca.', '2025-03-13', null, 'Maritza Nizama', 1, 'Traumatismo', 'Policontuso', 1725, 'Grave', 20000, 10000, '2025-05-16', 64, 'Transigido', 'CERRADO', 'RVC'),
('1001272090', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Isidro', '2025-03-13', null, 'DS', 1, 'Milagros Osorio Prudencio (Fractura)', 'Policontuso', 1725, 'Grave', 14000, -4000, '2025-05-29', 77, 'Transigido', 'CERRADO', 'Abeo'),
('1001272346', 2025, 'Marzo', 'LIMA', 'LIMA', 'Sagitario', '2025-03-14', null, 'DS', 2, 'Enrique Campos Garboza (Politraumatizado) y Raul Mazgo PAredes (Fractura)', 'Politraumatizado', 8000, 'Grave', 12900, 100, '2025-05-06', 53, 'Transigido', 'CERRADO', 'Abeo'),
('1001272750', 2025, 'Marzo', 'Lima', 'Av. La Marina Cruce con Universitaria- San Miguel', 'San Miguel', '2025-03-15', null, 'Micaela Solis', 6, 'Fractura / politraumatizado/ TEC /Policontuso /contusión', 'Policontuso', 10350, 'Grave', 16000, 164000, '2025-12-04', 264, 'Transigido', 'CERRADO', 'RVC'),
('1001272988', 2025, 'Marzo', 'LIMA', 'LIMA', 'Miraflores', '2025-03-15', null, 'OU', 1, 'Franco José Carlos Ausejo Quispe (Policontuso, Herida Cortante Mano)', 'Policontuso', 1725, 'Leve', null, 4000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001273139', 2025, 'Marzo', 'LIMA', 'LIMA', 'Magdalena', '2025-03-16', null, 'OU', 1, 'Ever Gil Vera (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 200, 2800, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001273231', 2025, 'Marzo', 'Lima', 'Carretera Central 15.5 km.', 'Huaycan.', '2025-03-16', null, 'Maritza Nizama', 1, 'Traumatismos', 'Esguince', 2300, 'Leve', 2500, 22500, '2025-03-25', 9, 'Transigido', 'CERRADO', 'RVC'),
('1001273237', 2025, 'Marzo', null, 'MORALES', 'MORALES', '2025-03-17', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 55000, '2025-03-17', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001273279', 2025, 'Marzo', 'Lima', 'Jr. Trinitarias con Monserrate - Surco', 'Surco', '2025-03-16', null, 'Pilar Dextre', 2, 'Traumatismos', 'Policontuso', 3450, 'Leve', 6000, 439.2, '2025-10-16', 214, 'Transigido', 'CERRADO', 'RVC'),
('1001273322', 2025, 'Marzo', 'LIMA', 'LIMA', 'Monterrico', '2025-03-17', null, 'JD', 1, 'Roberto Carlos Castillo Encalada (Fractura de Cabeza de Femur)', 'Policontuso', 1725, 'Leve', 3000, 17000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001273702', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Borja', '2025-03-18', null, 'OU', 1, 'Jose Antonio Niño Saavedra (Esguince Cervical)', 'Esguince', 2300, 'Leve', 0, 5000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001273925', 2025, 'Marzo', 'LIMA', 'LIMA', 'Villa', '2025-03-18', null, 'GC', 1, 'Jorge Luis Navarro Vidaurre (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 500, 2500, '2025-03-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001274098', 2025, 'Marzo', 'LIMA', 'LIMA', 'Orrantia', '2025-03-18', null, 'DS', 2, 'Hugo Alvaron Barrientos Lopez (Esguince en el Tobillo) y Patricia Delgado Narpa (Politraumatizada)', 'Politraumatizado', 8000, 'Grave', 6000, -1000, '2025-03-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001274126', 2025, 'Marzo', 'LIMA', 'LIMA', 'La Molina', '2025-03-18', null, 'OU', 1, 'María Alejandra Tello Gonzáles (TEC, Cervicalgia)', 'Cervicalgia', 2300, 'Leve', 0, 8000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001274249', 2025, 'Marzo', 'LIMA', 'LIMA', 'Villa', '2025-03-19', null, 'GC', 1, 'Luis Arturo Tay Bayes (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001274255', 2025, 'Marzo', 'LIMA', 'LIMA', 'Punta Hermosa', '2025-03-19', null, 'DS', 1, 'Fany Fina Flores Rodriguez (Esguince Cervical)', 'Esguince', 2300, 'Leve', null, 5000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001274749', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Borja', '2025-03-20', null, 'JD', 2, 'Gina Cristina Cerda Riega (Fractura de Tercer Dedo de Pie Derecho), Edinson Aimar Sulca Cenón (Esguince tobillo derecho)', 'Esguince', 4600, 'Leve', 0, 4000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001274798', 2025, 'Marzo', 'Lima', 'San Miguel', 'San Miguel', '2025-03-20', null, 'Maritza Nizama', 1, 'Politraumatizado', 'Policontuso', 1725, 'Leve', null, 15000, '2025-11-28', 253, 'Transigido', 'CERRADO', 'RVC'),
('1001275205', 2025, 'Marzo', 'Lima', 'Lima', 'Mirones Bajo', '2025-03-20', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '2025-11-28', 253, 'Transigido', 'CERRADO', 'RVC'),
('1001275431', 2025, 'Marzo', 'LIMA', 'LIMA', 'Chacarilla', '2025-03-21', null, 'JD', 1, 'César Luis Hinostroza Torres (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001275747', 2025, 'Marzo', 'LIMA', 'LIMA', 'Pamplona', '2025-03-22', null, 'OU', 1, 'Paul Rojas Siles (Fatal)', 'Policontuso', 1725, 'Leve', 0, 55000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001276049', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Borja', '2025-03-23', null, 'OU', 1, 'Nelson Maguin Morales Velasquez (TEC, Policontuso)', 'Policontuso', 1725, 'Grave', 8000, -2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001276151', 2025, 'Marzo', 'Lima', 'SJL', 'Canto Rey', '2025-03-23', null, 'Pilar Dextre', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, 10000, '2025-11-28', 250, 'Transigido', 'CERRADO', 'RVC'),
('1001276201', 2025, 'Marzo', null, 'MOROCOCHA', 'MOROCOCHA', '2025-03-23', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 55000, '2025-08-07', 137, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001276316', 2025, 'Marzo', 'Lima', 'Callao', 'Ciudad de Pescador', '2025-03-22', null, 'Micaela Solis', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Grave', 7000, 3370.8, '2025-05-07', 46, 'Transigido', 'CERRADO', 'RVC'),
('1001276346', 2025, 'Marzo', 'LIMA', 'LIMA', 'Praderas', '2025-03-23', null, 'OU', 1, 'Angel Gabriel Casares Hernández (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001276378', 2025, 'Marzo', 'Lima', 'Comas', 'Santa Isabel', '2025-03-23', null, 'Pilar Dextre', 6, 'Policonstuso', 'Fallecido', 390000, 'Grave', 500, 9500, '2025-05-05', 43, 'Transigido', 'CERRADO', 'RVC'),
('1001276731', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Borja', '2025-03-24', null, 'GC', 1, 'Yerner Gamboa Cochachi ( Politraumatizado, esguince de tobillo, y esguince de dedo)', 'Politraumatizado', 4000, 'Leve', 500, 6500, '2025-04-04', 11, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001276741', 2025, 'Marzo', 'Lima', 'Santiago de Surco', 'Sagitario', '2025-03-25', null, 'Pilar Dextre', 1, 'Fractura', 'Politraumatizado', 4000, 'Leve', 3380, 3614, '2025-06-05', 72, 'Transigido', 'CERRADO', 'RVC'),
('1001276833', 2025, 'Marzo', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-03-25', null, 'Micaela Solis', 2, 'Esguince', 'Policontuso', 3450, 'Leve', 2400, 2024, '2025-05-01', 37, 'Transigido', 'CERRADO', 'RVC'),
('1001276853', 2025, 'Marzo', 'Lima', 'Cercado de Lima', 'Mirones Altos', '2025-03-25', null, 'Micaela Solis', 2, 'Policontuso', 'TEC Leve', 11500, 'Grave', 4300, 907.5, '2025-06-04', 71, 'Transigido', 'CERRADO', 'RVC'),
('1001277263', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Isidro', '2025-03-25', null, 'JD', 1, 'José Emilio Ponce Ibarra (Politraumatizado)', 'Politraumatizado', 4000, 'Grave', 10000, -7000, '2025-04-17', 23, 'Transigido', 'CERRADO', 'Abeo'),
('1001277525', 2025, 'Marzo', null, 'CERCADO', 'PALACIO VIEJO', '2025-03-26', null, 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1700, 1300, '2025-03-27', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001277593', 2025, 'Marzo', 'LIMA', 'LIMA', 'Lurin', '2025-03-13', null, 'JD', 2, 'Miguel Angel Trucios Condor (Fallecido),, Ylda Victoriana Gonzales (Politraumatizada)', 'Fallecido', 130000, 'Grave', 0, 58000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001278210', 2025, 'Marzo', 'Lima', 'Callao', 'La Perla', '2025-03-27', null, 'Maritza Nizama', 3, 'Fractura', 'Fallecido', 195000, 'Grave', 6400, 13210, '2025-03-09', -18, 'Transigido', 'CERRADO', 'RVC'),
('1001278509', 2025, 'Marzo', 'LIMA', 'LIMA', 'Chorrillos', '2025-03-28', null, 'GC', 2, 'Krizta Liz Marcela Peña Chumbipuma y Liliana Jacqueline Flores Alejos (politraumatizados)', 'Politraumatizado', 8000, 'Grave', 3600, 2400, '2025-05-13', 46, 'Transigido', 'CERRADO', 'Abeo'),
('1001278578', 2025, 'Marzo', 'Lima', 'Bocanegra', 'Bocanegra', '2025-03-28', null, 'Maritza Nizama', 1, 'Contusiones', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-05-15', 48, 'Transigido', 'CERRADO', 'RVC'),
('1001279116 / 304867', 2025, 'Marzo', null, null, null, '2025-03-29', null, 'Eduardo', 1, 'TEC Leve + Esguince + Policontuso y corte + Policontuso', 'TEC Leve', 5750, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001279721', 2025, 'Marzo', 'LIMA', 'LIMA', 'Mateo Pumacahua', '2025-03-29', null, 'GC', 1, 'Jose Gabriel Anglas Reyes (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001279897', 2025, 'Marzo', 'LIMA', 'LIMA', 'Lince', '2025-03-31', null, 'DS', 1, 'NN (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-03-31', 0, 'Tercero No Coopera', 'CERRADO', 'Abeo'),
('1001280097', 2025, 'Marzo', 'LIMA', 'LIMA', 'Surquillo', '2025-03-31', null, 'GC', 1, 'Ever Richar Elger Yupan (policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001280109', 2025, 'Marzo', 'Lima', 'La Victoria', 'La Victoria', '2025-03-31', null, 'Micaela Solis', 1, 'Contusion de organos genitales', 'Policontuso', 1725, 'Leve', 547, 19453, '2025-04-04', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001280199', 2025, 'Abril', 'LIMA', 'LIMA', 'Curva de Villa', '2025-04-01', null, 'DS', 1, 'Robert Steven Mendo Lezcano (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-04-02', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001280266', 2025, 'Abril', 'Lima', 'SMP', 'San Martin de Porres', '2025-01-04', null, 'Pierina Ugaz', 1, 'Esguince y torceduras no especificadas en la rodilla', 'Policontuso', 1725, 'Grave', 12500, 5000.8, '2025-08-19', 227, 'Transigido', 'CERRADO', 'RVC'),
('16625910', 2024, 'Septiembre', 'LIMA', 'Magdalena', null, '2024-09-21', '2024-09-21', 'DS', 1, 'Maria Alejandra Armas Galindo (Traumatismos multiples superficiales. otorragia (sangre en oido), mareos, contusion torax)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001280478', 2025, 'Abril', 'Lima', 'CALLAO', 'Marquez', '2025-01-04', null, 'Pierina Ugaz', 1, 'herida cortante de región glútea (35 puntos).', 'Policontuso', 1725, 'Leve', 0, 40000, '2025-04-08', 94, 'Transigido', 'CERRADO', 'RVC'),
('1001280489', 2025, 'Abril', 'Lima', 'CALLAO', 'Callao', '2025-01-04', null, 'Pierina Ugaz', 2, 'Contusion de rodilla', 'Policontuso', 3450, 'Leve', null, 35000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001280713', 2025, 'Abril', 'LIMA', 'LIMA', 'Miraflores', '2025-04-01', null, 'OU', 1, 'Pedro Luis Vargas Muguerza (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001281506', 2025, 'Abril', 'Lima', 'JESUS MARIA', 'Jesús María.', '2025-03-04', null, 'Maritza Nizama', 2, 'Contusion de rodilla', 'Policontuso', 3450, 'Leve', 300, 19700, '2025-04-15', 42, 'Transigido', 'CERRADO', 'RVC'),
('1001281983', 2025, 'Abril', 'LIMA', 'LIMA', 'Orrantia', '2025-04-04', null, 'DS', 1, 'Minjae Song (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 3000, '2025-06-01', 58, 'Transigido', 'CERRADO', 'Abeo');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001282591', 2025, 'Abril', 'LIMA', 'LIMA', 'Manchay', '2025-04-06', null, 'DS', 1, 'Eduardo Rivera Valdez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('1001282607', 2025, 'Abril', 'LIMA', 'LIMA', 'Chacarrilla', '2025-04-06', null, 'DS', 1, 'NN', 'Policontuso', 1725, 'Leve', 0, 0, '2025-04-06', 0, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001282973', 2025, 'Abril', 'LIMA', 'LIMA', 'Laderas de Villa', '2025-04-07', null, 'DS', 1, 'Cesar Augusto Sanchez Coaguila (Fractura de Tobillo)', 'Fractura Pierna', 17250, 'Grave', 2000, 8000, '2025-04-08', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001283402', 2025, 'Abril', 'LIMA', 'LIMA', 'Villa Alejandro', '2025-04-07', null, 'JD', 1, 'Valentin Luis Oré Tantalean (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 350, 2650, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001283697', 2025, 'Abril', 'LIMA', 'LIMA', 'San Antonio', '2025-04-08', null, 'GC', 1, 'María Antonieta Villanueva Patiño ( Politraumatizado, fractura de olecranón derecho y herida profunda en la cara y herida en el Baso)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Judicializado', 'CERRADO', 'Abeo'),
('1001283723', 2025, 'Abril', 'LIMA', 'LIMA', 'Chacarrilla', '2025-04-08', null, 'OU', 1, 'Hernan Diomedes Espinoza Aguilar (TEC, Traumatismo Cervical)', 'Policontuso', 1725, 'Leve', 3500, 4500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('246709', 2024, null, null, null, null, '2024-09-24', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('1001284200', 2025, 'Abril', 'Callao', 'CALLAO', 'Ramón Castilla', '2025-09-04', null, 'Micaela Solis', 1, 'Politraumatizado, quedando en UCI', 'Policontuso', 1725, 'Leve', null, 45000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001284481', 2025, 'Abril', 'LIMA', 'LIMA', 'Miraflores', '2025-04-10', null, 'JD', 1, 'Nelson Alejandro Montilla Martínez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001284805', 2025, 'Abril', 'LIMA', 'LIMA', 'Manchay', '2025-04-11', null, 'DS', 2, 'Coralia Laura Utia CArtolin y Zabdiel Omar Laurente Utia (Politraumatizados)', 'Politraumatizado', 8000, 'Grave', 0, 6000, '2025-04-11', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001285647', 2025, 'Abril', 'LIMA', 'LIMA', 'Orrantia', '2025-04-12', null, 'JD', 2, 'Rodrigo Andre Vera Meza (Politraumatizado), Carolina Gutierrez Aponte (Politraumatizado)', 'Politraumatizado', 8000, 'Grave', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001285757', 2025, 'Abril', 'LIMA', 'LIMA', 'Lince', '2025-04-13', null, 'GC', 2, 'Luis Enrique Ale Barbaran y Jessica Aylin Rodriguez Collantes (Politraumatizado)', 'Politraumatizado', 8000, 'Grave', 1000, 8000, '2025-04-14', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001285772', 2025, 'Abril', 'LIMA', 'LIMA', 'San Antonio', '2025-04-13', null, 'JD', 3, 'Brayan Angel Segura Flores (Politraumatizado), José Sebastian Cayo Chirino (Politraumatizado), José Luis Jara Cueva (Politraumatizado)', 'Politraumatizado', 12000, 'Grave', null, 6000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('248751', 2024, null, null, null, null, '2024-09-30', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'En Investigación', 'ABIERTO', 'Chacon'),
('1001285861', 2025, 'Abril', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2025-04-14', null, 'Pilar Dextre', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 3000, 612, '2025-06-10', 57, 'Transigido', 'CERRADO', 'RVC'),
('1001285907', 2025, 'Abril', 'LIMA', 'LIMA', 'San Isidro', '2025-04-14', null, 'JD', 2, 'Miguel Ángel Huamán Sulca (Politraumatizada), Abraham Tobias Altamirano Yupanqui (Politraumatizado)', 'Politraumatizado', 8000, 'Grave', 6000, 0, '2025-08-27', 135, 'Transigido', 'CERRADO', 'Abeo'),
('1001251507', 2025, 'Enero', 'LIMA', 'LIMA', 'San Isidro', '2025-01-28', null, 'GC', 1, 'N/N', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001286398', 2025, 'Abril', 'LIMA', 'LIMA', 'Magdalena', '2025-04-15', null, 'OU', 2, 'Andres Ricardo Zumaran Castañeda y Margarita Judith Herrera Montoya (Policontuso)', 'Policontuso', 3450, 'Leve', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001286631', 2025, 'Octubre', 'Lima', 'San Miguel', 'San Miguel', '2025-10-15', null, 'Micaela Solis', 1, 'Contusión de Mano derecha y contusión de brazo derecho', 'Esguince', 2300, 'Leve', null, 10000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001286857', 2025, 'Abril', 'LIMA', 'LIMA', 'Orrantia', '2025-04-15', null, 'GC', 2, 'Alvaro Gastón Payet Mejía y Liz Margot Grimaldo Farias (Politraumatizado)', 'Politraumatizado', 8000, 'Grave', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001286882', 2025, 'Abril', 'LIMA', 'LIMA', 'Orrantia', '2025-04-16', null, 'JD', 1, 'Úrsula Mano Espinoza (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001287418', 2025, 'Abril', 'Callao', 'San Miguel', 'Maranga', '2025-04-16', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 50, 14950, '2025-04-16', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001287426', 2025, 'Abril', 'Lima', 'Independencia', 'Jesus María / Petit thouars', '2025-04-16', null, 'Pierina Ugaz', 1, 'Fractura del hombro izquierdo, fractura de brazo izquierdo, fractura de pierna izquierda, fractura de columna vertebral', 'Politraumatizado', 4000, 'Leve', null, 50000, '2025-11-28', 226, 'Transigido', 'CERRADO', 'RVC'),
('1001287787', 2025, 'Abril', 'LIMA', 'LIMA', 'Lince', '2025-04-17', null, 'GC', 1, 'Eric Leonel Pacheco Vasquez Caicedo (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3750, 6250, '2025-10-03', 169, 'Transigido', 'CERRADO', 'Abeo'),
('1001288026', 2025, 'Abril', 'Callao', 'Callao', 'La perla', '2025-04-19', null, 'Maritza Nizama', 4, 'Policontusión y Contusión cervical', 'Policontuso', 6900, 'Grave', 13000, 5332, '2025-07-31', 103, 'Transigido', 'CERRADO', 'RVC'),
('1001288190', 2025, 'Abril', 'LIMA', 'LIMA', 'Magdalena', '2025-04-20', null, 'GC', 1, 'Deborah Odry Ingar Osorio (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-05-10', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1001288256', 2025, 'Abril', 'LIMA', 'LIMA', 'Surco', '2025-04-20', null, 'GC', 1, 'Gabriel Salvador Rubio Morales (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 10000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001288577', 2025, 'Abril', 'Callao', 'Pueblo Libre', 'Pueblo Libre', '2025-04-21', null, 'Pierina Ugaz', 1, 'Fractura de clavícula – UCI', 'Policontuso', 1725, 'Grave', 10000, 2155.6, '2025-09-05', 137, 'Transigido', 'CERRADO', 'RVC'),
('1001288974', 2025, 'Abril', null, 'EL TAMBO', 'EL TAMBO', '2025-04-22', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 100, 4400, '2025-04-22', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001288979', 2025, 'Abril', 'Lima', 'Jesús María', 'Jesús María', '2025-04-22', null, 'Micaela Solis', 2, 'Policontuso', 'Fallecido', 130000, 'Grave', 5000, 5178, '2025-05-22', 30, 'Transigido', 'CERRADO', 'RVC'),
('1001289004', 2025, 'Abril', 'Lima', 'Cercado de Lima', 'Monserrat.', '2025-04-21', null, 'Pilar Dextre', 1, 'Contusión y herida de tobillo derecho queda en observación.', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001289081', 2025, 'Abril', 'Lima', 'Breña', 'Breña', '2025-04-22', null, 'Maritza Nizama', 1, 'Herida en pierna izquierda y policontuso.', 'Policontuso', 1725, 'Leve', 700, 4300, '2025-04-28', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001289104', 2025, 'Abril', 'Lima', 'Jesús María', 'Jesús María', '2025-04-22', null, 'Maritza Nizama', 2, 'Contusión de tórax y contusión de la pared abdominal, traumatismos superficiales múltiples no especificados./ Traumatismo de cabeza, herida de oído, fractura múltiple de costilla, traumatismos superficiales múltiples, policontuso.', 'Policontuso', 3450, 'Leve', 0, 40000, '2025-06-26', 65, 'Transigido', 'CERRADO', 'RVC'),
('1001289387', 2025, 'Abril', 'LIMA', 'LIMA', 'San Antonio', '2025-04-23', null, 'DS', null, 'Politraumatizado', 'Politraumatizado', 0, 'Leve', 0, 20000, '2025-04-23', 0, 'Daño Material', 'CERRADO', 'Abeo'),
('1001263863', 2025, 'Febrero', 'LIMA', 'LIMA', 'San Isidro', '2025-02-25', null, 'JD', 1, 'Walter Cayizaya Alvarez (Fractura de Brazo)', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001289424', 2025, 'Abril', 'LIMA', 'LIMA', 'San Isidro', '2025-04-23', null, 'JD', 1, 'Carolina Ugarte Noriega (Fractura de Dedos de Mano)', 'Policontuso', 1725, 'Leve', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001289454', 2025, 'Abril', null, 'AYAVIRI', 'AYAVIRI', '2025-04-23', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 20000, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001289893', 2025, 'Abril', 'LIMA', 'LIMA', 'San Borja', '2025-04-24', null, 'JD', 1, 'Diego Alonso Ormeño Huamaní (Fractura de Tibia Izquierda)', 'Fractura de tibia', 17250, 'Grave', 2000, 5000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001289958', 2025, 'Abril', 'LIMA', 'LIMA', 'Surco', '2025-04-24', null, 'JD', 2, 'Sergio Estrebides Rodríguez (Politraumatizado), Yesica Díaz López (Poliatrumatizada)', 'Politraumatizado', 8000, 'Grave', null, 0, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1001290149', 2025, 'Abril', 'LIMA', 'LIMA', 'Miraflores', '2025-04-24', null, 'DS', 1, 'Said Abraham Meza Martinez (Fractura)', 'Policontuso', 1725, 'Leve', 0, 5000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001290290', 2025, 'Abril', 'Lima', 'Cercado de Lima.', 'MONSERRAT', '2025-04-24', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-07-03', 70, 'Transigido', 'CERRADO', 'RVC'),
('1001290480', 2025, 'Abril', 'LIMA', 'LIMA', 'Magdalena', '2025-04-24', null, 'OU', 1, 'Kelly Del Pilar Carquin Ohama (Fractura Dedo del Pie, Atriccion)', 'Policontuso', 1725, 'Grave', 17500, -7500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001290530', 2025, 'Abril', 'LIMA', 'LIMA', 'San Antonio', '2025-04-25', null, 'GC', 1, 'Aldo Fernando Carrizales Castro (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001291328', 2025, 'Abril', 'LIMA', 'LIMA', 'Orrantia', '2025-04-27', null, 'GC', 1, 'Hector Luis Figuera Ramirez', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001291460', 2025, 'Abril', 'LIMA', 'LIMA', 'Miraflores', '2025-04-27', null, 'GC', 1, 'Jean Carlos Oliva Lujan (policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001291792', 2025, 'Abril', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-04-28', null, 'Pilar Dextre', 1, 'Traumatismo superficiales múltiples', 'Policontuso', 1725, 'Leve', 50, 4950, '2025-04-29', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001292092', 2025, 'Abril', 'LIMA', 'LIMA', 'Chacarrilla', '2025-04-28', null, 'GC', 1, 'Nathaly Lucero Nulez Ortega (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 2800, 200, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001292296', 2025, 'Abril', 'Callao', 'Callao', 'INGUNZA', '2025-04-29', null, 'Pilar Dextre', 1, 'Fractura', 'TEC Leve', 5750, 'Leve', 0, 50000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001292485', 2025, 'Abril', 'LIMA', 'LIMA', 'Surquillo', '2025-04-30', null, 'DS', 1, 'Evdis Herlid Angeldonis Goza (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-04-30', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001292519', 2025, 'Abril', 'Lima', 'Cercado de Lima', 'Petit Thouars.', '2025-04-29', null, 'Maritza Nizama', 2, 'Policontuso y fractura', 'Politraumatizado', 8000, 'Grave', 25000, 2045, '2026-01-31', 277, 'Transigido', 'CERRADO', 'RVC'),
('1001292612', 2025, 'Abril', 'LIMA', 'LIMA', 'Miraflores', '2025-04-30', null, 'OU', 1, 'Estefania Zarate Lescano (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 4000, null, null, 'Otros', 'CERRADO', 'Abeo'),
('1001292717', 2025, 'Abril', 'LIMA', 'LIMA', 'Magdalena', '2025-04-30', null, 'OU', 1, 'Olenka Milagros Adelina Obregón Carbajal (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001293086', 2025, 'Mayo', 'LIMA', 'LIMA', 'Chacarrilla', '2025-05-01', null, 'OU', 1, 'Eduardo ARRESE Estrada (Politraumatismo, Escoriaciones)', 'Politraumatizado', 4000, 'Leve', null, 10000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001293552', 2025, 'Mayo', 'Pisco', 'Pisco', 'San Andrés', '2025-05-01', null, 'Pierina Ugaz', 1, 'Policontuso por suceso de tránsito , fractura de pie derecho, por descartar más lesiones', 'Policontuso', 1725, 'Leve', 800, 19200, '2025-10-07', 159, 'Transigido', 'CERRADO', 'RVC'),
('1001293735', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Borja', '2025-05-02', null, 'JD', 2, 'Celia Lourdes Silva Sebastián (Politraumatizada), Rosario Sebastián León (Politraumatizada)', 'Politraumatizado', 8000, 'Grave', 2500, 500, '2025-05-20', 18, 'Transigido', 'CERRADO', 'Abeo'),
('1001293790', 2025, 'Mayo', 'Lima', 'Comas', 'Tupac Amaru', '2025-05-03', null, 'Maritza Nizama', 2, 'traumatismo de cuello / Contusión cervical, contusión de rodilla', 'Politraumatizado', 8000, 'Grave', 2400, 1209, '2025-06-04', 32, 'Transigido', 'CERRADO', 'RVC'),
('100129415', 2025, 'Mayo', 'Lima', 'Santa Anita', 'Santa Anita', '2025-05-04', null, 'Pierina Ugaz', 1, 'Fractura', 'Politraumatizado', 4000, 'Grave', 15000, 20000, '2025-12-05', 215, 'Transigido', 'CERRADO', 'RVC'),
('1001294428', 2025, 'Mayo', 'Lima', 'Jesús María', 'Jesús María', '2025-05-03', null, 'Micaela Solis', 1, 'Contusión Craneal, Contusión de Muslo y Rodilla.', 'Policontuso', 1725, 'Leve', 2500, 1449.6, '2025-06-10', 38, 'Transigido', 'CERRADO', 'RVC'),
('1001294430', 2025, 'Mayo', 'LIMA', 'LIMA', 'Chacarrilla', '2025-05-03', null, 'DS', 1, 'Jonathan Jose Carrasco Bustamante (Fractura en el brazo)', 'Policontuso', 1725, 'Grave', 6500, -6500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001294477', 2025, 'Mayo', 'LIMA', 'LIMA', 'Santa Felicia', '2025-05-04', null, 'DS', 1, 'Ricardo Jherson Arango Sumansa (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001294786', 2025, 'Mayo', 'LIMA', 'LIMA', 'Miraflores', '2025-05-05', null, 'DS', 1, 'Angel Felix Flores Morrou', 'Policontuso', 1725, 'Leve', 1180, 1820, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001295042', 2025, 'Mayo', 'Lima', 'Jesús María', 'Jesús María', '2025-05-06', null, 'Pilar Dextre', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001295243', 2025, 'Mayo', 'LIMA', 'LIMA', 'Villa', '2025-05-06', null, 'OU', 1, 'Luis Gabino Tuesta Lopez (Policontuso)', 'Policontuso', 1725, 'Leve', 200, 2800, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001295372', 2025, 'Mayo', 'LIMA', 'LIMA', 'Chacarrilla', '2025-05-06', null, 'DS', 1, 'Claudio Alfonso Ventura Paucar (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 2000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001295719', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Borja', '2025-05-07', null, 'JD', 1, 'Gian Carlo Sota Hurtado (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1900, 10100, '2025-07-01', 55, 'Transigido', 'CERRADO', 'Abeo'),
('1001296080', 2025, 'Mayo', 'Lima', 'Jesús María', 'Jesús María', '2025-05-08', null, 'Pierina Ugaz', 1, 'fractura -herida c', 'Policontuso', 1725, 'Leve', 1500, 28500, '2025-05-09', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001296131', 2025, 'Mayo', 'Lima', 'Lima', 'Alfonso Ugarte', '2025-05-07', null, 'Maritza Nizama', 2, 'Policontuso / contusion', 'Policontuso', 3450, 'Leve', 900, 24100, '2025-06-10', 34, 'Transigido', 'CERRADO', 'RVC'),
('1001296452', 2025, 'Mayo', 'Lima', 'SMP', 'Sin DP', '2025-05-08', null, 'Pierina Ugaz', 1, 'Politraumatizado, descarte de fractura', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001296530', 2025, 'Mayo', 'Callao', 'Ventanilla', 'Villa Los Reyes', '2025-05-08', null, 'Micaela Solis', 1, 'Muerte', 'Politraumatizado', 4000, 'Leve', null, 80000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001296763', 2025, 'Mayo', 'LIMA', 'LIMA', 'La Planicie', '2025-05-09', null, 'DS', 3, 'Angela Miluska Miranda Palpan, Ronald Augusto Diaz Campana, Bernice Alfaro Urquizo y Jair Jerei Vilcayauri Huaringa (', 'Policontuso', 5175, 'Grave', 64000, -62000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001297028', 2025, 'Mayo', 'Lima', 'Ancón', 'Santa Rosa', '2025-05-10', null, 'Micaela Solis', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 0, 25000, '2025-05-21', 11, 'Transigido', 'CERRADO', 'RVC'),
('1001280291', 2025, 'Abril', 'LIMA', 'LIMA', 'San Luis', '2025-04-01', null, 'OU', 1, 'Antonia Inga Rivera (Fractura Hombro, Pelvis, Costillas)', 'Policontuso', 1725, 'Leve', null, 30000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001297070', 2025, 'Mayo', 'Lima', 'Lima', 'Monserrat', '2025-05-10', null, 'Pierina Ugaz', 1, 'Traumatismo', 'Policontuso', 1725, 'Leve', null, 40000, '2025-06-25', 46, 'Transigido', 'CERRADO', 'RVC'),
('1001297238', 2025, 'Mayo', 'Lima', 'Carabayllo', 'Santa Isabel', '2025-05-10', null, 'Pilar Dextre', 1, 'Contusión', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001297244', 2025, 'Mayo', 'LIMA', 'LIMA', 'Barranco', '2025-05-10', null, 'JD', 1, 'Marvelys Gabriela Fernández Quintana (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 2000, 4000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001297583', 2025, 'Mayo', 'Callao', 'San Miguel', 'Maranga', '2025-05-11', null, 'Micaela Solis', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', 750, 9250, '2025-05-15', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001297648', 2025, 'Mayo', 'Huaura', 'Hualmay', 'Cruz Blanca', '2025-05-12', null, 'Micaela Solis', 1, 'Policontuso', 'Fallecido', 65000, 'Grave', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001297782', 2025, 'Mayo', 'Lima', 'Los Olivos', 'Laura Caller Ibérico', '2025-05-12', null, 'Maritza Nizama', 1, 'Traumatismo superficial de la cabeza', 'Policontuso', 1725, 'Grave', 20350, 0, '2025-06-06', 25, 'Transigido', 'CERRADO', 'RVC'),
('1001284197', 2025, 'Abril', 'Callao', 'Ciudad del Pescador', 'UIAT CALLAO', '2025-09-04', null, 'Micaela Solis', 1, 'Muerte', 'Policontuso', 1725, 'Leve', null, 80000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001297791', 2025, 'Mayo', 'Callao', 'Callao', 'Bocanegra.', '2025-05-12', null, 'Pierina Ugaz', 0, 'sin diagnostico', 'Policontuso', 0, 'Leve', 0, 10000, '2025-05-13', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001297918', 2025, 'Mayo', 'LIMA', 'LIMA', 'Santa Felicia', '2025-05-12', null, 'OU', 1, 'Nancy Portella Ayala (Politraumatismo, Herida Rodilla, Contusión Región Lumbosacra y Pelvis)', 'Politraumatizado', 4000, 'Leve', 4400, -1400, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001298180', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Luis', '2025-05-12', null, 'GC', 1, 'Andre Alessandro Mantilla Magallanes (Fractura tibia y peroné)', 'Policontuso', 1725, 'Grave', 9500, -6500, '2025-07-03', 52, 'Transigido', 'CERRADO', 'Abeo'),
('1001298182', 2025, 'Mayo', 'Lima', 'Ica', 'Ica', '2025-05-12', null, 'Pilar Dextre', 1, 'Traumatismo', 'Policontuso', 1725, 'Leve', 1300, 28700, '2025-05-14', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001298465', 2025, 'Mayo', 'Lima', 'San Juan de Lurigancho', 'Caja de Agua', '2025-05-13', null, 'Maritza Nizama', 1, 'Politraumatizado', 'TEC Leve', 5750, 'Leve', 5000, 4224, '2025-06-20', 38, 'Transigido', 'CERRADO', 'RVC'),
('1001298502', 2025, 'Mayo', 'LIMA', 'LIMA', 'Miraflores', '2025-05-14', null, 'OU', 1, 'Luis Fernando Romaina Rodríguez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 10000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001298592', 2025, 'Mayo', 'LIMA', 'LIMA', 'Chacarrilla', '2025-05-14', null, 'OU', 1, 'Juan Pablo Ezeta Sanchez (Policontuso)', 'Policontuso', 1725, 'Leve', null, 13000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001298634', 2025, 'Mayo', 'LIMA', 'LIMA', 'Miraflores', '2025-05-08', null, 'GC', 1, 'Christopher Mendoza Carbajal (Fractura de Mano)', 'Policontuso', 1725, 'Leve', 2500, -40000, '2026-02-11', 279, 'Transigido', 'CERRADO', 'Abeo'),
('1001299406', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Isidro', '2025-05-15', null, 'JD', 2, 'Emilia Estela Cancio LLamas (Fractura de Muñeca), Sofía Elizabeth Salinas Cancio (Politraumatizado)', 'Fractura de muñeca', 34500, 'Grave', null, 0, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001299409', 2025, 'Mayo', 'Lima', 'Callao', 'La Perla', '2025-05-15', null, 'Pilar Dextre', 1, 'Traumatismo', 'Policontuso', 1725, 'Leve', 1360, 18640, '2025-06-09', 25, 'Transigido', 'CERRADO', 'RVC'),
('1001299641', 2025, 'Junio', 'LIMA', 'LIMA', 'Sagitario', '2025-06-14', null, 'GC', 1, 'Sergio Manuel Canales Arenas (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 4000, 9000, '2025-07-18', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1001285796', 2025, 'Abril', 'Callao', 'Callao', 'Callao', '2025-04-13', '2025-04-13', 'Pilar Dextre', 3, 'TEC', 'Policontuso', 5175, 'Leve', null, 45000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001300467', 2025, 'Mayo', null, 'AMARILIS', 'AMARILIS', '2025-05-17', null, 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 0, 1500, '2025-05-17', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001300507', 2025, 'Mayo', 'Lima', 'Callao', 'Sin DP', '2025-05-19', null, 'Pilar Dextre', 1, 'Contusiones', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-05-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001301298', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Borja', '2025-05-20', null, 'GC', 1, 'Luis Hildebratd Guzman Llulluy (Esgince de mano)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001301326', 2025, 'Mayo', 'Lima', 'ATE', 'Salamanca', '2025-05-20', null, 'Maritza Nizama', 1, null, 'Policontuso', 1725, 'Leve', 0, 5000, '2025-06-06', 17, 'Transigido', 'CERRADO', 'RVC'),
('1001301386', 2025, 'Mayo', 'Lima', 'Matucana', 'Matucana', '2025-05-20', null, 'Micaela Solis', 1, 'Daño en el rostro', 'Politraumatizado', 4000, 'Leve', null, 10000, '2025-11-28', 192, 'Transigido', 'CERRADO', 'RVC'),
('1001301714', 2025, 'Mayo', 'Lima', 'San Martín de Porres', 'Sol de Oro', '2025-05-21', null, 'Micaela Solis', 2, 'No determinado(se dio a la fuga)', 'Policontuso', 3450, 'Leve', 0, 10000, '2025-05-21', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001302056', 2025, 'Mayo', 'LIMA', 'LIMA', 'Magdalena', '2025-05-22', null, 'GC', 1, 'Mirella Lainas Tarazona (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Otros', 'CERRADO', 'Abeo'),
('1001302380', 2025, 'Mayo', 'Lima', 'Ate', 'Salamanca', '2025-05-22', null, 'Pierina Ugaz', 1, 'Fractura de Húmero Proximal Derecho', 'Politraumatizado', 4000, 'Leve', null, 30000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001302746', 2025, 'Mayo', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-05-24', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 500, 4500, '2025-05-30', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001302862', 2025, 'Mayo', 'LIMA', 'LIMA', 'Surquillo', '2025-05-24', null, 'GC', 1, 'Jorge Rodolfo Rasmussen Ochoa (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, '2025-07-07', 44, 'Transigido', 'CERRADO', 'Abeo'),
('1001303159', 2025, 'Mayo', 'Lima', 'Callao', 'Bocanegra', '2025-05-25', null, 'Micaela Solis', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 5000, 1020.23, '2025-06-25', 31, 'Transigido', 'CERRADO', 'RVC'),
('1001303280', 2025, 'Mayo', 'Lima', 'Comas', 'Santa Isabel', '2025-05-26', null, 'Micaela Solis', 4, 'Muerte', 'Policontuso', 6900, 'Grave', null, 150000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001303292', 2025, 'Mayo', 'Lima', 'ATE', 'ATE', '2025-05-25', null, 'Pierina Ugaz', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', null, 15000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001303780', 2025, 'Mayo', 'LIMA', 'LIMA', 'Mateo Pumacahua', '2025-05-26', null, 'DS', 1, 'Astrid Salcedo Paucar (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001303905', 2025, 'Mayo', null, 'CALLERIA', 'PUCALLPA', '2025-05-27', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 4000, '2025-05-28', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001304115', 2025, 'Mayo', null, 'BELEN', '9 DE OCTUBRE', '2025-05-28', null, 'JOEL HUAHUACONDORI', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', 400, 32600, '2025-05-29', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001304278', 2025, 'Mayo', 'Lima', 'San Juan de Lurigancho.', 'Mariscal Cáceres.', '2025-05-28', null, 'Maritza Nizama', 5, 'Policontuso / fractura', 'Policontuso', 8625, 'Grave', 9950, 25050, '2025-06-25', 28, 'Transigido', 'CERRADO', 'RVC'),
('1001304443', 2025, 'Mayo', null, 'TARAPOTO', 'TARAPOTO', '2025-05-28', null, 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 3000, 0, '2025-05-28', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001304447', 2025, 'Mayo', 'LIMA', 'LIMA', 'Las Praderas', '2025-05-28', null, 'JD', 1, 'Carmen Orozco Gutierrez (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, '2025-10-03', 128, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001305028', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Borja', '2025-05-29', null, 'JD', 1, 'Jaime Alonso Chacón Tenorio (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 2000, '2025-09-17', 111, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001305171', 2025, 'Mayo', 'LIMA', 'LIMA', 'Surco', '2025-05-30', null, 'DS', 1, 'Consuelo Rojas Romero (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001305198', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Isidro', '2025-05-29', null, 'GC', 1, 'Orlando Segundo VIlcabana Sanchez (Fractura de Mano y herida contusa en la pierna)', 'Policontuso', 1725, 'Grave', 30000, -27000, '2025-07-01', 33, 'Transigido', 'CERRADO', 'Abeo'),
('1001286118', 2025, 'Abril', 'Lima', 'Rimac', 'Piedra Liza', '2025-04-14', '2025-04-14', 'Pilar Dextre', 1, 'Muerte', 'Policontuso', 1725, 'Leve', null, 80000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001305431', 2025, 'Mayo', 'LIMA', 'LIMA', 'Magdalena', '2025-05-30', null, 'DS', 1, 'Patrick Joseph Vasquez Huansi (Esguince en Rodilla', 'Esguince', 2300, 'Grave', 8000, 11000, '2025-12-08', 192, 'Transigido', 'CERRADO', 'Abeo'),
('1001305471', 2025, 'Mayo', 'Lima', 'Jesus María', 'Jesus María', '2025-05-30', null, 'Pierina Ugaz', 1, 'Policontuso, atricción', 'Policontuso', 1725, 'Leve', 150, 4850, '2025-06-05', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001305824', 2025, 'Mayo', 'LIMA', 'LIMA', 'Orrantia', '2025-05-31', null, 'DS', 1, 'Esguince + Policontuso', 'Esguince', 2300, 'Leve', 0, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001305828', 2025, 'Mayo', 'Lima', 'Jesus María', 'Jesus María', '2025-05-31', null, 'Maritza Nizama', 1, 'Herida en rodilla', 'TEC Leve', 5750, 'Leve', 250, 4750, '2025-06-06', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001306740', 2025, 'Junio', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-06-02', null, 'Micaela Solis', 0, '-', 'Policontuso', 0, 'Leve', 0, 5000, '2025-06-10', 8, 'Transigido', 'CERRADO', 'RVC'),
('1001306747', 2025, 'Agosto', 'Lima', 'Callao', 'Playa Rímac.', '2025-08-08', null, 'Maritza Nizama', 1, 'Policontuso por accidente de tránsito.', 'Esguince', 2300, 'Leve', 3000, 0, '2025-11-12', 96, 'Transigido', 'CERRADO', 'RVC'),
('1001307386', 2025, 'Junio', 'LIMA', 'LIMA', 'Pamplona', '2025-06-04', null, 'GC', 1, 'Joyser Ingleyser Coronel Zarate (policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001307398', 2025, 'Junio', 'LIMA', 'LIMA', 'Monterrico', '2025-06-04', null, 'JD', 1, 'Carlos Julián Cadavid Cáceres (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001307486', 2025, 'Junio', 'LIMA', 'LIMA', 'San Borja', '2025-06-04', null, 'DS', 1, 'Cleidys Milagros Diaz (Herida cortante en el rostro)', 'Policontuso', 1725, 'Leve', 5000, -2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001307537', 2025, 'Junio', 'Lima', 'Cercado Lima', 'Alfonso Ugarte', '2025-02-04', null, 'Pierina Ugaz', 1, 'Fractura', 'Policontuso', 1725, 'Leve', null, 55000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001307806', 2025, 'Junio', null, 'BANDA DE SHILCAYO', 'BANDA DE SHILCAYO', '2025-06-05', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso y corte', 'Policontuso y corte', 2300, 'Leve', 1200, 1800, '2025-06-04', -1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001307855', 2025, 'Junio', null, 'YANACANCHA', 'YANACANCHA', '2025-06-05', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 4000, -2500, '2025-06-06', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001308061', 2025, 'Junio', null, 'ZAMACOLA', 'ZAMACOLA', '2025-06-04', null, 'RUTH HUAHUACONDORI', 1, 'Policontuso y corte', 'Policontuso y corte', 2300, 'Leve', 5000, -2000, '2025-07-05', 31, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001308564', 2025, 'Junio', 'Lima', 'Cercado Lima', 'San Andrés', '2025-06-07', null, 'Maritza Nizama', 1, 'Lesión por aplastamiento y descarte de fractura', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001308575', 2025, 'Junio', 'LIMA', 'LIMA', 'San Antonio', '2025-06-07', null, 'JD', 1, 'Fabiana Yola Villavicencio Zarazu (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 8000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001308856', 2025, 'Junio', 'LIMA', 'LIMA', 'San Borja', '2025-06-08', null, 'JD', 1, 'Robinson Sebastian Molina Principe (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001308997', 2025, 'Junio', null, null, null, '2025-06-09', null, 'Eduardo', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001309207', 2025, 'Junio', 'LIMA', 'LIMA', 'Lince', '2025-06-09', null, 'JD', 1, 'Danilo Shingari Yumpiri (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001309479', 2025, 'Junio', 'LIMA', 'LIMA', 'San Isidro', '2025-06-09', null, 'DS', 1, 'Sabino Martin Usin Vasquez (Politraumatismo) y Oscar Joel Gonzáles Ojeda (Politraumatismo, Esguince Rodilla)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001309509', 2025, 'Junio', 'LIMA', 'LIMA', 'Chorrillos', '2025-06-10', null, 'OU', 1, 'José Enrique Torres Lizana (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 550, 54450, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001309740', 2025, 'Junio', 'LIMA', 'LIMA', 'Lince', '2025-06-10', null, 'DS', 1, 'Yolanda Janet Chavez Cespedes (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1500, 11000, '2025-08-04', 55, 'Transigido', 'CERRADO', 'Abeo'),
('1001309772', 2025, 'Junio', 'Lima', 'La victoria', 'La victoria', '2025-06-10', null, 'Micaela Solis', 1, 'sin DX', 'Policontuso', 1725, 'Leve', 0, 5000, '2025-08-04', 55, 'Transigido', 'CERRADO', 'RVC'),
('1001309871', 2025, 'Junio', 'LIMA', 'LIMA', 'San Isidro', '2025-06-11', null, 'JD', 1, 'Kristel Mishury Chávez Arenas (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 2000, 3000, '2025-08-25', 75, 'Transigido', 'CERRADO', 'Abeo'),
('1001289416', 2025, 'Octubre', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-10-14', null, 'Pierina Ugaz', 1, 'Traumatismo intracraneal no especificados, quedándose internado', 'Policontuso', 1725, 'Leve', null, 50000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001311226', 2025, 'Junio', 'Lima', 'Callo', 'San Miguel', '2025-06-13', null, 'Noelia', 1, 'Traumatismo superficial múltiples de la pierna', 'Policontuso', 1725, 'Leve', 100, 19900, '2025-05-16', -28, 'Transigido', 'CERRADO', 'RVC'),
('1001311761', 2025, 'Junio', 'Lima', 'San Miguel', 'San Miguel', '2025-06-15', null, 'Micaela Solis', 1, 'contusion', 'Fallecido', 65000, 'Grave', 440, 9560, '2025-06-19', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001311771', 2025, 'Junio', 'Lima', 'Breña.', 'Chacra Colorada.', '2025-06-16', null, 'Maritza Nizama', 2, 'herida cortante de región de cara', 'Politraumatizado', 8000, 'Grave', null, 45000, '2025-10-06', 112, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001311773', 2025, 'Junio', 'LIMA', 'LIMA', 'San Antonio', '2025-06-16', null, 'OU', 1, 'Hector José Matías Zuñiga Jimenez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001311783', 2025, 'Junio', 'LIMA', 'LIMA', 'Sagitario', '2025-06-16', null, 'JD', 1, 'Junior Fabricio Almeyda Palomino (13 / Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 20000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001312112', 2025, 'Junio', 'LIMA', 'LIMA', 'Miraflores', '2025-06-16', null, 'OU', 1, 'Rafael Estuardo Vertiz Vargas (Politraumatismo, Rotura Pieza Dental)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001312507', 2025, 'Junio', 'LIMA', 'LIMA', 'Orrantia', '2025-06-17', null, 'DS', 1, 'Isabel Chumbiouma Barraza (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001312668', 2025, 'Junio', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-06-17', null, 'Micaela Solis', 1, 'Fractura de clavícula y muñeca', 'Policontuso', 1725, 'Leve', 5000, 20638.4, '2025-08-14', 58, 'Transigido', 'CERRADO', 'RVC'),
('1001312715', 2025, 'Junio', 'LIMA', 'LIMA', 'San Antonio', '2025-06-17', null, 'GC', 1, 'María Antoni Scatolini Cerquera (Fractura de tibia)', 'Fractura de tibia', 17250, 'Grave', 0, 3000, '2025-07-10', 23, 'Transigido', 'CERRADO', 'Abeo'),
('1001312732', 2025, 'Junio', null, 'SACHACA', 'SACHACA', '2025-06-17', null, 'RUTH HUAHUACONDORI', 1, 'Esguince + Policontuso', 'Esguince', 2300, 'Leve', 1500, 1500, '2025-06-19', 2, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001312941 / 329573', 2025, 'Junio', null, null, null, '2025-06-17', null, 'Eduardo', 1, null, 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001312965', 2025, 'Junio', 'LIMA', 'LIMA', 'San Isidro', '2025-06-18', null, 'DS', 1, 'Evelyn Elena Yupan Peña (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, '2026-03-24', 279, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001313809', 2025, 'Junio', null, 'IMATA', 'SAN ANTONIO DE CHUCA', '2025-06-19', null, 'RUTH HUAHUACONDORI', 1, 'Politraumatizado + Policontuso', 'Politraumatizado', 4000, 'Leve', 0, 55000, '2025-07-04', 15, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001314531', 2025, 'Junio', 'Lima', 'Laura Caller', 'San Martin de Porres.', '2025-06-22', null, 'Pierina Ugaz', 1, 'Tec y Fracturas multiples', 'Policontuso', 1725, 'Leve', null, 60000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001314595', 2025, 'Junio', 'LIMA', 'LIMA', 'Monterrico', '2025-06-22', null, 'GC', 1, 'Yashuri Linda Huamaní Miranda (Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001314625', 2025, 'Junio', 'Lima', 'Ate', 'Ate', '2025-06-22', null, 'Maritza Nizama', 3, 'Polincotuso', 'Policontuso y corte', 6900, 'Grave', null, 30000, '2025-10-25', 125, 'Transigido', 'CERRADO', 'RVC'),
('1001314709', 2025, 'Junio', 'Lima', 'Ingunza', 'Callao', '2025-06-23', null, 'Noelia', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 5000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001314743', 2025, 'Junio', 'LIMA', 'LIMA', 'Chilca', '2025-06-23', null, 'JD', 1, 'Anggelo Román Pineda Olaya (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 5000, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001314779', 2025, 'Junio', 'LIMA', 'LIMA', 'San Antonio', '2025-06-23', null, 'DS', 1, 'Sandra Aliaga Toro (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001297031', 2025, 'Mayo', 'Lima', 'Lima', 'Mirones Bajo', '2025-05-10', null, 'Maritza Nizama', 1, 'Herida', 'Policontuso', 1725, 'Leve', 5300, 4907, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001315047', 2025, 'Junio', 'LIMA', 'LIMA', 'Pueblo Libre', '2025-06-23', null, 'DS', 1, 'Laura Ibet Huaraca Escobar (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001315280', 2025, 'Junio', 'LIMA', 'LIMA', 'Miraflores', '2025-06-23', null, 'JD', 1, 'Rudy Merino Villacorta Cahuaza (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001315387', 2025, 'Junio', 'LIMA', 'LIMA', 'Orrantia', '2025-06-24', null, 'DS', 1, 'Rocio del Pilar Minaya Daulis (Politraumatizada)', 'Politraumatizado', 4000, 'Grave', 8000, -2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001315552', 2025, 'Junio', 'LIMA', 'LIMA', 'Pueblo Libre', '2025-06-24', null, 'GC', 1, 'Joselin Brigitte Kuo Bacilio (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1900, 4100, '2025-07-14', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1001315844', 2025, 'Junio', 'Lima', 'Puente Piedra', 'Puente Piedra', '2025-06-25', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '2025-11-28', 156, 'Transigido', 'CERRADO', 'RVC'),
('1001316198', 2025, 'Junio', null, 'TAMBURCO', 'TAMBURCO', '2025-06-27', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 5000, null, null, 'Daño Material', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001316570', 2025, 'Junio', 'LIMA', 'LIMA', 'Miraflores', '2025-06-26', null, 'GC', 1, 'Rosita Leiva Chillón y Ana Alva Espinoza ( Politraumatizadas', 'Politraumatizado', 4000, 'Grave', 28000, -26000, '2025-08-15', 50, 'Transigido', 'CERRADO', 'Abeo'),
('1001297789', 2025, 'Mayo', 'LIMA', 'LIMA', 'Monterrico', '2025-05-12', null, 'JD', 1, 'Nilton César Cumbe Quiroga (Fisuras de Muñeca y Tobillo)', 'Policontuso', 1725, 'Leve', 0, 20000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001316807', 2025, 'Junio', null, 'PUNO', 'HUASCAR', '2025-06-26', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001316979', 2025, 'Junio', 'Lima', 'Alfonso ugarte', 'Lima', '2025-06-27', null, 'Maritza Nizama', 1, 'Policontuso, TEC leve.', 'Policontuso', 1725, 'Grave', 8000, 3000, '2025-01-31', -147, 'Transigido', 'CERRADO', 'RVC'),
('1001317051', 2025, 'Junio', 'Lima', 'Bellavista.', 'Bellavista', '2025-06-27', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '2025-12-16', 172, 'Transigido', 'CERRADO', 'RVC'),
('1001317076', 2025, 'Junio', 'LIMA', 'LIMA', 'Chacarilla', '2025-06-27', null, 'DS', 1, 'Angelica Jacqueline Tineo Cjuiro (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001317122', 2025, 'Junio', 'Lima', 'Sol de Oro', 'Los Olivos', '2025-06-28', null, 'Noelia', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 6500, 5490, '2025-09-15', 79, 'Transigido', 'CERRADO', 'RVC'),
('1001299652', 2025, 'Mayo', 'LIMA', 'LIMA', 'Barranco', '2025-05-16', null, 'OU', null, 'NN no pasa atención en el momento', 'Policontuso', 0, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001317302', 2025, 'Junio', null, 'JOSE LUIS BUSTAMANTE Y RIVERO', 'SAN JOSE', '2025-06-28', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 2500, 500, '2025-07-10', 12, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001317527 / 333170', 2025, 'Junio', null, null, null, '2025-06-29', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, '2025-06-29', 0, 'Cerrado s/detalle', 'CERRADO', 'Chacon'),
('1001317559', 2025, 'Junio', 'Lima', 'Jesus Maria', 'Jesus Maria', '2025-06-29', null, 'Maritza Nizama', 1, 'Policontuso por accidente de tránsito.', 'Politraumatizado', 4000, 'Leve', 2000, 13000, '2025-07-02', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001317970', 2025, 'Julio', 'LIMA', 'LIMA', 'Pamplona', '2025-07-01', null, 'GC', 1, 'Adela Eugennia Junco Vasquez (esguince de muñeca)', 'Esguince', 2300, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001305401', 2025, 'Mayo', 'Lima', 'La Victoria', 'La Victoria', '2025-05-30', null, 'Pierina Ugaz', 1, 'Muerte', 'Policontuso', 1725, 'Leve', null, 55000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001319411', 2025, 'Julio', 'LIMA', 'LIMA', 'San Borja', '2025-07-03', null, 'JD', 1, 'Sofía Francisca Pinedo Bunsen (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 9000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001319795', 2025, 'Julio', 'LIMA', 'LIMA', 'Chacarilla', '2025-07-04', null, 'DS', 1, 'Yony Gregorio Ampueda Gomez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('100132011', 2025, 'Julio', 'LIMA', 'LIMA', 'Chorrillos', '2025-07-04', null, 'JD', 1, 'Diego Angelo Jimenez Campomanes (Fractura de Pierna Derecha)', 'Fractura Pierna', 17250, 'Grave', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001321543', 2025, 'Julio', 'Lima', 'Chosica', 'Chosica', '2025-07-09', null, 'Maritza Nizama', 2, 'fractura', 'TEC Leve', 11500, 'Grave', 10000, 7657.5, '2025-09-03', 56, 'Transigido', 'CERRADO', 'RVC'),
('1001321735', 2025, 'Julio', null, 'YANAHUARA', 'YANAHUARA', '2025-07-09', null, 'RUTH HUAHUACONDORI', 3, null, 'Policontuso', 5175, 'Leve', 700, 400, '2025-07-10', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001322011', 2025, 'Julio', 'LIMA', 'LIMA', 'Miraflores', '2025-07-09', null, 'DS', 2, 'Daniel Otero Madueño y Gabriela Madueño Gaviria (Politraumatizados)', 'Politraumatizado', 8000, 'Grave', 0, 3000, '2026-01-16', 191, 'Archivado', 'CERRADO', 'Abeo'),
('1001322031', 2025, 'Julio', 'LIMA', 'LIMA', 'Orrantia', '2025-07-10', null, 'DS', 1, 'Gloria Rocio Rocano Caro (Policontusa)', 'Policontuso', 1725, 'Leve', null, 4000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001322360', 2025, 'Julio', 'LIMA', 'LIMA', 'Monterrico', '2025-07-11', null, 'OU', 3, 'José Ludwing Cam Martinez (TIC, Trauma Ocular, Politraumatizado), Pool Yustyn Vasquez Alfaro (TEC) y Yimauro Manuel Vasquez Alfaro (TEC)', 'Politraumatizado', 12000, 'Grave', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001322594', 2025, 'Julio', 'LIMA', 'LIMA', 'Praderas', '2025-07-11', null, 'OU', 1, 'Lourdes Acacia Micaela Espinoza La Rosa (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001322628', 2025, 'Julio', 'Lima', 'Callao', 'La Perla', '2025-11-07', null, 'Noelia', 1, 'politraumatismo', 'Politraumatizado', 4000, 'Leve', null, 45000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001322846', 2025, 'Julio', 'LIMA', 'LIMA', 'La Molina', '2025-07-12', null, 'OU', 1, 'Roniel de Jesús Díaz Pineda (Politraumatizado, Múltiples laceraciones rostro)', 'Politraumatizado', 4000, 'Leve', 0, 2000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001323074', 2025, 'Julio', null, 'SACHACA', 'SACHACA', '2025-07-13', null, 'RUTH HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', 4260, -1260, '2025-07-18', 5, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001323581', 2025, 'Julio', 'LIMA', 'LIMA', 'Monterrico', '2025-07-14', null, 'GC', 1, 'Charbel Awuapara Cardenas (Esguince en Rodilla)', 'Esguince', 2300, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001323586', 2025, 'Julio', 'Lima', 'Lima', 'Monserrat', '2025-07-14', null, 'Pierina Ugaz', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', 250, 9750, '2025-07-14', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001323593', 2025, 'Julio', 'LIMA', 'LIMA', 'Monterrico', '2025-07-14', null, 'GC', 1, 'Charbel Awuapara Cardenas (Esguince en Rodilla)', 'Esguince', 2300, 'Leve', null, 5000, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('1001323685', 2025, 'Julio', 'LIMA', 'LIMA', 'San Borja', '2025-07-15', null, 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, 8000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001324486', 2025, 'Julio', 'LIMA', 'LIMA', 'Las Praderas', '2025-07-16', null, 'DS', 1, 'Daniela Viviana Vilela Salinas (Esguince Cervical)', 'Esguince', 2300, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001324788', 2025, 'Julio', 'Lima', 'Rimac', 'Rimac', '2025-07-16', null, 'Maritza Nizama', 2, 'Policontuso / constusión', 'Policontuso', 3450, 'Leve', 2450, 8535, '2025-09-03', 49, 'Transigido', 'CERRADO', 'RVC'),
('1001325004', 2025, 'Julio', 'Lima', 'Cercado de Lima', 'Chacra Colorada', '2025-07-17', null, 'Noelia', 1, 'Contusión de cadera derecha', 'Politraumatizado', 4000, 'Leve', null, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001325196', 2025, 'Julio', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2025-07-17', null, 'Micaela Solis', 1, 'Policontuso herida contusa pierna izquierda.', 'Politraumatizado', 4000, 'Leve', 1700, 1484, '2025-08-14', 28, 'Transigido', 'CERRADO', 'RVC'),
('1001325583', 2025, 'Julio', 'Lima', 'Callao', 'Carmen de la Legua', '2025-07-19', null, 'Pierina Ugaz', 1, 'Contusiones múltiples por accidente de transito', 'Policontuso', 1725, 'Leve', 120, 9880, '2025-07-19', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001325691', 2025, 'Julio', 'LIMA', 'LIMA', 'Lince', '2025-07-19', null, 'DS', 2, 'Fabricio Pablo Daniel Sevilora Ponce (Fractura Pierna) y Juan Heraclides Bustinza Rodriguez (Politraumatizado)', 'Fractura Pierna', 34500, 'Grave', 5500, 5000, '2025-08-21', 33, 'Transigido', 'CERRADO', 'Abeo'),
('1001325805', 2025, 'Julio', 'Lima', 'Lima', 'Mirones bajo', '2025-07-19', null, 'Maritza Nizama', 5, 'Contusiones múltiples por accidente de transito', 'Policontuso', 8625, 'Grave', null, 10000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001326029', 2025, 'Julio', 'Lima', 'Chaclacayo.', 'Chaclacayo.', '2025-07-21', null, 'Micaela Solis', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 100, 29900, '2025-05-01', -81, 'Transigido', 'CERRADO', 'RVC'),
('1001310445', 2025, 'Junio', 'LIMA', 'LIMA', 'Surco', '2025-06-12', null, 'DS', 1, 'NN (Fallecida)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001326072', 2025, 'Julio', 'LIMA', 'LIMA', 'San Isidro', '2025-07-21', null, 'GC', 1, 'Cesar Antonio Campos Sussarego (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001326315', 2025, 'Julio', 'Lima', 'Cercado de Lima', 'Monserrat', '2025-07-21', null, 'Noelia', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 400, 14600, '2025-07-24', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001326412', 2025, 'Julio', 'Lima', 'Callao', 'Ciudad del Pescador', '2025-07-21', null, 'Pierina Ugaz', 1, 'Traumatismo por accidente vehicular, quedando internado.', 'Politraumatizado', 4000, 'Leve', null, 1020, '2026-02-06', 200, 'Transigido', 'CERRADO', 'RVC'),
('1001326472', 2025, 'Julio', 'LIMA', 'LIMA', 'San Borja', '2025-07-22', null, 'OU', 1, 'Bruno Andre García Vega (Cervicalgia)', 'Cervicalgia', 2300, 'Leve', 0, 0, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001326480', 2025, 'Julio', 'Lima', 'Jesús María.', 'Jesús María', '2025-07-22', null, 'Maritza Nizama', 1, 'Fractura', 'Fallecido', 65000, 'Grave', 6000, 2790, '2025-11-03', 104, 'Transigido', 'CERRADO', 'RVC'),
('1001326485', 2025, 'Julio', 'LIMA', 'LIMA', 'Chacarilla', '2025-07-21', null, 'DS', 1, 'Carmen Mercedes Cairo Mena (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1500, 1500, '2025-08-27', 37, 'Transigido', 'CERRADO', 'Abeo'),
('1001326622  / 340098', 2025, 'Julio', null, null, null, '2025-07-22', null, 'Eduardo', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001327017', 2025, 'Julio', 'Lima', 'San Miguel', 'San Miguel', '2025-07-22', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001327334', 2025, 'Julio', 'LIMA', 'LIMA', 'San Isidro', '2025-07-24', null, 'OU', 1, 'Sebastián Ivan Cari Sixto (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 12000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001328434', 2025, 'Julio', 'Lima', 'Cañete', 'San Vicente de Cañete', '2025-07-26', null, 'Noelia', 3, '1.        Por descartar fractura de mano derecha
2.        Por descartar fractura de pelvis
3.        Por descartar contusión de tórax', 'Policontuso', 5175, 'Leve', null, 30000, '2026-10-02', 433, 'Transigido', 'CERRADO', 'RVC'),
('1001328454', 2025, 'Julio', 'Lima', 'Lima', 'Petit Thouars', '2025-07-26', null, 'Pierina Ugaz', 1, 'Policonuso', 'Policontuso', 1725, 'Leve', null, 20000, '2025-12-01', 128, 'Transigido', 'CERRADO', 'RVC'),
('1001328590', 2025, 'Julio', 'Lima', 'La victoria', 'la victoria', '2025-07-27', null, 'Noelia', 4, '1. Policontuso
2. Policontuso 
3. Herida de la mejia y de la región temporomandibular   
4. Traumatismo superficiales múltiples no especificados y contusión de codo', 'Fallecido', 260000, 'Grave', null, 50000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001328736', 2025, 'Julio', 'LIMA', 'LIMA', 'Miraflores', '2025-07-27', null, 'DS', 1, 'Luis Armando Sanchez Gonzales', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001328740', 2025, 'Julio', 'Lima', 'Lima', 'Alfonso Ugarte', '2025-07-27', null, 'Maritza Nizama', 3, 'TEC', 'Politraumatizado', 12000, 'Grave', 3100, 36900, '2025-08-01', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001328903', 2025, 'Julio', 'LIMA', 'LIMA', 'Surco', '2025-07-28', null, 'JD', 1, 'Dieliberth Espinoza Castillo (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('1001329099', 2025, 'Julio', 'LIMA', 'LIMA', 'Monterrico', '2025-07-30', null, 'JD', 4, 'Guiliana Martha Luisa Leguia Leguia (Politraumatismo), Cayetana Illary Riveros Carrillo (Politraumatismo), Sabrina Caeli Riveros Carrillo (Politraumatismo), Nataly Chiara Jumpa Carrillo (Politraumatismo)', 'Politraumatizado', 16000, 'Grave', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001330833', 2025, 'Agosto', 'LIMA', 'LIMA', 'Surco', '2025-08-02', null, 'GC', 1, 'Angel Nove Pedraza Lucero (Policontuso', 'Policontuso', 1725, 'Leve', 600, 2400, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001331216', 2025, 'Agosto', 'Lima', 'San Miguel', 'San Miguel', '2025-02-02', null, 'Pierina Ugaz', 1, 'raumatismo Superficiales Múltiples', 'Policontuso', 1725, 'Leve', 600, 29400, '2025-02-02', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001332344', 2025, 'Agosto', null, 'MIRAFLORES', 'MIRAFLORES', '2025-08-06', null, 'RUTH HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', 0, 4000, '2025-08-07', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001332388', 2025, 'Agosto', 'Lima', 'Callao', 'La Legua', '2025-07-08', null, 'Noelia', 1, 'Trauma Tórax Abdominal y Pelvis Grave', 'Policontuso', 1725, 'Grave', 40000, 14500, '2025-10-13', 97, 'Transigido', 'CERRADO', 'RVC'),
('1001332450', 2025, 'Agosto', 'Chincha', 'Chincha', 'Alto Laran.', '2025-08-24', null, 'Micaela Solis', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', null, 15000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001332461', 2025, 'Agosto', 'Lima', 'Lima', 'San Miguel', '2025-07-08', null, 'Pierina Ugaz', 1, 'Traumatismos  de estructuras múltiples e la rodilla -herida de dedo  de la mano – herida de rodilla', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-11-08', 123, 'Transigido', 'CERRADO', 'RVC'),
('1001333208', 2025, 'Agosto', 'LIMA', 'LIMA', 'Santa Felicia', '2025-08-09', null, 'OU', 1, 'Enmanuel Gustavo Baldeón Hurtado (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 500, 2500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001333313', 2025, 'Agosto', 'Lima', 'SJL', 'PIEDRA LIZA', '2025-09-08', null, 'Micaela Solis', 1, 'FRACTURA', 'Policontuso', 1725, 'Leve', null, 30000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001333550', 2025, 'Agosto', 'LIMA', 'LIMA', 'Sagitario', '2025-08-09', null, 'OU', 1, 'Deini López Fernández (Aparente Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001333790', 2025, 'Agosto', 'LIMA', 'LIMA', 'Orrantia', '2025-08-10', null, 'OU', 1, 'Emerson Manuel Rivera Núñez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 200, 2800, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001334056', 2025, 'Agosto', 'LIMA', 'LIMA', 'Miraflores', '2025-08-11', null, 'OU', 1, 'Allyson Elizabeth Lau Ayala (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001334394', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Borja', '2025-08-12', null, 'GC', 1, 'Patricia Flores Rivera (Policontuso)', 'Policontuso', 1725, 'Leve', null, 5000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001334641', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Antonio', '2025-08-12', null, 'DS', 1, 'Andreina del Valle Alvarez Gil (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1500, 3500, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001334747', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Borja', '2025-08-13', null, 'DS', 1, 'Eduardo Franco Sanchez de la Rosa (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001335048', 2025, 'Agosto', 'LIMA', 'LIMA', 'Chacarilla', '2025-08-14', null, 'OU', 1, 'Pablo Palacios Vera (Hipertrofia del ligamento amarillo, Discopatía y artropatía facetaria, Esguince y torcedura de columna lumbar)', 'Torcedura', 3450, 'Leve', 5000, -2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001335054', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Isidro', '2025-08-14', null, 'JD', 1, 'Imar Josue Vásquez Burgos (Fisura de Rodilla Derecha / Cortes profundos en mano derecha / Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001335096', 2025, 'Agosto', 'Lima', 'SJL', 'ZARATE', '2025-08-13', null, 'Noelia', 1, 'Policontuso en mano y muñeca derecha', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001335151', 2025, 'Agosto', 'Lima', 'Comas', 'TUPAC AMARU', '2025-08-14', null, 'Pierina Ugaz', 1, 'Policontuso, quedando en observación.', 'Policontuso', 1725, 'Leve', 400, 14600, '2025-08-14', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001335268', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Isidro', '2025-08-14', null, 'GC', 1, 'Victor Mauricio Mercado Puyo (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001335569', 2025, 'Agosto', 'LIMA', 'LIMA', 'Surquillo', '2025-08-15', null, 'GC', 1, 'Antonio Jesús Marrero Tovar (Policontusso)', 'Policontuso', 1725, 'Leve', 0, 6000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001335837', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Borja', '2025-08-15', null, 'OU', 1, 'Carlos Sebastián Cabrera Aramburu (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 11000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001336446', 2025, 'Agosto', 'Lima', 'Cercado de Lima', 'Unidad Vecinal N° 3.', '2025-08-17', null, 'Maritza Nizama', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2025-08-19', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001336667', 2025, 'Agosto', 'LIMA', 'LIMA', 'Miraflores', '2025-08-18', null, 'GC', 1, 'Julio Cesar Bravo Ramirez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001337016', 2025, 'Agosto', 'LIMA', 'LIMA', 'Magdalena', '2025-08-19', null, 'DS', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001314783', 2025, 'Junio', 'LIMA', 'LIMA', 'San Isidro', '2025-06-23', null, 'JD', 1, 'Rafael D''Angelo Casabone (Atricción de Pie Izquierdo /Fractura Expuesta de 5to dedo de Pie Izquierdo)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001337909', 2025, 'Agosto', 'LIMA', 'LIMA', 'Chacarilla', '2025-08-20', null, 'DS', 2, 'Carolina Paz Quiroga (Fractura de Costilla) y Gladys Paz Quiroga (Herda Cortante en el Rostro)', 'Policontuso', 3450, 'Leve', 5000, -2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001316774', 2025, 'Junio', 'LIMA', 'LIMA', 'San Juan de Miraflores', '2025-06-27', null, 'GC', 1, 'Josef Carlos Sierra Guerra (Tec y Politrumatizado)', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001338564', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Isidro', '2025-08-22', null, 'OU', 1, 'Jesus Orlando Cardoza Palma (Contusión Región Lumbosacra y Pelvis)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001338740', 2025, 'Agosto', 'Lima', 'El Agustino', 'Santoyo', '2025-08-23', null, 'Noelia', 1, 'Traumatismo toraxico de la pelvis y las dos rodillas', 'Politraumatizado', 4000, 'Leve', 1800, 5519, '2025-10-22', 60, 'Transigido', 'CERRADO', 'RVC'),
('1001338784', 2025, 'Agosto', 'Lima', 'Aucallama', 'Aucallama', '2025-08-24', null, 'Maritza Nizama', 1, 'Atrición Severa', 'Policontuso', 1725, 'Leve', null, 25000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001338906', 2025, 'Agosto', 'Callao', 'Callao', 'Bocanegra', '2025-08-23', null, 'Pierina Ugaz', 1, 'fractura de la pierna, y cortes en la cabeza', 'TEC Leve', 5750, 'Leve', null, 40000, '2025-09-23', 31, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001339151', 2025, 'Agosto', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2025-08-24', null, 'Noelia', 1, 'Fractura y politraumatizmo', 'Policontuso', 1725, 'Leve', null, 25000, '2025-10-24', 61, 'En Evaluación', 'ABIERTO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001339431', 2025, 'Agosto', 'LIMA', 'LIMA', 'Miraflores', '2025-08-25', null, 'OU', 1, 'Daniel Elias Sivira Gonzales (Herida Cortante Mano)', 'Policontuso', 1725, 'Leve', 0, 2000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001339433', 2025, 'Agosto', 'LIMA', 'LIMA', 'Monterrico', '2025-08-25', null, 'JD', 1, 'Cecilia Milagros Rodríguez Briceño (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001339491', 2025, 'Agosto', null, 'RIOJA', 'RIOJA', '2025-08-25', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 3000, '2025-08-26', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001339638', 2025, 'Agosto', 'Lima', 'Centro de Lima', 'Monserrate / UPIAT LIMA', '2025-08-26', null, 'Pierina Ugaz', 1, 'Muerte', 'TEC Leve', 5750, 'Leve', null, 80000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001339705', 2025, 'Agosto', 'Lima', 'San Miguel', 'Maranga', '2025-08-26', null, 'Maritza Nizama', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 20000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001339796', 2025, 'Agosto', 'LIMA', 'LIMA', 'Sagitario', '2025-08-26', null, 'OU', 1, 'Anthony Fernando Giron Chempen (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001340128', 2025, 'Agosto', 'Lima', 'SMP.', 'SMP.', '2025-08-26', null, 'Micaela Solis', 1, 'TEC SEVERO', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-09-09', 14, 'Transigido', 'CERRADO', 'RVC'),
('1001340223', 2025, 'Agosto', 'LIMA', 'LIMA', 'Monterrico', '2025-08-28', null, 'GC', 1, 'Matías Yasid Jamis Guglielmino (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 12000, '2025-09-23', 26, 'En Negociación', 'CERRADO', 'Abeo'),
('1001340248', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Borja', '2025-08-27', null, 'JD', 1, 'Maricielo Mamani Rodríguez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001340256', 2025, 'Agosto', 'Lima', 'Lima', 'Ingunza', '2025-08-27', null, 'Noelia', 1, 'Esguince de pierna derecha', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-01-09', -230, 'Transigido', 'CERRADO', 'RVC'),
('1001340902', 2025, 'Agosto', 'LIMA', 'LIMA', 'Chacarilla', '2025-08-29', null, 'DS', 1, 'Rodrigo Navarro Estrada (Contusión de tobillo)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001341024', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Isidro', '2025-08-29', null, 'DS', 1, 'Nicole Andrea Aleman Ibañez (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001341587', 2025, 'Agosto', null, 'JUANJUI', 'JUANJUI', '2025-08-30', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Grave', 23500, -20500, '2025-09-11', 12, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001341732', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Monterrico', '2025-09-01', null, 'JD', 1, 'Gianpier Osorio Kudman (Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Daño Material', 'CERRADO', 'Abeo'),
('1001342231', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Miraflores', '2025-09-02', null, 'GC', 1, 'Carlos Ramirez Roncal (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Otros', 'CERRADO', 'Abeo'),
('1001342271', 2025, 'Septiembre', 'Lima', 'Lima', 'Mirones Bajo.', '2025-02-09', null, 'Maritza Nizama', 1, 'Fractura Mutliple', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001342364', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Magdalena', '2025-09-02', null, 'OU', 2, 'Jair Fernando Espinoza Ortiz (Esguince y Torcedura que compromete ligamentos laterales, Traumatismo Pierna) y Edward Orlando Cabrera Mendocilla (Cervicalgia, Traumatismo de estructuras múltiples rodilla)', 'Torcedura', 6900, 'Grave', 4070, 1930, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001342510', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Orrantia', '2025-09-02', null, 'DS', 1, 'Ry Jose Osorio Sanchez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001343250', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Miraflores', '2025-09-04', null, 'JD', 1, 'Jorge Luis Gonzáles Falla (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001343359', 2025, 'Septiembre', 'Lima', 'San Miguel', 'Maranga', '2025-05-09', null, 'Noelia', 1, 'Esguinces y torceduras del tobillo', 'TEC Leve', 5750, 'Leve', 2100, 3300, '2025-10-14', 158, 'Transigido', 'CERRADO', 'RVC'),
('1001343475', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Miraflores', '2025-09-05', null, 'JD', 1, 'Mirko Barturen Arteaga (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001343513', 2025, 'Septiembre', 'Lima', 'La Perla', 'La Perla', '2025-05-09', null, 'Pierina Ugaz', 1, 'Policontuso de pierna, rodilla y brazo lado derecho', 'Esguince', 2300, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001343662', 2025, 'Septiembre', 'LIMA', 'LIMA', 'San Isidro', '2025-09-06', null, 'OU', 1, 'Diez De Tejada (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 6000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001343745', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Barranco', '2025-09-06', null, 'OU', 1, 'Juan Leonardo Berru García (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 900, 2100, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001343881', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Chorrillos', '2025-09-06', null, 'OU', 1, 'Luis Vicente Ruiz Palomino y ocupante (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001344010', 2025, 'Septiembre', 'Lima', 'Cercado de Lima', 'Unidad Vecinal 3', '2025-06-09', null, 'Maritza Nizama', 1, 'Traumatismo', 'Policontuso', 1725, 'Leve', 1200, 0, '2025-11-11', 155, 'Transigido', 'CERRADO', 'RVC'),
('1001344242', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Orrantia', '2025-09-08', null, 'OU', 1, 'Augusto Prado Roca (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 400, 19600, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001344378', 2025, 'Septiembre', 'Lima', 'SJL', 'Santa Elizabeth - S.J.L.', '2025-08-09', null, 'Micaela Solis', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', 1500, 0, '2025-09-15', 37, 'Transigido', 'CERRADO', 'RVC'),
('1001344855', 2025, 'Septiembre', null, 'CHONGOS ALTO', 'CHONGOS ALTO', '2025-09-09', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 55000, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001345103', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Miraflores', '2025-09-10', null, 'DS', 1, 'Magalli Patricia Castillo Soto (Policontusa)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001345180 / 354201', 2025, 'Septiembre', null, null, null, '2025-08-10', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Cerrado s/detalle', 'CERRADO', 'Chacon'),
('1001345589 / 354474', 2025, 'Septiembre', null, null, null, '2025-09-11', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Daño Material', 'CERRADO', 'Chacon'),
('1001345729', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Villa El Salvador', '2025-09-12', null, 'OU', 2, 'Fernanda Danae Valeria Torres Meregildo y Hannah Valentina Torres Meregildo (Policontuso)', 'Policontuso', 3450, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001345798', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Chacarilla', '2025-09-11', null, 'JD', 1, 'Ana María Malatesta Llanos (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001346345', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Lince', '2025-09-13', null, 'GC', 1, 'Mariana Giare Cuervo Caro (Policontuso)', 'Policontuso', 1725, 'Leve', 500, 9500, '2025-09-15', 2, 'Transigido', 'CERRADO', 'Abeo'),
('1001346447', 2025, 'Septiembre', 'Lima', 'Comas.', 'Túpac Amaru.', '2025-09-14', null, 'Maritza Nizama', 2, 'Contusión encefálica/ descartar TEC', 'Policontuso', 3450, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001346534', 2025, 'Septiembre', 'LIMA', 'LIMA', 'San Borja', '2025-09-14', null, 'GC', 1, 'Henry Augusto Cadenas Acosta (Policontuso)', 'Policontuso', 1725, 'Leve', 2500, 500, '2025-11-25', 72, 'Transigido', 'CERRADO', 'Abeo'),
('1001346555', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Magdalena', '2025-09-13', null, 'GC', 1, 'Marco Antonio Aguilar Lopez (fractura de cadera)', 'Fractura de cadera', 12000, 'Grave', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001346958', 2025, 'Septiembre', null, 'TAMBILLO', 'TAMBILLO', '2025-09-16', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 0, '2025-10-02', 16, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001346978', 2025, 'Septiembre', 'Lima', 'Lima', 'Petit Thouars', '2025-09-15', null, 'Micaela Solis', 1, 'Politraumatizado', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001317278', 2025, 'Junio', null, 'CHALA', 'CHALA', '2025-06-28', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 16000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001347636', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Barranco', '2025-09-17', null, 'JD', 1, 'Eugenio Mejía Cáceres (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 8000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001347697', 2025, 'Septiembre', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2025-09-17', null, 'Noelia', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 8000, '2025-10-06', 19, 'Transigido', 'CERRADO', 'RVC'),
('1001347958', 2025, 'Septiembre', 'Lima', 'Cercado de Lima', 'Petit Thouars', '2025-09-18', null, 'Micaela Solis', 1, 'TEC LEVE', 'TEC Leve', 5750, 'Leve', 1500, 0, '2025-10-20', 32, 'Transigido', 'CERRADO', 'RVC'),
('1001347979', 2025, 'Septiembre', 'Lima', 'SJL', 'Caja de Agua', '2025-09-17', null, 'Pierina Ugaz', 1, 'Traumatismo  múltiples, Policontuso por accidente de tránsito.', 'Policontuso', 1725, 'Leve', null, 25000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001347999', 2025, 'Septiembre', 'Lima', 'San Miguel', 'San Miguel', '2025-09-17', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 5000, 38040, '2025-11-03', 47, 'Transigido', 'CERRADO', 'RVC'),
('1001348042', 2026, 'Enero', 'LIMA', 'San Borja', 'San Borja', '2026-01-26', '2026-01-26', 'JD', 1, 'Jorge Luis Ortiz Valladares (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 2300, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001348132', 2025, 'Septiembre', null, 'EL TAMBO', 'EL TAMBO', '2025-09-18', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 3000, '2025-09-19', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001348432', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Magdalena', '2025-09-19', null, 'DS', 1, 'Katia Maria Mejía Cabrera (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 3000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001348951', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-09-20', null, 'DS', 1, 'Frangel Jonathan Quispe Paredes (Fractura del Metatarso)', 'Policontuso', 1725, 'Grave', 18000, -13000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('100134915', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-09-21', null, 'GC', 1, 'John Keybert Guzman Quintero (Politrumatizado)', 'Policontuso', 1725, 'Leve', 2060, 940, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001349267', 2025, 'Septiembre', null, 'CALLERIA', 'PUCALLPA', '2025-09-21', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 6000, null, null, 'Daño Material', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001349939', 2025, 'Septiembre', 'Lima', 'Ate Vitarte', 'Ate Vitarte', '2025-09-23', null, 'Noelia', 2, '1.Contusión de la región lumbosacra y de la pelvis  2. Policontuso', 'Politraumatizado', 8000, 'Grave', null, 35000, '2026-02-14', 144, 'En Negociación', 'ABIERTO', 'RVC'),
('1001350106', 2025, 'Septiembre', 'Lima', 'Lima', 'Payet', '2025-09-23', null, 'Pierina Ugaz', 1, '- Peatón: Luis Alberto Aliaga Mauricio (70)

- Diagnóstico: Policontuso por accidente de tránsito - atropello.

- Lugar de atención: Clínica Jesús del Norte.', 'Policontuso', 1725, 'Grave', 8600, 11400, '2026-01-23', 122, 'Transigido', 'CERRADO', 'RVC'),
('1001350137', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Villa Alejandro', '2025-09-24', null, 'OU', 1, 'Nancy María Miranda Tupac (Politraumatismo, Esguince Cervica)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001350315', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Orrantia', '2025-09-24', null, 'DS', 1, 'Josselin Esmit Palomino Rojas (Policontusa en gestación)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001350345', 2025, 'Septiembre', 'Lima', 'Ancón', 'Ancón', '2025-09-24', null, 'Maritza Nizama', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 364, 9636, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001319261', 2025, 'Julio', null, 'LA JOYA', 'SAN JOSE', '2025-07-03', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 4000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001350608 / 358619', 2025, 'Septiembre', null, null, null, '2025-09-26', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, '2025-09-26', 0, 'Daño Material', 'CERRADO', 'Chacon'),
('1001350639', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Chacarilla', '2025-09-25', null, 'JD', 1, 'Zsa Zsa Fort Garruez (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, '2025-12-16', 82, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001350680', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Miraflores', '2025-09-25', null, 'OU', 1, 'Rubén Junior Baldeón Velasquez (Fractura Muñeca y Tobillo)', 'Policontuso', 1725, 'Grave', 20990, -17990, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001350796', 2025, 'Septiembre', 'Lima', 'Santa Luzmila', 'Santa Luzmila', '2025-09-26', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso y corte', 2300, 'Leve', null, 15000, '2026-02-09', 136, 'Transigido', 'CERRADO', 'RVC'),
('1001350867', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Chacarilla', '2025-09-25', null, 'JD', 1, 'Debora Lucía Roldán Merino (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001351624', 2025, 'Septiembre', 'Lima', 'La Victoria', 'Apolo', '2025-09-30', null, 'Maritza Nizama', 1, 'Esguince cervical / contusión', 'TEC Leve', 5750, 'Leve', null, 8500, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001351964', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Orrantia', '2025-09-29', null, 'JD', 1, 'Raúl Jhosepi Pelaez Saavedra (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 20000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001352126', 2025, 'Septiembre', 'Lima', 'Comas', 'Santa Luzmila', '2025-09-30', null, 'Micaela Solis', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', 0, 13000, '2025-10-22', 22, 'Transigido', 'CERRADO', 'RVC'),
('1001352377', 2025, 'Septiembre', 'Lima', 'San Juan de Lurigancho', 'Huayrona', '2025-09-30', null, 'Noelia', 1, 'Traumatismo encéfalo craneano, por descartar fractura de cadera derecha', 'Policontuso', 1725, 'Leve', null, 10565, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001352481', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Curva de Villa', '2025-09-30', null, 'GC', 0, 'Laura Isabel Alvarez Galvez y Jurgen Coronel Alvarez (Policontusos)', 'Policontuso', 0, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001352511', 2025, 'Octubre', 'Lima', 'Los Olivos', 'Pro', '2025-01-10', null, 'Pierina Ugaz', 1, 'Contusión  en la región Lumbosacra, quedando en observación', 'Policontuso', 1725, 'Leve', null, 20000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001352551', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Lince', '2025-09-30', null, 'DS', 1, 'Jorge Luis Davila Urrutia (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001352554', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Curva de Villa', '2025-09-30', null, 'GC', 1, 'Jean Franco Leon Pérez (Policontuso)', 'Policontuso', 1725, 'Leve', 1200, 18800, '2025-12-17', 78, 'Transigido', 'CERRADO', 'Abeo'),
('1001352728', 2025, 'Octubre', 'LIMA', 'LIMA', 'Lurin', '2025-10-01', null, 'DS', 1, 'Daniel Franco Pichihua (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001353184', 2025, 'Octubre', 'LIMA', 'LIMA', 'Monterrico', '2025-10-02', null, 'DS', 1, 'Brayan Stephen Requena Plaza (Fractura de Cadera)', 'Fractura de cadera', 12000, 'Grave', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001353214', 2025, 'Octubre', 'LIMA', 'LIMA', 'Villa El Salvador', '2025-10-02', null, 'JD', 1, 'Diómedes Arroyo Vásquez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001353474', 2025, 'Octubre', 'Lima', 'Jesús Maria', 'Jesús María', '2025-03-10', null, 'Maritza Nizama', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', null, 5000, '2025-10-14', 218, 'Transigido', 'CERRADO', 'RVC'),
('1001353607', 2025, 'Octubre', 'LIMA', 'LIMA', 'Las Praderas', '2025-10-03', null, 'JD', 1, 'Patricia Huamán López (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001353834', 2025, 'Octubre', 'LIMA', 'LIMA', 'Miraflores', '2025-10-04', null, 'OU', 1, 'Rosmer Eduardo Ávila Pacheco (Fractura diafisiaria de Tibia y Peroné)', 'Policontuso', 1725, 'Grave', 8000, -6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001354079', 2025, 'Octubre', 'Lima', 'El Agustino', 'El Agustino', '2025-04-10', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 13000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001354530', 2025, 'Octubre', 'Lima', 'SMP', 'Barboncito', '2025-06-10', null, 'Pierina Ugaz', 1, 'Contusión  en el codo izquierdo - posterior fractura de codo izquierdo', 'Politraumatizado', 4000, 'Leve', null, 35000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001354629', 2025, 'Octubre', 'Lima', 'Comas', 'Santa Isabel', '2025-06-10', null, 'Maritza Nizama', 1, 'Policontuso', 'Politraumatizado', 4000, 'Leve', null, 8000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001354908', 2025, 'Octubre', 'LIMA', 'LIMA', 'Orrantia', '2025-10-07', null, 'GC', 1, 'Fatima Jennifer Daniela Lopez Martines (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 6000, '2025-10-28', 21, 'Transigido', 'CERRADO', 'Abeo'),
('1001354974', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Borja', '2025-10-07', null, 'GC', 1, 'Joel Delgado Santos (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 6000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001355027', 2025, 'Octubre', 'LIMA', 'LIMA', 'Orrantia', '2025-10-07', null, 'DS', 1, 'Tusnelda Patricia Teran Rodas (Esguince de Tobillo)', 'Esguince', 2300, 'Leve', 0, 20000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001355111', 2025, 'Octubre', 'Lima', 'Lima', 'Petit Thouars', '2025-07-10', null, 'Micaela Solis', 1, 'no se atendio', 'Policontuso', 1725, 'Leve', null, 5000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001355222', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Isidro', '2025-10-07', null, 'GC', 1, 'Antonio David Picon Cuevas (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('1001355223', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Antonio', '2025-10-07', null, 'OU', 1, 'Juan Edgardo Payé Mayta (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 650, 5350, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001355303', 2025, 'Octubre', 'Lima', 'Ate', 'Santa Clara', '2025-08-10', null, 'Noelia', 3, 'OT1:Contusión de la rodilla - OT2: Fractura vertebral lumbar quedando en obs para descartar fractura traumatismo vertebro medular OT3: Policontuso', 'Policontuso', 5175, 'Leve', null, 60000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001355447', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Juan de Miraflores', '2025-10-06', null, 'GC', 2, 'Manuel Bijon Costa Boza y Guisella Saravia Quispe (Policontusos)', 'Policontuso', 3450, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001355767', 2025, 'Octubre', 'Lima', 'Bellavista', 'Ramón Castilla', '2025-10-10', null, 'Micaela Solis', 1, 'Contusión en pierna derecha', 'TEC Leve', 5750, 'Leve', 0, 13000, '2025-11-25', 46, 'Transigido', 'CERRADO', 'RVC'),
('1001355772', 2025, 'Octubre', 'LIMA', 'LIMA', 'Chacarilla', '2025-10-09', null, 'OU', 1, 'Yerson Yslael Ruiz Veliz (Fractura Tibia y Peroné)', 'Policontuso', 1725, 'Leve', 5000, 0, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001355781', 2025, 'Octubre', 'Lima', 'Bellavista', 'Dulanto', '2025-10-10', null, 'Maritza Nizama', 6, 'Policontuso', 'Policontuso', 10350, 'Grave', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001355782', 2025, 'Octubre', 'LIMA', 'LIMA', 'Chacarilla', '2025-10-09', null, 'OU', 1, 'Franklin Eduardo Blanco Perez (Politraumatismo, Trauma Pierna)', 'Politraumatizado', 4000, 'Leve', 0, 10000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001355786', 2025, 'Octubre', 'LIMA', 'LIMA', 'Miraflores', '2025-10-09', null, 'GC', 2, 'Cecilia Andreina Vargas Zapata y Matteo Alonso Lopez Vargas (Policontuso)', 'Policontuso', 3450, 'Leve', null, 4000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001356215', 2025, 'Octubre', 'Lima', 'Jesús María', 'Jesús María', '2025-10-10', null, 'Noelia', 1, 'Herida policontuso y dos heridas a colgajo periocular derecho', 'Policontuso', 1725, 'Leve', 2500, 450, '2025-11-28', 49, 'Transigido', 'CERRADO', 'RVC'),
('1001356473', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Juan de Miraflores', '2025-10-12', null, 'GC', 1, 'Silvia Ursula Cabrera Silva (Esguince)', 'Esguince', 2300, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001356602', 2025, 'Octubre', 'LIMA', 'LIMA', 'Curva de Villa', '2025-10-13', null, 'DS', 1, 'Manuel Muñoz Najar Castañeda (Fractura de Tobillo)', 'Fractura Pierna', 17250, 'Grave', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001357071', 2025, 'Octubre', 'Lima', 'Comas', 'Tupac Amaru', '2025-10-10', null, 'Pierina Ugaz', 1, 'Traumatismo múltiple no especificado', 'TEC Leve', 5750, 'Grave', 10000, 2381.23, '2026-01-02', 84, 'Transigido', 'CERRADO', 'RVC'),
('1001357139', 2025, 'Octubre', null, 'CHONTABAMBA', 'OXAPAMPA', '2025-10-14', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 400, 5600, '2025-10-15', 1, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001357411', 2025, 'Octubre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-10-14', null, 'JD', 1, 'Yulay Katherin Falco Rivera (Politraumatismo, Esguince Pierna Derecha)', 'Politraumatizado', 4000, 'Leve', 1060, 1940, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001357420', 2025, 'Octubre', 'Lima', 'San Miguel', 'San Miguel', '2025-10-14', null, 'Maritza Nizama', 3, 'Policonstuso / contusición toracica / uci', 'Policontuso', 5175, 'Grave', 27000, 316, '2026-02-06', 115, 'Transigido', 'CERRADO', 'RVC'),
('1001357782', 2025, 'Octubre', null, 'SINCOS', 'SINCOS', '2025-10-15', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Grave', 19000, -16000, '2025-10-20', 5, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001357918', 2025, 'Octubre', 'LIMA', 'LIMA', 'Monterrico', '2025-10-16', null, 'OU', 1, 'Eduardo Felipe Añaños García (Politraumatismo, Traumatismo Superficial de Cabeza)', 'Politraumatizado', 4000, 'Leve', 1100, 8900, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001358055', 2025, 'Octubre', 'LIMA', 'LIMA', 'Miraflores', '2025-10-17', null, 'GC', 2, 'Victor Manuel Gomez Castillo  y Mayra Kimberly Rojas Meza (policontuso)', 'Policontuso', 3450, 'Leve', null, 20000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001358433', 2025, 'Octubre', 'Lima', 'SJL', 'Caja de agua', '2025-10-18', null, 'Pierina Ugaz', 1, 'Contusión en el tórax  y contusión en la mano derecha, quedando en observación', 'Policontuso', 1725, 'Leve', null, 50000, '2026-01-06', 80, 'Transigido', 'CERRADO', 'RVC'),
('1001358676', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Antonio', '2025-10-18', null, 'DS', 1, 'Jonathan Manuel Rojas Augusto (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001358915', 2025, 'Octubre', 'LIMA', 'LIMA', 'Chacarilla', '2025-10-18', null, 'JD', 1, 'Darwin Josuel Hernández Guaremae (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001358976', 2025, 'Octubre', 'LIMA', 'LIMA', 'Magdalena', '2025-10-20', null, 'DS', 1, 'Ian Gael Villavicencio Bustos (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 5000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001359080', 2025, 'Octubre', 'Lima', 'Ate', 'Salamanca', '2025-10-20', null, 'Maritza Nizama', 1, 'Corte en dedo anular de la mano derecha', 'Policontuso', 1725, 'Leve', 1200, 0, '2025-10-22', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001326065', 2025, 'Julio', null, 'HUAYLLAY', 'HUAYLLAY', '2025-07-20', null, 'JOEL HUAHUACONDORI', 4, null, 'Policontuso', 6900, 'Grave', null, 1500, null, null, 'Daño Material', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001359345', 2025, 'Octubre', 'Lima', 'Carmen de la Legua-Reynoso', 'Carmen de la legua', '2025-10-20', null, 'Micaela Solis', 1, 'Politraumatizado', 'Policontuso', 1725, 'Leve', 2300, 2768, '2025-12-22', 63, 'Transigido', 'CERRADO', 'RVC'),
('1001359604', 2025, 'Octubre', 'Lima', 'Lima', 'Mirones altos', '2025-10-21', null, 'Noelia', 1, 'Traumatismo múltiples vasos sanguíneos a nivel de cadera y del muslo derecho (quedando internado)', 'Policontuso', 1725, 'Leve', null, 70000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001337894', 2025, 'Agosto', 'LIMA', 'LIMA', 'Orrantia', '2025-08-23', null, 'DS', 1, 'Elizabet Ruiz Saldaña (Fractura)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001359841', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Antonio', '2025-10-21', null, 'OU', 2, 'Luis Omar Saavedra Salazar y Ana Mazia Jazmin Lina Calderón (Policontusos)', 'Policontuso', 3450, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001359930', 2025, 'Octubre', 'Lima', 'Lima', 'Salamanca', '2025-10-22', null, 'Pierina Ugaz', 1, 'TRAUMATISMOS SUPERFICIALES MÚLTIPLES, NO ESPECIFICADOS', 'Policontuso', 1725, 'Leve', 150, 9850, '2025-10-22', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001360232', 2025, 'Octubre', 'LIMA', 'LIMA', 'Surco', '2025-10-22', null, 'GC', 1, 'Bruno Danilo Cayo Quiñe (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001360266', 2025, 'Octubre', 'Lima', 'Casma', 'Casma', '2025-10-23', null, 'Maritza Nizama', 1, ': Policontuso, traumatismo facial, herida cortante en torso de la nariz más deformación.', 'Politraumatizado', 4000, 'Leve', null, 10000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001360372', 2026, 'Octubre', 'Lima', 'Lima', 'Marnga', null, null, 'Pierina Ugaz', 1, 'Traumatismo intracraneal, quedando internado.', 'TEC Leve', 5750, 'Leve', null, 55000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001360434', 2025, 'Octubre', 'Lima', 'San Miguel', 'San Miguel', '2025-10-23', null, 'Noelia', 2, '1. Contusión en pierna derecha, quedando en observación  2.Contusión en miembro inferior', 'Politraumatizado', 8000, 'Grave', 1800, 2200, '2025-10-27', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001360439/ 366852', 2025, 'Octubre', null, null, null, '2025-10-23', null, 'Eduardo', 1, 'Fallecido + Politraumatizado + Policontuso', 'Fallecido', 65000, 'Grave', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001360696', 2025, 'Octubre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-10-23', null, 'DS', 1, 'Giancarlo Alfonso Cordero Crisostomo (UCI)', 'Policontuso', 1725, 'Grave', 27000, 30000, '2026-02-04', 104, 'Transigido', 'CERRADO', 'Abeo'),
('1001361075', 2025, 'Octubre', 'LIMA', 'LIMA', 'Monterrico', '2025-10-24', null, 'JD', 1, 'César Augusto Ramírez Pascual (TEC Leve / Corte Profundo en Frente / Politraumatismo)', 'TEC Leve', 5750, 'Leve', null, 3000, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001361079', 2025, 'Octubre', 'Lima', 'Huacho', 'Huacho', '2025-10-24', null, 'Maritza Nizama', 1, 'Traumatismo /descarte fractura / hemorragia intracerebral,', 'Policontuso', 1725, 'Leve', 1360, 3640, '2025-04-11', -196, 'Transigido', 'CERRADO', 'RVC'),
('1001361091', 2025, 'Octubre', 'Lima', 'Chosica', 'Chosica', '2025-10-24', null, 'Micaela Solis', 2, 'Policontuso', 'Esguince', 4600, 'Leve', null, 20000, '2025-11-24', 31, 'Transigido', 'CERRADO', 'RVC'),
('1001361095', 2025, 'Octubre', 'LIMA', 'LIMA', 'Orrantia', '2025-10-24', null, 'OU', 1, 'Catherine Lisset Huamani Kuskinen (Contusión Rodilla Izquierda)', 'Policontuso', 1725, 'Leve', 0, 15000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001361150', 2025, 'Octubre', 'Lima', 'Chancay', 'Chancay', '2025-10-25', null, 'Noelia', 7, '1. Policontuso, herida en brazo, fractura de antebrazo, probable contusión en tórax, quedando en observación 2. Policontuso, herida frontal, traumatismo encéfalo craneano 3. Politraumatizada, herida en el cuero cabelludo, herida en el labio, fractura de antebrazo 4. Fractura de codo izquierdo 5. Contusión en cabeza, contusión lumbo sacra, policontuso leve 6. Policontuso 7. Policontuso, herida en la cara', 'Esguince', 16100, 'Grave', null, 90000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001361235', 2025, 'Octubre', 'LIMA', 'LIMA', 'Miraflores', '2025-10-25', null, 'JD', 1, 'Cecilia Leonor Duthurburu Sánchez  (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001361290', 2025, 'Octubre', 'Lima', 'Chancay', 'Chancay', '2025-10-26', null, 'Pierina Ugaz', 1, 'Politraumatizado por accidente de tránsito con TEC severo', 'TEC Leve', 5750, 'Leve', null, 45000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001361396', 2025, 'Octubre', 'LIMA', 'LIMA', 'Las Praderas', '2025-10-26', null, 'GC', 1, 'Jach Deivi Vela Lopez (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001361444', 2025, 'Octubre', 'Lima', 'San Miguel', 'San Miguel', '2025-10-26', null, 'Micaela Solis', 1, 'Herida en la mejilla', 'Politraumatizado', 4000, 'Leve', 300, 14700, '2025-11-12', 17, 'Transigido', 'CERRADO', 'RVC'),
('1001361458', 2025, 'Octubre', 'Lima', 'Ica', 'Subtanjalla - Ica.', '2025-10-26', null, 'Maritza Nizama', 2, 'Policontuso / traumatismo vertebro medular/ FRACTURA', 'TEC Leve', 11500, 'Grave', null, 25000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001361655', 2025, 'Octubre', 'LIMA', 'LIMA', 'Lince', '2025-10-27', null, 'OU', 1, 'Claudio Eduardo Segura Solis (Fractura Muñeca, Tibia y Peroné)', 'Policontuso', 1725, 'Grave', 15000, -12000, null, null, 'En Negociación', 'CERRADO', 'Abeo'),
('1001338152', 2025, 'Agosto', null, 'PUERTO BERMUDEZ', 'PUERTO BERMUDEZ', '2025-08-21', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001362021', 2025, 'Octubre', 'Lima', 'Unidad Vecinal 3', 'Unidad Vecinal 3', '2025-10-28', null, 'Noelia', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2500, 9810, '2025-12-04', 37, 'Transigido', 'CERRADO', 'RVC'),
('1001362518', 2025, 'Octubre', 'Lima', 'Maranga', 'Maranga', '2025-10-29', null, 'Pierina Ugaz', 1, 'Contusión de tobillo, policontuso', 'Policontuso', 1725, 'Leve', 119.7, 0, '2026-11-24', 391, 'Transigido', 'CERRADO', 'RVC'),
('1001362591', 2025, 'Octubre', 'Lima', 'La Victoria', 'Cotabambas.', '2025-10-29', null, 'Maritza Nizama', 1, 'Policontuso', 'Fallecido', 65000, 'Grave', 0, 5000, '2026-02-20', 114, 'Transigido', 'CERRADO', 'RVC'),
('1001362592', 2025, 'Octubre', 'LIMA', 'LIMA', 'Chorrillos', '2025-10-29', null, 'DS', 2, 'Yohan Geremy Vivas Pineda (TEC Severo) y Brandon Arnold de la Cruz Cortez (Fractura en la Clavicula)', 'TEC Grave', 46000, 'Grave', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001363449', 2025, 'Noviembre', null, 'ESPINAR', 'ESPINAR', '2025-11-01', null, 'JOEL HUAHUACONDORI', 4, null, 'Policontuso', 6900, 'Grave', 30000, 10000, '2025-11-22', 21, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001363462', 2025, 'Octubre', 'LIMA', 'LIMA', 'Las Praderas', '2025-10-31', null, 'DS', 1, 'Arnaldo Lopez Olivieri (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001363464', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Isidro', '2025-11-01', null, 'DS', 1, 'Andres Davila Mora (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001363689', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Barranco', '2025-11-02', null, 'DS', 1, 'Angelo Smith Caceres Cordova (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001363914', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-11-03', null, 'OU', 2, 'Yan Pavel Sánchez Kirova y Xiomara Nicolle Olivera Bruno (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001364058', 2025, 'Noviembre', null, 'YAUYOS', 'YAUYOS', '2025-11-05', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 300, 1200, '2025-11-19', 14, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001364706', 2025, 'Noviembre', 'Lima', 'Jesus Maria', 'Jesus Maria', '2025-05-11', null, 'Micaela Solis', 1, 'Tec severo', 'Politraumatizado', 4000, 'Leve', null, 20000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001364727', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Isidro', '2025-11-04', null, 'DS', 1, 'Jorge Leonardo Palacios Golles (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001364768', 2025, 'Noviembre', 'Lima', 'San Miguel', 'Maranga', '2025-05-11', null, 'Noelia', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 100, 2900, '2025-05-11', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001364808', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Isidro', '2025-11-05', null, 'DS', 1, 'Katherine Rocio Sulca Zuloaga (Poilitraumatizada)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001365244', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Borja', '2025-11-05', null, 'JD', 1, 'Caleb Florian Muñoz (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001365248', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Antonio', '2025-11-05', null, 'OU', 1, 'Daniel Alessandro Muñoz Pevez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1500, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001365391', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Miraflores', '2025-11-06', null, 'OU', 1, 'Jefferson Orlando Sayas Arrascue (Politraumatismo, Trauma Hombro Derecho)', 'Politraumatizado', 4000, 'Leve', 400, 2600, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001365592', 2025, 'Noviembre', 'Lima', 'Lima', 'Palomino', '2025-06-11', null, 'Maritza Nizama', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', null, 8000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001365742', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Surco', '2025-11-07', null, 'OU', 1, 'Maryori Katherina Bastidas Rodríguez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001365991', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Orrantia', '2025-11-07', null, 'GC', 1, 'Noel Adrian Figueroa Guerrero (policontuso)', 'Policontuso', 1725, 'Leve', 200, 2800, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001366064', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Urb. Pachacamac', '2025-11-08', null, 'GC', 2, 'Ruben Veliz de la Caridad Zapata y Joshely Gonzales (policontuso)', 'Policontuso', 3450, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001366686', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Monterrico', '2025-11-09', null, 'GC', 1, 'Franko Matias Feliciano Benito (Politraumatizado', 'Politraumatizado', 4000, 'Grave', 9000, 3000, '2025-12-19', 40, 'Transigido', 'CERRADO', 'Abeo'),
('1001366948', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Villa El Salvador', '2025-11-10', null, 'GC', 1, 'Justo Germán Dorado Vargas (policontuso)', 'Policontuso', 1725, 'Leve', null, 30000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001366968', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Curva de Villa', '2025-11-10', null, 'DS', 1, 'Sari Vanessa Ipanaque Aroni (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 6000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001367003', 2025, 'Noviembre', 'Lima', 'Comas', 'UNIVERSITARIA', '2025-10-11', null, 'Micaela Solis', 1, 'Tumefacción', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001367193', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Urbanización Pachacamac', '2025-11-10', null, 'DS', 1, 'Luis Stephano Goyeneche Cruz (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 10000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001367301', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Antonio', '2025-11-11', null, 'DS', 1, 'NN (Policontuso)', 'Policontuso', 1725, 'Leve', null, 9000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001367317', 2025, 'Noviembre', 'Lima', 'Jesus Maria', 'Jesus Maria', '2025-11-11', null, 'Pierina Ugaz', 1, 'Fractura expuesta  miembro inferior izquierdo, politraumatizada  por accidente de tránsito', 'Politraumatizado', 4000, 'Leve', null, 50000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001367378', 2025, 'Noviembre', 'Lima', 'SJL', 'Huayrona', '2025-11-11', null, 'Noelia', 2, '1. Trauma Cervical Policontuso, queda en observación 2. Esguince de columna Cervical, traumatismo torácico cerrado y policontuso, quedando en observación', 'Politraumatizado', 8000, 'Grave', null, 8000, '2026-02-19', 100, 'Transigido', 'CERRADO', 'RVC'),
('1001367805', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Las Praderas', '2025-11-12', null, 'JD', 2, 'Alexandra Daniela Diaz Mendoza (Policontuso), Dalia Mendoza Ramirez (Policontuso)', 'Policontuso', 3450, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001367851', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Chacarilla', '2025-11-12', null, 'OU', 4, 'Esmeralda Chappa Alva, Gianfranco Junior Arteta Carrera, Carlos Alfredo Quispe Mamani y Matías Quispe Solano (Politraumatismo)', 'Politraumatizado', 16000, 'Grave', null, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001367887', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Urbanización Pachacamac', '2025-11-13', null, 'GC', 1, 'Ernesto Antonio Susanibar Navarro(Fractura de pierna y Clávicula)', 'Fractura Pierna', 17250, 'Grave', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001367904', 2025, 'Noviembre', 'Lima', 'San Miguel', 'Maranga', '2025-11-13', null, 'Maritza Nizama', 1, 'TEC LEVE', 'Policontuso', 1725, 'Leve', null, 8000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001368894', 2025, 'Noviembre', 'Lima', 'San Martín de Porres', 'San Martín de Porres', '2025-11-15', null, 'Micaela Solis', 1, 'heridas múltiples', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-12-11', 26, 'Transigido', 'CERRADO', 'RVC'),
('1001368942', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Miraflores', '2025-11-15', null, 'GC', 1, 'Politraumatizado + Esguince', 'Politraumatizado', 4000, 'Leve', null, 3000, '2026-02-04', 81, 'Transigido', 'CERRADO', 'Abeo'),
('1001368992', 2025, 'Noviembre', 'LIMA', 'Miraflores', 'Miraflores', '2025-11-15', null, 'GC', 1, 'Sandra Castañeda Landazuri (Fractura de Clavicula)', 'Fractura de clavícula', 23000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001369146', 2025, 'Noviembre', 'Lima', 'Independencia', 'Independencia', '2025-11-16', null, 'Maritza Nizama', 7, 'Esguinces y torceduras', 'Politraumatizado', 28000, 'Grave', null, 40000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001369293', 2025, 'Noviembre', 'Lima', 'Chaclacayo', 'Chaclacayo.', '2025-11-16', null, 'Micaela Solis', 1, 'TEC', 'Esguince', 2300, 'Leve', null, 11000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001369426', 2025, 'Noviembre', 'Lima', 'Sna Miguel', 'San Miguel', '2025-11-15', null, 'Pierina Ugaz', 1, 'esguince columna vertebral.', 'TEC Leve', 5750, 'Leve', null, 35000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001369431', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Borja', '2025-11-17', null, 'OU', 3, 'Carlos Oscco Pillaca, Isabel Mercedes Grippa Sako y Zoila Luz Morales Sako (Politraumatismo)', 'Politraumatizado', 12000, 'Grave', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001347087', 2025, 'Septiembre', null, 'RUPA RUPA 
TINGO MARIA', 'TINGO MARIA', '2025-09-15', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 16000, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001369971', 2025, 'Noviembre', 'Lima', 'Pueblo libre', 'Pueblo Libre', '2025-11-18', null, 'Pierina Ugaz', 3, 'Traumatismo múltiples / Contusión /Esguinces y torceduras de la columna cervical y traumatismo múltiples, no especificados.

- Lugar de atención: clínica Providencia', 'Politraumatizado', 12000, 'Grave', 41200, -1200, '2026-02-12', 86, 'En Negociación', 'ABIERTO', 'RVC'),
('1001370147', 2025, 'Noviembre', 'Lima', 'Callao', 'Ciudadela Chalaca', '2025-11-18', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso y corte', 2300, 'Leve', 2500, 2960, '2025-12-18', 30, 'Transigido', 'CERRADO', 'RVC'),
('1001370436', 2025, 'Noviembre', 'Lima', 'Rimac', 'Rimac', '2025-11-18', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 5100, 1400, '2026-01-30', 73, 'Transigido', 'CERRADO', 'RVC'),
('1001370811', 2025, 'Noviembre', 'Lima', 'Bellavista', 'Ciudad del pescador', '2025-11-19', null, 'Noelia', 1, 'Policontuso (en observación)', 'Policontuso', 1725, 'Leve', null, 5000, '2025-11-27', 8, 'Transigido', 'CERRADO', 'RVC'),
('1001370855', 2025, 'Noviembre', 'LIMA', 'LIMA', 'La Molina', '2025-11-20', null, 'GC', 1, 'Jimmy Harold Vidaurre CHinoy (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001371092', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Miraflores', '2025-11-20', null, 'JD', 1, 'Luis Yolky Marcenaro Velarde (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 14000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001350455', 2025, 'Septiembre', 'LIMA', 'LIMA', 'Orrantia', '2025-09-25', null, 'DS', 1, 'Mary Solange Echegaray Juarez (Dislocacion de cadera)', 'Policontuso', 1725, 'Leve', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001371476', 2025, 'Noviembre', 'Lima', 'Ate', 'Salamanca', '2025-11-21', null, 'Maritza Nizama', 1, 'Policontuso por accidente de transito y fracturas a descartar, (quedando en observación)', 'Politraumatizado', 4000, 'Leve', null, 15000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001371641', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Orrantia', '2025-11-26', null, 'DS', 1, 'Edgar Jesus Roca Cuya (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001359165', 2025, 'Octubre', 'LIMA', 'LIMA', 'San Juan de Miraflores', '2025-10-20', null, 'JD', 1, 'Jorge Luis Mamani Ope (Fractura Metatarsano Pie Derecho)', 'Policontuso', 1725, 'Leve', null, 5500, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001371808', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-11-20', null, 'OU', 2, 'Leoncio Cabrera Merino y Oscar José Quispe Medina (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001359653', 2025, 'Octubre', 'LIMA', 'LIMA', 'La Molina', '2025-10-21', null, 'OU', 1, 'Natalia Nina Luque (Fractura expuesta de Tibia y Peroné)', 'Policontuso', 1725, 'Leve', null, 2000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001372631', 2025, 'Noviembre', 'Lima', 'Independencia', 'Independencia', '2025-11-25', null, 'Micaela Solis', 3, 'TEC, Esguince de columna', 'Policontuso', 5175, 'Leve', 4700, 3058.79, '2026-04-07', 133, 'En Negociación', 'ABIERTO', 'RVC'),
('1001372729', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San isidro', '2025-11-24', null, 'OU', 1, 'Miguel Angel Dávila Ruiz (Fractura Muñeca, Laceraciones Rostro, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001373227', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-11-25', null, 'GC', 1, 'Valentina Ascona Espinoza (Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001373555', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Magdalena', '2025-11-27', null, 'DS', 1, 'Andy Michael Ajen Luna (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 3500, 9500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001373912', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San isidro', '2025-11-27', null, 'JD', 1, 'Claudia Karina Horna Mendez (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001373940', 2025, 'Noviembre', 'Lima', 'Jesus Maria', 'Jesus Maria', '2025-11-27', null, 'Noelia', 1, 'Traumatismo encefalocraneano', 'Politraumatizado', 4000, 'Leve', 1200, 800, '2025-12-10', 13, 'Transigido', 'CERRADO', 'RVC'),
('1001374579', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Miraflores', '2025-11-28', null, 'OU', 1, 'José Francisco Galindez Rojas (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 20000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001374600', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Isidro', '2025-11-29', null, 'OU', 1, 'José Natividad Buitrago Bautista (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001374964', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Surquillo', '2025-11-30', null, 'GC', 1, 'Yilfredo Jose Diaza Alfonzo (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001374971', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Surquiillo', '2025-11-30', null, 'GC', 2, 'Monica Bravo Angulo y Jessica Alejandra Galvez Díaz (Policontusos)', 'Policontuso', 3450, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001374985', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Miraflores', '2025-11-29', null, 'OU', 1, 'Alexander José Zerpa Villalta (Fractura Muñeca, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1200, 4800, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001375213', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Isidro', '2025-12-01', null, 'OU', 1, 'Alexander Joshua Herrera Guerrera (Fractura Tibia y Peroné)', 'Policontuso', 1725, 'Grave', 7000, -4000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001375225', 2025, 'Diciembre', null, 'IMATA', 'SAN ANTONIO DE CHUCA', '2025-12-01', null, 'RUTH HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', 0, 1500, '2025-12-01', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001375418', 2025, 'Diciembre', 'Lima', 'SMP', 'Laura Caller.', '2025-01-12', null, 'Maritza Nizama', 2, 'Traumatismo cabeza, esguince y torcedura de la columna cervical y torácico, contusión de tórax/Traumatismo múltiple no especificado', 'Policontuso', 3450, 'Grave', 12500, 1603, '2026-02-17', 401, 'Transigido', 'CERRADO', 'RVC'),
('1001375754', 2025, 'Diciembre', 'Lima', 'San Miguel', 'San Miguel', '2025-02-12', null, 'Micaela Solis', 1, 'Contusión y esguince en tobillo derecho', 'Policontuso', 1725, 'Leve', 6000, 16000, '2026-02-05', 358, 'Transigido', 'CERRADO', 'RVC'),
('1001375930', 2025, 'Diciembre', null, 'CHIMBOTE', '21 DE ABRIL', '2025-12-02', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 1500, '2025-12-04', 2, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001376009', 2025, 'Diciembre', 'Lima', 'Puente Piedra', 'La Ensenada – Puente Piedra', '2025-03-12', null, 'Noelia', 1, 'Policontuso por accidente de tránsito (quedando en observación)', 'Policontuso', 1725, 'Leve', 1300, 1200, '2026-01-19', 313, 'Transigido', 'CERRADO', 'RVC'),
('1001376103', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Miraflores', '2025-12-03', null, 'DS', 1, 'Elmison Ramon Garcia Gonzales (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 2000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001376245', 2025, 'Diciembre', null, 'SAN ANTONIO DE PUTINA PUNCO', 'SAN ANTONIO DE PUTINA', '2025-12-30', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 1000, 500, '2026-01-11', 12, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001376574', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Sagitario', '2025-12-04', null, 'OU', 1, 'Richard Danis Luna Torres (Politraumatismo, Trauma Pierna)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001376648', 2025, 'Diciembre', 'Callao', 'CALLAO', 'Oquendo', '2025-12-05', null, 'Pierina Ugaz', 1, 'Descarte de fractura en la pierna, policontuso por accidente de tránsito,', 'TEC Leve', 5750, 'Leve', null, 35000, '2026-03-05', 90, 'En Negociación', 'ABIERTO', 'RVC'),
('1001376940', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Antonio', '2025-12-05', null, 'OU', 1, 'Jackeline Dayana Robles Castañeda (Policontuso)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001361790', 2025, 'Octubre', 'LIMA', 'LIMA', 'Miraflores', '2025-10-27', null, 'OU', 1, 'Rosa Filomena Vasquez Paredes (Contusión en región lumbosacra)', 'Policontuso', 1725, 'Leve', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001377465', 2025, 'Diciembre', 'Lima', 'Santa Luzmila.', 'Santa Luzmila.', '2025-09-12', null, 'Micaela Solis', 1, 'Traumatismo múltiple no especificado.', 'TEC Leve', 5750, 'Leve', null, 10000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001377497', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Miraflores', '2025-12-10', null, 'JD', 1, 'Nancy Marrón Quispe (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001377558', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Lince', '2025-12-08', null, 'GC', 1, 'Julio Cesar Donayre Zavaleta (Tec Moderado)', 'TEC Moderado', 11500, 'Grave', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001377599', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Barranco', '2025-12-06', null, 'GC', 1, 'Johnny Giraldez Camarena (Policontuso)', 'Policontuso', 1725, 'Leve', 1500, 10000, '2025-12-26', 20, 'Transigido', 'CERRADO', 'Abeo'),
('1001377633', 2025, 'Diciembre', null, 'CHALA', 'ACHANIZO', '2025-12-05', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 0, '2025-12-16', 11, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001377680', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Santa Felicia', '2025-12-08', null, 'DS', 1, 'Jean Carlo Jose Salazar Sanchez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001378029', 2025, 'Diciembre', 'Lima', 'La Victoria', 'Apolo', '2025-10-12', '2025-10-12', 'Pierina Ugaz', 2, 'Fractira de humero izquierdo y policontuso por accidente de transito', 'Policontuso', 3450, 'Leve', 0, 55000, '2026-01-28', 108, 'Transigido', 'CERRADO', 'RVC'),
('1001378083', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Surquillo', '2025-12-08', null, 'DS', 1, 'Yessica Yoseline Heredia Yanez (Politraumatisada)', 'Policontuso', 1725, 'Leve', 2000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001378093', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Magdalena', '2025-12-08', null, 'JD', 1, 'Sandra Mendoza Campo (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001378870', 2025, 'Diciembre', 'Lima', 'San Miguel', 'San Miguel', '2025-12-12', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 8000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001378944', 2025, 'Diciembre', null, 'PAMPAROMAS', 'PAMPAROMAS', '2025-12-12', null, 'JOEL HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', 0, 1500, '2025-12-13', 1, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001378967', 2025, 'Diciembre', null, 'TARAPOTO', 'TARAPOTO', '2025-12-12', null, 'JOEL HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', 1200, 300, '2025-12-13', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001379064', 2025, 'Diciembre', 'Lima', 'Universitaria', 'Universitaria', '2025-12-13', null, 'Micaela Solis', 2, 'Herida cortante de rostro y Policontuso', 'Policontuso', 3450, 'Leve', null, 25000, '2026-03-28', 105, 'En Negociación', 'ABIERTO', 'RVC'),
('1001379156', 2025, 'Diciembre', 'Lima', 'SMP', 'San Martin de Porres', '2025-12-13', null, 'Pierina Ugaz', 2, '1.: Se atendió en la ambulancia
-', 'Policontuso', 3450, 'Leve', null, 25000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001379240', 2025, 'Diciembre', 'Callao', 'Callao', 'Sarita Colonia', '2025-12-14', null, 'Maritza Nizama', 3, 'Politraumatizado/trauma cervical / trauma múltiple', 'Policontuso', 5175, 'Grave', 9451, 0, '2026-02-19', 67, 'Transigido', 'CERRADO', 'RVC'),
('1001379284', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Chorrillos', '2025-12-14', null, 'DS', 1, 'Bettina Ines Lange Plesch (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 17000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001379297', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Antonio', '2025-12-14', null, 'JD', 1, 'Henry Dilon Zamora Crespin (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 3000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001379445', 2025, 'Diciembre', null, 'PAMPAS', 'PAMPAS', '2025-12-14', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 1500, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001379459', 2025, 'Diciembre', 'Lima', 'Los Olivos', 'Pro', '2025-12-13', null, 'Noelia', 2, '1. Policontuso por accidente de tránsito 2. Fracturas múltiples en la columna lumbar y de la pelvis', 'Policontuso', 3450, 'Leve', null, 35000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001379464', 2025, 'Diciembre', null, 'TARAPOTO', 'TARAPOTO', '2025-12-13', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 4100, 2900, '2025-12-31', 18, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001379596', 2025, 'Diciembre', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2025-12-15', null, 'Noelia', 1, 'Contusión muscular múltiple con señales de fricción dorsal, lumbar y glúteo derecho (terapia física: 20 sesiones)', 'Fallecido', 65000, 'Grave', 3000, 0, '2026-02-18', 65, 'Transigido', 'CERRADO', 'RVC'),
('1001379762', 2025, 'Diciembre', null, 'ESPINAR', 'ESPINAR', '2025-12-14', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 2000, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001380109', 2025, 'Diciembre', 'Lima', 'CARABAYLLO', 'Santa Isabel de carabayllo', '2025-12-16', null, 'Pierina Ugaz', 1, 'Traumatismos multiples no especificados', 'Policontuso', 1725, 'Leve', 200, 19800, '2026-01-14', 29, 'Transigido', 'CERRADO', 'RVC'),
('1001380293', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Miraflores', '2025-12-16', null, 'OU', 1, 'Solmaralba Madeleine Rodríguez Franchi (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 750, 2250, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001380367', 2025, 'Diciembre', 'Lima', 'Cercado de Lima', 'Petit Thouars', '2025-12-16', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 8000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001380434', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Antonio', '2025-12-16', null, 'GC', 1, 'Arnold David Cabrera Guevara (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, 55000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001380611', 2025, 'Diciembre', 'Lima', 'San Juan de Lurigancho', 'Caja de Agua', '2025-12-17', null, 'Micaela Solis', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', 900, 978.5, '2026-01-21', 35, 'Transigido', 'CERRADO', 'RVC'),
('1001380664', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Antonio', '2025-12-17', null, 'OU', 1, 'Leonardo Sandro Medina Romero (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001381423', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Miraflores', '2025-12-19', null, 'JD', 1, 'Jean Carlos Stefano Condori Cabello (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 2000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001381449', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Curva de Villa', '2025-12-19', null, 'DS', 1, 'Wendy Rosmeri Ramirez Quispe (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 8000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001381545', 2025, 'Diciembre', 'Lima', 'Lurigancho - Chosica', 'Huachipa', '2025-12-19', null, 'Noelia', 2, '1. Policontuso por accidente de transito 2. Policontuso por accidente de transito', 'Policontuso y corte', 4600, 'Leve', null, 25000, '2026-01-02', 14, 'Transigido', 'CERRADO', 'RVC'),
('1001381834', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Borja', '2025-12-20', null, 'OU', 1, 'Piero Alessandro Arenas Sinche (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, 6000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001381890', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Borja', '2025-12-20', null, 'OU', 2, 'Eric José Palomino Escalante y Patricia Portal Lucano (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', 3000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001382280', 2025, 'Diciembre', 'Lima', 'Los Olivos', 'LAURA CALLER', '2025-12-22', null, 'Micaela Solis', 2, 'TEC', 'Policontuso', 3450, 'Leve', 0, 25000, '2026-08-01', 222, 'Transigido', 'CERRADO', 'RVC'),
('1001382304', 2025, 'Diciembre', 'Lima', 'San Migiel', 'San Miguel', '2025-12-20', null, 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito, quedando en observación', 'Policontuso y corte', 2300, 'Leve', null, 25000, '2025-12-20', 0, 'En Negociación', 'ABIERTO', 'RVC'),
('1001382307', 2025, 'Diciembre', 'Lima', 'San Juan de Lurigancho', 'Canto Rey', '2025-12-21', null, 'Maritza Nizama', 1, 'Policontuso, heridas múltiples, esguince cervical, traumatismo encéfalo craneano, quedando en observación,', 'Esguince', 2300, 'Leve', null, 15000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001382328', 2025, 'Diciembre', null, 'TAMBOPATA', 'TAMBOPATA', '2025-12-20', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 2500, 1500, '2025-12-22', 2, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001382347', 2025, 'Diciembre', null, 'ZAPATERO', 'LAMAS', '2025-12-20', null, 'JOEL HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', 1300, 2700, '2026-01-03', 14, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001383139', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Jose Galvez', '2025-12-23', null, 'OU', 2, 'Ygnacio Cienfuegos Retes (Politraumatismo) y Nazaria Rojas Huayta (Luxación Clavícula)', 'Politraumatizado', 8000, 'Grave', null, 3000, '2026-01-28', 36, 'En Investigación', 'CERRADO', 'Abeo'),
('1001383480', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Barranco', '2025-12-24', null, 'GC', 1, 'Milan Israel Cahuanna Alarcon (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001369462', 2025, 'Noviembre', 'Lima', 'San Martin de Porres', 'Condevilla', '2025-11-17', null, 'Noelia', 1, 'Policontuso traumatismo craneoencefálico (hospitalizado)', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001371280', 2025, 'Noviembre', 'Lima', 'San Martin de Porres', 'Sol de Oro', '2025-11-20', null, 'Pierina Ugaz', 1, 'No se atendio', 'Policontuso', 1725, 'Leve', null, 5000, null, null, 'Otros', 'ABIERTO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001384304', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Isidro', '2025-12-26', null, 'OU', 1, 'Victor Andréz Huamani Rojas (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 4000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001384427', 2025, 'Diciembre', 'Lima', 'Lima', 'Monserrat.', '2025-12-26', null, 'Maritza Nizama', 0, 'No', 'Policontuso y corte', 0, 'Leve', null, 2000, '2025-12-26', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001384447', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Villa el Salvador', '2025-12-26', null, 'GC', 2, 'NIlma Mamallacta Grefa (Politraumatizada) y Miriam mammalacta tello (policontuso)', 'Politraumatizado', 8000, 'Grave', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001384809', 2025, 'Diciembre', 'Lima', 'Lima', 'Breña -Palomino', '2025-12-27', null, 'Pierina Ugaz', 1, 'Aborto retenido gestación 11semanas de gestación.', 'Politraumatizado', 4000, 'Leve', 3200, 36800, '2026-07-01', 186, 'Transigido', 'CERRADO', 'RVC'),
('1001384859', 2025, 'Diciembre', null, 'Huaral', 'Huaral', '2025-12-29', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso y corte', 2300, 'Leve', null, 8000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1001384884', 2025, 'Diciembre', 'Lima', 'Lima', 'Condevilla', '2025-12-28', null, 'Maritza Nizama', 1, 'Traumatismo intracraneal y traumatismo múltiple', 'Policontuso', 1725, 'Leve', null, 8000, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001384953', 2025, 'Diciembre', 'Lima', 'San Miguel', 'Maranga', '2025-12-29', null, 'Micaela Solis', 1, 'Contusión Múltiple por accidente de transito', 'TEC Leve', 5750, 'Leve', null, 15000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001385068', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Antonio', '2025-12-29', null, 'DS', 1, 'Luis Henry Idrogo Alejandría (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1000, 2000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001385188', 2025, 'Diciembre', 'LIMA', 'LIMA', 'La Molina', '2025-12-29', null, 'OU', 1, 'Juan Francisco Silva García (Politraumatismo, Esguince Hombro)', 'Politraumatizado', 4000, 'Leve', 1900, 1100, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001385311', 2025, 'Diciembre', 'Lima', 'Breña', 'Breña', '2025-12-29', null, 'Noelia', 1, 'Contusión en la muñeca y antebrazo derecho', 'Politraumatizado', 4000, 'Leve', 1500, 8500, '2025-12-29', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001385316', 2025, 'Diciembre', 'Lima', 'Los Olivos', 'Pro', '2025-12-29', null, 'Pierina Ugaz', 1, 'Fractura del tobillo izquierdo', 'Policontuso', 1725, 'Leve', null, 60000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001385331', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Surquillo', '2025-12-29', null, 'GC', 1, 'Edgar Teodoro FLores Mallqui (Policontuso)', 'Policontuso', 1725, 'Leve', null, 12000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001385428 /387668', 2025, 'Diciembre', null, null, null, '2025-12-29', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('1001385573', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Miraflores', '2025-12-30', null, 'GC', 1, 'Emilio Bruno Kamiche planas (Politraumatizado y Corte en la Cara)', 'Politraumatizado', 4000, 'Leve', 0, 3000, '2026-01-14', 15, 'Transigido', 'CERRADO', 'Abeo'),
('1001385810', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Surco', '2025-12-30', null, 'DS', 1, 'Romina Pachauri Iquise (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001371662', 2025, 'Noviembre', 'LIMA', 'LIMA', 'San Isidro', '2025-11-21', null, 'GC', 1, 'Isabel Lorena Ramirez Destre (Politaumatizada)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001385870', 2026, 'Diciembre', null, 'ESPINAR', 'ESPINAR', '2026-12-30', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 5994, 1006, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001372111', 2025, 'Noviembre', null, 'SAN ALEJANDRO', 'SAN ALEJANDRO', '2025-11-22', null, 'JOEL HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', null, 7000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001387092', 2026, null, null, null, null, '2026-01-03', null, 'Alejandro', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'Alejandro'),
('1001387298', 2026, 'Enero', 'LIMA', 'Punta Hermosa', 'Punta Hermosa', '2026-01-04', '2026-01-04', 'LM', null, 'Daños Materiales', 'Policontuso', 0, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001387417', 2026, null, null, 'Casma', 'Casma', '2026-01-04', null, 'Alejandro', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Alejandro'),
('1001387448', 2026, 'Enero', 'LIMA', 'San Borja', 'San Borja', '2026-01-05', '2026-01-05', 'GC', 1, 'Steven Edgar Huarote Inuma (Esguince y Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001387775', 2026, 'Enero', 'LIMA', 'San Antonio de Mala', 'San Antonio de Mala', '2026-01-05', '2026-01-05', 'GC', 2, 'Carlos Enrique Palomino Salcedo y Jorge Luis Felipa Barrios (Esguince y Politraumatizado)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001388675', 2026, 'Enero', 'LIMA', 'Barranco', 'Barranco', '2026-01-07', '2026-01-07', 'JD', 1, 'Hamza Argelina Touati (Fractura de 5to Metatarso de Pie Izquierdo)', 'Policontuso', 1725, 'Leve', 6000, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001388801', 2026, null, null, 'San Miguel', 'Maranga', '2026-01-07', null, 'Pierina Ugaz', 1, 'Heridas múltiples en ambas piernas (dado de alta)', 'Policontuso', 1725, 'Leve', 2100, null, '2025-01-12', -360, 'Transigido', 'CERRADO', 'RVC'),
('1001388949', 2026, null, null, 'La Perla', 'La Perla', '2026-01-08', null, 'Pierina Ugaz', 1, 'Traumatismo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001389002', 2026, null, null, 'Nazca', 'Nazca', '2026-01-07', null, 'Pierina Ugaz', 1, 'Fractura de clavícula  derecha, quedando internada.', 'Fractura de clavícula', 23000, 'Grave', null, null, '2026-01-13', 6, 'Rechazado', 'CERRADO', 'RVC'),
('1001389412', 2026, null, null, 'Ventanilla', 'Ventanilla', '2026-01-08', null, 'Pierina Ugaz', 1, 'Heridas en la cabeza, TEC  moderado', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001389658', 2026, null, null, 'Cercado de Lima', 'Alfonso Ugarte', '2026-01-09', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001389697', 2026, null, null, 'CALLAO', 'La Legua', '2026-01-09', null, 'Pierina Ugaz', 1, 'Traumatismo cervical  y lumbar', 'Cervicalgia', 2300, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001389701', 2026, 'Enero', 'LIMA', 'San isidro', 'San isidro', '2026-01-08', '2026-01-08', 'OU', 1, 'William Emilio Pernalete Alvarado (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001389737', 2026, null, null, 'La Victoria', 'La Victoria', '2026-01-09', null, 'Pierina Ugaz', 2, 'Trastorno de disco cervical / Politraumatizado, contusión dorsal y lumbar.', 'Hernias discales', 57500, 'Grave', 500, null, '2026-02-17', 39, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001390227', 2026, 'Enero', 'LIMA', 'La Planicie', 'La Planicie', '2026-01-10', '2026-01-10', 'DS', 1, 'Luis Adolfo Jimenez Cerna (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001390264', 2026, null, null, 'Carmen de la Legua', 'Carmen de la Legua', '2026-01-09', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 300, null, '2026-01-13', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001390485', 2026, 'Enero', 'LIMA', 'Lurin', 'Lurin', '2026-01-10', '2026-01-10', 'DS', 1, 'Antonio Verano Geninger (Esguince de Rodilla y Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 6000, null, '2026-02-19', 40, 'Transigido', 'CERRADO', 'Abeo'),
('1001390877', 2026, null, null, 'Breña', 'Chacra Colorada', '2026-01-11', null, 'Pierina Ugaz', 2, '- Policontuso por accidente de tránsito, por descartar fractura  y hombro y dodo  Izquierdo  - Policontuso por accidente de tránsito, traumatismo cervical  y fractura en el hombro derecho', 'Fractura de columna', 40000, 'Grave', 0, null, '2026-01-13', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001390909', 2026, null, null, 'Ate Vitarte', 'Vitarte', '2026-01-10', null, 'Pierina Ugaz', 2, '1. Esguince de tobillo izq. y policontuso 2. Fractura del peroné izq. Y esguince de tobillo izq.', 'Fractura de Peroné', 34500, 'Grave', 10000, null, '2026-01-11', 1, 'Transigido', 'CERRADO', 'RVC'),
('1001390914', 2026, 'Enero', 'LIMA', 'San Borja', 'San Borja', '2026-01-11', '2026-01-11', 'DS', 1, 'Gema Elizabeth Romero Chuquillanqui (Fractura de Clavicula)', 'Fractura de clavícula', 23000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001391044', 2026, null, null, 'Los Olivos', 'Pro', '2026-01-12', null, 'Pierina Ugaz', 9, 'Traumatismo superficial múltiple, Contusión en piernas heridas de la pierna no especificada, Esguince y torcedura de la columna cervical, traumatismo superficial múltiple en cabeza, Traumatismo superficial de la cabeza y contusión de la pelvis,  Traumatismo superficial de la cabeza, Contusión del muslo y traumatismo superficial múltiple, Herida del parpado periocular y traumatismo superficial múltiple de la nariz,   Traumatismo superficial múltiple no especificados.', 'Politraumatizado', 36000, 'Grave', 18700, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001377463', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Surco', '2025-12-09', null, 'DS', 1, 'Julio Fernando Castañeda Guitierrez (Fractura)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001391869', 2026, 'Enero', 'LIMA', 'San Borja', 'San Borja', '2026-01-13', '2026-01-13', 'OU', 1, 'Sandra Lisbeth Calderón Ludeña (TEC, Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001392205', 2026, null, null, null, null, '2026-01-14', null, 'Eduardo', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Chacon'),
('1001392491', 2026, 'Enero', 'LIMA', 'Nueva Esperanza', 'Nueva Esperanza', '2026-01-15', '2026-01-15', 'DS', 1, 'Ricardo Daniel Quinta Arias (Politraummatizado)', 'Politraumatizado', 4000, 'Leve', 1500, null, '2026-01-16', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001392563', 2026, 'Enero', 'LIMA', 'San Antonio', 'San Antonio', '2026-01-15', '2026-01-15', 'GC', 1, 'Rober Sebastian Laguna Zuñiga (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 250, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001392912', 2026, null, null, null, null, '2026-01-16', null, 'Eduardo', 1, 'Politraumatizado + Fractura de fémur + Policontuso', 'Fractura de fémur', 23000, 'Grave', 0, null, null, null, 'En Negociación', 'ABIERTO', 'Chacon'),
('1001393056', 2026, null, null, 'Puente Piedra', 'Puente Piedra', '2026-01-16', null, 'Pierina Ugaz', 1, 'Luxifractura', 'Fractura Pierna', 17250, 'Grave', null, null, '2026-03-31', 74, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001393143', 2026, null, null, null, null, '2026-01-17', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('1001393212', 2026, null, null, 'Independencia', 'Tupac Amaru', '2026-01-16', null, 'Pierina Ugaz', 5, 'Policonstuso y traumatismo', 'Policontuso', 8625, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001393332', 2026, 'Enero', 'LIMA', 'San Luis', 'San Luis', '2026-01-17', '2026-01-17', 'GC', 1, 'Gabriela Sofia Bustamante Lopez (Fractura de cadera)', 'Fractura de cadera', 12000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001393477', 2026, 'Enero', 'LIMA', 'Miraflores', 'Miraflores', '2026-01-17', '2026-01-17', 'OU', 1, 'Alberto Hugo Vallebuono Del Aguila (Fractura Cadera, Politraumatismo)', 'Fractura de cadera', 12000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001383780', 2025, 'Diciembre', 'Lima', 'Centro de Lima', 'Cotabambas', '2025-12-25', null, 'Noelia', 5, '1. Contusión rodilla izquierda 2. Tec leve (Alta médica) 3. Traumatismo encéfalo craneano leve  - Tec leve 4. Tec leve 5. Contusión brazo izquierdo', 'Policontuso', 8625, 'Grave', null, 30000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001393587', 2026, null, null, 'Nuevo Chimbote', 'Buenos Aires', '2026-01-17', null, 'Alejandro', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 2000, '2026-01-29', 12, 'Transigido', 'CERRADO', 'Alejandro'),
('1001393591', 2026, 'Enero', 'LIMA', 'San Antonio de Mala', 'San Antonio de Mala', '2026-01-17', '2026-01-17', 'JD', 1, 'Ramón Javier de la Cruz Vicente (Fallecido)', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001393649', 2026, null, null, 'Comas', 'Tupac Amaru', '2026-01-18', null, 'Pierina Ugaz', 1, 'Traumatismo superficiales múltiples', 'Politraumatizado', 4000, 'Grave', 18000, null, '2026-02-17', 30, 'Otros', 'CERRADO', 'RVC'),
('1001393830', 2026, null, null, 'Asia', null, '2026-01-19', null, 'Alejandro', 2, 'Policontuso y corte', 'Policontuso y corte', 4600, 'Leve', 0, 4000, '2026-01-23', 4, 'Transigido', 'CERRADO', 'Alejandro'),
('1001393958', 2026, 'Enero', 'LIMA', 'San Antonio', 'San Antonio', '2026-01-19', '2026-01-19', 'JD', 1, 'Yader Ismael Marcaquispe Gavilán (Contusión en el Pecho y hemorragia interna)', 'Hemorragia interna', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001394275', 2026, null, null, 'Callao', 'La Legua', '2026-01-19', null, 'Micaela Solis', 1, 'Fractura expuesta de tibia y peroné de tercer grado.', 'Fractura pierna expuesta', 23000, 'Grave', 10000, null, '2026-03-18', 58, 'Transigido', 'CERRADO', 'RVC'),
('1001394597', 2026, null, null, 'Jesus Maria', 'Jesus Maria', '2026-01-20', null, 'Pierina Ugaz', 1, 'Contusion de pierna izquierda', 'Policontuso', 1725, 'Grave', 14950, null, '2026-03-26', 65, 'En Negociación', 'ABIERTO', 'RVC'),
('1001394681', 2026, 'Enero', 'LIMA', 'Miraflores', 'Miraflores', '2026-01-20', '2026-01-20', 'DS', 2, 'Mercedes Guliana Garcia Vargas y Sofia Susana Chicano Vargas (Policontusas)', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1001394719', 2026, 'Enero', 'LIMA', 'Surco', 'Surco', '2026-01-20', '2026-01-20', 'GC', 1, 'Gabriel Eduardo Caro Perez (fractura de pie)', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001395124', 2026, 'Enero', 'LIMA', 'Surquillo', 'Surquillo', '2026-01-21', '2026-01-21', 'GC', 1, 'Karla Alejandra Neyra Bouloguer  (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001395307', 2026, null, null, 'S.J.L', 'Zarate', '2026-01-21', null, 'Elizabeth Monzon', 2, '1. Policontuso 2. Policontuso y traumatismo encéfalo craneano (TEC)', 'TEC Leve', 11500, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001395423', 2026, null, null, 'SMP', 'SMP', '2026-01-22', null, 'Pierina Ugaz', 1, 'reservado, quedando internado.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001395791', 2026, 'Enero', 'LIMA', 'Surquillo', 'Surquillo', '2026-01-22', '2026-01-22', 'JD', 1, 'Jimena Alexandra León Sánchez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001395903', 2026, 'Enero', 'LIMA', 'Lurin', 'Lurin', '2026-01-23', '2026-01-23', 'JD', 2, 'Hallan Demilsson Limahuaya Ramos (Politraumatismo),  Maricielo del Rosario Nuñez Quispe (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001396227', 2026, null, null, 'Puente Piedra', 'puente piedra', '2026-01-23', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001396229', 2026, null, null, 'Puente Piedra', 'Puente Piedra', '2026-01-23', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '2026-01-26', 3, 'Otros', 'CERRADO', 'RVC'),
('1001396343', 2026, null, null, 'Independencia', 'Independencia/ trasladado UIAT NORTE(Ancón', '2026-01-23', null, 'Micaela Solis', 1, 'Choque con consecuencia fatal', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001396404', 2026, null, null, 'Jesus Maria', 'Jesús Maria', '2026-01-24', null, 'Pierina Ugaz', 1, 'Fractura de la tibia distal izquierda', 'Fractura de tibia', 17250, 'Grave', null, null, '2026-03-31', 66, 'Asegurado No Autoriza', 'CERRADO', 'RVC'),
('1001396527', 2026, null, null, 'Independencia', 'independencia', '2026-01-24', null, 'Pierina Ugaz', 2, 'fractura de la epífisis inferior del radio distal derecho./ contusión del hombro y brazo', 'Fractura de radio y cúbito', 34500, 'Grave', 18000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001396833', 2026, 'Enero', 'LIMA', 'Monterrico', 'Monterrico', '2026-01-25', '2026-01-25', 'DS', 1, 'Rosa Maria Villanueva Palomino (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001396892', 2026, 'Enero', 'LIMA', 'Lurin', 'Lurin', '2026-01-25', '2026-01-25', 'OU', 1, 'Valentina Justo Anampe (Esguince cervical, Trauma Hombro)', 'Esguince', 2300, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('1001384152', 2025, 'Diciembre', null, 'URUBAMBA', 'URUBAMBA', '2025-12-26', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 25000, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('1001397285', 2026, null, null, 'SMP', 'Sol de Oro', '2026-01-26', null, 'Pierina Ugaz', 1, 'Esguince de tobillo', 'Esguince', 2300, 'Leve', 6000, null, '2026-02-13', 18, 'Transigido', 'CERRADO', 'RVC'),
('1001397459', 2026, 'Enero', 'LIMA', 'Miraflores', 'Miraflores', '2026-01-27', '2026-01-27', 'GC', 1, 'Omar Zapata Castro (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001398030', 2026, 'Enero', 'LIMA', 'Lince', 'Lince', '2026-01-26', '2026-01-26', 'DS', null, 'No hay lesionados', 'Policontuso', 0, 'Leve', 0, null, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001399271', 2026, 'Enero', 'LIMA', 'San Borja', 'San Borja', '2026-01-30', '2026-01-30', 'OU', 1, 'Cleyton David Guevara Vasquez (Fractura Rodilla, Politraumatismo)', 'Fractura Pierna', 17250, 'Grave', 8000, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001399455', 2026, 'Enero', 'LIMA', 'Chilca', 'Chilca', '2026-01-30', '2026-01-30', 'GC', 1, 'Jesus Alberto Gutierrez Tapia (Politraumatizado - Fractura de pierna)', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001400221', 2026, 'Febrero', 'LIMA', 'Chorrillos', 'Chorrillos', '2026-02-01', '2026-02-01', 'DS', 5, 'Maria del Pilar Arancibia Flores, Gabriela del Pilar Andrade Arancibia, Anibal Fabricio Andrade Lopez, Nicola Gabriel Andrade Lopez y Angela Lopez (Politraumatizados)', 'Politraumatizado', 20000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001400238', 2026, 'Febrero', 'LIMA', 'Cieneguilla', 'Cieneguilla', '2026-02-01', '2026-02-01', 'GC', 2, 'Isabel Nayeli Kohler Tassara (Politraumatizada) - Manuel Anibal Portocarrero Flores (Corte en la cara)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001400310', 2026, null, null, 'Callo', 'La legua', '2026-02-02', null, 'Pierina Ugaz', 1, 'Traumatismo / politraumatismo.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001400311', 2026, 'Febrero', 'LIMA', 'Santa Felicia', 'Santa Felicia', '2026-02-01', '2026-02-01', 'GC', 1, 'Jhonatan Huaccachi Yauramiza (Esguince de tobillo)', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001400355', 2026, null, null, 'San Miguel', 'Maranga', '2026-02-02', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, null, '2026-02-06', 4, 'Transigido', 'CERRADO', 'RVC'),
('1001400695', 2026, 'Febrero', 'LIMA', 'Chacarilla', 'Chacarilla', '2026-02-02', '2026-02-02', 'DS', 1, 'Yeferson Sayduc Yunyet Olivo (Fractura de Pelvis)', 'Fractura de pelvis', 15000, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001402515', 2026, null, null, 'Independencia', 'Independencia', '2026-02-06', null, 'Pierina Ugaz', 1, 'Fractura del hueso escafoides de la mano / traumatismos superficial multiple', 'Fractura de muñeca', 17250, 'Grave', 5000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001402711/ 1001402710', 2026, null, null, 'El Agustino', 'Santoyo', '2026-02-06', null, 'Micaela', 1, 'Fractura de fémur', 'Fractura de fémur', 23000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001402771', 2026, 'Febrero', 'LIMA', 'Surquillo', 'Surquillo', '2026-02-06', '2026-02-06', 'DS', 1, 'Diego Alfonso Benavente Herrera (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2026-02-07', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001403192', 2026, null, null, 'Callao', 'Carmen de la Legua Reynoso', '2026-02-07', null, 'Pierina Ugaz', 1, 'Contusión de pie izquierdo', 'Policontuso', 1725, 'Leve', 50, null, '2026-02-18', 11, 'Transigido', 'CERRADO', 'RVC'),
('1001403193', 2026, 'Febrero', 'LIMA', 'San Borja', 'San Borja', '2026-02-07', '2026-02-07', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001403353', 2026, 'Febrero', 'LIMA', 'Surquillo', 'Surquillo', '2026-02-08', '2026-02-08', 'DS', 1, 'Benjamin Daniel Hernandez Arce (TEC Severo, UCI)', 'TEC Grave', 23000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001385812', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Isidro', '2025-12-30', null, 'DS', 1, 'Ken Luis Cabrera Vasquez (Politraumatiazdo)', 'Policontuso', 1725, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001404124', 2026, 'Febrero', 'LIMA', 'Chacarilla', 'Chacarilla', '2026-02-09', '2026-02-09', 'JD', 1, 'Alicia Tereza Shaus Andaluz (Fractura de Radio Distal Derecho)', 'Fractura de radio y cúbito', 17250, 'Grave', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001404164', 2026, 'Febrero', 'LIMA', 'San Isiro', 'San Isiro', '2026-02-10', '2026-02-10', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001404410', 2026, 'Febrero', 'LIMA', 'Jose Galvez', 'Jose Galvez', '2026-02-10', '2026-02-10', 'OU', 1, 'Hanani Nicolle Valdivia Diaz (TEC, Fisura brazo, Cervicalgia, Politraumatismo)', 'Fractura de brazo expuesto', 23000, 'Grave', 5500, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001386174', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Punta Hermosa', '2025-12-31', null, 'DS', 3, 'Gerardo Samuel Calagua Atencio (Latigazo Cervical); Rachel Stacy Apaza Delgado ( Contusión de Cabeza); Lia, Walter Apaza Delgado ( Latigazo Cervical)', 'Policontuso', 5175, 'Leve', null, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001405125', 2026, 'Febrero', 'LIMA', 'Monterrico', 'Monterrico', '2026-02-12', '2026-02-12', 'DS', 1, 'Carlos Augusto Sandoval Ayllon (Fractura en el Rostro)', 'Fractura de mandíbula', 17250, 'Grave', 7000, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('17060973', 2025, 'Junio', null, 'ESPINAR', 'ESPINAR', '2025-06-30', null, 'JOEL HUAHUACONDORI', 3, null, 'Policontuso', 5175, 'Leve', 0, 6000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001405337', 2026, null, null, 'Callao', 'Callao', '2026-02-12', null, 'Pierina Ugaz', 1, 'TEC grave', 'TEC Grave', 23000, 'Grave', 14800, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001405447', 2026, 'Febrero', 'LIMA', 'Santa Felicia', 'Santa Felicia', '2026-02-12', '2026-02-12', 'OU', 1, 'María Fernanda Domínguez Gonzales (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001405605', 2026, 'Febrero', 'LIMA', 'San Isidro', 'San Isidro', '2026-02-13', '2026-02-13', 'DS', 1, 'Bryan Yan Angello Roberto Gonzales (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2026-02-13', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001405684', 2026, 'Febrero', 'LIMA', 'Miraflores', 'Miraflores', '2026-02-16', '2025-12-05', 'GC', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001405846', 2026, 'Febrero', 'LIMA', 'San Isidro', 'San Isidro', '2026-02-13', '2026-02-13', 'DS', 1, 'Johan Alexander Padron Barreto (Esguince de Hombro y tobillo)', 'Esguince', 2300, 'Leve', 1500, null, '2026-02-14', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001406084', 2026, null, null, 'Rimac', 'Rimac', '2026-02-14', null, 'Pierina Ugaz', 2, 'Policonstuso', 'Policontuso', 3450, 'Leve', 0, null, '2026-04-22', 67, 'Asegurado No Autoriza', 'CERRADO', 'RVC'),
('1001406253', 2026, null, null, 'Cañete', 'Lunahuana', '2026-02-14', null, 'Pierina Ugaz', 1, 'Contusión de Mano y Pies', 'Policontuso', 1725, 'Leve', 1800, null, '2026-02-19', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001406304', 2026, null, null, 'Ate', 'Salamanca', '2026-02-14', null, 'Elizabeth Monzon', 1, 'Traumatismo múltiple intracraneal', 'TEC Leve', 5750, 'Grave', 18770, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001406362', 2026, null, null, 'SJL', 'Caja de Agua', '2026-02-14', null, 'Elizabeth Monzon', 1, 'Contusión en rodilla y pie derecho', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'CERRADO', 'RVC'),
('1001406428', 2026, null, null, 'Huaral', 'Huaral', '2026-02-15', null, 'Micaela Solis', 2, 'policontuso /fractura', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001406520', 2026, 'Febrero', 'LIMA', 'SJM', 'SJM', '2026-02-15', '2026-02-15', 'JD', 1, 'Eduardo Gampier Huando Huari (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('17224027', 2025, 'Octubre', null, 'COCACHACRA', 'UPIAT AREQUIPA', '2025-10-08', null, 'RUTH HUAHUACONDORI', 10, null, 'Policontuso', 17250, 'Grave', null, 6000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001199688', 2026, 'Octubre', null, null, null, null, null, 'Alejandro Rodríguez', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Alejandro'),
('1001407459', 2026, 'Febrero', 'LIMA', 'Orrantia', 'Orrantia', '2026-02-17', '2026-02-17', 'GC', 1, 'Celestina Ascencio Claro (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001407738', 2026, null, null, 'Callao', 'UIAT Callao', '2026-02-18', null, 'Pierina Ugaz', 1, 'Muerte Inmediata', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001408219', 2026, null, null, 'Jesus Maria', 'Jesus Maria', '2026-01-19', null, 'Pierina Ugaz', 1, 'Contusión de rodilla izquierda y contusión de pierna derecha', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1001408304', 2026, 'Febrero', 'LIMA', 'Tablada de Lurin', 'Tablada de Lurin', '2026-02-19', '2026-02-19', 'DS', 1, 'Mirk Lizandro Trujillo Paz (Fractura en la rodilla)', 'Fractura Pierna', 17250, 'Grave', 25000, null, '2026-03-12', 21, 'Transigido', 'CERRADO', 'Abeo'),
('1001408523', 2026, null, null, 'SJL', 'Santa Elizabeth', '2026-02-19', null, 'Mario Pilares', 3, 'Traumatismo superficiales  muktiples', 'Policontuso', 5175, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001409250', 2026, 'Febrero', 'LIMA', 'San Borja', 'San Borja', '2026-02-20', '2026-02-20', 'OU', 1, 'Danyer Misael Yajure Lovaton (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001409497', 2026, null, null, 'Lima', 'UV3', '2026-02-20', null, 'Pierina Ugaz', 1, 'Traumatismo multiple / herida de codo', 'Politraumatizado', 4000, 'Leve', 600, null, '2025-02-24', -361, 'Transigido', 'CERRADO', 'RVC'),
('1001204499', 2026, 'Octubre', null, null, null, null, null, 'Alejandro Rodríguez', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Alejandro'),
('1001410229', 2026, null, null, 'Hauchipa', 'Huachipa', '2026-02-22', null, 'Pierina Ugaz', 2, 'Herida de Brazo y Antebrazo', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001410244', 2026, 'Febrero', 'LIMA', 'Orrantia', 'Orrantia', '2026-02-22', '2026-02-22', 'GC', 1, 'Julius Kalsen Guizado Elemer (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('1001410498', 2026, 'Febrero', 'LIMA', 'Laderas de Villa', 'Laderas de Villa', '2026-02-23', '2026-02-23', 'OU', 1, 'Shayla Jazbleidy León Hernández (Fractura Tabique, Politraumatismo)', 'Fractura de mandíbula', 17250, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001410633', 2026, null, null, 'SMP', 'Condevilla', '2026-01-23', null, 'Pierina Ugaz', 1, 'Fractura de radio distal', 'Fractura de radio y cúbito', 17250, 'Grave', 5000, null, '2026-03-27', 63, 'Transigido', 'CERRADO', 'RVC'),
('1001410754', 2026, null, null, 'Ate', 'Salamanca', '2026-02-24', null, 'Pierina Ugaz', 2, 'policontuso /fractura', 'Policontuso', 3450, 'Leve', 5000, null, '2026-03-02', 6, 'Transigido', 'CERRADO', 'RVC'),
('1001410850', 2026, 'Febrero', 'LIMA', 'Monterrico', 'Monterrico', '2026-02-24', '2026-02-24', 'GC', 1, 'Flor de María VIdal de Mosqueira (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001204959', 2026, 'Octubre', null, null, null, null, null, 'Alejandro Rodríguez', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Alejandro'),
('1001411144', 2026, null, null, 'Pueblo Libre', 'Pueblo Libre', '2026-02-24', null, 'Micaela Solis', 1, 'contusión de codo', 'Policontuso', 1725, 'Leve', 2000, null, '2026-02-27', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001411218', 2026, 'Febrero', 'LIMA', 'Monterrico', 'Monterrico', '2026-02-24', '2026-02-24', 'JD', 1, 'Diego Adolfo Hidalgo Olivares (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1001411263', 2026, 'Febrero', 'LIMA', 'Monterrico', 'Monterrico', '2026-02-24', '2026-02-24', 'JD', 1, 'Frank Richard Andrade Nuñez (Esguince de Muñeca Derecha).', 'Esguince', 2300, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001411483', 2026, null, null, 'Cercado de Lima', 'Monserrat', '2026-02-25', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 350, null, '2026-03-05', 8, 'Transigido', 'CERRADO', 'RVC'),
('1001412491', 2026, 'Febrero', 'LIMA', 'Miraflores', 'Miraflores', '2026-02-27', '2026-02-27', 'OU', 1, 'Ariana Gianella Malpartida Alva (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001391289', 2026, null, null, 'San Miguel', 'San Miguel', '2026-01-12', null, 'Pierina Ugaz', 1, 'Fractura de la mano.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001412824', 2026, 'Febrero', 'LIMA', 'Sagitario', 'Sagitario', '2026-02-28', '2026-02-28', 'GC', 1, 'Nicole Anthuanet Juarez Huaylla (Fractura de epificis)', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001412869', 2026, 'Febrero', 'LIMA', 'Orrantia', 'Orrantia', '2026-02-28', '2026-02-28', 'DS', 1, 'Javier Renato Campos Zea (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001413923', 2026, 'Marzo', 'LIMA', 'San Borja', 'San Borja', '2026-03-02', '2026-03-02', 'DS', 1, 'Valeria Alejandra Ortiz Costilla (Policontusa)', 'Policontuso', 1725, 'Leve', 0, null, '2026-03-02', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001414015', 2026, null, null, 'Bellavista', 'Ciudad del Pescador.', '2026-03-02', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Rechazado', 'CERRADO', 'RVC'),
('1001393540', 2026, null, null, null, null, null, null, 'Jordy', 1, null, 'Policontuso', 1725, 'Leve', null, 4500, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001414197', 2026, 'Marzo', 'LIMA', 'Miraflores', 'Miraflores', '2026-03-03', '2026-03-03', 'DS', 1, 'Ani Zarela Alvez Cabrera (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001414199', 2026, null, null, 'Independencia', 'Independencia', '2026-03-03', null, 'Pierina Ugaz', 1, 'Pidio alta voluntaria SIN DX', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'CERRADO', 'RVC'),
('1001414709', 2026, null, null, 'San Miguel', 'San Miguel', '2026-03-04', null, 'Pierina Ugaz', 1, 'Fractura de peroné pierna derecha', 'Fractura de Peroné', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001415060', 2026, null, null, 'Bellavista', 'Sin denuncia policial', '2026-03-04', null, 'Pierina Ugaz', 1, '--', 'Policontuso', 1725, 'Leve', null, null, '2026-03-09', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001415248', 2026, 'Marzo', 'LIMA', 'Chacarilla', 'Chacarilla', '2026-03-05', '2026-03-05', 'OU', 1, 'Ximena Abigail AYROLLES ECHEGARAY (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001415365', 2026, 'Marzo', 'LIMA', 'Orrantia', 'Orrantia', '2026-03-05', '2026-03-05', 'DS', 1, 'Noelia Petronila Suarez Gomez (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 1500, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001397035', 2026, null, null, null, null, null, null, 'Jordy', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001415650', 2026, null, null, 'Chimbote', 'Buenos Aires', '2026-03-05', null, 'Alejandro', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'En Negociación', 'CERRADO', 'Alejandro'),
('1001416268', 2026, null, null, 'Comas', 'Tupac amaru', '2026-03-06', null, 'Pierina Ugaz', 1, 'fractura de rótula izquierda.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001416320', 2026, 'Marzo', 'LIMA', 'San Isidro', 'San Isidro', '2026-03-06', '2026-03-06', 'DS', 1, 'Olenka Milagros Urbiola Moran (Esguince Cervical)', 'Esguince', 2300, 'Leve', 5000, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001416354', 2026, null, null, null, 'Subtanjalla', '2026-03-06', null, 'Alejandro', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Alejandro'),
('1001416537', 2026, 'Marzo', 'LIMA', 'Magdalena', 'Magdalena', '2026-03-07', '2026-03-07', 'DS', 1, 'Lino Gerardo Serna Guia (TEC Critico)', 'TEC Grave', 23000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001416959', 2026, null, null, 'Ate', 'Salamanca', '2026-03-08', null, 'Wilinton Loarte', 8, 'TEC / Policontuso / fractura', 'TEC Leve', 46000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001417500', 2026, null, null, 'Paramonga', null, '2026-03-27', null, 'Alejandro', 3, 'Fractura de fémur', 'Fractura de fémur', 69000, 'Grave', 0, null, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('1001417678', 2026, 'Marzo', 'LIMA', 'Sagitario', 'Sagitario', '2026-03-10', '2026-03-10', 'JD', 1, 'Isabel Calixta Gonzales Pereyra (Fractura de Tobillo)', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001418061', 2026, 'Marzo', 'LIMA', 'Santa Felicia', 'Santa Felicia', '2026-03-11', '2026-03-11', 'OU', 1, 'Ariana Nohemí Huachos Lozano (Herida cortante rostro)', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001418162', 2026, 'Marzo', 'LIMA', 'Surquillo', 'Surquillo', '2026-03-11', '2026-03-11', 'OU', 1, 'César Gustavo Vasquez Vasquez (Esguince Tobillo)', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001419215', 2026, 'Marzo', 'LIMA', 'Chorrillos', 'Chorrillos', '2026-03-12', '2026-03-12', 'DS', 1, 'Magno Chuquillanqui Vera (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 4000, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001420053', 2026, 'Marzo', 'LIMA', 'Monterrico', 'Monterrico', '2026-03-14', '2026-03-14', 'JD', 1, 'David Kevin Manaydy Zanabria (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001420817', 2026, 'Marzo', 'LIMA', 'Orrantia', 'Orrantia', '2026-03-15', '2026-03-15', 'JD', 4, 'José Pablo Morán Torre (Politraumatizado), Gady Letizia Taza López (Politraumatizado), Ana Paula Carhuavilca Casas (Politraumatizado), Madisson Ivette Ramos Granada (Politraumatizado)', 'Politraumatizado', 16000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001421091', 2026, null, null, 'Callao', 'Playa Rimac', '2026-03-15', null, 'Micaela Solis', 2, '1. CT: Herida contuso cortante en región del labio superior con sangrado activo Y 2. OT: Policontuso traumático en la pierna derecha, quedando en observación', 'Policontuso y corte', 4600, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001421117', 2026, 'Marzo', 'LIMA', 'San Borja', 'San Borja', '2026-03-15', '2026-03-15', 'JD', 2, 'Eithan Santiago Zevallos (6 meses / Policontuso), Anny Ren Zhang (13 / Policontuso)', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001403583', 2026, null, null, null, null, null, null, 'Jordy', 1, null, 'Policontuso', 1725, 'Leve', null, 2100, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001421995', 2026, null, null, 'Los Olivos', 'Sol de Oro', '2026-03-16', null, 'Pierina Ugaz', 1, 'Contusión de pierna derecha, lesión en tendón extensor del 3er y 5to dedo de la mano derecha', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001422021', 2026, 'Marzo', 'LIMA', 'San Isidro', 'San Isidro', '2026-03-16', '2026-03-16', 'OU', 1, 'Wily Renato Dongo Cateriano (Cervicalgia)', 'Cervicalgia', 2300, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001422369', 2026, 'Marzo', 'LIMA', 'Lince', 'Lince', '2026-03-17', '2026-03-17', 'OU', 1, 'Elva Ríos Machicanda (Fractura Tobillo)', 'Policontuso', 1725, 'Leve', 3000, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001422610', 2026, null, null, 'Alfonso Ugarte', 'Alfonso Ugarte', '2026-03-17', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001422629', 2026, 'Marzo', 'LIMA', 'San Borja', 'San Borja', '2026-03-17', '2026-03-17', 'GC', 1, 'Pedro Alonso De la Torre Lopez (Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001404724', 2026, null, null, null, null, null, null, 'Jordy', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001423292', 2026, null, null, 'Comas', 'Universitaria', '2026-03-18', null, 'Pierina Ugaz', 1, 'Traumatismos superficiales múltiples y heridas de otras partes del antebrazo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001424174', 2026, 'Marzo', 'LIMA', 'Magdalena', 'Magdalena', '2026-03-19', '2026-03-19', 'JD', 1, 'Andrea Balia Cordova Díaz (Policontuso)', 'Policontuso', 1725, 'Leve', 500, null, '2026-03-20', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001424487', 2026, 'Marzo', 'LIMA', 'Monterrico', 'Monterrico', '2026-03-19', '2026-03-19', 'OU', 1, 'Juan Luis Alvarez Mendoza (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001405298', 2026, 'Febrero', 'LIMA', 'Miraflores', 'Miraflores', '2026-02-12', '2026-02-12', 'JD', 1, 'Deninson Argenis Rodríguez Toro (Fractura 5to Metatarsiano Pie Izquierdo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001426086', 2026, null, null, 'Bellavista', 'San Miguel', '2026-03-21', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001406579', 2026, 'Febrero', null, null, null, null, null, 'Enmanuel', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001427835', 2026, 'Marzo', 'LIMA', 'Pueblo Libre', 'Pueblo Libre', '2026-03-23', '2026-03-23', 'OU', 1, 'Josué David Choquehuanca Echevarria (Politraumatismo, Herida Cortante Oreja)', 'Politraumatizado', 4000, 'Leve', 500, null, '2026-03-23', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001428568', 2026, 'Marzo', 'LIMA', 'Magdalena', 'Magdalena', '2026-03-23', '2026-03-23', 'GC', 1, 'Franco Eddy Cespedes Vilchez (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001428603', 2026, null, null, 'La Victoria', 'Apolo', '2026-03-23', null, 'Mario Pilares', 1, 'Contusión', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001429479', 2026, 'Marzo', 'LIMA', 'Orrantia', 'Orrantia', '2026-03-24', '2026-03-24', 'DS', 1, 'Eduardo Jesus Murga Venturo (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2026-03-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001407150', 2026, null, null, null, null, null, null, 'Jordy', 1, null, 'Policontuso', 1725, 'Leve', null, 3850, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001429654', 2026, 'Marzo', 'LIMA', 'Orrantia', 'Orrantia', '2026-03-24', '2026-03-24', 'DS', 1, 'NN (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001429723', 2026, 'Marzo', 'LIMA', 'San Isidro', 'San Isidro', '2026-03-24', '2026-03-24', 'OU', 1, 'Nataly Noemí Chávez Alvarado (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 3500, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001429774', 2026, 'Marzo', 'LIMA', 'Monterrico', 'Monterrico', '2026-03-24', '2026-03-24', 'DS', 1, 'Eliza del Pilar Chacon Tapia (Policontusa)', 'Policontuso', 1725, 'Leve', 0, null, '2026-03-24', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001430947', 2026, 'Marzo', 'LIMA', 'Miraflores', 'Miraflores', '2026-03-25', '2026-03-25', 'JD', 1, 'Pierina Schaefer Svagelj (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001431300', 2026, 'Marzo', 'LIMA', 'Surco', 'Surco', '2026-03-26', '2026-03-26', 'DS', 1, 'Patricia Manco Vela (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001431318', 2026, 'Marzo', 'LIMA', 'Miraflores', 'Miraflores', '2026-03-26', '2026-03-26', 'OU', 1, 'Jean Pierre Beltrán Ramírez (Politraumatismo, Rotura de Bazo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001431328', 2026, null, null, null, 'San Miguel', '2026-03-26', null, 'Pierina Ugaz', 1, 'Lesiones:

·     Conductor tercero: Marco Antonio Fernández Wilbet

·     Diagnóstico: Policontuso

·     Lugar de atención: Clínica San Gabriel', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001431363', 2026, 'Marzo', 'LIMA', 'Lince', 'Lince', '2026-03-26', '2026-03-26', 'GC', 1, 'Danitza Cordova Dávila (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001431970', 2026, null, null, 'Comas', 'Santa Luzmila', '2026-03-26', null, 'Micaela Solis', 1, 'Contusión de miembro inferior izquierdo (en observación)', 'Policontuso', 1725, 'Leve', null, null, '2026-04-23', 28, 'Transigido', 'CERRADO', 'RVC'),
('1001432512', 2026, 'Marzo', 'LIMA', 'San Isidro', 'San Isidro', '2026-03-27', '2026-03-27', 'OU', 1, 'Etson Bryam Huaman Cabrera (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 500, null, '2026-03-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001432821', 2026, 'Marzo', 'LIMA', 'Chorrillos', 'Chorrillos', '2026-03-26', '2026-03-26', 'OU', 1, 'Erik Alberto Ramirez Rivera (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, null, '2026-03-26', 0, 'Archivado', 'CERRADO', 'Abeo'),
('1001434333', 2026, null, null, 'Zapallal', 'Zapallal', '2026-03-29', null, 'Mario Pilares', 2, 'Policontuso, por descarte de fractura, quedando en observación', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001434945', 2026, 'Marzo', 'LIMA', 'Las Praderas', 'Las Praderas', '2026-03-29', '2026-03-29', 'GC', 1, 'Lazaro Mera Rodriguez (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001435619', 2026, 'Marzo', 'LIMA', 'San Borja', 'San Borja', '2026-03-30', '2026-03-30', 'DS', 2, 'Sebastian Antonio Alexander Salas Valle y Giovanna Leslie Valle Montesinos (Politraumatizados)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001436178', 2026, 'Marzo', 'LIMA', 'Monterrico', 'Monterrico', '2026-03-30', '2026-03-30', 'GC', 1, 'Isis Rueda Garcia (Esguince cervical', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001436981', 2026, null, null, 'Comas', 'Sin denuncia policial', '2026-03-31', null, 'Pierina Ugaz', 0, null, 'Policontuso', 0, 'Leve', 0, null, '2026-03-31', 0, 'Transigido', 'CERRADO', 'RVC'),
('1001437385', 2026, 'Marzo', 'LIMA', 'San Borja', 'San Borja', '2026-03-31', '2026-03-31', 'JD', 2, 'Sandro Iván Delgado Vera (Politraumatizado), María Fernanda Infanzón Palomino (Politraumastizada)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001438179', 2026, null, null, 'Ancón', 'Ancón', '2026-04-01', null, 'Pierina Ugaz', 1, 'Traumatismo de Órgano Intraabdominal no especificado.', 'Hemorragia interna', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001438351', 2026, 'Abril', 'LIMA', 'Curva de Villa', 'Curva de Villa', '2026-04-01', '2026-04-01', 'OU', 1, 'Miguel Chanel Valverde (Politraumatismo, Esguince Tobillo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001438494', 2026, 'Abril', 'LIMA', 'Miraflores', 'Miraflores', '2026-04-01', '2026-04-01', 'GC', 1, 'Magdiel Jesús Benites Bastidas (Fractura de pelvis)', 'Fractura de pelvis', 15000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001438744', 2026, 'Abril', 'LIMA', 'Magdalena', 'Magdalena', '2026-04-01', '2026-04-01', 'DS', 1, 'Maria Leisy Sophia Rodriguez Saldaña (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2026-04-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001443071', 2026, null, null, 'SMP', 'Sol de Oro', '2026-04-04', null, 'Pierina Ugaz', 1, 'Traumatismos múltiples no especificados, quedando en observación', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001443630', 2026, 'Abril', 'LIMA', 'Lurin', 'Lurin', '2026-04-04', '2026-04-04', 'DS', 1, 'Lloygony Manuel Navarro Zevallos (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001444426', 2026, 'Abril', 'LIMA', 'Surco', 'Surco', '2026-04-05', '2026-04-05', 'DS', 1, 'Alisson Anell Soto Buitron  (Policontusa)', 'Policontuso', 1725, 'Leve', 0, null, '2026-04-05', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001409876', 2026, 'Febrero', null, null, null, null, null, 'Enmanuel', 1, null, 'Policontuso', 1725, 'Leve', null, 300, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001445998', 2026, 'Abril', 'LIMA', 'Monterrico', 'Monterrico', '2026-04-06', '2026-04-06', 'JD', 1, 'Roberto Emerson Rojas Villanueva (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 500, null, '2026-04-07', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001446487', 2026, 'Abril', 'LIMA', 'Santa Felicia', 'Santa Felicia', '2026-04-07', '2026-04-07', 'OU', 1, 'Lizbeth Nohely Rojas Canorio (Esguince Rodilla)', 'Esguince', 2300, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001447153', 2026, 'Abril', 'LIMA', 'Magdalena', 'Magdalena', '2026-04-07', '2026-04-07', 'GC', 1, 'Kimberly Ignacio Cueto (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001447165', 2026, null, null, 'La Victoria', 'La Victoria', '2026-04-07', null, 'Micaela Solis', 1, 'Policontuso y herida', 'Policontuso y corte', 2300, 'Leve', 3000, 3000, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001447803', 2026, null, null, 'SMP', 'Condevilla', '2026-04-08', null, 'Pierina Ugaz', 1, 'Traumatismo encéfalo craneano leve y policontuso (mujer en gestación 02 meses)', 'TEC Leve', 5750, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001448077', 2026, null, null, 'LA VICTORIA', 'LA VICTORIA', '2026-04-08', null, 'Pierina Ugaz', 2, 'fractura de  tibia, herida contusa, policontuso', 'Fractura de tibia', 34500, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001448135', 2026, 'Abril', 'LIMA', 'Sagitario', 'Sagitario', '2026-04-08', '2026-04-08', 'DS', 1, 'Robert Antonio Romero Chacon3.', 'Policontuso', 1725, 'Grave', 9500, null, '2026-04-21', 13, 'Transigido', 'CERRADO', 'Abeo'),
('1001449061', 2026, 'Abril', 'LIMA', 'San Borja', 'San Borja', '2026-04-09', '2026-04-09', 'DS', 1, 'Jose Luis Rojas Pineda (Fractura en el dedo)', 'Policontuso', 1725, 'Leve', 4500, null, '2026-05-07', 28, 'Transigido', 'CERRADO', 'Abeo'),
('1001449085', 2026, null, null, 'El Agustino', 'Villa Hermosa', '2026-04-09', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1680, 1680, '2026-04-14', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001449457', 2026, null, null, 'Los Olivos', 'Laura Caller', '2026-04-13', null, 'Pierina Ugaz', 4, 'Policontuso', 'Policontuso', 6900, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001450674', 2026, 'Abril', 'LIMA', 'Orrantia', 'Orrantia', '2026-04-10', '2026-04-10', 'JD', 1, 'Nahomi Cáceda Palacin (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001451114', 2026, null, null, 'Salamanca', 'Salamanca', '2026-04-10', null, 'Mario Pilares', 2, 'traumatismo Superficial Múltiple', 'Politraumatizado', 8000, 'Grave', 3000, null, '2026-04-20', 10, 'Transigido', 'CERRADO', 'RVC'),
('1001453792', 2026, 'Abril', 'LIMA', 'Surco', 'Surco', '2026-04-13', '2026-04-13', 'OU', 1, 'Ismael Estrada Rodríguez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1050, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('1001455680', 2026, 'Abril', 'LIMA', 'San Borja', 'San Borja', '2026-04-14', '2026-04-14', 'GC', 1, 'Rebeca Fiorella Clemente Piaggio (Policontuso y Esguince de rodilla izquierda)', 'Esguince', 2300, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001410871', 2026, null, null, null, null, null, null, 'Jordy', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001456673', 2026, 'Abril', 'LIMA', 'Orrantia', 'Orrantia', '2026-04-15', '2026-04-15', 'DS', 1, 'Roberto Salinas Arana (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2026-04-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001412619', 2026, null, null, null, null, null, null, 'Jordy', 1, null, 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001456845', 2026, 'Abril', 'LIMA', 'Miraflores', 'Miraflores', '2026-04-15', '2026-04-15', 'OU', 3, 'Abraham Denegri, Gina y un menor (Politraumatismo, laceraciones y escoriaciones)', 'Politraumatizado', 12000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001457618', 2026, 'Abril', 'LIMA', 'Monterrico', 'Monterrico', '2026-04-16', '2026-04-16', 'JD', 1, 'David Abelardo García Rivas (Fractura de Clavícula Izquierda)', 'Fractura de clavícula', 23000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001457658', 2026, 'Abril', 'LIMA', 'Magdalena', 'Magdalena', '2026-04-16', '2026-04-16', 'OU', 2, 'Dayanna Rosmery Flores Pachas y Wilmer Joel Pérez Monteza (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001458901', 2026, 'Abril', 'Lima', 'Rimac', 'de El Manzano - Rímac', '2026-04-17', '2026-04-17', 'Pierina Ugaz', 1, 'Policontuso por accidente vehicular, quedando en observación', 'Policontuso', 1725, 'Leve', null, null, '2026-04-24', 7, 'Transigido', 'CERRADO', 'RVC'),
('1001459293', 2026, 'Abril', 'Lima', 'Pueblo Libre', 'Pueblo Libre', '2026-04-17', '2026-04-17', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, null, '2027-05-04', 382, 'Transigido', 'CERRADO', 'RVC'),
('1001460095', 2026, 'Abril', 'Lima', 'Lima', 'Monserrat', '2026-04-18', '2026-04-18', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 150, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001461505', 2026, 'Abril', 'LIMA', 'Cieneguilla', 'Cieneguilla', '2026-04-19', '2026-04-19', 'OU', 2, 'Gabriel Yeser Soriano Javier (Fractura Tibia y Peroné) y Fátima Nicole García López (Politraumatismo, TEC)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001461999', 2026, 'Abril', 'LIMA', 'Surco', 'Surco', '2026-04-20', '2026-04-20', 'GC', 1, 'Miguel Angel Tomas Balbin Castañeda (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('1001462137', 2026, null, null, 'Ancash', 'Chimbote', '2026-04-20', null, 'Alejandro', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Alejandro'),
('1001462724', 2026, 'Abril', 'LIMA', 'Orrantia', 'Orrantia', '2026-04-21', '2026-04-21', 'DS', 1, 'Christian Luis Cassana Sandoval (Policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2026-04-21', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001463222', 2026, 'Abril', 'LIMA', 'Orrantia', 'Orrantia', '2026-04-21', '2026-04-21', 'JD', 1, 'Luis Manuel Torres Panca (Politraumatismo / Herida en Muslo Izquierdo)', 'Politraumatizado', 4000, 'Leve', 3000, null, '2026-04-22', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001414167', 2026, null, null, 'Chancay', null, '2026-03-02', null, 'Alejandro', 1, 'Fractura de pelvis + Injerto de Piel (tamaños pequeños)', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('1001463785', 2026, 'Abril', 'LIMA', 'Chacarrilla', 'Chacarrilla', '2026-04-22', '2026-04-22', 'JD', 1, 'Carlos Ricardo Arnaiz Muñoz (TEC Moderado / Traumatismo Toráxico Cerrado / Politraumatismo en Miembro Superior Izquierdo)', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001464358', 2026, 'Abril', 'LIMA', 'Orrantia', 'Orrantia', '2026-04-22', '2026-04-22', 'JD', 1, 'Luis Miguel Timmermann Flores (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001464634', 2026, 'Abril', 'LIMA', 'Lurin', 'Lurin', '2026-04-23', '2026-04-23', 'OU', 3, 'José Antonio Paniura Falcón (Politraumatismo), Bernabé Aroste Olivera (Politraumatismo, Tec, Heridas Cortantes Rostro) y Alejandro Caso Mendoza (Fractura Hombro, Politraumatismo)', 'Politraumatizado', 12000, 'Grave', 6000, null, '2026-04-24', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001465494', 2026, 'Abril', 'LIMA', 'San Isidro', 'San Isidro', '2026-04-25', '2026-04-25', 'GC', 1, 'David francisco Neira cunyarache (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001466173', 2026, 'Abril', 'LIMA', 'Lince', 'Lince', '2026-04-27', '2026-04-27', 'DS', 1, 'Sebastian Enriqure Espronceda Velasquez (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 600, null, '2026-04-28', 1, 'Transigido', 'CERRADO', 'Abeo'),
('1001466344', 2026, 'Abril', 'SJL', 'SJL', 'Santa Elizabeth', '2026-04-27', '2026-04-27', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001466714', 2026, 'Abril', 'LIMA', 'Miraflores', 'Miraflores', '2026-04-28', '2026-04-28', 'JD', 1, 'Eduin Chávez Cortez (Fractura de Brazo Izquierdo)', 'Policontuso', 1725, 'Leve', 1000, null, '2026-04-28', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001466972', 2026, 'Abril', 'Lima', 'Jesus Maria', 'Petit Thouars', '2026-04-28', '2026-04-28', 'Pierina Ugaz', 1, 'Contusión de otras partes del antebrazo y zonas no especificadas, contusión de dedo', 'Policontuso', 1725, 'Leve', null, null, '2026-05-07', 9, 'Transigido', 'CERRADO', 'RVC'),
('1001415427', 2026, 'Marzo', 'LIMA', 'Monterrico', 'Monterrico', '2026-03-05', '2026-03-05', 'JD', 1, 'Neela Alejandra Quispe Moreno (Fractura de 3 dedos de pie izquierdo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('1001467110', 2026, 'Abril', 'LIMA', 'Santa Felicia', 'Santa Felicia', '2026-04-28', '2026-04-28', 'OU', 1, 'Renato Alberto Vargas Vicente (presuntamente policontuso)', 'Policontuso', 1725, 'Leve', 0, null, '2026-04-28', 0, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('1001467674', 2026, 'Abril', 'Lima', 'Callao', 'Playa Rimac.', '2026-04-29', '2026-04-29', 'Pierina Ugaz', null, null, 'Policontuso', 0, 'Leve', 450, null, '2026-05-04', 5, 'Transigido', 'CERRADO', 'RVC'),
('1001421621', 2026, null, null, 'SMP', 'Sol de Oro', '2026-03-16', null, 'Pierina Ugaz', 2, 'Desgarro muscular  con la piel expuesta requiere intervención quirúrgica  para reconstrucción de dermis', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001468624', 2026, 'Mayo', 'Lima', 'Los Olivos', 'Pro', '2026-05-01', '2026-05-01', 'Mario Pilares', 1, 'Esguince de tobillo izq., esguince rodilla bilateral, herida pierna derecha y policontuso', 'Esguince', 2300, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001468695', 2026, 'Mayo', 'Lima', 'Cercado de Lima', 'UV3 Mirones', null, null, 'Pierina Ugaz', 1, 'Policontuso por accidente de transito', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('1001469226', 2026, 'Mayo', 'Lima', 'San Miguel', 'San Miguel', '2026-05-03', '2026-05-03', 'Micaela Solis', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 1736, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001469801', 2026, 'Mayo', 'Lima', 'Callao', 'Callao', '2026-05-04', '2026-05-04', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 100, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001422776', 2026, 'Marzo', null, null, null, null, null, 'Enmanuel', 1, null, 'Policontuso', 1725, 'Leve', null, 2000, null, null, 'En Negociación', 'ABIERTO', 'Tuesta'),
('1001469908', 2026, 'Mayo', 'Lima', 'Comas', 'Universitaria', null, null, 'Pierina Ugaz', 2, 'Policontuso por accidente de transito', 'Policontuso', 3450, 'Leve', null, null, '2026-05-06', null, 'Transigido', 'CERRADO', 'RVC'),
('1001470993', 2026, 'Mayo', 'Callao', 'Callao', 'Playa Rimac', '2026-05-07', '2026-05-07', 'Pierina Ugaz', 1, 'Policontuso por accidente  de transito/Fractura de diafisiaria de radio izquierdo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1001472547', 2026, 'Mayo', 'Lima', 'Los Olivos', 'Pro', null, null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('1001473042', 2026, 'Mayo', 'Lima', 'San Miguel', 'San Miguel', '2026-05-11', '2026-05-11', 'Pierina Ugaz', 2, 'Contusión de rodilla/Esguince cervical', 'Esguince', 4600, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('1001522987', 2024, 'Junio', 'LIMA', 'Monterrico', null, '2024-06-19', '2024-06-19', 'GC', 1, 'Milko Edu Rojas Bonilla (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('1001425129', 2026, 'Marzo', 'LIMA', 'Miraflores', 'Miraflores', '2026-03-20', '2026-03-20', 'JD', 1, 'Silvia Ríos Merino', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('100419726', 2026, null, null, 'Independencia', 'Independencia', '2026-03-13', null, 'Pierina Ugaz', 1, 'Herida del Antebrazo, parte no especificada', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('100909051', 2022, 'Diciembre', 'LIMA', 'Miraflores', null, '2022-12-26', '2022-12-26', 'DS', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('1011051882', 2023, 'Noviembre', 'LIMA', 'Monterrico', null, '2023-11-29', '2023-11-29', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2023-11-29', 0, 'Transigido', 'CERRADO', 'Abeo'),
('10697673', 2024, 'Noviembre', 'Lima', 'Alfonso Ugarte', 'Alfonso Ugarte', '2024-11-09', '2024-11-09', 'Pierina Ugaz', 2, 'TEC- Fractura de pierna izquierda./ TEC- Policontuso y herida contaminada.', 'Fractura Pierna', 34500, 'Grave', 0, 35000, '2025-04-07', 149, 'Transigido', 'CERRADO', 'RVC'),
('14570586', 2024, 'Octubre', 'LIMA', 'Monterrico', null, '2024-10-03', '2024-10-03', 'JD', 1, 'José Luis Aranguren Hernández (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Otros', 'ABIERTO', 'Abeo'),
('14583826', 2021, 'Enero', 'LIMA', 'Los Olivos', 'Laura Caller.', '2021-01-19', '2021-01-19', 'Oscar Arroyo', 1, '-      Peatón: Mardonio Alexander Isuiza Tapullima (24)

Diagnostico: Policontuso TEC contusión en hombro lado derecho, contusión de rodilla lado derecho y cervical. Queda en observación.

Lesiones graves.

Atendido en la Clínica Jesús del Norte.', 'TEC Leve', 5750, 'Leve', 300, 300, '2022-01-19', 365, 'Transigido', 'CERRADO', 'RVC'),
('14600667', 2021, 'Febrero', 'LIMA', 'Cercado de Lima', 'Comisaría Monserrat.', null, '2021-02-01', 'Oscar Arroyo', 1, '-      Conductor (Tercero): JeanLucc Mavid Alegría Mont (23)

Diagnóstico: Heridas múltiples en el tobillo izquierdo aplastamiento de tobillo izquierdo y diversas fracturas en el brazo. Queda internado.

Lesiones graves.

Atendido en la Clínica Javier Prado.

-      Ocupante (Tercero): Vanessa Trebejo Quispe (26)

Diagnóstico: Esguince torcedura de codo izquierdo. Queda internada.

Lesiones graves.

Atendida en la Clínica Javier Prado.', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14600700', 2021, 'Febrero', 'CALLAO', 'Villa El Salvador', 'Urb. Pachacamac - VES.', null, '2021-02-01', 'Oscar Arroyo', 1, '-      Conductor (Tercero Venezolano): Kelvin Rafael Sánchez Yánez (24)

Diagnóstico: Heridas en brazos, escoriaciones, otros.

Lesiones de consideración.

Atendido en la Clínica Clinimed VES.', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14607794', 2021, 'Febrero', 'LIMA', 'San Juan de Miraflores', 'San Juan de Miraflores.', null, '2021-02-06', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Luis Cesar Flores Sotocorno

Diagnóstico: Contusiones codo derecho y músculos, lumbalgia post traumatismo.

Lesiones de consideración.

Atendido en la Clínica Santa Martha.', 'Lumbalgia', 3450, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14657288', 2021, 'Marzo', 'LIMA', 'Callao', 'Ciudadela Chalaca.', null, '2021-03-15', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Jesús Remigio Flores Muchaypiña (72)

Diagnóstico: Policontusos. Golpe en pierna izquierda.

Lesiones leves.

No se atendió en ningún centro médico', 'Policontuso', 1725, 'Leve', 200, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14657469', 2021, 'Marzo', 'LIMA', 'Ate', 'Huaycán', null, '2021-03-15', 'Oscar Arroyo', 1, '-      Conductor (Tercero): Frank José Toribio Camargo (21)

Diagnóstico: Aún en observación.

Lesiones posiblemente graves.

Atendido en el Hospital de Huaycán.', 'Politraumatizado', 4000, 'Leve', 300, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14680153', 2021, 'Marzo', 'LIMA', 'Instalaciones de Petramax', 'Jicamarca.', null, '2021-03-31', 'Pierina Ugaz', 1, '-       Tercera: No identificada.

Diagnóstico: Fallecimiento', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14683754', 2021, 'Abril', 'CALLAO', 'El Agustino', 'San Cayetano', null, '2021-04-06', 'Pierina Ugaz', 1, '-      Conductor (Tercero 2): Yokoky Yahayra Mendoza Pajuelo

Diagnóstico: Fallecimiento al llegar al Hospital Hipólito Unanue.

Fallecida

-      Ocupante 1 (Tercero 1): Inga Rengifo Ana María

Diagnóstico: Herida superficial en el rostro, contusión craneal y en muslo izquierdo.

Lesiones de consideración.

Atendida en el Hospital 2 de Mayo.

-      Ocupante 2 (Tercero 1): María Paula Rivera Raina

Diagnóstico: Trauma torácico cerrado.

Lesiones de consideración.

Atendida en el Hospital 2 de Mayo.

-      Ocupante 3 (Tercero 1): Maruja Olmeda Ata

Diagnóstico: Traumatismos superficiales múltiples.

Lesiones leves.

Atendida en el Hospital 2 de Mayo. 

-      Ocupante 4 (Tercero 1): Paola Gabriela Canales Mesias

Diagnóstico: Policontusos.

Lesiones leves.

Atendida en el Hospital 2 de Mayo.', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14712990', 2021, 'Abril', 'LIMA', 'Ate', 'Salamanca.', null, '2021-04-26', 'Pierina Ugaz', 1, '-      Conductor (Tercero): Henry Wilfredo Gomez Hidalgo

Diagnóstico: Tercero no quiso ser atendido; indicó que el ya vería por su cuenta la atención. Acorde a lo que se visualizó al tercero tendría lesión en la pierna.

Lesiones posiblemente de consideración.', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14741459', 2021, 'Mayo', 'LIMA', 'SMP.', 'Habich.', null, '2021-05-18', 'Pierina Ugaz', 1, 'No hubo lesiones', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14747769', 2021, 'Mayo', 'LIMA', 'CALLAO', 'La Legua', null, '2021-05-21', 'Pierina Ugaz', 1, 'Alexander Augusto Benites Farfán

Diagnóstico: Policontuso.', 'Policontuso', 1725, 'Grave', 30000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14765287', 2021, 'Junio', 'LIMA', 'San Juan de Miraflores', 'San Juan de Miraflores', null, '2021-06-04', 'Pierina Ugaz', 1, 'Ocupante Tercero: Kathyuska Mundarain Linares (27)
Diagnóstico: Traumatismo intracraneal
Atendida: Clinica Tezza', 'TEC Leve', 5750, 'Leve', 3500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1000936556', 2023, 'Marzo', 'LIMA', 'BREÑA', 'Chacra Colorada', '2023-03-05', '2023-03-05', 'Pierina Ugaz', 1, 'Policontuso, contusión en rodilla y tobillo derecho, descargar fractura', 'Policontuso', 1725, 'Leve', 1966, 1694, '2025-05-25', 812, 'Transigido', 'CERRADO', 'RVC'),
('14823088', 2021, 'Julio', 'LIMA', 'LIMA', 'Monserrat', null, '2021-07-19', 'Pierina Ugaz', 1, 'Conductor tercero: Noel Baez Anaya (28)         Diagnóstico: Fractura de pierna                  Atendido en Clínica SanJuan Bautista, San Miguel.', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14847670', 2021, 'Agosto', 'CALLAO', 'Los olivos', 'Sol de Oro', null, '2021-08-06', 'Pierina Ugaz', 1, 'Conductor tercero 1: Cesar Augurto Rojas Caceres (41)

Diagnóstico: Policontuso

Atendido en Clínica Montefiori

Ocupante tercera 1: Arleth Daleska Navarro Ayala (15)                                                                                        Diagnóstico: Policontuso.

Atendido en Clínica de su elección (Cuenta con seguro particular)', 'Policontuso', 1725, 'Grave', 30003000, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14879103', 2021, 'Agosto', 'LIMA', 'Santa Anita', 'Santa Anita', null, '2021-08-25', 'Pierina Ugaz', 1, 'Conductor tercero: Cecilia Veronikha Capcha Acevedo (48)
Diagnóstico: Policontuso con posible fractura de miembro superior derecho, por descartarse en placas radiográficas.
Atendido en Clínica Montefiori, La Molina', 'Fractura de radio y cúbito', 17250, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14885553', 2021, 'Septiembre', 'LIMA', 'San Juan de Miraflores.', 'Av. Los Héroes con Av. Miguel Iglesias, San Juan de Miraflores - Comisaría de San Juan de Miraflores.', null, '2021-09-01', 'Pierina Ugaz', 1, 'Achata Acuña Tomas S (90)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14947531', 2021, 'Octubre', 'LIMA', 'Av. Universitaria con Av. Mariano Cornejo - Comisaría Maranga', 'Av. Universitaria con Av. Mariano Cornejo - Comisaría Maranga', null, '2021-10-15', 'Pierina Ugaz', 1, '- Conductor tercero: Flavio Jossue Espinoza Carmelino

Diagnóstico: Policontuso

Atendido en Clínica Providencia', 'Policontuso', 1725, 'Leve', 500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14972711', 2021, 'Noviembre', 'LIMA', 'Av. Nestor Gambeta Km. 14.5 – Comisaría Marquez', 'Av. Nestor Gambeta Km. 14.5 – Comisaría Marquez', null, '2021-11-02', 'Pierina Ugaz', 1, '- Conductor tercero: Jarley Verpillot Simologe

Diagnóstico: Muerte', 'Fallecido', 65000, 'Grave', 0, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14982465', 2021, 'Noviembre', 'LIMA', 'Av. Mariano Pastor Sevilla con Av. Talara, Villa el Salvador – Comisaría de Pachacamac', 'Av. Mariano Pastor Sevilla con Av. Talara, Villa el Salvador – Comisaría de Pachacamac', null, '2021-11-09', 'Mario Pilares/Pierina Ugaz', 1, 'Franklin Rafael Briseño Perez

- Diagnóstico: Traumatismo encéfalo craneano, policontuso.

- Atendido en Hospital de emergencia de VES

 

- Ocupante tercero: Lesly Sharon Meneses Quispe (28)

- Diagnóstico: Policontuso

- Atendido en Hospital de emergencias Essalud “Uldarico Roca”

 

- Conductor tercero: Jeremy Anthony Sánchez Meneses (12)

- Diagnóstico: Policontuso

- Atendido en Hospital de emergencias Essalud “Uldarico Roca”

 

- Conductor tercero: Valeshka Nahiara Sánchez Meneses (03)

- Diagnóstico: Policontuso

- Atendido en Hospital de emergencias Essalud “Uldarico Roca”', 'TEC Leve', 5750, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14987597', 2021, 'Noviembre', 'LIMA', 'Av. Beltran con calle 11 – Comisaría Ventanilla', 'Av. Beltran con calle 11 – Comisaría Ventanilla', null, '2021-11-12', 'Pierina Ugaz', 1, 'Jacinto Jimenez Torres

- Diagnóstico: Policontuso

- Atendido en Hospital Ventanilla', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('14992644', 2021, 'Noviembre', 'LIMA', 'Panamericana Sur, Altura del grifo PRIMAX – Comisaría Lurin', 'Panamericana Sur, Altura del grifo PRIMAX – Comisaría Lurin', null, '2021-11-17', 'Pierina Ugaz', 1, '- Copiloto 1 asegurado: Cesar David Valdivia Acevedo

- Diagnóstico: Muerte instantánea

 

- Copiloto 2 asegurado: Víctor Marquez Seijas

- Diagnóstico: Fractura de pierna y golpes en cabeza

- Atendido en Clinica Santa Martha', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('15001459', 2021, 'Noviembre', 'LIMA', 'Av. Nestor Gambeta, altura empresa Aji nomoto – Comisaría de Oquendo', 'Av. Nestor Gambeta, altura empresa Aji nomoto – Comisaría de Oquendo', null, '2021-11-23', 'Pierina Ugaz', 1, '- Ocupante tercero: Santiago Hector Ravines Valverde (38)

- Diagnóstico: Policontuso

- Atendido en Clínica Jesús del Norte

 

- Ocupante tercero: Danny Henrry Cusipuma Melgar (40)

- Diagnóstico: Policontuso

- Atendido en Clínica Jesús del Norte

 

- Ocupante tercero: Jesus Eddie Castilla Manrique (46)  

- Diagnóstico: Policontuso

- Atendido en Clínica Jesús del Norte

 

- Ocupante tercero: Carmen Vanessa de la Vesa Angulo (38)

- Diagnóstico: Policontuso

- Atendido en Clínica Jesús del Norte

 

- Ocupante tercero: Ronaldo Martin Aquiño Facio (26)

- Diagnóstico: Policontuso

- Atendido en Clínica Jesús del Norte

 

- Ocupante tercero: Luber Torres Flores (52)

- Diagnóstico: Policontuso

- Atendido en Clínica Jesús del Norte

 

- Ocupante tercero: Luis Miguel Nuñez Alburqueque (52)

- Diagnóstico: Policontuso

- Atendido en Clínica Jesús del Norte', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('15022194', 2021, 'Diciembre', 'LIMA', 'Av. Miguel Iglesias con Av. Billinghurst – Comisaría San Juan de Miraflores', 'Av. Miguel Iglesias con Av. Billinghurst – Comisaría San Juan de Miraflores', null, '2021-12-07', 'Pierina Ugaz', 1, '- Ocupante tercera: Jenny Karina Hernández Solís

- Diagnóstico: Contusión de tobillo y rodilla

- Atendido en Hospital María Auxiliadora', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('15041432', 2021, 'Diciembre', 'LIMA', 'Av. Juan Velasco Alvarado con Av. Cesar Canevaro – Comisaría de Villa el Salvador', 'Av. Juan Velasco Alvarado con Av. Cesar Canevaro – Comisaría de Villa el Salvador', null, '2021-12-16', 'Pierina Ugaz', 1, '- Conductor tercero:

- Diagnóstico: Policontuso

- Atendido en Clínica Santa Martha', 'Policontuso', 1725, 'Leve', 500, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('15075215', 2022, 'Enero', 'LIMA', 'BELLAVISTA', 'Ciudad del Pescador', '2022-01-07', '2022-01-07', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 15000, '2026-04-23', 1567, 'Transigido', 'CERRADO', 'RVC'),
('15078938', 2022, 'Enero', 'LIMA', 'Santa Felicia', null, '2022-01-10', '2022-01-10', 'JD', 2, 'Policontusa / Latigazo Cervical (terapia en ambos casos)', 'Policontuso', 3450, 'Grave', 14711, -4711, '2022-06-02', 143, 'Transigido', 'CERRADO', 'Abeo'),
('15085174', 2022, 'Enero', 'LIMA', 'San Isidro', null, '2022-01-13', '2022-01-13', 'OU', 1, 'Fractura Clavicula, Politraumatismo', 'Politraumatizado', 4000, 'Leve', 5400, 14600, '2022-11-28', 319, 'Transigido', 'CERRADO', 'Abeo'),
('15085834', 2022, 'Enero', 'LIMA', 'SANTIAGO DE SURCO', 'Sagitario', '2022-01-13', '2022-01-13', 'Mario Pilares', 5, 'Grave', 'Politraumatizado', 20000, 'Grave', 23268, 5721, '2022-05-02', 109, 'Transigido', 'CERRADO', 'RVC'),
('15089442', 2022, 'Enero', 'LIMA', 'San Borja', null, '2022-01-16', '2022-01-16', 'DS', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-01-17', 1, 'Rechazado', 'CERRADO', 'Abeo'),
('15102057', 2022, 'Enero', 'LIMA', 'CALLAO', 'Ciudadela Chalaca', '2022-01-22', '2022-01-22', 'Pierina Ugaz', 1, 'Muerte', 'Fallecido', 65000, 'Grave', null, 45000, '2022-12-07', 319, 'Judicializado', 'CERRADO', 'RVC'),
('15103090', 2022, 'Enero', 'LIMA', 'Orrantia', null, '2022-01-24', '2022-01-24', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('15119628', 2022, 'Febrero', 'LIMA', 'Monterrico', null, '2022-02-06', '2022-02-06', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-02-22', 16, 'Rechazado', 'CERRADO', 'Abeo'),
('15138591', 2022, 'Febrero', 'LIMA', 'Miraflores', null, '2022-02-15', '2022-02-15', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('1000904367', 2022, 'Diciembre', 'LIMA', 'CALLAO', 'Oquendo', '2022-12-14', '2022-12-14', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2025-05-25', 893, 'Transigido', 'CERRADO', 'RVC'),
('15145321', 2022, 'Febrero', 'LIMA', 'INDEPENDENCIA', 'Independencia', '2022-02-20', '2022-02-20', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 12500, 4280, '2022-11-30', 283, 'Transigido', 'CERRADO', 'RVC'),
('15149378', 2022, 'Febrero', 'LIMA', 'CALLAO', 'Ciudadela Chalaca', '2022-02-23', '2022-02-23', 'Mario Pilares', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 20000, '2022-02-23', 0, 'Transigido', 'CERRADO', 'RVC'),
('15152691', 2022, 'Febrero', 'LIMA', 'Barranco', null, '2022-02-24', '2022-02-24', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('15153131', 2022, 'Febrero', 'LIMA', 'SJL', 'Santa Elizbeth', '2022-02-25', '2022-02-25', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('1000903385', 2022, 'Diciembre', 'LIMA', 'COMAS', 'la Pascana', '2022-12-12', '2022-12-12', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 2956, '2025-05-25', 895, 'Archivado', 'CERRADO', 'RVC'),
('15155536', 2022, 'Marzo', 'LIMA', 'VMT', 'Nueva Esperanza', '2022-03-01', '2022-03-01', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 4000, 26000, '2022-03-02', 1, 'Transigido', 'CERRADO', 'RVC'),
('15159250', 2022, 'Marzo', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-03-06', '2022-03-06', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 59, 9941, '2022-03-02', -4, 'Transigido', 'CERRADO', 'RVC'),
('1000896379', 2022, 'Noviembre', 'LIMA', 'LURIGANCHO', 'Huachipa', '2022-11-23', '2022-11-23', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 3960, 2120, '2025-05-25', 914, 'Archivado', 'CERRADO', 'RVC'),
('15170095', 2022, 'Marzo', 'LIMA', 'San Luis', null, '2022-03-15', '2022-03-15', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('15175892', 2022, 'Marzo', 'LIMA', 'Santa Felicia', null, '2022-03-21', '2022-03-21', 'OU', 1, 'Esguince y Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('15182495', 2022, 'Marzo', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2022-03-31', '2022-03-31', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 113978.91, -89078.91, '2023-03-13', 347, 'Transigido', 'CERRADO', 'RVC'),
('15184675', 2022, 'Abril', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-04-01', '2022-04-01', 'Pierina Ugaz', 4, 'Leve', 'Policontuso', 6900, 'Grave', 0, 100000, '2022-08-25', 146, 'Transigido', 'CERRADO', 'RVC'),
('15191228', 2022, 'Abril', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2022-04-06', '2022-04-06', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 25000, '2023-08-15', 496, 'Transigido', 'CERRADO', 'RVC'),
('15192773', 2022, 'Abril', 'LIMA', 'SJM', 'San Juan de Miraflores', '2022-04-07', '2022-04-07', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-06-08', 62, 'Transigido', 'CERRADO', 'RVC'),
('15193208', 2022, 'Abril', 'LIMA', 'VES', 'Urbanización Pachacamac', '2022-04-08', '2022-04-08', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2026-04-24', 1477, 'Transigido', 'CERRADO', 'RVC'),
('15194525', 2022, 'Abril', 'LIMA', 'PTE. PIEDRA', 'Puente Piedra', '2022-04-10', '2022-04-10', 'Mario Pilares', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 25000, '2022-07-23', 104, 'Transigido', 'CERRADO', 'RVC'),
('15204757', 2022, 'Abril', 'LIMA', 'LURIN', 'Lurin', '2022-04-19', '2022-04-19', 'Javier Castañeda', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 40000, '2023-05-03', 379, 'Transigido', 'CERRADO', 'RVC'),
('15205992', 2022, 'Abril', 'LIMA', 'Chacarrilla', null, '2022-04-20', '2022-04-20', 'GC', 1, 'Politraumatizado con laceraciones en el brazo', 'Politraumatizado', 4000, 'Leve', 6000, -1000, '2022-05-13', 23, 'Transigido', 'CERRADO', 'Abeo'),
('15215582', 2022, 'Abril', 'LIMA', 'San Isidro', null, '2022-04-28', '2022-04-28', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2022-06-28', 61, 'Transigido', 'CERRADO', 'Abeo'),
('15239542', 2022, 'Mayo', 'LIMA', 'VMT', 'Villa María del Triunfo', '2022-05-13', '2022-05-13', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, null, null, 'Transigido', 'CERRADO', 'RVC'),
('15247964', 2022, 'Mayo', 'LIMA', 'San Borja', null, '2022-05-18', '2022-05-18', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 5000, 0, '2022-06-21', 34, 'Transigido', 'CERRADO', 'Abeo'),
('15257188', 2022, 'Mayo', 'LIMA', 'Chacarrilla', null, '2022-05-23', '2022-05-23', 'DS', 2, 'Fractura Pierna y Policontusa', 'Fractura Pierna', 34500, 'Grave', 68000, -18000, '2022-08-18', 87, 'Transigido', 'CERRADO', 'Abeo'),
('15263485', 2022, 'Mayo', 'LIMA', 'LURIGANCHO', 'Huachipa', '2022-05-28', '2022-05-28', 'Richard Rodriguez', 1, 'Leve', 'Policontuso', 1725, 'Grave', 8500, 908, '2022-06-14', 17, 'Transigido', 'CERRADO', 'RVC'),
('15272110', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-06', '2022-06-06', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2022-06-06', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15274117', 2022, 'Junio', 'LIMA', 'LIMA', 'Mirones Bajo', '2022-06-08', '2022-06-08', 'Richard Rodriguez', 2, 'Leve', 'Policontuso', 3450, 'Leve', 250, 14750, '2022-06-08', 0, 'Transigido', 'CERRADO', 'RVC'),
('15274555', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-08', '2022-06-08', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('15286341', 2022, 'Junio', 'LIMA', 'BREÑA', 'Chacra Colorada', '2022-06-15', '2022-06-15', 'Javier Castañeda', 2, 'Leve', 'Policontuso', 3450, 'Leve', null, 20000, '2026-04-24', 1409, 'Transigido', 'CERRADO', 'RVC'),
('15289748', 2022, 'Junio', 'LIMA', 'San Isidro', null, '2022-06-17', '2022-06-17', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('15291535', 2022, 'Junio', 'LIMA', 'SJM', 'San Juan de Miraflores', '2022-06-17', '2022-06-17', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-07-16', 29, 'Transigido', 'CERRADO', 'RVC'),
('15299326', 2022, 'Junio', 'LIMA', 'SANTA ANITA', 'Santa Anita', '2022-06-20', '2022-06-20', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 11340, '2023-07-05', 380, 'Transigido', 'CERRADO', 'RVC'),
('15302872', 2022, 'Junio', 'LIMA', 'Chacarrilla', null, '2022-06-22', '2022-06-22', 'DS', 1, 'Esguince en Tobillo', 'Esguince', 2300, 'Grave', 7700, -2700, '2022-08-23', 62, 'Transigido', 'CERRADO', 'Abeo'),
('15309453', 2022, 'Junio', 'LIMA', 'SMP', 'San Martin de Porres', '2022-06-24', '2022-06-24', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-08-09', 46, 'Transigido', 'CERRADO', 'RVC'),
('15327967', 2022, 'Julio', 'LIMA', 'Chacarrilla', null, '2022-07-04', '2022-07-04', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('15328787', 2022, 'Julio', 'LIMA', 'San Borja', null, '2022-07-05', '2022-07-05', 'GC', 1, 'Fractura de Clavícula', 'Fractura de clavícula', 23000, 'Grave', 0, 10000, '2022-10-24', 111, 'Transigido', 'CERRADO', 'Abeo'),
('15330324', 2022, 'Julio', 'LIMA', 'CALLAO', 'Ramon Castilla', '2022-07-06', '2022-07-06', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2023-01-09', 187, 'Transigido', 'CERRADO', 'RVC'),
('15333136', 2022, 'Julio', 'LIMA', 'Ate Vitarte', null, '2022-07-07', '2022-07-07', 'GC', 1, null, 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Daño Material', 'CERRADO', 'Abeo'),
('15339264', 2022, 'Julio', 'LIMA', 'Monterrico', null, '2022-07-11', '2022-07-11', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1200, 300, '2022-07-14', 3, 'Transigido', 'CERRADO', 'Abeo'),
('15342092', 2022, 'Julio', 'LIMA', 'Miraflores', null, '2022-07-12', '2022-07-12', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, '2022-07-10', -2, 'Transigido', 'CERRADO', 'Abeo'),
('15343137', 2022, 'Julio', 'LIMA', 'LIMA', 'Mirones Bajo', '2022-07-13', '2022-07-13', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Grave', 20000, -2800, '2022-12-13', 153, 'Transigido', 'CERRADO', 'RVC'),
('15350403', 2022, 'Julio', 'LIMA', 'Chacarrilla', null, '2022-07-18', '2022-07-18', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, '2022-07-18', 0, 'Transigido', 'CERRADO', 'Abeo'),
('1001426655', 2026, 'Marzo', 'LIMA', 'Mala', 'Mala', '2026-03-22', '2026-03-22', 'OU', 1, 'Sara Pascuala Galindo Huerta (Fractura cabeza de húmero hombro)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('15362923', 2022, 'Julio', 'LIMA', 'SANTA ANITA', 'Santa Anita', '2022-07-22', '2022-07-22', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 15000, '2022-09-28', 68, 'Transigido', 'CERRADO', 'RVC'),
('15366825', 2024, 'Enero', 'HUARMEY', 'HUARMEY', null, '2024-01-26', '2022-07-25', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('15380625', 2022, 'Agosto', 'LIMA', 'San Isidro', null, '2022-08-01', '2022-08-01', 'JD', 1, 'Fractura de Dedo de Pie Izquierdo / Corte Profundo en Cabeza / Politraumatizado', 'Politraumatizado', 4000, 'Grave', 6500, -1500, '2023-09-21', 416, 'En Negociación', 'ABIERTO', 'Abeo'),
('15389312', 2022, 'Agosto', 'LIMA', 'Miraflores', null, '2022-08-06', '2022-08-06', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 3000, 2000, '2022-08-07', 1, 'Transigido', 'CERRADO', 'Abeo'),
('15394544', 2022, 'Agosto', 'LIMA', 'Santa Felicia', null, '2022-08-09', '2022-08-09', 'GC', 1, 'Politraumatizado -Esguinces y torcedura de codo', 'Politraumatizado', 4000, 'Leve', 900, 4100, '2022-08-10', 1, 'Transigido', 'CERRADO', 'Abeo'),
('15415340', 2021, 'Diciembre', 'LIMA', 'Av. Pedro Miota Cdra. 8 con Jr. Huancabamba – Comisaría San Juan de Miraflores', 'Av. Pedro Miota Cdra. 8 con Jr. Huancabamba – Comisaría San Juan de Miraflores', null, '2021-12-18', 'Mario Pilares', 1, '- Conductor tercero: Rafael Humberto Ureta Cruz (28)

- Diagnóstico: Posible fractura pie izquierdo. Internado

- Atendido en Hospital María Auxiliadora VMT', 'Policontuso', 1725, 'Leve', null, null, '2026-04-24', null, 'Transigido', 'CERRADO', 'RVC'),
('15416933', 2022, 'Agosto', 'LIMA', 'LURIGANCHO', 'Huachipa', '2022-08-20', '2022-08-20', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Grave', 19103, 1566, '2023-04-04', 227, 'Transigido', 'CERRADO', 'RVC'),
('1000888859', 2022, 'Noviembre', 'LIMA', 'RIMAC', 'Piedra Liza', '2022-11-03', '2022-11-03', 'Pierina Ugaz', 4, 'Leve', 'Policontuso', 6900, 'Grave', null, 100000, '2025-05-25', 934, 'Archivado', 'CERRADO', 'RVC'),
('15426133', 2022, 'Agosto', 'LIMA', '-', 'No se pone D.P.', '2022-08-25', '2022-08-25', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 1500, 2433.2, '2022-10-20', 56, 'Transigido', 'CERRADO', 'RVC'),
('15433137', 2022, 'Septiembre', 'LIMA', 'INDEPENDENCIA', 'Independencia', '2022-09-01', '2022-09-01', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', null, 19370, null, null, 'Otros', 'ABIERTO', 'RVC'),
('1000888588', 2022, 'Noviembre', 'LIMA', 'ATE', 'Ate Vitarte', '2022-11-02', '2022-11-02', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 12268, '2024-11-14', 743, 'Judicializado', 'CERRADO', 'RVC'),
('15451860', 2022, 'Septiembre', 'LIMA', 'CHORRILLOS', 'Mateo Pumacahua', '2022-09-12', '2022-09-12', 'Pierina Ugaz', 1, 'Muerte', 'Fallecido', 65000, 'Grave', 0, 10000, '2023-01-09', 119, 'Transigido', 'CERRADO', 'RVC'),
('15463344', 2022, 'Septiembre', 'LIMA', 'Jesus Maria', null, '2022-09-17', '2022-09-17', 'GC', 1, 'Esguince de hombro y corte en la pierna', 'Esguince', 2300, 'Leve', 2200, 800, '2022-09-17', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15469277', 2022, 'Septiembre', 'LIMA', 'San Miguel', null, '2022-09-21', '2022-09-21', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('15471164', 2022, 'Septiembre', 'LIMA', 'San Miguel', null, '2022-09-22', '2022-09-22', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2022-09-23', 1, 'Archivado', 'CERRADO', 'Abeo'),
('15484932', 2022, 'Septiembre', 'LIMA', 'SJL', 'La Huayrona', '2022-09-30', '2022-09-30', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2022-09-30', 0, 'Transigido', 'CERRADO', 'RVC'),
('15489949', 2022, 'Octubre', 'LIMA', 'San Luis', null, '2022-10-04', '2022-10-04', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 700, 4300, '2022-10-05', 1, 'Transigido', 'CERRADO', 'Abeo'),
('15490160', 2022, 'Octubre', 'LIMA', 'San Borja', null, '2022-10-04', '2022-10-04', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('15503908', 2022, 'Octubre', 'LIMA', 'ANCON', 'Ancon', '2022-10-08', '2022-10-08', 'Pierina Ugaz', 2, 'Leve', 'Policontuso', 3450, 'Leve', 0, 20000, '2022-12-25', 78, 'Transigido', 'CERRADO', 'RVC'),
('15526806', 2022, 'Octubre', 'LIMA', 'Miraflores', null, '2022-10-24', '2022-10-24', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('15527720', 2022, 'Octubre', 'LIMA', 'SMP', 'Condevilla', '2022-10-24', '2022-10-24', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 5000, 5378, '2023-01-24', 92, 'Transigido', 'CERRADO', 'RVC'),
('15531744', 2022, 'Octubre', 'LIMA', 'San Miguel', null, '2022-10-25', '2022-10-25', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 700, 2300, '2022-11-04', 10, 'Transigido', 'CERRADO', 'Abeo'),
('15534846', 2022, 'Octubre', 'LIMA', 'San Antonio', null, '2022-10-27', '2022-10-27', 'DS', 1, 'Esguince de Rodilla', 'Esguince', 2300, 'Grave', 7000, -2000, '2022-11-30', 34, 'Transigido', 'CERRADO', 'Abeo'),
('1553957', 2022, 'Octubre', 'LIMA', 'Lince', null, '2022-10-28', '2022-10-28', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 1500, 3500, '2022-11-01', 4, 'Transigido', 'CERRADO', 'Abeo'),
('1000854250', 2022, 'Agosto', 'LIMA', 'LA VICTORIA', '.La Victoria', '2022-08-06', '2022-08-06', 'Javier Castañeda', 2, 'Leve', 'Policontuso', 3450, 'Leve', null, 25000, '2025-05-25', 1023, 'Transigido', 'CERRADO', 'RVC'),
('15545837', 2022, 'Noviembre', 'LIMA', 'INGUNZA', 'Ingunza', '2022-11-06', '2022-11-06', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Grave', 6080, 4598, '2023-06-07', 213, 'Transigido', 'CERRADO', 'RVC'),
('15545977', 2024, 'Agosto', 'Lima', 'Ate', 'Salamanca', '2024-08-07', '2024-08-07', 'Elizabeth Monzon', 1, 'Policontuso, trauma facial izquierdo, heridas múltiples en manos y rodillas y cara.', 'Policontuso y corte', 2300, 'Grave', 7000, 13000, '2025-03-05', 210, 'Transigido', 'CERRADO', 'RVC'),
('15548792', 2022, 'Noviembre', 'LIMA', 'CALLAO', 'Oquendo', '2022-11-08', '2022-11-08', 'Pierina Ugaz', 1, 'Muerte', 'Fallecido', 65000, 'Grave', 20000, 20000, '2023-08-09', 274, 'Transigido', 'CERRADO', 'RVC'),
('15551968', 2022, 'Noviembre', 'LIMA', 'LOS OLIVOS', 'Sol de Oro', '2022-11-09', '2022-11-09', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 20000, '2022-12-29', 50, 'Transigido', 'CERRADO', 'RVC'),
('15556992', 2022, 'Noviembre', 'LIMA', 'CALLAO', 'La Legua', '2022-11-11', '2022-11-11', 'Pierina Ugaz', 1, '-', 'Policontuso', 1725, 'Leve', 0, 5000, '2022-11-11', 0, 'Transigido', 'CERRADO', 'RVC'),
('1000850558', 2022, 'Julio', 'LIMA', 'COMAS', 'Santa Luzmila', '2022-07-26', '2022-07-26', 'Pierina Ugaz', 11, 'Leve', 'Policontuso', 18975, 'Grave', null, 160000, '2025-05-25', 1034, 'Archivado', 'CERRADO', 'RVC'),
('15568278', 2022, 'Noviembre', 'LIMA', 'Chacarrilla', null, '2022-11-18', '2022-11-18', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('15582700', 2022, 'Noviembre', 'LIMA', 'SANTA ANITA', 'Santa Anita', '2022-11-25', '2022-11-25', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 500, 9500, '2022-11-28', 3, 'Transigido', 'CERRADO', 'RVC'),
('15584524', 2022, 'Noviembre', 'LIMA', 'Miraflores', null, '2022-11-25', '2022-11-25', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, 800, '2022-11-29', 4, 'Transigido', 'CERRADO', 'Abeo'),
('15585395', 2022, 'Noviembre', 'LIMA', 'ATE', 'Ate Vitarte', '2022-11-26', '2022-11-26', 'Javier Castañeda', 4, 'Leve', 'Policontuso', 6900, 'Grave', 7000, 1520, '2023-01-31', 66, 'Transigido', 'CERRADO', 'RVC'),
('15597576', 2022, 'Diciembre', 'LIMA', 'San Borja', null, '2022-12-04', '2022-12-04', 'OU', 1, 'Policontuso; sin embargo no pasa atención médica', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Otros', 'CERRADO', 'Abeo'),
('15597647', 2022, 'Diciembre', 'LIMA', 'Jesus María', null, '2022-12-04', '2022-12-04', 'OU', 1, 'Politraumatismo, Herida Cortante Pierna', 'Politraumatizado', 4000, 'Leve', 100, 4900, '2022-12-04', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15604906', 2022, 'Diciembre', 'LIMA', 'ATE', 'Ate Vitarte', '2022-12-07', '2022-12-07', 'Javier Castañeda', 1, 'Leve', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-12-08', 366, 'Transigido', 'CERRADO', 'RVC'),
('15612435', 2022, 'Diciembre', 'LIMA', 'San Isidro', null, '2022-12-14', '2022-12-14', 'JD', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', 2300, 2700, '2023-01-11', 28, 'Transigido', 'CERRADO', 'Abeo'),
('15618158', 2022, 'Diciembre', 'LIMA', 'La Planicie', null, '2022-12-17', '2022-12-17', 'DS', 1, 'Contusión en el tobillo', 'Policontuso', 1725, 'Leve', 800, 700, '2022-12-17', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15633523', 2022, 'Diciembre', 'LIMA', 'VENTANILLA', 'Ventanilla', '2022-12-27', '2022-12-27', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Grave', 21640, 6780, '2023-07-08', 193, 'Transigido', 'CERRADO', 'RVC'),
('15636925', 2022, 'Diciembre', 'LIMA', 'LURIGANCHO', 'Huachipa', '2022-12-28', '2022-12-28', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', 2500, 4075, '2023-02-24', 58, 'Transigido', 'CERRADO', 'RVC'),
('15640857', 2022, 'Diciembre', 'LIMA', 'San Borja', null, '2022-12-31', '2022-12-31', 'OU', 1, 'Politraumatismo; sin embargo, no pasa atención médica', 'Politraumatizado', 4000, 'Leve', 0, 5000, null, null, 'Otros', 'CERRADO', 'Abeo'),
('15647083', 2023, 'Enero', 'LIMA', 'Maranga', null, '2023-01-04', '2023-01-04', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 2000, 3000, '2023-01-10', 6, 'Transigido', 'CERRADO', 'Abeo'),
('15653849', 2022, 'Enero', 'LIMA', 'SMP', 'San Martin de Porres', '2022-01-07', '2022-01-07', 'Javier Castañeda', 1, 'Politrauma, por descartar fractura en brazo izquierdo', 'Politraumatizado', 4000, 'Grave', 15000, 5200, '2023-04-15', 463, 'Transigido', 'CERRADO', 'RVC'),
('15684008', 2023, 'Enero', 'LIMA', 'BREÑA', 'Breña', '2023-01-25', '2023-01-25', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2420, 3820, '2023-06-14', 140, 'Transigido', 'CERRADO', 'RVC'),
('15685682', 2023, 'Enero', 'LIMA', 'Lince', null, '2023-01-25', '2023-01-25', 'DS', 10, 'Angela Maria Paz Barrientos (Fallecida) y 9 Personas Lesionadas', 'Policontuso', 17250, 'Grave', 360000, 60000, '2024-10-17', 631, 'En Negociación', 'CERRADO', 'Abeo'),
('1000846336', 2022, 'Julio', 'LIMA', 'CHACLACAYO', 'Chaclacayo', '2022-07-13', '2022-07-13', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2025-05-25', 1047, 'Archivado', 'CERRADO', 'RVC'),
('15690351', 2023, 'Enero', 'CALLAO', 'CALLAO', 'Ciudadela Chalaca', '2023-01-30', '2023-01-30', 'Mario Pilares', 1, 'Muerte inmediata', 'Fallecido', 65000, 'Grave', null, 100000, '2023-11-21', 295, 'Transigido', 'CERRADO', 'RVC'),
('15700651', 2023, 'Febrero', 'LIMA', 'CARABAYLLO', 'Progreso', null, '2023-02-06', 'Pierina Ugaz', 3, 'Policontuso/  Policontuso/ Herida cortante en pierna derecha', 'Policontuso y corte', 6900, 'Grave', 0, 22000, '2026-04-24', null, 'Transigido', 'CERRADO', 'RVC'),
('15712588', 2023, 'Febrero', 'CALLAO', 'CALLAO', 'Ramon castilla', '2023-02-13', '2023-02-13', 'Mario Pilares', 1, 'Traumatismos superficiales múltiples', 'Politraumatizado', 4000, 'Leve', 0, 10000, '2023-02-14', 1, 'Transigido', 'CERRADO', 'RVC'),
('15713996', 2023, 'Febrero', 'CALLAO', 'CALLAO', 'Ramón Castilla', '2023-02-14', '2023-02-14', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 2700, 4204, '2023-03-20', 34, 'Transigido', 'CERRADO', 'RVC'),
('15714383', 2023, 'Febrero', 'LIMA', 'LURIN', 'Lurin', '2023-02-14', '2023-02-14', 'Mario Pilares', 1, 'Muerte', 'Fallecido', 65000, 'Grave', 80000, 0, '2024-02-21', 372, 'Transigido', 'CERRADO', 'RVC'),
('15722227', 2023, 'Febrero', 'LIMA', 'PACHACAMAC', 'Pachacamac', '2023-02-18', '2023-02-18', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2026-04-24', 1161, 'Transigido', 'CERRADO', 'RVC'),
('15725024', 2023, 'Febrero', 'CALLAO', 'CALLAO', 'Ramon Castilla', '2023-02-20', '2023-02-20', 'Pierina Ugaz', 1, 'Amputacion de los dedos del pie izquierdo', 'Policontuso', 1725, 'Leve', 0, 37460, '2024-09-17', 575, 'Transigido', 'CERRADO', 'RVC'),
('15725609', 2023, 'Febrero', 'CALLAO', 'CALLAO', 'Ramon Castilla', '2023-02-20', '2023-02-20', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-05-18', 87, 'Transigido', 'CERRADO', 'RVC'),
('15726780', 2023, 'Febrero', 'LIMA', 'VES', 'Villa el Salvador', '2023-02-21', '2023-02-21', 'Javier Castañeda', 3, 'Traumatismo de tórax, traumatismo de muñeca y rodilla izquierda/ Traumatismo de fémur, rodilla, pie izquierdo./ Traumatismo de cráneo, cadera, hombro izquierdo y columna cervical', 'Cervicalgia', 6900, 'Grave', 850, 1460, '2024-01-11', 324, 'Transigido', 'CERRADO', 'RVC'),
('15730280', 2023, 'Febrero', 'LIMA', 'RIMAC', 'Rimac', '2023-02-22', '2023-02-22', 'Mario Pilares', 1, 'Muerte inmediata', 'Fallecido', 65000, 'Grave', 45000, 55000, '2023-04-05', 42, 'Transigido', 'CERRADO', 'RVC'),
('15736823', 2023, 'Febrero', 'LIMA', 'SMP', 'Barboncitos', '2023-02-27', '2023-02-27', 'Pierina Ugaz', 2, 'Contusión leve en pierna izquierda/ Contusión leve en pierna izquierda', 'Policontuso', 3450, 'Leve', 2000, 3092, '2023-09-14', 199, 'Transigido', 'CERRADO', 'RVC'),
('15738216', 2023, 'Marzo', 'LIMA', 'SJM', 'San Juan de Miraflores', '2023-03-01', '2023-03-01', 'Pierina Ugaz', 2, 'Policontuso /  Policontuso', 'Policontuso', 3450, 'Grave', 12604, 4380, '2023-10-13', 226, 'Transigido', 'CERRADO', 'RVC'),
('15739473', 2023, 'Marzo', 'LIMA', 'Chacarilla', null, '2023-03-02', '2023-03-02', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('15744825', 2023, 'Marzo', 'LIMA', 'Monterrico', null, '2023-03-06', '2023-03-06', 'GC', 1, 'Policontuso y laceraciones', 'Laceraciones', 2300, 'Leve', 1248, 252, '2023-03-08', 2, 'Transigido', 'CERRADO', 'Abeo'),
('15744883', 2023, 'Marzo', 'LIMA', 'CHORRILLOS', 'Villa Chorrillos', '2023-03-06', '2023-03-06', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-03-17', 11, 'Transigido', 'CERRADO', 'RVC'),
('15764739', 2023, 'Marzo', 'LIMA', 'San Luis', null, '2023-03-17', '2023-03-17', 'OU', 1, 'Politraumatismo, Herida Cortante Profunda Pie Izquierdo', 'Politraumatizado', 4000, 'Leve', 1260, 3740, '2023-03-17', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15768067', 2023, 'Marzo', 'LIMA', 'LIMA', 'Alfonso Ugarte', '2023-03-20', '2023-03-20', 'Pierina Ugaz', 1, '- Lesiones: Por actualizar', 'Policontuso', 1725, 'Leve', 0, 10000, '2024-02-15', 332, 'Transigido', 'CERRADO', 'RVC'),
('1000829898', 2022, 'Julio', 'LIMA', 'CALLAO', 'Sarita Colonia', '2022-07-26', '2022-07-26', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 30000, '2025-05-25', 1034, 'Archivado', 'CERRADO', 'RVC'),
('15770840', 2023, 'Marzo', 'LIMA', 'Magdalena', null, '2023-03-18', '2023-03-18', 'JD', 1, 'Fractura de Pierna Derecha / Luxación de Cadera', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('15780655', 2023, 'Marzo', 'LIMA', 'CHORRILLOS', 'Chorrillos', '2023-03-24', '2023-03-24', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 8000, 0, '2023-08-16', 145, 'Transigido', 'CERRADO', 'RVC'),
('15803154', 2023, 'Abril', 'LIMA', 'SJM', 'Comisaría de San Juan de Miraflores', '2023-04-11', '2023-04-11', 'Pierina Ugaz', 1, 'Muerte inmediata', 'Fallecido', 65000, 'Grave', 18000, 62000, '2024-01-08', 272, 'Transigido', 'CERRADO', 'RVC'),
('15811317', 2023, 'Abril', 'LIMA', 'VES', 'Comisaría de Villa el Salvador', '2023-04-14', '2023-04-14', 'Pierina Ugaz', 1, 'Fractura de clavícula y cuatro costillas rotas', 'Fractura de clavícula', 23000, 'Grave', 35500, -5500, '2023-07-30', 107, 'Transigido', 'CERRADO', 'RVC'),
('15824302', 2023, 'Abril', 'LIMA', 'LIMA', 'Comisaría de Petit Thouars', '2023-04-20', '2023-04-20', 'Mario Pilares', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 20000, '2023-06-22', 63, 'Transigido', 'CERRADO', 'RVC'),
('15825215', 2023, 'Abril', 'LIMA', 'Surquillo', null, '2023-04-20', '2023-04-20', 'JD', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 1500, 0, '2023-06-05', 46, 'Transigido', 'CERRADO', 'Abeo'),
('15828093', 2023, 'Abril', 'LIMA', 'Mateo Pumacahua', null, '2023-04-22', '2023-04-22', 'OU', 1, 'Politraumatismo, Heridas Cortantes Rostro', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('15833721', 2023, 'Abril', 'LIMA', 'LA VICTORIA', 'Comisaría de La Victoria', '2023-04-23', '2023-04-23', 'Pierina Ugaz', 7, 'Policontuso / Policontuso /: Policontuso /: Policontuso / Herida cortante en el cuero cabelludo, policontuso /Traumatismo superficial de tórax /  Traumatismo múltiple no especificado', 'Politraumatizado', 28000, 'Grave', null, 50000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('15838459', 2023, 'Abril', 'LIMA', 'Villa el Salvador', null, '2023-04-27', '2023-04-27', 'OU', 1, 'Fractura Brazo, Politraumatismo', 'Politraumatizado', 4000, 'Grave', 10000, 10000, '2023-04-30', 3, 'Transigido', 'CERRADO', 'Abeo'),
('15839867', 2023, 'Abril', 'CALLAO', 'CALLAO', 'Comisaría de Dulanto', '2023-04-29', '2023-04-29', 'Mario Pilares', 1, 'Contusión de pie y tobillo derecho', 'Policontuso', 1725, 'Leve', 200, 4800, '2023-04-29', 0, 'Transigido', 'CERRADO', 'RVC'),
('15844291', 2023, 'Mayo', 'LIMA', 'SMP', 'Comisaría de Barboncitos', '2023-05-04', '2023-05-04', 'Pierina Ugaz', 6, 'Fractura expuesta miembro inferior izquierdo /  Posible luxación miembro superior derecho /Policontuso tórax, luxación por descartar miembro inferior izquierdo, miembro superior izquierdo / Policontuso miembro inferior derecho, luxación por descartar / : Policontuso miembro superior izquierdo luxación por descartar/ Policontuso tórax y zona lumbar de columna luxación a descartar', 'Fractura de columna', 120000, 'Grave', 60500, 89500, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('15847476', 2023, 'Mayo', 'LIMA', 'Chacarrilla', null, '2023-05-05', '2023-05-05', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 200, 2800, '2023-05-05', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15865456', 2023, 'Mayo', 'LIMA', 'ATE', 'Comisaría de Salamanca', '2023-05-13', '2023-05-13', 'Mario Pilares', 3, 'Contusión de tobillo, contusión en los dedos de la mano izquierda sin dañar las uñas /  Contractura muscular/  Policontuso', 'Policontuso', 5175, 'Grave', 8200, 2538, '2023-07-19', 67, 'Transigido', 'CERRADO', 'RVC'),
('15866178', 2023, 'Mayo', 'LIMA', 'Monterrico', null, '2023-05-14', '2023-05-14', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('15869746', 2023, 'Mayo', 'LIMA', 'Miraflores', null, '2023-05-16', '2023-05-16', 'GC', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 7000, -4000, '2023-05-24', 8, 'Transigido', 'CERRADO', 'Abeo'),
('15878037', 2023, 'Mayo', 'LIMA', 'Salamanca', null, '2023-05-21', '2023-05-21', 'OU', 2, 'Policontusos', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('15878038', 2023, 'Mayo', 'LIMA', 'Sagitario', null, '2023-05-21', '2023-05-21', 'GC', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('15881377', 2023, 'Mayo', 'CALLAO', 'CALLAO', 'Comisaría de Carmen de La Legua.', '2023-05-23', '2023-05-23', 'Mario Pilares', 1, 'Policontuso de hombro, brazo y rostro.', 'Policontuso', 1725, 'Leve', 0, 30000, '2024-10-10', 506, 'Transigido', 'CERRADO', 'RVC'),
('15882523', 2023, 'Mayo', 'LIMA', 'LURIGANCHO', 'Comisaría de Chosica', '2023-05-24', '2023-05-24', 'Mario Pilares', 1, 'Traumatismos especificados que afectan múltiples regiones del cuerpo de la cabeza parte no especificada', 'Politraumatizado', 4000, 'Leve', null, 10000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('15882968', 2023, 'Mayo', 'LIMA', 'Curva de Villa', null, '2023-05-29', '2023-05-29', 'GC', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 50000, 0, '2023-09-26', 120, 'Transigido', 'CERRADO', 'Abeo'),
('15886297', 2023, 'Mayo', 'LIMA', 'Pamplona I', null, '2023-05-25', '2023-05-25', 'GC', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 3330, -330, '2023-06-13', 19, 'Transigido', 'CERRADO', 'Abeo'),
('15893728', 2023, 'Junio', 'LIMA', 'Urbanización Pachacamac', null, '2023-06-02', '2023-06-02', 'GC', 2, 'Politraumatizados', 'Politraumatizado', 8000, 'Grave', 9781.97, 5218.03, '2023-06-27', 25, 'Transigido', 'CERRADO', 'Abeo'),
('15903503', 2023, 'Junio', 'LIMA', 'ATE', 'Comisaría de Santa Clara', '2023-06-07', '2023-06-07', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 10000, '2023-06-07', 0, 'Transigido', 'CERRADO', 'RVC'),
('15905392', 2023, 'Junio', 'LIMA', 'Surquillo', null, '2023-06-09', '2023-06-09', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 300, 1200, '2023-06-14', 5, 'Transigido', 'CERRADO', 'Abeo'),
('15908790', 2023, 'Junio', 'LIMA', 'San Isidro', null, '2023-06-10', '2023-06-10', 'JD', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('15910425', 2023, 'Junio', 'LIMA', 'San Borja', null, '2023-06-10', '2023-06-10', 'JD', 7, 'Policontusas', 'Policontuso', 12075, 'Grave', 7000, 3500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('15915206', 2023, 'Junio', 'LIMA', 'Monterrico', null, '2023-06-14', '2023-06-14', 'DS', 1, 'Fractura Arco Costal Izquierdo', 'Policontuso', 1725, 'Leve', 1500, 18500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('15916336', 2023, 'Junio', 'LIMA', 'LOS OLIVOS', 'Comisaría de Sol de Oro', '2023-06-14', '2023-06-14', 'Mario Pilares', 1, '- Conductor tercero: Dilson Bustamante Delgado (28)

- Diagnostico: Policontuso

- Atendido en Clínica Jesús del Norte', 'Policontuso', 1725, 'Leve', 5000, 5560, '2023-09-21', 99, 'Transigido', 'CERRADO', 'RVC'),
('15918799', 2023, 'Junio', 'LIMA', 'Monterrico', null, '2023-06-15', '2023-06-15', 'OU', 1, 'Politraumatismo, Trauma Pierna', 'Politraumatizado', 4000, 'Leve', 4000, 1000, '2023-06-15', 0, 'Transigido', 'CERRADO', 'Abeo'),
('15930976', 2023, 'Junio', 'LIMA', 'Magdalena', null, '2023-06-23', '2023-06-23', 'OU', 3, 'Policontusos', 'Policontuso', 5175, 'Leve', null, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('15938960', 2023, 'Junio', 'CALLAO', 'VENTANILLA', 'Comisaría de Ventanilla', '2023-06-28', '2023-06-28', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 3500, 1120, '2025-03-02', 613, 'Transigido', 'CERRADO', 'RVC'),
('15989835', 2023, 'Julio', 'LIMA', 'ZAPALLAL', 'Comisaría de Zapallal', '2023-07-27', '2023-07-27', 'Pierina Ugaz', 2, 'Policontuso / Policontuso', 'Policontuso', 3450, 'Leve', null, 15000, '2023-08-25', 29, 'Rechazado', 'CERRADO', 'RVC'),
('15992273', 2023, 'Agosto', 'LIMA', 'LOS OLIVOS', 'Comisaría Sol de Oro', '2023-08-01', '2023-08-01', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-03-06', 583, 'Transigido', 'CERRADO', 'RVC'),
('15993938', 2023, 'Agosto', 'LIMA', 'Magdalena', null, '2023-08-02', '2023-08-02', 'GC', 6, 'Tec Moderado / Policontuso / Politraumatizada / Policontuso / Fractura de brazo / Policontuso', 'TEC Moderado', 69000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('16014641', 2023, 'Agosto', 'LIMA', 'LIMA', 'Comisaría San Andrés.', '2023-08-14', '2023-08-14', 'Pierina Ugaz', 1, 'Golpes en él cuerpo y fractura en el dedo gordo del  pie derecho.', 'Policontuso', 1725, 'Leve', 4500, 2278, '2023-12-15', 123, 'Transigido', 'CERRADO', 'RVC'),
('16023218', 2023, 'Agosto', 'LIMA', 'SJL', 'Comisaria Zarate', '2023-08-18', '2023-08-18', 'Richard Rodriguez', 1, 'Policontuso, trauma abdominal cerrado y  traumatismo encéfalo craneal.', 'TEC Leve', 5750, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('16023514', 2023, 'Agosto', 'CALLAO', 'CARMEN DE LA LEGUA', 'CIA Carmen de la Legua', '2023-08-19', '2023-08-19', 'Mario Pilares', 1, 'Politraumatizado, fractura expuesta de tibia y peroné.', 'Fractura pierna expuesta', 23000, 'Grave', 50000, 0, '2024-05-29', 284, 'Transigido', 'CERRADO', 'RVC'),
('16024921', 2023, 'Agosto', 'LIMA', 'BELLAVISTA', 'Comisaría Ciudad del Pescador.', '2023-08-21', '2023-08-21', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', 2700, 12300, '2023-12-26', 127, 'Transigido', 'CERRADO', 'RVC'),
('16030509', 2023, 'Agosto', 'LIMA', 'San Isidro', null, '2023-08-24', '2023-08-24', 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2023-09-05', 12, 'Rechazado', 'CERRADO', 'Abeo'),
('16036704', 2023, 'Agosto', 'LIMA', 'SAN MIGUEL', 'Comisaría de UV3.', '2023-08-29', '2023-08-29', 'Pierina Ugaz', 1, 'Policontuso, descarte de esguince de tobillo derecho', 'Esguince', 2300, 'Grave', 12000, 2950, '2023-01-22', -219, 'Transigido', 'CERRADO', 'RVC'),
('16041540', 2023, 'Septiembre', 'LIMA', 'CALLAO', 'Ramon Castilla.', '2023-01-09', '2023-01-09', 'Mario Pilares', 2, 'Cervical, lumbago no especificado y dolor agudo./Contusión de la región lumbosacra y de la pelvis, contusión del hombro y del brazo.', 'Policontuso', 3450, 'Grave', 7800, 4229.66, '2024-01-17', 373, 'Transigido', 'CERRADO', 'RVC'),
('16043320', 2023, 'Septiembre', 'LIMA', 'Orrantia', null, '2023-09-05', '2023-09-05', 'OU', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 2000, '2023-09-19', 14, 'Transigido', 'CERRADO', 'Abeo'),
('16053317', 2023, 'Septiembre', 'LIMA', 'San Borja', null, '2023-09-07', '2023-09-07', 'JD', 1, 'Politraumatizada', 'Politraumatizado', 4000, 'Leve', 1300, 3700, '2023-09-15', 8, 'Transigido', 'CERRADO', 'Abeo'),
('16058651', 2023, 'Septiembre', 'LIMA', 'CALLAO', 'Sarita Colonia', '2023-11-09', '2023-11-09', 'Pierina Ugaz', 10, 'Policontuso. /  Policontuso./  Policontuso./ Policontuso./ Policontuso./ Policontuso./ Policontuso./ Policontuso./ Policontuso./ Policontuso.', 'Policontuso', 17250, 'Grave', null, 30000, '2023-09-21', -49, 'Transigido', 'CERRADO', 'RVC'),
('16059276', 2023, 'Septiembre', 'LIMA', 'CALLAO', 'Sarita Colonia', '2023-11-09', '2023-11-09', 'Pierina Ugaz', 10, 'Policontuso./ Policontuso./ Policontuso./Policontuso./Policontuso./Policontuso./ Policontuso./ Policontuso./ Policontuso./ Policontuso.', 'Policontuso', 17250, 'Grave', null, 30000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('16071271', 2023, 'Septiembre', 'LIMA', 'Monterrico', null, '2023-09-20', '2023-09-20', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('16075438', 2023, 'Septiembre', 'LIMA', 'CALLAO', 'Sin denuncia Policial', '2023-09-21', '2023-09-21', 'Pierina Ugaz', 1, 'No cuenta.', 'Policontuso', 1725, 'Leve', null, 10000, '2023-09-26', 5, 'Transigido', 'CERRADO', 'RVC'),
('16084012', 2023, 'Septiembre', 'LIMA', 'HUACHIPA', 'Huachipa.', '2023-09-28', '2023-09-28', 'Pierina Ugaz', 1, 'Luxación expuesta muñeca izquierda.', 'Torcedura', 3450, 'Grave', 12000, 2180, '2023-09-19', -9, 'Transigido', 'CERRADO', 'RVC'),
('16085553', 2023, 'Septiembre', 'LIMA', 'LIMA', 'Unidad Vecinal N°3.', '2023-09-29', '2023-09-29', 'Pierina Ugaz', 1, 'TEC. policontuso.', 'TEC Leve', 5750, 'Grave', 7000, 6105.68, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('16102286', 2023, 'Octubre', 'LIMA', 'Chacarilla', null, '2023-10-10', '2023-10-10', 'GC', 9, 'Policontusos', 'Policontuso', 15525, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('16103277', 2023, 'Octubre', 'LIMA', 'SAN MIGUEL', 'Maranga', '2023-10-10', '2023-10-10', 'Pierina Ugaz', 1, 'Contusión en la región lumbosacra y de la pelvis, descanso médico 8 días.', 'Policontuso', 1725, 'Leve', 1250, 2640, '2023-10-21', 11, 'Transigido', 'CERRADO', 'RVC'),
('16112800', 2023, 'Octubre', 'LIMA', 'San Antonio', null, '2023-10-14', '2023-10-14', 'GC', 1, 'Fractura de húmero', 'Policontuso', 1725, 'Leve', 2800, null, '2023-09-24', -20, 'Transigido', 'CERRADO', 'Abeo'),
('16114013', 2023, 'Octubre', 'LIMA', 'Magdalena', null, '2023-10-16', '2023-10-16', 'GC', 1, 'esguinces de tobillo, laceraciones en rodilla y esguince de mano', 'Esguince', 2300, 'Leve', null, null, '2023-10-27', 11, 'Transigido', 'CERRADO', 'Abeo'),
('16124823', 2023, 'Octubre', 'LIMA', 'Pamplona I', null, '2023-10-22', '2023-10-22', 'DS', 4, 'Fractura de tabique, 3 Policontusos)', 'Policontuso', 6900, 'Grave', 0, 10000, null, null, 'Otros', 'CERRADO', 'Abeo'),
('16124824', 2023, 'Octubre', 'CALLAO', 'CALLAO', 'Márquez.', '2023-10-22', '2023-10-22', 'Richard Rodriguez', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Transigido', 'CERRADO', 'RVC'),
('16124834', 2023, 'Octubre', 'CALLAO', 'CALLAO', 'Ventanilla.', '2023-10-22', '2023-10-22', 'Richard Rodriguez', 1, 'Muerte Inmediata.', 'Fallecido', 65000, 'Grave', 40000, 80000, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('16132878', 2023, 'Noviembre', 'LIMA', 'Punta Hermosa', null, '2023-11-01', '2023-11-01', 'GC', 3, 'Traumatismo Intercraneal, Traumatismo Inercraneal, Fractural de Tibia y Peroné y Politraumatizado', 'Politraumatizado', 12000, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('16134309', 2023, 'Noviembre', 'CALLAO', 'VENTANILLA', 'Villa Los Reyes.', '2023-03-11', '2023-03-11', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito, TEC, herida abierta por compresión a descartar fractura de pierna izquierda.', 'Fractura Pierna', 17250, 'Grave', 64250, 44720, '2024-10-28', 597, 'Transigido', 'CERRADO', 'RVC'),
('1000813128', 2022, 'Abril', 'LIMA', 'SAN LUIS', 'Yerbateros', '2022-04-03', '2022-04-03', 'Mario Pilares', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 12000, '2025-05-25', 1148, 'Archivado', 'CERRADO', 'RVC'),
('1000806161', 2022, 'Marzo', 'LIMA', 'SMP', 'San Martín de Porres', '2022-03-11', '2022-03-11', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 20000, '2025-05-25', 1171, 'Archivado', 'CERRADO', 'RVC'),
('16177080', 2023, 'Noviembre', 'LIMA', 'Chacarrilla', null, '2023-11-28', '2023-11-28', 'OU', 1, 'Fractura Metatarsiano, Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('16178483', 2023, 'Noviembre', 'LIMA', 'PUENTE PIEDRA', 'Puente Piedra.', '2023-11-30', '2023-11-30', 'Pierina Ugaz', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 5000, '2023-11-30', 0, 'Transigido', 'CERRADO', 'RVC'),
('16181780', 2023, 'Diciembre', 'LIMA', 'ATE', 'Salamanca', '2023-03-12', '2023-03-12', 'Richard Rodriguez', 1, 'Contusión en pierna derecha, queda en observación.', 'Policontuso', 1725, 'Leve', null, 15000, '2024-04-02', 387, 'Transigido', 'CERRADO', 'RVC'),
('1000804675', 2022, 'Marzo', 'LIMA', 'LA VICTORIA', 'La Victoria', '2022-03-07', '2022-03-07', 'Pierina Ugaz', 1, 'Leve', 'Policontuso', 1725, 'Leve', null, 10000, '2023-09-15', 557, 'Archivado', 'CERRADO', 'RVC'),
('16190896', 2023, 'Diciembre', 'LIMA', 'Miraflores', null, '2023-12-06', '2023-12-06', 'JD', 1, 'Fractura de Brazo Izquierdo / Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('16206701', 2023, 'Diciembre', 'LIMA', 'ATE', 'Salamanca.', '2023-12-17', '2023-12-17', 'Pierina Ugaz', 1, 'Refiere policontuso.', 'Policontuso', 1725, 'Leve', null, 15000, '2024-03-08', 82, 'Transigido', 'CERRADO', 'RVC'),
('16207000 / 159406', 2024, null, null, null, null, '2024-01-12', null, 'Emily', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 0, null, null, null, 'Rechazado', 'CERRADO', 'Chacon'),
('16210782', 2023, 'Diciembre', 'LIMA', 'Monterrico', null, '2023-12-19', '2023-12-19', 'OU', 1, 'Politraumatismo', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('16222969', 2023, 'Diciembre', 'LIMA', 'LIMA', 'Mirones Bajos.', '2023-12-27', '2023-12-27', 'Mario Pilares', 1, 'Policontuso.', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('16239846', 2024, 'Enero', 'Lima', 'Lima', 'Cotabambas', '2024-01-08', '2024-01-08', 'Mario Pilares', 1, 'Contusión del hombro y del brazo, contusión de la cadera', 'Policontuso', 1725, 'Leve', 2450, 3050, '2024-10-22', 288, 'Transigido', 'CERRADO', 'RVC'),
('16250720', 2024, 'Enero', 'CAMANA', 'LA PAMPA', null, '2024-01-13', '2024-01-12', 'RUTH HUAHUACONDORI', 9, 'Policontuso', 'Policontuso', 15525, 'Grave', null, null, '1970-01-01', -19735, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16257625', 2024, 'Enero', 'Lima', 'San Juan de Lurigancho', 'Santa Elizabeth', '2024-01-18', '2024-01-18', 'Mario Pilares', 1, 'Traumatismo encéfalo craneano, descartar traumatismo abdominal cerrado, herida con exposición de material óseo, descartar fractura del pie derecho', 'TEC Leve', 5750, 'Grave', 25000, 8870, '2024-07-09', 173, 'Transigido', 'CERRADO', 'RVC'),
('16262562', 2024, 'Enero', 'LIMA', 'Pueblo Libre', null, '2024-01-19', '2024-01-19', 'DS', 1, 'Maria Rosa Isable Navarro Sanchez (Policontusa)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('16264770', 2024, 'Enero', 'LIMA', 'Laderas de Villa', null, '2024-01-23', '2024-01-23', 'GC', 1, 'Alfredo Eduardo Portocarrero Tamara (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('16265796', 2024, 'Enero', 'LIMA', 'Laderas de 
Villa', null, '2024-01-24', '2024-01-24', 'GC', 1, 'Luis Antonio Cerva (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('16271099', 2024, 'Enero', 'LIMA', 'Huaylas', null, '2024-01-26', '2024-01-26', 'JD', 1, 'Daniel Alejandro Suarez Portilla (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('16271561', 2024, 'Enero', 'Lima', 'Ate', 'Salamanca.', '2024-01-26', '2024-01-26', 'Pierina Ugaz', 1, 'Presenta corte en la nariz.', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-03-22', 421, 'Transigido', 'CERRADO', 'RVC'),
('16271784', 2024, 'Enero', 'AREQUIPA', 'CERRO COLORADO', null, '2024-01-27', '2024-01-27', 'RUTH HUAHUACONDORI', 1, 'Policontuso y corte', 'Policontuso y corte', 2300, 'Leve', null, 2000, '1970-01-01', -19749, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16271814', 2024, 'Enero', 'LIMA', 'San Luis', null, '2024-01-27', '2024-01-27', 'OU', 1, 'Julio Cesar Rivadeneyra Guerrero (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 2500, 2500, '2024-01-29', 2, 'Transigido', 'CERRADO', 'Abeo'),
('16271855', 2024, 'Enero', 'Callao', 'Callao', 'Carmen de la Legua Reynoso.', '2024-01-28', '2024-01-28', 'Mario Pilares', 2, '- Policontuso 
- Policontuso', 'Policontuso', 3450, 'Leve', 1900, 18100, '2024-02-02', 5, 'Transigido', 'CERRADO', 'RVC'),
('16273785', 2024, 'Enero', 'AREQUIPA', 'CERCADO', null, '2024-01-31', '2024-01-31', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 930, '1970-01-01', -19753, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1001429567', 2026, 'Marzo', 'LIMA', 'Orrantia', 'Orrantia', '2026-03-24', '2026-03-24', 'JD', 1, 'Elizabeth Keiko Ramos López (Fractura de Rodilla)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('16287647', 2024, 'Febrero', 'Lima', 'La Victoria', 'Apolo', '2024-02-06', '2024-02-06', 'Pierina Ugaz', 1, 'Policontuso en cadera y rodilla.', 'Policontuso', 1725, 'Leve', 600, 730, '2024-08-16', 192, 'Transigido', 'CERRADO', 'RVC'),
('16288782', 2024, 'Febrero', 'MATARANI', 'ISLAY', null, '2024-02-07', '2024-02-07', 'RUTH HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, null, '1970-01-01', -19760, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16288864', 2024, 'Febrero', 'Lima', 'San Miguel', 'Maranga.', '2024-02-07', '2024-02-07', 'Pierina Ugaz', 1, 'Refiere lesiones visibles en el pie izquierdo y en la pierna derecha', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-02-15', 8, 'Transigido', 'CERRADO', 'RVC'),
('16292826', 2024, 'Febrero', 'Lima', 'SMP', 'SMP.', '2024-02-09', '2024-02-09', 'Richard Rodriguez', 2, '-1.-Policontuso en tobillo derecho 
 2.- Policontuso ,en pierna izquierda.
-', 'Policontuso', 3450, 'Leve', 0, 15000, '2025-03-21', 406, 'Transigido', 'CERRADO', 'RVC'),
('16297979', 2024, 'Febrero', 'LIMA', 'Urb. Pachacamac', null, '2024-02-13', '2024-02-13', 'OU', 1, 'Elmer Ramiro Lujan Vilchez (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('16300757', 2024, 'Febrero', 'MOYOBAMBA', 'JEPELACIO', null, '2024-02-15', '2024-02-13', 'JOEL HUAHUACONDORI', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', null, null, '1970-01-01', -19768, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16317245', 2024, 'Febrero', 'Callao', 'Callao', 'del Callao', '2024-02-25', '2024-02-25', 'Maritza Nizama', 1, 'Fractura costal en 2 costillas, fisura en 3 costillas.', 'Fractura de costillas', 10000, 'Grave', 3000, 17000, '2024-04-24', 59, 'Transigido', 'CERRADO', 'RVC'),
('16319768', 2024, 'Febrero', 'CARAVELI', 'LOMAS', null, '2024-02-28', '2024-02-28', 'RUTH HUAHUACONDORI', 2, 'Fallecido + Politraumatizado', 'Fallecido', 130000, 'Grave', null, null, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16319884', 2024, 'Febrero', 'Lima', 'Los Olivos', 'Sol de Oro', '2024-02-28', '2024-02-28', 'Pierina Ugaz', 1, 'Fractura sugestiva de muñeca izquierda y fractura deprimida del platillo tibial interno izquierdo,', 'Fractura de muñeca', 17250, 'Grave', 55642.05, -20642.05, '2025-02-04', 342, 'Transigido', 'CERRADO', 'RVC'),
('16320836', 2024, 'Marzo', 'Lima', 'Breña', 'Chacra Colorado', '2024-03-01', '2024-03-01', 'Pierina Ugaz', 2, '1.-Contusión de otras partes de la muñeca mano hombro brazo
  2.- Contusión de otras partes y las no especificadas de la pierna derecha,', 'Policontuso', 3450, 'Leve', 2500, 1123, '2024-04-10', 40, 'Transigido', 'CERRADO', 'RVC'),
('16327682', 2024, 'Marzo', 'LIMA', 'Villa El Salvador', null, '2024-03-06', '2024-03-06', 'DS', 1, 'Junior Ricardo Ascorbe Castro (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('16329413', 2024, 'Marzo', 'LIMA', 'San Borja', null, '2024-03-07', '2024-03-07', 'DS', 1, 'Juan Carlos CAncino Quiroz (Policontuso)', 'Policontuso', 1725, 'Leve', 900, 600, '2024-03-14', 7, 'Transigido', 'CERRADO', 'Abeo'),
('16336178', 2024, 'Marzo', 'LIMA', 'Lurin', null, '2024-03-12', '2024-03-12', 'OU', 1, 'Jeremy López Portocarrero (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 1800, 3200, '2024-03-12', 0, 'Transigido', 'CERRADO', 'Abeo'),
('16345691', 2024, 'Marzo', 'LIMA', 'Miraflores', null, '2024-03-14', '2024-03-14', 'DS', 1, 'Jose Luis Contreras Martinez', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19796, 'Daño Material', 'CERRADO', 'Abeo'),
('16350746', 2024, 'Marzo', 'TAMBOPATA', 'PUERTO MALDONADO', null, '2024-03-20', '2024-03-20', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 100, '1970-01-01', -19802, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16353270', 2024, 'Marzo', 'Callao', 'Callao', 'Ramon Castilla.', '2024-03-21', '2024-03-21', 'Pierina Ugaz', 1, '1. Policontuso', 'Policontuso', 1725, 'Grave', 28590, 1410, '2024-09-11', 174, 'Transigido', 'CERRADO', 'RVC'),
('16356398', 2024, 'Marzo', 'Lima', 'Huachipa', 'Huachipa', '2024-03-23', '2024-03-23', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 20000, '2026-04-24', 762, 'Transigido', 'CERRADO', 'RVC'),
('16358417', 2024, 'Marzo', 'Lima', 'Huachipa', 'Huachipa.', '2024-03-27', '2024-03-27', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito por descartar fractura de pierna derecha y descartar fractura de cadera, 
   -', 'Fractura de cadera', 12000, 'Grave', 0, 50000, '2024-10-07', 194, 'Transigido', 'CERRADO', 'RVC');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('16358642', 2024, 'Marzo', 'YAULI', 'LA OROYA', null, '2024-03-30', '2024-03-29', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16363894', 2024, 'Abril', 'LIMA', 'Laderas de Villa', null, '2024-04-03', '2024-04-03', 'JD', 1, 'Jhersson Aldo Utani Coello (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19816, 'Daño Material', 'CERRADO', 'Abeo'),
('16371981', 2024, 'Abril', 'Lima', 'El Agustino', 'San Pedro', '2024-04-06', '2024-04-06', 'Pierina Ugaz', 1, 'Shock hipovolémico, ira-insuficiencia respiratoria aguda, declarada fallecida a las 14:25 hrs.', 'Fallecido', 65000, 'Grave', 0, 80000, '2024-11-24', 232, 'Transigido', 'CERRADO', 'RVC'),
('16387023', 2024, 'Abril', 'Lima', 'Santa Anita.', 'Santa Anita.', '2024-04-17', '2024-04-17', 'Pierina Ugaz', 1, 'Politraumatizado,', 'Politraumatizado', 4000, 'Leve', 0, 12500, '2024-06-10', 54, 'Transigido', 'CERRADO', 'RVC'),
('16395450', 2024, 'Abril', 'MAYNAS', 'IQUITOS', null, '2024-04-23', '2024-04-23', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 1500, null, null, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16395566', 2024, 'Abril', 'LIMA', 'San Isidro', null, '2024-04-23', '2024-04-23', 'GC', 4, 'Lady Geraldine Arenas Huaman, Omar Jin Castro Valdeos, José Carlos Untiveros Encarnación, Carmen Sosa Ramirez-Palomino (Policontusos)', 'Policontuso', 6900, 'Grave', 0, null, '2024-05-30', 37, 'Archivado', 'CERRADO', 'Abeo'),
('16404513', 2024, 'Abril', 'Lima', 'Independencia', 'Santa Clara', '2024-04-28', '2024-04-28', 'Maritza Nizama', 1, 'Policontuso, mano derecha por accidente de tránsito', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-12-28', 244, 'Transigido', 'CERRADO', 'RVC'),
('16404516', 2024, null, null, null, null, '2024-04-28', null, 'Emily', 3, 'Politraumatizado', 'Politraumatizado', 12000, 'Grave', 18000, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('16406080', 2024, 'Julio', 'Lima', 'Los Olivos', 'De Pro', '2024-04-30', '2024-04-30', 'Maritza Nizama', 1, 'Heridas Múltiples en la Cabeza', 'Policontuso', 1725, 'Leve', 0, 20000, '2024-06-01', 32, 'Transigido', 'CERRADO', 'RVC'),
('16406757', 2024, 'Mayo', 'LIMA', 'San Juan de Miraflores', null, '2024-05-02', '2024-05-02', 'OU', 1, 'Betty Lorena Marrufo Anyosa - Contusión Abdominal (Gestante)', 'Policontuso', 1725, 'Leve', 5212.12, -212.12, '1970-01-01', -19845, 'Transigido', 'CERRADO', 'Abeo'),
('16406792', 2024, 'Mayo', 'Callao', 'Callao', 'Márquez.', '2024-05-02', '2024-05-02', 'Pierina Ugaz', 3, '1.  Traumatismo Encéfalo craneano Politraumatizado, fractura de muñeca, 
2.-  Esguinces y torceduras de otras partes y de las no especificadas 
   -3. Gestante de 37 semanas, se le realizara cesaría de emergencia y luego operación de cadera.', 'Fractura de cadera', 36000, 'Grave', 35750, 41893, '2024-09-05', 126, 'Transigido', 'CERRADO', 'RVC'),
('16410266 / 203231', 2024, null, null, null, null, null, null, 'Emily', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 474.7, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('16416350', 2024, 'Mayo', 'LIMA', 'Miraflores', null, '2024-05-08', '2024-05-08', 'OU', 1, 'Jose Luis Obispo Cubas (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('16424455', 2024, 'Mayo', 'LIMA', 'Pueblo Libre', null, '2024-05-13', '2024-05-13', 'OU', 1, 'Lia Daniela Agurto Coronado (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 2000, 3000, '1970-01-01', -19856, 'Transigido', 'CERRADO', 'Abeo'),
('16425413', 2024, 'Mayo', 'LIMA', 'Miraflores', null, '2024-05-14', '2024-05-14', 'GC', 1, 'Augusto Jose Bernardo Tenorio Cevallos (Fractura de mano izquierda)', 'Policontuso', 1725, 'Leve', 0, 0, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('16427692', 2024, 'Mayo', 'HUANCAYO', 'SAN AGUSTIN DE CAJAS', null, '2024-05-16', '2024-05-16', 'JOEL HUAHUACONDORI', 2, 'Fallecido + Policontuso', 'Fallecido', 130000, 'Grave', null, null, null, null, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16430937', 2024, 'Mayo', 'SAN MARTIN', 'TARAPOTO', null, '2024-05-18', '2024-05-14', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19861, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('1000796217', 2022, 'Febrero', 'LIMA', 'SAN LUIS', 'San Luis', '2022-02-08', '2022-02-08', 'Pierina Ugaz', 1, 'Grave', 'Politraumatizado', 4000, 'Leve', 0, 22990, '2022-10-10', 244, 'Judicializado', 'CERRADO', 'RVC'),
('16445777', 2024, 'Mayo', 'LIMA', 'San Isidro', null, '2024-05-27', '2024-05-27', 'JD', 1, 'Nicolás Eugenio Moreno Zanelli (Esguince Pie Derecho / Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('16446097', 2024, 'Mayo', 'Lima', 'Lima', 'Monserrate', '2024-05-27', '2024-05-27', 'Maritza Nizama', 1, 'Herida por atrición segundo dedo de mano izquierda, quedando en observación.', 'Policontuso', 1725, 'Leve', null, 25000, '1970-01-01', -19870, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('16447647', 2024, 'Mayo', 'Lima', 'SMP', 'Condevilla Señor', '2024-05-28', '2024-05-28', 'Pierina Ugaz', 2, '1.  Traumatismo superficial múltiple.
2.  Policontuso.', 'Politraumatizado', 8000, 'Grave', 3200, 1616, '2025-03-12', 288, 'Transigido', 'CERRADO', 'RVC'),
('16448076', 2024, 'Mayo', 'LIMA', 'San Bartolo', null, '2024-05-28', '2024-05-28', 'GC', 1, 'Alfredo Huamán Millan (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, 5000, '1970-01-01', -19871, 'Archivado', 'CERRADO', 'Abeo'),
('16449126', 2024, 'Mayo', 'Callao', 'Oquendo', 'Oquendo', '2024-05-28', '2024-05-28', 'Maritza Nizama', 3, '1.-Policontuso, por actualizar.

2. Policontuso, por actualizar.
3.  Policontuso, por actualizar.', 'Policontuso', 5175, 'Leve', 400, 6192, '2024-11-21', 177, 'Transigido', 'CERRADO', 'RVC'),
('16449227', 2024, 'Mayo', 'Lima', 'Los olivos', 'Santa Luzmila.', '2024-05-29', '2024-05-29', 'Pierina Ugaz', 1, '1.  Traumatismo superficial múltiple, quedando en observación.', 'Politraumatizado', 4000, 'Grave', 8000, 7182, '2024-09-06', 100, 'Transigido', 'CERRADO', 'RVC'),
('16450317', 2024, 'Mayo', 'CHANCHAMAYO', 'PICHANAKI', null, '2024-05-29', '2024-05-29', 'JOEL HUAHUACONDORI', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, 1800, '1970-01-01', -19872, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16453634', 2024, 'Mayo', 'PUNO', 'CHUCUITO', null, '2024-05-30', '2024-05-30', 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, 33000, '1970-01-01', -19873, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16454599', 2024, 'Mayo', 'Lima', 'Agustino', 'Santoyo.', '2024-05-30', '2024-05-30', 'Mario Pilares', 1, '1. Atricción severo de miembro inferior derecho, politraumatizado, estado crítico.', 'Politraumatizado', 4000, 'Grave', 20000, 34730, '2024-09-24', 117, 'Transigido', 'CERRADO', 'RVC'),
('16455272', 2024, 'Junio', 'LIMA', 'Chacarrilla', null, '2024-06-01', '2024-06-01', 'DS', 1, 'Omar Santiago Fuentes Ledesma (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-06-01', 0, 'Transigido', 'CERRADO', 'Abeo'),
('16455304', 2024, 'Junio', 'SANTIAGO', 'SANTIAGO', null, '2024-06-01', '2024-06-01', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19875, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16455329', 2024, 'Julio', 'Lima', 'SMP', 'Sol de oro', '2024-07-02', '2024-07-02', 'Pierina Ugaz', 1, '1. Traumatismo Superficial múltiple del abdomen y región Lumbosacra.', 'Politraumatizado', 4000, 'Leve', 5455, 3433, '2024-09-05', 65, 'Transigido', 'CERRADO', 'RVC'),
('16455331', 2024, 'Junio', 'LIMA', 'Surquillo', null, '2024-06-02', '2024-06-02', 'DS', 1, 'Mikael Carnero Estrada (Policontuso)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19876, 'Transigido', 'CERRADO', 'Abeo'),
('16463722', 2024, 'Junio', 'LIMA', 'Villa el Salvador', null, '2024-06-10', '2024-06-10', 'JD', 1, 'Marcos Pardave Curo (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('16465105', 2024, 'Junio', 'AREQUIPA', 'YURA', null, '2024-10-10', '2024-06-10', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 3400, '1970-01-01', -20006, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16465241', 2024, 'Junio', 'HUANCAYO', 'SAN JERONIMO DE TUNAN', null, '2024-06-01', '2024-05-30', 'JOEL HUAHUACONDORI', 1, 'Policontuso y corte', 'Policontuso y corte', 2300, 'Leve', null, null, '1970-01-01', -19875, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16473169', 2024, 'Junio', 'Lima', 'Pisco', 'Pisco', '2024-06-15', '2024-06-15', 'Eleazar Soldevilla', 1, 'Policontuso con descarte de fractura de cadera', 'Fractura de cadera', 12000, 'Grave', 20800, 14940, '2024-11-20', 158, 'Transigido', 'CERRADO', 'RVC'),
('16473170', 2024, 'Junio', 'Lima', 'Pisco', 'Pisco', '2024-06-15', '2024-06-15', 'Eleazar Soldevilla', 2, '1. : Policontuso con descarte de fractura de cadera

2.  Policontuso', 'Fractura de cadera', 24000, 'Grave', 0, 45000, '2024-08-07', 53, 'Transigido', 'CERRADO', 'RVC'),
('16473171', 2024, 'Junio', 'LIMA', 'Monterrico', null, '2024-06-16', '2024-06-16', 'GC', 1, 'Monica Valencia Polh (Tec Severo)', 'TEC Grave', 23000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('16473180', 2024, 'Junio', 'Lima', 'Petit Thouars', 'Petit Thouars', '2024-06-16', '2024-06-16', 'Pierina Ugaz', 1, 'policontuso por accidente de tránsito', 'Policontuso', 1725, 'Leve', 4000, 3611, '2024-08-29', 74, 'Transigido', 'CERRADO', 'RVC'),
('16482006', 2024, 'Junio', 'LIMA', 'Santa Felicia', null, '2024-06-21', '2024-06-21', 'DS', 1, 'Olinda Rosa Delgado Tafur de Huaman (Policotusa)', 'Policontuso', 1725, 'Leve', 0, 1500, '1970-01-01', -19895, 'Transigido', 'CERRADO', 'Abeo'),
('16482409', 2024, 'Junio', 'Lima', 'Parcona', 'Parcona', '2024-06-22', '2024-06-22', 'Pierina Ugaz', 1, '-  Policontuso', 'Policontuso', 1725, 'Leve', 1200, 3800, '2024-06-26', 4, 'Transigido', 'CERRADO', 'RVC'),
('16490408  / 220467', 2024, null, null, null, null, '2024-06-27', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Rechazado', 'CERRADO', 'Chacon'),
('16490408 / 220467', 2024, null, null, null, null, '2024-06-27', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Rechazado', 'CERRADO', 'Chacon'),
('16496322 / 218660', 2024, null, null, null, null, '2024-06-21', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('16500079', 2024, 'Julio', 'Lima', 'Santa Clara', 'Santa Clara', '2024-07-03', '2024-07-03', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-09-04', 63, 'Transigido', 'CERRADO', 'RVC'),
('16504729', 2024, 'Julio', 'Callao', 'Callao', 'Callao', '2024-07-05', '2024-07-05', 'Pierina Ugaz', 1, '1.  Policontuso', 'Policontuso', 1725, 'Grave', 8000, 6000, '2024-09-04', 61, 'Transigido', 'CERRADO', 'RVC'),
('16506155', 2024, 'Julio', 'Callao', 'Ventanilla', 'Ventanilla', '2024-07-06', '2024-07-06', 'Mario Pilares', 2, '1 .- Pendiente
     2. Pendiente', 'Policontuso', 3450, 'Leve', 0, 25000, '2024-09-07', 63, 'Transigido', 'CERRADO', 'RVC'),
('16509897', 2024, 'Julio', 'Lima', 'Huachipa', 'Huachipa', '2024-09-07', '2024-09-07', 'Pierina Ugaz', 14, '1.     Policontuso por accidente de tránsito.

2.    Policontuso por accidente de tránsito.
3.-  Policontuso por accidente de tránsito.
 
4.     Policontuso por accidente de tránsito.

5.  Politraumatismo encéfalo craneano (TEC), trauma de extremidades (probable trauma vascular), miembro superior izquierdo.
6.-  Fractura de nariz y traumatismo múltiple.
7.-  Policontuso múltiple.
9.- Traumatismo superficial multiple.
10.-  Traumatismo múltiple no especificado.
11.-  Traumatismo múltiple.
12.-   Policontuso por accidente de tránsito.
13.  Traumatismo múltiple.
14.-  Fractura de diáfisis, de tibia izquierda y policontuso múltiple.
 Traumatismo superficial de la nariz.', 'Fractura de tibia', 241500, 'Grave', 32600, 35907.5, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('1001445940', 2026, 'Abril', 'LIMA', 'Monterrico', 'Monterrico', '2026-04-06', '2026-04-06', 'JD', 1, 'Karla Palomino Coronado (traumatismo por aplastamiento en región lumbosacra y pelvis, traumatismo de órgano intraabdominal (hígado), traumatismos superficiales múltiples)..', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('16518145', 2024, 'Julio', 'AREQUIPA', 'CERCADO', null, '2024-07-15', '2024-07-15', 'RUTH HUAHUACONDORI', 1, 'Fractura de radio y cúbito + Policontuso', 'Fractura de radio y cúbito', 17250, 'Grave', null, 5000, '1970-01-01', -19919, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16523035', 2024, 'Julio', 'LIMA', 'Monterrico', null, '2024-07-17', '2024-07-17', 'DS', 1, 'Jonathan Pedro Emilio Salinas Mendoza (Fractura en Vertebra)', 'Policontuso', 1725, 'Grave', 9000, 41000, '1970-01-01', -19921, 'Transigido', 'CERRADO', 'Abeo'),
('16523226', 2024, 'Julio', 'Callao', 'Callao', 'Ramón Castilla', '2024-07-18', '2024-07-18', 'Pierina Ugaz', 1, '1.  Politraumatismo por accidente de tránsito, fractura de huesos de antebrazo lado derecho, por descartar fractura de base de cráneo, por descartar fractura de trauma abdominal cerrado,                                 por descartar trauma de tórax cerrado, quedo hospitalizado.', 'Fractura de radio y cúbito', 17250, 'Grave', null, 45000, '2025-02-28', 225, 'Transigido', 'CERRADO', 'RVC'),
('16523320', 2024, null, null, null, null, '2024-07-18', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('16530235', 2024, 'Julio', 'Huaral', 'Chancay', 'Chancay', null, '2024-07-23', 'Alejandro Rodríguez', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, '2024-06-27', null, 'Transigido', 'CERRADO', 'Alejandro'),
('16530243', 2024, 'Julio', 'Chincha', 'Tambo de Mora', 'Tambo de Mora', null, '2024-07-13', 'Alejandro Rodríguez', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'Alejandro'),
('16530331', 2024, 'Julio', 'LIMA', 'San Borja', null, '2024-07-24', '2024-07-24', 'JD', 1, 'Robert Bonifacio Gonzales (Politraumatizado), Bastian Tadashi Bonifacio Paco Huanco (1 / Politraumatizado), Leonela Sánchez Paco Huanca (1 / (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('16532725', 2024, 'Julio', 'AREQUIPA', 'JOSE BUSTAMANTE', null, '2024-07-25', '2024-07-25', 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 930, '1970-01-01', -19929, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16544512', 2024, 'Agosto', 'Lima', 'Los Olivos', 'Pro', '2024-08-04', '2024-08-04', 'Micaela Solis', 1, 'Corte de 0.5 cm. en el rostro', 'Policontuso', 1725, 'Leve', 0, 20000, '2024-10-30', 87, 'Otros', 'ABIERTO', 'RVC'),
('16550672', 2024, 'Agosto', 'Callao', 'Callao', 'Callao', '2024-09-08', '2024-09-08', 'Pierina Ugaz', 1, 'Policontuso por accidente de tránsito.', 'Policontuso', 1725, 'Leve', 300, 14700, '2024-10-08', 30, 'Transigido', 'CERRADO', 'RVC'),
('16552716', 2024, 'Agosto', 'AREQUIPA', 'CERRO COLORADO', null, '2024-08-09', '2024-08-09', 'RUTH HUAHUACONDORI', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', null, 1190, '1970-01-01', -19944, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16557727 / 234183', 2024, null, null, null, null, '2024-08-12', null, 'Emily', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 1147, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('16558823', 2024, 'Agosto', 'Lima', 'SMP', 'San Martín de Porres', '2024-08-13', '2024-08-13', 'Mario Pilares', 1, 'Traumatismo en la cabeza, ojo                                               contusión del tórax, brazo, hombro, muñeca, mano y en la pierna no especificada', 'Policontuso', 1725, 'Leve', 3600, 3230, '2025-02-19', 190, 'Transigido', 'CERRADO', 'RVC'),
('16570787', 2024, 'Agosto', 'Callao', 'Callao', 'Dulanto', '2024-08-16', '2024-08-16', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-09-05', 20, 'Transigido', 'CERRADO', 'RVC'),
('16570863', 2024, 'Agosto', 'Lima', 'Pueblo Libre', 'pueblo libre', '2024-08-17', '2024-08-17', 'Micaela Solis', 1, 'policontuso', 'Policontuso', 1725, 'Leve', null, 10000, '1970-01-01', -19952, 'Otros', 'ABIERTO', 'RVC'),
('16570887', 2024, 'Agosto', 'AZANGARO', 'AZANGARO', null, '2024-08-19', '2024-08-19', 'JOEL HUAHUACONDORI', 2, 'Policontuso y corte', 'Policontuso y corte', 4600, 'Leve', null, null, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16572711', 2024, 'Agosto', 'Callao', 'Callao', 'Carmen de la legua  y Reynoso', '2024-08-19', '2024-08-19', 'Micaela Solis', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-10-02', 44, 'Transigido', 'CERRADO', 'RVC'),
('16576653', 2024, 'Agosto', 'Lima', 'Comas.', 'Santa Luzmila', '2024-08-21', '2024-08-21', 'Mario Pilares', 1, 'Policontuso , internado en trauma shock.', 'Policontuso', 1725, 'Leve', 1000, 29000, '2024-08-24', 3, 'Transigido', 'CERRADO', 'RVC'),
('1001456493', 2026, 'Abril', 'Lima', 'Callao', 'Sarita Colonia', '2026-04-15', '2026-04-15', 'Pierina Ugaz', 1, 'Fracturra de dedo', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('16587676', 2024, null, null, null, null, '2024-08-25', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'En Investigación', 'CERRADO', 'Chacon'),
('16587822', 2024, 'Agosto', 'LIMA', 'Miraflores', null, '2024-08-27', '2024-08-27', 'OU', 1, 'Luis Guillermo Matos Palomino (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('16589744', 2024, 'Septiembre', 'CHINCHA', 'SUNAMPE', null, '2024-09-01', '2024-08-31', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19967, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16597183', 2024, 'Septiembre', 'CORONEL PORTILLO', 'CAMPOVERDE', null, '2024-09-06', '2024-09-05', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 600, '1970-01-01', -19972, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16613964', 2024, 'Septiembre', 'SAN MARTIN', 'TARAPOTO', null, '2024-09-14', '2024-09-14', 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, null, '1970-01-01', -19980, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16616152', 2024, 'Septiembre', 'Lima', 'San Miguel', 'San Miguel', '2024-09-16', '2024-09-16', 'Pierina Ugaz', 1, 'Contusión del dedo pulgar de la mano izquierda.', 'Policontuso', 1725, 'Leve', 3686, -101.08, '2025-01-07', 113, 'Transigido', 'CERRADO', 'RVC'),
('1001456804', 2026, 'Abril', 'LIMA', 'Lurin', 'Lurin', '2026-04-15', '2026-04-15', 'JD', null, null, 'Policontuso', 0, 'Leve', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('16630038', 2024, 'Septiembre', 'LIMA', 'San Juan de Miraflores', null, '2024-09-25', '2024-09-25', 'DS', 1, 'Hairo Javier Fernandez Paredes (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('16638199', 2024, 'Septiembre', 'AREQUIPA', 'LA JOYA', null, '2024-09-30', '2024-09-29', 'RUTH HUAHUACONDORI', 3, 'Fallecido + Politraumatizado + Policontuso', 'Fallecido', 195000, 'Grave', null, null, '2025-05-29', 241, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16642927', 2024, 'Octubre', 'Barranca', 'Supe', 'Supe', null, '2024-10-03', 'Alejandro Rodríguez', 2, 'Fallecido', 'Fallecido', 130000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('16647142', 2024, 'Octubre', 'Lima', 'Callao', 'Bocanegra', '2024-10-04', '2024-10-04', 'Maritza Nizama', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 0, 25000, '2025-03-07', 154, 'Transigido', 'CERRADO', 'RVC'),
('16647462', 2024, 'Octubre', 'LIMA', 'Lince', null, '2024-10-06', '2024-10-06', 'OU', 1, 'Willson José Márquez Espitia (Policontuso)', 'Policontuso', 1725, 'Leve', 100, 100, '2024-10-06', 0, 'Transigido', 'CERRADO', 'Abeo'),
('16648166', 2024, 'Octubre', 'Lima', 'San Miguel', 'San Miguel', '2024-10-07', '2024-10-07', 'Maritza Nizama', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 4500, 932, '2025-03-31', 175, 'Transigido', 'CERRADO', 'RVC'),
('16648570', 2024, 'Octubre', 'Lima', 'Chincha', 'UPIAT Chincha.', '2024-10-08', '2024-10-08', 'Soldevila Magallanes / Pierina Ugaz', 3, 'Muerto', 'Fallecido', 195000, 'Grave', 0, 300000, '2025-02-20', 135, 'Transigido', 'CERRADO', 'RVC'),
('16648571', 2024, 'Octubre', 'Lima', 'Chincha', 'UPIAT Chincha.', '2024-10-08', '2024-10-08', 'Pilar Dextre', 3, 'Muerto', 'Fallecido', 195000, 'Grave', 33000, 267000, '2025-05-26', 230, 'Judicializado', 'CERRADO', 'RVC'),
('16648649', 2024, 'Octubre', 'Lima', 'Callao', 'La Perla', '2024-10-09', '2024-10-09', 'Mario Pilares', 0, 'NO SE CONSIGNARON', 'Policontuso', 0, 'Leve', 0, 5000, '2024-10-17', 8, 'Transigido', 'CERRADO', 'RVC'),
('16651743', 2024, 'Octubre', 'HUANCAYO', 'EL TAMBO', null, '2024-10-11', '2024-10-11', 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Negociación', 'ABIERTO', 'JH PACIFICO CONSULTING'),
('16655905', 2024, 'Octubre', 'PACASMAYO', 'Ciudad de Dios', 'Ciudad de Dios', '2024-10-15', '2024-10-14', 'Ricardo Vivar', 1, 'Shock hipovolémico, fractura expuesta de fémur, Tec moderado', 'Fractura de fémur', 23000, 'Grave', null, 40000, '2025-10-23', 373, 'Transigido', 'CERRADO', 'RVC'),
('16659295', 2024, 'Octubre', 'TRUJILLO.', 'Viru', 'Virú.', '2024-10-16', '2024-10-16', 'Ricardo Vivar', 3, 'Diagnóstico: Traumatismo de columna lumbar.


- Diagnóstico: Traumatismo de columna lumbar.

- Diagnóstico: Descartar fractura de rótula, traumatismo abdominal cerrado.', 'Fractura Pierna', 51750, 'Grave', 0, 100000, '2024-11-29', 44, 'Transigido', 'CERRADO', 'RVC'),
('16664817', 2024, 'Octubre', 'Lima', 'Comas', 'Collique', '2024-10-19', '2024-10-19', 'Micaela Solis', 1, 'Contusión en dorso de mano derecha', 'Policontuso', 1725, 'Leve', null, 5000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('16681906', 2024, null, null, null, null, '2024-11-04', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('16697793', 2024, 'Noviembre', 'Lima', 'Alfonso Ugarte', 'Alfonso Ugarte', '2024-11-09', '2024-11-09', 'Pierina Ugaz', 2, 'TEC- Fractura de pierna izquierda./ TEC- Policontuso y fractura del brazo izquierdo.', 'Fractura Pierna', 34500, 'Grave', 0, 35000, '2024-11-22', 13, 'Transigido', 'CERRADO', 'RVC'),
('16705551', 2024, 'Noviembre', 'LIMA', 'Pueblo Libre', null, '2024-11-14', '2024-11-14', 'GC', 1, 'Nestor Leon Cazo (Fractura de pelvis)', 'Fractura de pelvis', 15000, 'Grave', 5000, 5000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('16716216', 2024, 'Noviembre', 'Lima', 'Nazca', 'Nazca', '2024-11-21', '2024-11-21', 'Pilar Dextre', 5, 'Policontuso', 'Policontuso', 8625, 'Grave', 0, 55000, '2024-12-23', 32, 'Transigido', 'CERRADO', 'RVC'),
('16716381', 2024, 'Noviembre', 'Lima', 'Puente piedra', 'Puente piedra', '2024-11-21', '2024-11-21', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1150, 1670, '2025-03-03', 102, 'Transigido', 'CERRADO', 'RVC'),
('16716599', 2024, 'Noviembre', 'Lima', 'SJL', 'SJL', '2024-11-21', '2024-11-21', 'Pierina Ugaz', 1, 'Muerte', 'Fallecido', 65000, 'Grave', 50000, 30000, '1970-01-01', -20048, 'En Negociación', 'ABIERTO', 'RVC'),
('16726155', 2024, 'Noviembre', 'Lima', 'Lima', 'Mirones Bajo.', '2024-11-27', '2024-11-27', 'Pierina Ugaz', 1, 'Luxación', 'Torcedura', 3450, 'Grave', 9350, 140, '2025-02-04', 69, 'Transigido', 'CERRADO', 'RVC'),
('16730917', 2024, 'Noviembre', 'Lima', 'Lima', 'Cotabambas', '2024-11-29', '2024-11-29', 'Pierina Ugaz', 1, 'Trauma cerrado, con sangrado interno, a descartar trauma de vejiga y/o pubis.', 'Hemorragia interna', 17250, 'Grave', null, 13085.8, '2025-06-27', 210, 'Transigido', 'CERRADO', 'RVC'),
('16731203', 2024, 'Diciembre', 'Lima', 'Zapallal', 'Zapallal', '2024-12-02', '2024-02-12', 'Pierina Ugaz', 1, 'Lesiones en el pie', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-02-26', 86, 'Transigido', 'CERRADO', 'RVC'),
('16731804', 2024, 'Diciembre', 'Lima', 'Zapallal', 'Zapallal', '2024-12-02', '2024-02-12', 'Micaela Solis', 1, 'Lesiones en el pie', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-02-26', 86, 'Transigido', 'CERRADO', 'RVC'),
('16739691', 2024, 'Diciembre', 'Santa', 'Chimbote', 'La Libertad', '2024-12-07', '2024-12-06', 'Maritza Nizama', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', 0, 5000, '2024-12-23', 16, 'Transigido', 'CERRADO', 'RVC'),
('16740113', 2024, 'Diciembre', 'LIMA', 'Lurin', null, '2024-12-06', '2024-12-06', 'GC', 1, 'Johanny Yamel Marchan Vargas (Fractura de clavicula)', 'Fractura de clavícula', 23000, 'Grave', 16000, 16000, '2025-01-28', 53, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('16742004', 2024, 'Diciembre', 'Lima', 'SJL', 'Zárate', '2024-12-10', '2024-10-12', 'Maritza Nizama', 1, 'Policontusa', 'Policontuso', 1725, 'Leve', 0, 15000, '2024-12-22', 12, 'Transigido', 'CERRADO', 'RVC'),
('167525821', 2024, 'Diciembre', 'Lima', 'Callao', 'Márquez.', '2024-12-16', '2024-12-16', 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 15000, '2025-08-22', 249, 'Transigido', 'CERRADO', 'RVC'),
('16753987', 2024, 'Diciembre', 'LIMA', 'Villa', null, '2024-12-17', '2024-12-17', 'OU', 1, 'Iris Paola Amante Delgadillo: Preliminar Policontuso, descartar fractura mandíbula', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Tercero No Coopera', 'ABIERTO', 'Abeo'),
('16772379', 2024, 'Diciembre', 'Lima', 'Barranca', 'Barranca', '2024-12-29', '2024-12-29', 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 20000, '2025-03-19', 80, 'Transigido', 'CERRADO', 'RVC'),
('16773970', 2024, 'Diciembre', 'Lima', 'Chincha', 'Grocio Prado', '2024-12-30', '2024-12-30', 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 15000, '2025-02-07', 39, 'Transigido', 'CERRADO', 'RVC'),
('16779247', 2025, 'Enero', 'Casma', 'Casma', 'Casma', '2025-01-05', null, 'Pilar Dextre', 4, 'TEC SEVERO', 'TEC Leve', 23000, 'Grave', 0, 45000, '2025-02-09', 35, 'Transigido', 'CERRADO', 'RVC'),
('16792555', 2025, 'Enero', 'Lima', 'Pisco', 'Paracas', '2025-01-12', null, 'Pilar Dextre', 1, 'Muerte', 'Policontuso', 1725, 'Grave', 30000, 50000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('16794946', 2025, 'Enero', 'Lima', 'VMT', 'Villa María del Triunfo', '2025-01-20', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 1500, '2024-10-23', -89, 'Transigido', 'CERRADO', 'RVC'),
('16796683', 2025, 'Mayo', 'Lima', 'LOS OLIVOS', 'Sol de Oro', '2025-05-02', null, 'Pilar Dextre', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 4000, 1869.2, '2025-05-30', 28, 'Transigido', 'CERRADO', 'RVC'),
('16797686', 2025, 'Enero', 'Lima', 'SMP', 'UIAT Ciudad del Pescdor', '2025-01-16', null, 'Pierina Ugaz', 1, 'Muerte', 'Policontuso', 1725, 'Grave', 90000, 0, '2025-12-16', 334, 'Transigido', 'CERRADO', 'RVC'),
('16804235', 2025, 'Enero', 'Trujillo', 'Trujillo', 'Ayacucho', '2025-01-20', null, 'Pilar Dextre', 3, 'Muerte', 'Policontuso', 5175, 'Leve', null, 180000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'RVC'),
('16823052', 2025, 'Enero', null, 'CHIMBOTE', 'CHIMBOTE', '2025-01-31', null, 'JOEL HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 700, 2300, '2025-01-31', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16826485', 2025, 'Febrero', 'Callao', 'Ventanilla', 'Villa Los Reyes', '2025-02-03', null, 'Micaela Solis', 4, 'Amputacion de Pierna Izqueirda', 'Policontuso', 6900, 'Grave', 50000, 32500, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('16828610', 2025, 'Febrero', 'Callao', 'Callao', 'Ciudadela Chalaca', '2025-02-04', null, 'Pierina Ugaz', 1, 'Policontuso', 'Politraumatizado', 4000, 'Grave', 12000, 4257, '2025-04-30', 85, 'Transigido', 'CERRADO', 'RVC'),
('16832411', 2025, 'Febrero', 'Callao', 'Dominicos', 'Sol de Oro', '2025-02-05', null, 'Pierina Ugaz', 1, 'Hemorragia  vascular', 'Policontuso', 1725, 'Leve', 0, 30000, '2025-05-14', 98, 'Transigido', 'CERRADO', 'RVC'),
('16836653', 2025, 'Febrero', 'Lima', 'San Juan de Lurigancho', 'Mariscal Cáceres.', '2025-02-07', null, 'Pierina Ugaz', 1, 'Atricción', 'Policontuso', 1725, 'Leve', 3500, 14520, '2025-02-13', 6, 'Transigido', 'CERRADO', 'RVC'),
('16837054', 2025, 'Febrero', 'Cañete', 'Chilca', 'Chilca', '2025-02-07', null, 'Pierina Ugaz', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-02-19', 12, 'Transigido', 'CERRADO', 'RVC'),
('16843149', 2025, 'Febrero', 'Lima', 'Ventanilla', 'Ventanilla', '2025-02-12', null, 'Pilar Dextre', 1, 'Policontuso', 'Policontuso', 1725, 'Grave', 48900, 6690, '2025-05-21', 98, 'Transigido', 'CERRADO', 'RVC'),
('16848080', 2025, 'Febrero', null, null, null, '2025-02-14', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Cerrado s/detalle', 'CERRADO', 'Chacon'),
('16849237', 2025, 'Febrero', null, 'HUARMEY', 'HUARMEY', '2025-02-15', null, 'JOEL HUAHUACONDORI', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, 8000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16852157', 2025, 'Febrero', 'Lima', 'SMP', 'SMP', '2025-02-18', null, 'Pierina Ugaz', 3, 'Traumatismos múltiples, quedando en observación', 'Policontuso', 5175, 'Leve', null, 20000, '2025-11-28', 283, 'Transigido', 'CERRADO', 'RVC'),
('16854233', 2025, 'Febrero', 'LIMA', 'LIMA', 'Monterrico', '2025-02-20', null, 'JD', 1, 'Domingo Alexander Fernández Zambrano (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1500, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('16854360', 2025, 'Febrero', 'LIMA', 'LIMA', 'Laderas de Villa', '2025-02-20', null, 'JD', 1, 'Esther Lozano Rodas (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 4136, -1136, '2025-03-24', 32, 'Transigido', 'CERRADO', 'Abeo'),
('16866387', 2025, 'Febrero', null, 'JOSE MARIA QUIMPER', 'EL CARDO', '2025-02-26', null, 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1300, 4700, '2025-05-14', 77, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16868612', 2025, 'Febrero', 'Lima', 'Ate', 'SALAMANCA', '2025-02-27', null, 'Maritza Nizama', 1, 'fractura tobillo', 'Politraumatizado', 4000, 'Grave', 22000, -1710, '2025-07-04', 127, 'Transigido', 'CERRADO', 'RVC'),
('16870477', 2025, 'Febrero', 'Lima', 'Lima', 'Mirones bajo', '2025-02-27', null, 'Maritza Nizama', 1, 'Contusión', 'Politraumatizado', 4000, 'Leve', 2200, 12800, '2025-04-04', 36, 'Transigido', 'CERRADO', 'RVC'),
('16871944', 2025, 'Marzo', 'LIMA', 'LIMA', 'Villa', '2025-03-02', null, 'GC', 7, 'Stephany Cardenas Cayetano, María Elena Quesso Conto, Santiago Chipana Choque, Nancy Soledad Apaza Yucra, Ethan Abdiel Cardenas Cayetano, Gumercina chipana Chipana, Anaizza Ylenia Chipana Apaza (Politraumatizado', 'Politraumatizado', 28000, 'Grave', 10000, 11000, '2025-10-06', 218, 'En Negociación', 'CERRADO', 'Abeo'),
('16889123', 2025, 'Marzo', 'LIMA', 'LIMA', 'Surquillo', '2025-03-14', null, 'JD', 1, 'Angel Mateo Agurto Palomino (Herida de Labio y Cavidad Bucal / Traumatismo Intracraneal / Herida del Párpado / Piezas Dentales Movidas)', 'Policontuso', 1725, 'Grave', 36000, -19000, '2025-05-05', 52, 'Transigido', 'CERRADO', 'Abeo'),
('16890055', 2025, 'Marzo', null, 'MARISCAL CARECES', 'PUCCHUN', '2025-03-14', null, 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 238000, null, null, 'En Negociación', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16890420', 2025, 'Marzo', null, 'PALCA', 'PALCA', '2025-03-17', null, 'JOEL HUAHUACONDORI', 3, 'Fallecido + Politraumatizado', 'Fallecido', 195000, 'Grave', 5000, -1000, '2025-05-07', 51, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16893556', 2025, 'Marzo', 'LIMA', 'LIMA', 'San Antonio', '2025-03-18', null, 'JD', 1, 'Gerónimo Jesús Hernández (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 1500, 1500, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('16899321', 2025, 'Marzo', 'Ancash', 'Huarmey', 'Huarmey', '2025-03-21', null, 'Maritza Nizama', 1, 'Fractura', 'Policontuso', 1725, 'Leve', 0, 30000, '2025-05-15', 55, 'Transigido', 'CERRADO', 'RVC'),
('16905574', 2025, 'Marzo', 'LIMA', 'LIMA', 'Villa el Salvador', '2025-03-25', null, 'DS', 1, 'Alicia Blanell Mora Venegas (Policontusa)', 'Policontuso', 1725, 'Leve', 900, 2100, '2025-04-10', 16, 'Transigido', 'CERRADO', 'Abeo'),
('16908922', 2025, 'Marzo', 'LIMA', 'LIMA', 'Sagitario', '2025-03-27', null, 'JD', 1, 'Enmanuel Jesús Montero Sequera (Fractura de Brazo)', 'Policontuso', 1725, 'Leve', 0, 10000, '2025-03-27', 0, 'Transigido', 'CERRADO', 'Abeo'),
('16911691', 2025, 'Marzo', null, 'SAN ANTONIO DE CHUCA', 'SAN ANTONIO DE CHUCA', '2025-03-29', null, 'RUTH HUAHUACONDORI', 4, 'Policontuso y corte', 'Policontuso y corte', 9200, 'Grave', 57000, -54000, '2025-04-14', 16, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16911692', 2025, 'Marzo', 'Lima', 'Sunampe', 'Sunampe', '2025-03-29', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 100, 14900, '2025-03-31', 2, 'Transigido', 'CERRADO', 'RVC'),
('16911701', 2025, 'Marzo', 'Lima', 'Zárate.', 'Zárate.', '2025-03-29', null, 'Maritza Nizama', 4, 'Policontuso', 'Policontuso', 6900, 'Grave', null, 40000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('16913126', 2025, 'Abril', 'LIMA', 'LIMA', 'San Juan de Miraflores', '2025-04-01', null, 'JD', 1, 'Jostin Joseph Sevillano Valladares (Fractura de Hombro)', 'Policontuso', 1725, 'Grave', 7500, 2500, '2025-05-13', 42, 'Transigido', 'CERRADO', 'Abeo'),
('16922745', 2025, 'Abril', 'Callao', 'Pueblo Libre', 'Pueblo Libre', '2025-05-04', '2025-05-04', 'Pilar Dextre', 1, 'Fractura tobillo', 'Policontuso', 1725, 'Leve', 4000, 6490, '2025-06-27', 54, 'Transigido', 'CERRADO', 'RVC'),
('16923693', 2025, 'Abril', 'Lima', 'Zarate', 'Zarate', '2025-07-04', null, 'Pilar Dextre', 9, 'Politraumatizado', 'Policontuso', 15525, 'Grave', 10000, 0, '2025-07-26', 22, 'Transigido', 'CERRADO', 'RVC'),
('16925537', 2025, 'Abril', 'Lima', 'SJL', 'La Huayrona', '2025-04-07', null, 'Pilar Dextre', 1, 'Fractura de fémur diafisiario', 'Politraumatizado', 4000, 'Grave', 22500, 2500, '2025-04-25', 18, 'Transigido', 'CERRADO', 'RVC'),
('16936211', 2025, 'Abril', null, 'YARADA LOS PALOS', 'YARADA LOS PALOS', '2025-04-12', null, 'RUTH HUAHUACONDORI / JOEL HUAHUACONDORI', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, 3000, null, null, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16943816', 2025, 'Abril', 'LIMA', 'LIMA', 'Surquillo', '2025-04-19', null, 'GC', 1, 'Acner Ivan Pusman  Jimenez (Amputación del dedo de la mano)', 'Policontuso', 1725, 'Grave', 7500, -4500, '2025-04-20', 1, 'Transigido', 'CERRADO', 'Abeo'),
('16943817', 2025, 'Abril', 'Callao', 'Callao', 'Oquendo', '2025-04-19', null, 'Maritza Nizama', 1, 'Fractura de pie', 'Fractura Pierna', 17250, 'Grave', null, 30000, '2025-11-13', 208, 'Transigido', 'CERRADO', 'RVC'),
('16959425', 2025, 'Abril', null, 'ATICO', 'ATICO', '2025-04-29', null, 'RUTH HUAHUACONDORI', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 64000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'JH PACIFICO CONSULTING'),
('16961295', 2025, 'Mayo', 'Lima', 'Cercado de Lima.', 'Unidad Vecinal 3', '2025-05-01', null, 'Micaela Solis', 1, 'cérvica dorsalgia post traumática', 'Policontuso', 1725, 'Leve', 2000, 23000, '2025-11-24', 207, 'Transigido', 'CERRADO', 'RVC'),
('16967053', 2025, 'Mayo', 'LIMA', 'LIMA', 'San Borja', '2025-05-06', null, 'JD', 1, 'Rebeca Denisse Velásquez Raffo (Policontusa)', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('16972658', 2025, 'Mayo', 'Lima', 'Puente Piedra', 'Puente Piedra', '2025-05-07', null, 'Micaela Solis', 5, 'Policontuso', 'Politraumatizado', 20000, 'Grave', 10000, 11579.4, '2025-09-19', 135, 'Transigido', 'CERRADO', 'RVC'),
('16975656', 2024, 'Julio', 'Lima', 'Puente Piedra', 'UIAT Norte', '2024-07-11', '2024-07-11', 'Pierina Ugaz', 1, 'Muerte Inmediata', 'Fallecido', 65000, 'Grave', 20000, 60000, '2024-09-13', 64, 'Judicializado', 'CERRADO', 'RVC'),
('16977508', 2025, 'Mayo', 'Callao', 'Callao', 'Marquez', '2025-05-09', null, 'Pilar Dextre', 1, 'Contusión de Rodilla', 'Policontuso', 1725, 'Leve', null, 10000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('16978077', 2025, 'Mayo', 'Callao', 'Callao', 'Callao', '2025-05-10', null, 'Maritza Nizama', 1, 'Constusión', 'Policontuso', 1725, 'Leve', 0, 10000, null, null, 'Transigido', 'CERRADO', 'RVC'),
('1698164', 2025, 'Mayo', 'LIMA', 'LIMA', 'Laderas de Villa', '2025-05-16', null, 'GC', 1, 'Ronie Daniel Velasquez Arotinco (Policontuso)', 'Policontuso', 1725, 'Leve', null, 2000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('16982137', 2025, 'Mayo', 'Lima', 'Puente Piedra', 'La Ensenada', '2025-05-14', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 1168.28, '2025-06-04', 21, 'Transigido', 'CERRADO', 'RVC'),
('16983549', 2025, 'Mayo', 'Lima', 'Ica', 'Ica', '2025-05-15', null, 'Pierina Ugaz', 1, 'Descarte de fractura', 'Policontuso', 1725, 'Leve', 1700, 18300, '2025-05-16', 1, 'Transigido', 'CERRADO', 'RVC'),
('17002325', 2025, 'Mayo', 'Lima', 'Jesus María', 'Jesus María', '2025-05-23', null, 'Maritza Nizama', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1150, 13850, '2025-06-24', 32, 'Transigido', 'CERRADO', 'RVC'),
('17016640', 2025, 'Junio', 'LIMA', 'LIMA', 'San Isidro', '2025-06-02', null, 'DS', 1, 'Brisila Lizbeth Avila Nicola (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('17017437', 2025, 'Junio', 'LIMA', 'LIMA', 'Pamplona', '2025-06-03', null, 'JD', 2, 'Karol Denise Arenas Carrera (TEC Grave / Politraumatismo), Moisés Inde Obregón Vásquez (Politraumatismo)', 'TEC Grave', 46000, 'Grave', null, 1000, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('17026201', 2025, 'Junio', 'Casma', 'Casma, Ancash.', 'Casma', '2025-10-06', null, 'Maritza Nizama', 1, 'trauma ocular derecho', 'Policontuso', 1725, 'Leve', null, 30000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('17029293', 2025, 'Junio', 'Cañete', 'San Vicente de Cañete', 'San Vicente de Cañete', '2025-12-06', null, 'Pierina Ugaz', 3, 'polincotuso', 'Policontuso', 5175, 'Leve', null, 50000, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('17055175', 2025, 'Junio', 'Lima', 'Laura Caller', 'Los Olivos', '2025-05-25', null, 'Pierina Ugaz', 1, 'Fractura en la clavícula', 'Policontuso', 1725, 'Grave', 8035, 36965, '2025-09-10', 108, 'Transigido', 'CERRADO', 'RVC'),
('1001463582', 2026, 'Abril', 'LIMA', 'Sagitario', 'Sagitario', '2026-04-21', '2026-04-21', 'DS', 1, 'Victor Vargas Pampamallco', 'Policontuso', 1725, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('17064178', 2025, 'Julio', 'Lima', 'Pueblo libre', 'Pueblo Libre', '2025-02-07', null, 'Micaela Solis', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 1000, 9000, '2025-08-27', 201, 'Transigido', 'CERRADO', 'RVC'),
('17071336', 2025, 'Julio', null, 'SACHACA', 'SACHACA', '2025-07-06', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 4000, '2025-07-08', 2, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17072022/ 17074381', 2025, 'Julio', 'Lima', 'San Luis', 'San Luis', '2025-07-07', null, 'Noelia', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 0, 4000, '2025-08-18', 42, 'Otros', 'CERRADO', 'RVC'),
('17077767 / 336266', 2025, 'Julio', null, null, null, '2025-07-09', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Cerrado s/detalle', 'CERRADO', 'Chacon'),
('17079935', 2025, 'Julio', null, 'MOQUEGUA', 'MOQUEGUA', '2025-07-10', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 1500, 4500, '2025-08-29', 50, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17082490', 2025, 'Julio', 'Lima', 'Nazca – Ica', 'Nazca', '2025-11-07', null, 'Micaela Solis', 1, 'Muerte Inmediata', 'Politraumatizado', 4000, 'Leve', 0, 80000, '2025-09-15', -53, 'Transigido', 'CERRADO', 'RVC'),
('17083955  / 337204', 2025, 'Julio', null, null, null, '2025-07-12', null, 'Eduardo', 1, 'Politraumatizado + Policontuso', 'Politraumatizado', 4000, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('17095083', 2025, 'Julio', 'LIMA', 'LIMA', 'Villa el Salvador', '2025-07-19', null, 'GC', 2, 'Paola Tasayco Zevallos y Aimara Silva Tasayco (Politraumatizada y esguince cervical)', 'Politraumatizado', 8000, 'Grave', 6000, -3000, '2025-08-08', 20, 'Transigido', 'CERRADO', 'Abeo'),
('17099317', 2025, 'Julio', null, 'PUQUIO', 'LUCANAS', '2025-07-25', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Grave', 10000, -6500, '2025-09-30', 67, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17101420', 2025, 'Septiembre', 'Lima', 'Rimac', 'Piedra Liza', '2025-09-26', null, 'Noelia', 1, 'Policontuso', 'TEC Leve', 5750, 'Leve', null, 30000, '2026-03-24', 179, 'En Negociación', 'ABIERTO', 'RVC'),
('17106084', 2025, 'Julio', 'Ancash', 'Casma', 'Casma', '2025-07-26', null, 'Maritza Nizama', 2, 'Por descartar factura', 'Policontuso', 3450, 'Leve', 0, 10000, '2025-09-03', 39, 'Transigido', 'CERRADO', 'RVC'),
('17113240', 2025, 'Agosto', 'Ancash', 'Caraz.', 'Marcará.', '2025-04-08', null, 'Maritza Nizama', 1, 'TEC LEVE', 'TEC Leve', 5750, 'Leve', 3000, 17000, '2025-05-09', 31, 'Transigido', 'CERRADO', 'RVC'),
('17116407', 2025, 'Agosto', 'LIMA', 'LIMA', 'Lurin', '2025-08-06', null, 'GC', 1, 'Ely David Moran Borges y Yaseem Stick Bañico Ramos(Policontuso)', 'Policontuso', 1725, 'Leve', 1000, 2000, null, null, 'Cerrado s/detalle', 'CERRADO', 'Abeo'),
('17116521', 2025, 'Agosto', 'Lima', 'San Antonio Jicamarca', 'San Antonio de Jicamarca', '2025-06-08', null, 'Micaela Solis', 4, 'Fractura Mutliple', 'Esguince', 9200, 'Grave', 18000, 55000, '2026-01-06', 212, 'En Negociación', 'ABIERTO', 'RVC'),
('17116945', 2025, 'Agosto', null, 'SAN RAMON', 'SAN RAMON', '2025-08-08', null, 'JOEL HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', null, 33000, null, null, 'Rechazado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17120627', 2025, 'Agosto', null, 'MOQUEGUA', 'MOQUEGUA', '2025-08-11', null, 'JOEL HUAHUACONDORI', 4, null, 'Policontuso', 6900, 'Grave', 9500, -6500, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17132050', 2025, 'Agosto', 'Lima', 'Los Olivos', 'Laura Caller', '2025-08-18', null, 'Micaela Solis', 2, 'Traumatismo superficial múltiple y traumatismo en cabeza.', 'Politraumatizado', 8000, 'Grave', null, 25000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('17140859', 2025, 'Agosto', 'LIMA', 'LIMA', 'Chacarilla', '2025-08-20', null, 'OU', 1, 'Leonel Miguel Alzamora Coraero (Politraumatismo, TIC)', 'Politraumatizado', 4000, 'Grave', 7335, 2665, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('17150922 / 349683', 2025, 'Agosto', null, null, null, '2025-08-25', null, 'Eduardo', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('17155562', 2025, 'Agosto', null, 'AREQUIPA', 'PALACIO VIEJO', '2025-08-28', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 4770, -3270, '2025-08-29', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17155691', 2025, 'Agosto', 'LIMA', 'LIMA', 'San Antonio', '2025-08-28', null, 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('17158175', 2025, 'Agosto', 'Lima', 'LIMA', 'Huachipa', '2025-08-30', null, 'Pierina Ugaz', 1, 'Fractura de clavicula', 'Policontuso', 1725, 'Leve', 4500, 20500, '2025-02-09', -202, 'Transigido', 'CERRADO', 'RVC'),
('17176110', 2025, 'Septiembre', 'Lima', 'San Martin de Porres', 'San Martin de Porres', '2025-10-09', null, 'Noelia', 2, '1. Traumatismo múltiples y contusión de muslo  2. Traumatismo múltiples y contusión de muslo', 'Policontuso', 3450, 'Leve', 3000, 7100, '2025-12-18', 70, 'Transigido', 'CERRADO', 'RVC'),
('17177866', 2025, 'Septiembre', null, 'PUQUIO', 'PUQUIO', '2025-09-10', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Grave', 45000, -42000, '2025-09-16', 6, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17187272', 2025, 'Septiembre', 'Lima', 'Cabayllo', 'Santa Isabel', '2025-12-09', null, 'Pierina Ugaz', 1, 'Contusión en la rodilla  derecha', 'Policontuso', 1725, 'Leve', null, 15000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('17195215 / 357078', 2025, 'Septiembre', null, null, null, '2025-09-20', null, 'Eduardo', 1, null, 'Policontuso', 1725, 'Leve', null, 0, '2025-10-16', 26, 'Archivado', 'CERRADO', 'Chacon'),
('17198963', 2025, 'Septiembre', 'LIMA', 'LIMA', 'San Isidro', '2025-09-22', null, 'DS', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 20000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('17208566', 2025, 'Septiembre', 'Lima', 'Lima', 'San Andrés', '2025-09-26', null, 'Pierina Ugaz', 1, 'TEC', 'Politraumatizado', 4000, 'Leve', 4000, 4919.2, '2025-11-12', 47, 'Transigido', 'CERRADO', 'RVC'),
('17212618', 2025, 'Octubre', null, 'PUNCHANA', 'PUNCHANA', '2025-10-01', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 200, 3800, '2025-10-01', 0, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17219017', 2025, 'Octubre', 'Lima', 'San Miguel', 'Pueblo Libre', '2025-06-10', null, 'Noelia', 1, 'Traumatismos superficiales múltiples especificados', 'Politraumatizado', 4000, 'Leve', null, 15000, '2025-10-14', 126, 'Transigido', 'CERRADO', 'RVC'),
('1001466996', 2026, 'Abril', 'LIMA', 'Chacarilla', 'Chacarilla', '2026-04-28', '2026-04-28', 'JD', 1, 'Eduardo Tovar Silva (Fractura de Brazo)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('17230316', 2025, 'Octubre', 'LIMA', 'LIMA', 'Manchay', '2025-10-11', null, 'GC', 1, 'Ruben Emilio Tomayquispe Ramos (Policontuso)', 'Policontuso', 1725, 'Leve', null, 6000, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('17236277', 2025, 'Octubre', 'Lima', 'El Agustino', 'El Agustino', '2025-10-15', null, 'Noelia', 6, '1. Contusión de otras partes y las no especificadas de la pierna 2. Traumatismo craneoencefálico moderado y policontuso y esguince de columna cervical 3. Contusión de otras partes y las no especificadas de la pierna 4. Politraumatizado por AATT 5. Policontuso 6. Policontuso', 'Policontuso', 10350, 'Grave', null, 70000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('17251799', 2025, 'Octubre', 'Lima', 'SMP', 'San Martin de Porres', '2025-10-23', null, 'Micaela Solis', 1, 'Traumatismo Múltiples vasos sanguíneos a nivel de cadera y del muslo derecho (quedando internado)', 'Politraumatizado', 4000, 'Leve', 3500, 812, '2025-12-19', 57, 'Transigido', 'CERRADO', 'RVC'),
('17258419 / 368125', 2025, 'Octubre', null, null, null, '2025-10-27', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('17260536', 2025, 'Septiembre', null, 'YURIMAGUAS', 'YURIMAGUAS', '2025-09-11', null, 'JOEL HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', null, 5000, null, null, 'Otros', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17266097', 2025, 'Noviembre', null, 'CERRO COLORADO', 'CERRO COLORADO', '2025-11-02', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 0, 1500, '2025-11-03', 1, 'Otros', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17272240', 2025, 'Noviembre', 'Lima', 'San Miguel', 'Maranga', '2025-06-11', null, 'Pierina Ugaz', 1, 'Contusión de dedo  de la mano, contusión de rodilla', 'TEC Leve', 5750, 'Leve', 500, 0, '2025-11-26', 168, 'Transigido', 'CERRADO', 'RVC'),
('17288380', 2025, 'Noviembre', null, 'TAMBOPATA', 'TAMBOPATA', '2025-11-14', null, 'RUTH HUAHUACONDORI', 1, null, 'Policontuso', 1725, 'Leve', 200, 0, '2025-11-15', 1, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17296432', 2025, 'Noviembre', null, 'TACNA', 'GREGORIO ALBARRACIN LACHIPA', '2025-11-19', null, 'JOEL HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', null, 20000, '2026-04-13', 145, 'Transigido', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17301825 / 376136', 2025, 'Noviembre', null, null, null, '2025-11-23', null, 'Eduardo', 1, 'Fallecido + Politraumatizado + Policontuso', 'Fallecido', 65000, 'Grave', null, 0, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('17302520', 2025, 'Noviembre', 'LIMA', 'LIMA', 'Miraflores', '2025-11-24', null, 'JD', 1, 'Alvaro Ríos Coripaica (Politraumatismo)', 'Politraumatizado', 4000, 'Leve', 0, 3000, null, null, 'Archivado', 'CERRADO', 'Abeo'),
('17302532', 2025, 'Noviembre', null, 'JEPELACIO', 'JEPELACIO', '2025-11-24', null, 'JOEL HUAHUACONDORI', 2, null, 'Policontuso', 3450, 'Leve', null, 1500, null, null, 'Archivado', 'CERRADO', 'JH PACIFICO CONSULTING'),
('17312668', 2025, 'Diciembre', 'Lima', 'SMP', 'Barboncito', '2025-01-12', null, 'Pierina Ugaz', 1, 'Traumatismos  superficiales y  policontuso por accidente de tránsito', 'Policontuso', 1725, 'Leve', null, 35000, '2025-12-26', 348, 'Transigido', 'CERRADO', 'RVC'),
('17323101', 2025, 'Diciembre', 'Lima', 'Chancay', 'UIAT Huaral', '2025-07-12', null, 'Maritza Nizama', 3, 'Muerte/ policontuso/ descartar fractura', 'Politraumatizado', 12000, 'Grave', null, 60000, null, null, 'Otros', 'ABIERTO', 'RVC'),
('17327267', 2025, 'Diciembre', 'Ica', 'Santiago', 'Santiago - Ica', '2025-10-12', null, 'Noelia', 1, 'Descarte de trauma abdominal cerrado (quedando internado en el área de observación) Policontuso por accidente de tránsito', 'Policontuso', 1725, 'Grave', 9000, 6000, '2025-12-18', 67, 'Transigido', 'CERRADO', 'RVC'),
('17328620 / 381568', 2025, 'Diciembre', null, null, null, '2025-12-10', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('17342145', 2025, 'Diciembre', 'LIMA', 'LIMA', 'San Luis', '2025-12-18', null, 'DS', 1, 'Frank William Huaman Lopez (Esguince y torcedura de columna cervical, luxación de codo y fractura de cubito proximal)', 'Torcedura', 3450, 'Leve', 5000, 1000, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('17343646', 2025, 'Diciembre', 'LIMA', 'LIMA', 'Pucusana', '2025-12-20', null, 'JD', 1, 'Frank Carlos Santiago Justiniano (Fallecido)', 'Fallecido', 65000, 'Grave', 0, 3000, null, null, 'Rechazado', 'CERRADO', 'Abeo'),
('17364504', 2026, null, null, 'Los Olivos', 'Pro', '2026-01-05', null, 'Pierina Ugaz', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 4500, null, '2026-02-09', 35, 'Transigido', 'CERRADO', 'RVC'),
('17365618', 2026, null, null, 'Chancay', null, '2026-01-09', null, 'Alejandro', 1, 'Fractura Pierna', 'Fractura Pierna', 17250, 'Grave', 0, null, null, null, 'En Negociación', 'ABIERTO', 'Alejandro'),
('17372200', 2026, 'Enero', 'LIMA', 'Magdalena', 'Magdalena', '2026-01-09', '2026-01-09', 'GC', 1, '-No quiso brindar información (Fractura de tibia)', 'Fractura de tibia', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('17373424', 2026, 'Enero', 'LIMA', 'San Antonio de Mala', 'San Antonio de Mala', '2026-01-10', '2026-01-10', 'JD', 1, 'Junior Gaspar Linares Tito (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'Abeo'),
('17381399', 2026, null, null, 'SMP', 'Barboncitos', '2026-01-15', null, 'Pierina Ugaz', 1, 'Muerte sin asistencia', 'Fallecido', 65000, 'Grave', null, null, '2026-01-26', 11, 'En Negociación', 'ABIERTO', 'RVC'),
('17384421', 2026, null, null, 'Callao', 'Carmen de la Legua', '2026-01-16', null, 'Pierina Ugaz', 2, 'Policontuso por accidente de tránsito', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'RVC'),
('17387900', 2026, null, null, 'Chosica', 'Huachipa', '2026-01-19', null, 'Pierina Ugaz', 1, 'Traumatismos superficiales múltiples, luxación o dislocación del hombro.', 'Politraumatizado', 4000, 'Leve', 2000, null, '2026-01-29', 10, 'Transigido', 'CERRADO', 'RVC'),
('17396371', 2026, 'Enero', 'LIMA', 'Lince', 'Lince', '2026-01-22', '2026-01-22', 'OU', 1, 'Antonio Minaya Domínguez (Politraumatismo, Heridas cortantes pierna izquierda)', 'Politraumatizado', 4000, 'Leve', 2400, null, null, null, 'Transigido', 'CERRADO', 'Abeo'),
('17399233', 2026, 'Enero', 'LIMA', 'San Antonio', 'San Antonio', '2026-01-26', '2026-01-26', 'OU', 2, 'Helga Mara Martens Vioña y Edgardo Merino Helguero (Politraumatismo)', 'Politraumatizado', 8000, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('17400014', 2026, null, null, 'La Victoria', 'La Victoria', '2026-01-26', null, 'Pierina Ugaz', 1, 'Contusión de pierna y contusión de tobillo, ambos en el pie derecho', 'Policontuso', 1725, 'Leve', null, null, '2026-03-09', 42, 'Transigido', 'CERRADO', 'RVC'),
('17401192', 2026, null, null, 'La Victoria', 'Yerbateros', '2026-01-27', null, 'Pierina Ugaz', 1, 'Esguince de torcedura  de columna, contusión de tórax, contusión  de rodilla  y traumatismo en la cabeza.', 'Esguince', 2300, 'Leve', null, null, '2026-03-26', 58, 'Transigido', 'CERRADO', 'RVC'),
('17411643', 2026, 'Febrero', 'LIMA', 'San Borja', 'San Borja', '2026-02-03', '2026-02-03', 'DS', 1, 'Jose Luis Silverio Diaz (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', 0, null, '2026-02-03', 0, 'Transigido', 'CERRADO', 'Abeo'),
('17411977', 2026, 'Febrero', null, 'Santa Anita', 'Santa Anita', '2026-02-04', null, 'Micaela Solis', 1, 'Consecuencia fatal', 'Fallecido', 65000, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('17412552', 2026, null, null, 'Rimac', 'Rimac', '2026-02-04', null, 'Pierina Ugaz', 2, 'Corte en el labio, policontuso, quedando en evaluación', 'Policontuso y corte', 4600, 'Leve', 2350, null, null, null, 'Transigido', 'CERRADO', 'RVC'),
('17415981', 2026, null, null, 'Pisco', null, '2026-02-06', null, 'Alejandro', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, 3000, '2026-02-06', 0, 'Transigido', 'CERRADO', 'Alejandro'),
('17442167', 2026, 'Febrero', 'LIMA', 'Las Praderas', 'Las Praderas', '2026-02-20', '2026-02-20', 'OU', 2, 'Jorge Cervantes García (TIC, insuficiencia respiratoria, Politraumatismo) y Perci Zamora Torre (Politraumatismo)', 'TEC Grave', 46000, 'Grave', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('17449459', 2026, 'Febrero', 'LIMA', 'San Antonio', 'San Antonio', '2026-02-24', '2026-02-24', 'DS', 1, 'Yessica Meza Estrada (Politraumatizada)', 'Politraumatizado', 4000, 'Leve', 0, null, '2026-02-24', 0, 'Otros', 'CERRADO', 'Abeo'),
('17454758', 2026, null, null, 'El Agustino', 'Santoyo', '2026-02-26', null, 'Pierina Ugaz', 1, 'Fractura de dos  dedos  de miembro inferior derecho, Traumatismos en ambos miembros inferiores', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('17458121', 2026, 'Febrero', 'LIMA', 'Santa Felicia', 'Santa Felicia', '2026-02-28', '2026-02-28', 'DS', 1, 'Herman Alberto Diaz Alarcon (Herida cortante en la pierna, politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('17459535', 2026, 'Marzo', 'LIMA', 'Nueva Esperanza', 'Nueva Esperanza', '2026-03-02', '2026-03-02', 'GC', 1, 'Oscar Humberto Fernandez Nicolas (Fallecido)', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('17462271', 2026, null, null, 'SMP', 'Pro', '2026-03-03', null, 'Pierina Ugaz', 1, 'Traumatismo de otros tendones y músculos a nivel del pie y tobillo (quedando en observación)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('17465128', 2026, null, null, null, null, '2026-03-04', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Asegurado No Autoriza', 'CERRADO', 'Chacon'),
('17467684', 2026, null, null, 'El Agustino', 'Santoyo', '2026-03-06', null, 'Micaela Solis', 1, 'luxo fractura de tobillo, lado izquierdo (quedando en observación)', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('17468101', 2026, null, null, 'SMP', 'San Martin de Porres – UPIAT Norte', '2026-03-07', null, 'Pierina Ugaz', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC'),
('17471222', 2026, null, null, null, null, '2026-03-10', null, 'Eduardo', 1, 'Fractura de pelvis + Hemorragia interna', 'Hemorragia interna', 17250, 'Grave', 0, null, null, null, 'En Negociación', 'ABIERTO', 'Chacon'),
('17472775', 2026, 'Marzo', 'LIMA', 'Magdalena', 'Magdalena', '2026-03-11', '2026-03-11', 'DS', 1, 'Jesus Raul Montero Centeno (Policontuso)', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Abeo'),
('17475239', 2026, 'Marzo', 'LIMA', 'Miraflores', 'Miraflores', '2026-03-12', '2026-03-12', 'JD', 1, 'Piero Paz Ojeda (Politraumatizado)', 'Politraumatizado', 4000, 'Leve', null, null, null, null, 'En Negociación', 'ABIERTO', 'Abeo'),
('17481167', 2026, null, null, 'Sullana', null, '2026-03-16', null, 'Eduardo', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('17492808', 2026, 'Marzo', 'LIMA', 'San Antonio', 'San Antonio', '2026-03-23', '2026-03-23', 'GC', 1, 'Jose Avila Vargas (fractura de pie)', 'Fractura Pierna', 17250, 'Grave', null, null, null, null, 'En Evaluación', 'ABIERTO', 'Abeo'),
('17505199', 2026, null, null, 'Casma', null, '2026-03-31', null, 'Alejandro', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Alejandro'),
('17514878 / 281177', 2025, 'Enero', null, null, null, '2025-01-14', null, 'Eduardo', 1, 'TEC Leve + Policontuso', 'TEC Leve', 5750, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('17515129', 2026, null, null, 'Comas', 'Santa Luzmila.', '2026-04-07', null, 'Pierina Ugaz', 1, 'traumatismo superficial múltiples, contusión de hombro,brazo, tórax y rodilla', 'Politraumatizado', 4000, 'Leve', 1100, 1100, '2025-04-15', -357, 'Transigido', 'CERRADO', 'RVC'),
('17516029', 2026, 'Abril', 'LIMA', 'Asia', 'Asia', '2026-04-08', '2026-04-08', 'GC', 1, 'Hugo Segundo Vargas Quispe (Tec Moderado y politraumatizado', 'TEC Moderado', 11500, 'Grave', null, null, null, null, 'En Investigación', 'ABIERTO', 'Abeo'),
('17523209', 2026, null, null, 'Chaclacayo', 'Chaclacayo', '2026-04-12', null, 'Wilinton Loarte', 1, 'Contusión en la pierna izquierda', 'Policontuso', 1725, 'Leve', null, null, '2026-04-14', 2, 'Transigido', 'CERRADO', 'RVC'),
('1001468509', 2026, 'Mayo', 'Lima', 'Lince', 'Petit Thouars', '2026-05-01', '2026-05-01', 'Pierina Ugaz', 1, 'Fractura del pie', 'Policontuso', 1725, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('17560761', 2026, 'Abril', 'Lima', 'Ate', 'Salamanca', null, null, 'Pierina Ugaz', 1, 'Contusión en partes de la pierna izquierda, herida en la pierna izquierda', 'Policontuso', 1725, 'Leve', 400, null, '2026-04-30', null, 'Transigido', 'CERRADO', 'RVC'),
('19867142 / 284741', 2025, 'Enero', null, null, null, '2025-01-26', null, null, 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 5500, 5500, null, null, 'Otros', 'CERRADO', 'Chacon'),
('19867142 / 318386', 2025, 'Mayo', null, null, null, '2025-05-10', null, null, 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Cerrado s/detalle', 'CERRADO', 'Chacon'),
('212794', 2024, null, null, null, null, '2024-06-02', null, 'Emily', 2, 'Policontuso', 'Policontuso', 3450, 'Leve', 100, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('214844', 2024, null, null, null, null, '2024-06-09', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('214931', 2024, null, null, null, null, '2024-06-10', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon');

insert into public.drive_siniestros (siniestro, anio, mes, provincia, distrito, comisaria, fecha_registro, fecha_siniestro, abogado, cant_lesionados, lesiones, lesion_principal, reserva_inicial, gravedad, reserva_final, ahorro, fecha_cierre, tiempo_cierre, sub_estado, estado, estudio) values
('217807', 2024, null, null, null, null, '2024-06-19', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Archivado', 'CERRADO', 'Chacon'),
('229109', 2024, null, null, null, null, '2024-07-26', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Chacon'),
('1001469861', 2026, 'Mayo', 'Lima', 'SMP', 'Barboncitos', '2026-05-04', '2026-05-04', 'Pierina Ugaz', 2, '1. Contusión en muñeca y tobillo derecho   2. Contusión de muslo y pierna derecha', 'Policontuso', 3450, 'Leve', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('248707', 2024, null, null, null, null, '2024-09-30', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'En Investigación', 'CERRADO', 'Chacon'),
('1001910262', 2026, null, null, 'San Miguel', 'San Miguel', '2026-01-23', null, 'Pierina Ugaz', 6, 'Fractura del quinto de la mano izquierda', 'Policontuso', 10350, 'Grave', null, null, null, null, 'Asegurado No Autoriza', 'ABIERTO', 'RVC'),
('256626', 2024, null, null, null, null, '2024-10-27', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('258207', 2024, null, null, null, null, '2024-11-01', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'En Investigación', 'CERRADO', 'Chacon'),
('265765', 2024, null, null, null, null, '2024-10-24', null, 'Emily', 1, 'Fallecido', 'Fallecido', 65000, 'Grave', 4000, null, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('268900', 2024, null, null, null, null, '2024-12-05', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Rechazado', 'CERRADO', 'Chacon'),
('269545', 2024, null, null, null, null, '2024-12-07', null, 'Emily', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Chacon'),
('269668', 2024, null, null, null, null, '2024-12-08', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'Responsabilidad Tercero', 'CERRADO', 'Chacon'),
('271056', 2024, null, null, null, null, '2024-12-12', null, 'Emily', 0, null, 'Policontuso', 0, 'Leve', 0, null, null, null, 'En Investigación', 'CERRADO', 'Chacon'),
('278929', 2025, 'Enero', null, null, null, '2025-01-07', null, 'Eduardo', 3, 'Policontuso', 'Policontuso', 5175, 'Leve', null, 6000, null, null, 'Daño Material', 'CERRADO', 'Chacon'),
('360033', 2025, 'Septiembre', null, null, null, '2025-09-30', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Daño Material', 'CERRADO', 'Chacon'),
('382657', 2025, 'Diciembre', null, null, null, '2025-12-14', null, 'Eduardo', 1, null, 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Daño Material', 'CERRADO', 'Chacon'),
('385991', 2025, 'Diciembre', null, null, null, '2025-12-24', null, 'Eduardo', 1, 'Politraumatizado', 'Politraumatizado', 4000, 'Leve', null, 0, null, null, 'Transigido', 'CERRADO', 'Chacon'),
('386139', 2025, 'Diciembre', null, null, null, '2025-12-23', null, 'Eduardo', 1, 'Policontuso', 'Policontuso', 1725, 'Leve', null, 0, null, null, 'Otros', 'CERRADO', 'Chacon'),
('45876', 2025, 'Julio', 'Lima', 'Los Olivos', 'Sol de Oro', '2025-08-07', null, 'Pierina Ugaz', 1, null, 'Policontuso', 1725, 'Leve', 0, 2000, '2025-05-21', -78, 'Otros', 'CERRADO', 'RVC'),
('17536904', 2026, 'Abril', 'Lima', 'Los Olivos', 'PRO', null, null, 'Pierina Ugaz', 2, 'Traumatismos múltiples, no especificados (T07), heridas múltiples  extensa en miembro inferior derecho, inflamación de tejidos blandos en muslo derecho (según ecografía), tendinosis de la pata de ganso (según ecografía), quedando en observación', 'Policontuso', 3450, 'Leve', null, null, null, null, 'En Evaluación', 'ABIERTO', 'RVC');

