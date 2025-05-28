CLASS zcl_renting_load_data1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_renting_load_data1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_cars      TYPE TABLE OF zrent_cars_lgl.
    TRY.
** CARS**

        DELETE FROM zrent_cars_lgl.
        INSERT zrent_cars_lgl FROM TABLE @( VALUE #(
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( ) matricula = '1246GSA' marca = 'BMW' modelo = 'SERIE 4' color = 'BLANCO' motor = '2.5' potencia = '210' und_potencia = 'CV'
            combustible = 'GASOLINA' consumo = '7.00' fecha_fabr = '20200418' puertas = '5' precio = '210' moneda = 'USD' alquilado = 'X' alq_desde = '20251201' alq_hasta = '20251231' )
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )  matricula = '2174FHF' marca = 'KIA' modelo = 'CEE''D' color = 'AZUL' motor = '4.2' potencia = '340' und_potencia = 'CV'
            combustible = 'GASOLINA' consumo = '10.00' fecha_fabr = '20200617' puertas = '5' precio = '160' moneda = 'USD' alquilado = 'X' alq_desde = '20250801' alq_hasta = '20250831' )
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )  matricula = '2356FSF' marca = 'AUDI' modelo = 'A8' color = 'BLANCO' motor = '3.9' potencia = '140' und_potencia = 'CV'
            combustible = 'ELECTRIC' consumo = '00.00' fecha_fabr = '20200304' puertas = '3' precio = '140' moneda = 'USD' alquilado = 'X' alq_desde = '20250701' alq_hasta = '20250708' )
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )  matricula = '2392JFH' marca = 'JEEP' modelo = 'GRAND CHEROKEE' color = 'BLANCO' motor = '3.6' potencia = '176'
            und_potencia = 'CV' combustible = 'GASOLINA' consumo = '12.00' fecha_fabr = '20200924' puertas = '5' precio = '160' moneda = 'USD' alquilado
            = 'X' alq_desde = '20200601' alq_hasta = '20201001' )
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )  matricula = '2837KFF' marca = 'MERCEDES' modelo = 'CLASE B' color = 'NEGRO' motor = '2.0' potencia = '200' und_potencia = 'CV'
            combustible = 'GASOLINA' consumo = '7.00' fecha_fabr = '20200726' puertas = '5' precio = '160' moneda = 'USD' alquilado = 'X' alq_desde = '20250301' alq_hasta = '20250301' )
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )  matricula = '2837SUF' marca = 'MERCEDES' modelo = 'CLASE C' color = 'AMARILLO' motor = '3.0' potencia = '220' und_potencia = 'CV'
            combustible = 'GASOLINA' consumo = '6.00' fecha_fabr = '20200614' puertas = '5' precio = '180' moneda = 'USD' alquilado = 'X' alq_desde = '20251201' alq_hasta = '20251206' )
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )  matricula = '2847JGH' marca = 'HONDA' modelo = 'CARENS' color = 'NEGRO' motor = '1.9' potencia = '180' und_potencia = 'CV'
            combustible = 'DIESEL' consumo = '5.00' fecha_fabr = '20210716' puertas = '5' precio = '180' moneda = 'USD' alquilado = 'X' alq_desde = '20251201' alq_hasta = '20251206' )
            ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )  matricula = '29348KJ' marca = 'MINI' modelo = 'CABRIO' color = 'AMARILLO' motor = '2.0' potencia = '240' und_potencia = 'CV'
            combustible = 'ELECTRIC' consumo = '0.00' fecha_fabr = '20200812' puertas = '3' precio = '150' moneda = 'USD' alquilado = 'X' alq_desde = '20251106' alq_hasta = '20251206' )
            ) ).
        IF sy-subrc EQ 0.
          out->write( |{ sy-dbcnt } were inserted in database.| ).
        ENDIF.
      CATCH cx_uuid_error INTO DATA(lr_UUID_ERROR).
        DATA(error) = lr_uuid_error->get_text(  ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
