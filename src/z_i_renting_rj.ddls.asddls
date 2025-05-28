@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Renting'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity Z_I_RENTING_RJ
  as select from Z_B_CARS as Cars
  association [1]    to Z_B_REM_DAYS_RJ       as _RemDays     on Cars.Matricula = _RemDays.Matricula
  association [0..*] to Z_B_BRANDS_RJ         as _Brands      on Cars.Marca = _Brands.Marca
  association [0..*] to z_b_det_customer_rj  as _DetCustomer on Cars.Matricula = _DetCustomer.Matricula
{
  key Matricula,
      Marca,
      Modelo,
      Color,
      Motor,
      Potencia,
      UndPotencia, //  Unidad
      Combustible,
      Consumo,
      FechaFabr,
      Puertas,
  //    Precio,
      Moneda,
      Alquilado,
      AlqDesde,
      AlqHasta,
      case
      when _RemDays.Dias <= 0 then 0
      when _RemDays.Dias between 1 and 30 then 1
      when _RemDays.Dias between 31 and 100 then 2
      when _RemDays.Dias > 100 then 3
      else 0
      end as TiempoRenta,
      ''  as Estado,
 //     _Brands.Imagen,
      _DetCustomer
}
