package mx.com.ideasydiseno.electronica

class Entrada {

            Proveedor proveedor
            Sucursal sucursal
            double total
            String status
            String observaciones


	static hasMany = [refacciones: DetalleEntrada,
                        		  fechas: DetalleFechaEntrada,
                        		  pagos: PagoProveedor]

            static constraints = {
                proveedor blank:false
                sucursal blank:false
                total blank:false
                status blank:false, inList: ["Abierto", "Cerrado"]
                observaciones blank:true, size:0..50
            }



            Double getTotalPagos() { pagos?.total?.sum() }

            Double getTotalRefacciones() { refacciones?.total?.sum() }

            Double getTotalAdeudo() {
                double tRefacciones = totalRefacciones!=null ? totalRefacciones.doubleValue() : 0;
                double tPagos = totalPagos!=null ? totalPagos.doubleValue() : 0;
                tRefacciones - tPagos
            }

            static transients = ['totalPagos', 'totalAdeudo', 'totalRefacciones']


    String toString(){
        return "Entrada Proveedor: ${proveedor} ${status}"
    }
}
