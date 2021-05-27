import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/all_empleados_controller.dart';

class AllEmpleadosPageView extends GetView<AllEmpleadosController> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('AllEmpleadosPage')),

        body: SafeArea(
          child: Obx(()
            {
              if (controller.getEmpleadosIsBusy.value) {
                return Center(child: CircularProgressIndicator());
              }
              else {
                return ListView.builder(
                  itemCount: controller.empleados.length,
                  itemBuilder: (context, index) {
                    return
                    ListTile(
                      title: Text('${controller.empleados[index].apellido1} ${controller.empleados[index].apellido2}, ${controller.empleados[index].nombre}'),
                      subtitle: Text('${controller.empleados[index].contrato?.puesto.descripcion} / ${controller.empleados[index].contrato?.zona.descripcion} (${controller.empleados[index].contrato?.empresa})'),
                    );
                  },
                );
              }
            }
            
          )
        )
      ),
    );
  }
}