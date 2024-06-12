import 'package:flutter/material.dart';
import 'integrate_api.dart';
import 'model_employe.dart';

class EmployeScreen extends StatefulWidget {
  const EmployeScreen({super.key});
  @override
  State<EmployeScreen> createState() => _EmployeScreenState();
}
class _EmployeScreenState extends State<EmployeScreen> {
  @override
  void initState() {
    // ApiIntegrate().fetchData2();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FutureBuilder<List<Data>>(
      //   future: ApiIntegrate().fetchData1(),
      //   builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot){
      //     return ListView.builder(
      //       itemCount: snapshot.data?.length,
      //       itemBuilder: (context, index) {
      //         return Card(child: ListTile(
      //           title: Text('${ snapshot.data?[index].employeeName! ?? ""}'),
      //           subtitle: Text('${snapshot.data?[index].employeeAge}' ?? ""),
      //         ),);
      //       },
      //     );
      //   },
      // ),
      body: FutureBuilder<EmployeModel>(
        future: ApiIntegrate().fetchData(),
        builder: (BuildContext context, AsyncSnapshot<EmployeModel> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else {
            return ListView.builder(
              itemCount: snapshot.data?.data?.length,
              itemBuilder: (context, index) {
                return Card(child: ListTile(
                  title: Text('${ snapshot.data?.data?[index].employeeName! ?? ""}'),
                  subtitle: Text('${snapshot.data?.data?[index].employeeAge}' ?? ""),
                ),);
              },
            );
          }

        },
      ),
    );
  }
}
