import '/core/services/color_service.dart';
import '/feature/factor/models/service_model.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceModel;

  const ServiceItem({this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorService.secondary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: ColorService.primary)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(serviceModel.title ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${serviceModel.price} \$"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${serviceModel.number}"),
          ),
        ],
      ),
    );
  }
}
