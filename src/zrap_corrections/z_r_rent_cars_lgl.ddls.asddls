@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition - Root Entity Cars'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z_r_rent_cars_lgl
  as select from zrent_cars_lgl
  association [1] to Z_B_REM_DAYS_RJ as _RemDays on zrent_cars_lgl.matricula = _RemDays.Matricula
{
  key inc_uuid              as IncUUID,
  key matricula             as Matricula,
      marca                 as Marca,
      modelo                as Modelo,
      color                 as Color,
      motor                 as Motor,
      potencia              as Potencia,
      und_potencia          as UndPotencia,
      combustible           as Combustible,
      consumo               as Consumo,
      fecha_fabr            as FechaFabr,
      puertas               as Puertas,
      @Semantics.amount.currencyCode: 'moneda'
      precio                as Precio,
      moneda                as Moneda,
      alquilado             as Alquilado,
      case
      when _RemDays.Dias <= 0 then 0
      when _RemDays.Dias between 1 and 30 then 1
      when _RemDays.Dias between 31 and 100 then 2
      when _RemDays.Dias > 100 then 3
      else 0
      end                   as TiempoRenta,
      ''                    as Estado,
      alq_desde             as AlqDesde,
      alq_hasta             as AlqHasta,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
