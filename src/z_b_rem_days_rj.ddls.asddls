@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Remaining Days'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity Z_B_REM_DAYS_RJ as select from zrent_cars_rj
{
 key matricula as Matricula,
      marca     as Marca,
      case
      when alq_hasta <> '00000000'
      then dats_days_between( cast( $session.system_date as abap.dats ), alq_hasta)
      end       as Dias   
    
//    key matricula as Matricula,
//    marca as Marca,
//    modelo as Modelo,
//    color as Color,
//    motor as Motor,
//    potencia as Potencia,
//    und_potencia as UndPotencia,
//    combustible as Combustible,
//    consumo as Consumo,
//    fecha_fabr as FechaFabr,
//    puertas as Puertas,
//    precio as Precio,
//    moneda as Moneda,
//    alquilado as Alquilado,
//    alq_desde as AlqDesde,
//    alq_hasta as AlqHasta
}
