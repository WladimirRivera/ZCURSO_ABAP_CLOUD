@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition - Comp Entity Cars'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity Z_C_RENT_CARS_LGL
  provider contract transactional_query
  as projection on z_r_rent_cars_lgl
{
  key IncUUID,
  key Matricula,
      Marca,
      Modelo,
      Color,
      Motor,
      Potencia,
      UndPotencia,
      Combustible,
      Consumo,
      FechaFabr,
      Puertas,
      Precio,
      Moneda,
      Alquilado,
      TiempoRenta,
      Estado,
      AlqDesde,
      AlqHasta,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
