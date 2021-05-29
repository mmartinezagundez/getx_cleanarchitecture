
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarchitecture/presentation/pages/controllers/home_controller.dart';
import 'package:getx_cleanarchitecture/presentation/routes/app_pages.dart';

class HomePageView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('HomePageView')),
        body: SafeArea(
          child: ListView(            
            children: [
              ListTile(              
                title: Text('Login Page'),
                subtitle: Text('Login y Logout'),
                trailing: Icon(Icons.login),
                onTap: () {
                  Get.toNamed(Routes.LOGIN);                    
                },
              ),
              ListTile(              
                title: Text('All Empleados'),
                subtitle: Text('Todos los Empleados'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Get.toNamed(Routes.ALLEMPLEADOS);                    
                },
              )
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.incrementCounter();
          },
          child: Icon(Icons.plus_one)
        ),
      ),
    );
  }
}