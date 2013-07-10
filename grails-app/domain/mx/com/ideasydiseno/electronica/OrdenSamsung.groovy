package mx.com.ideasydiseno.electronica

class OrdenSamsung extends Orden{

    String noOrdenServicio

    Date getMaxFecha() { fechas?.fecha?.max() }

  	DetalleFechaOrden getMaxDetalleFecha() { DetalleFechaOrden.findByFecha(fechas?.fecha?.max()) }

  	Double getTotalCobros() { cobros?.total?.sum() }

  	Double getTotalRefacciones() { refacciones?.total?.sum() }

  	Double getTotalPagos() { pagos?.total?.sum() }

  	Double getTotalAdeudo() {
  		double tCobros = totalCobros!=null ? totalCobros.doubleValue() : 0;
  		double tRefacciones = totalRefacciones!=null ? totalRefacciones.doubleValue() : 0;
  		double tPagos = totalPagos!=null ? totalPagos.doubleValue() : 0;
  		tCobros  + tRefacciones - tPagos
  	}

    static transients = ['maxFecha', 'maxDetalleFecha', 'totalCobros', 'totalRefacciones', 'totalPagos', 'totalAdeudo']

    static constraints = {
    	noOrdenServicio blank:true
    }
}
