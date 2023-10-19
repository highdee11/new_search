import 'dart:async';
import 'package:flutter/material.dart';
import '../notification_service.dart';
import 'network_response.dart';
import 'network_service.dart';

enum NetworkRequestStatus {
  idle, pending, error, completed
}

class NetworkRequest<T> {

  //init request response
  NetworkResponse? response;

  //create network status controller
  final StreamController<NetworkRequestStatus> statusController = StreamController.broadcast();
  Stream<NetworkRequestStatus> get statusStream => statusController.stream;

  String endpoint;

  //Constructor
  NetworkRequest({required this.endpoint}){
    statusController.add(NetworkRequestStatus.idle);
  }

  //GET REQUEST
  Future<void> get({String? query})async {

    _cleanUp();

    try{
      //Change request status to pending
      statusController.add(NetworkRequestStatus.pending);

      //send request
      response = await NetworkService().get('$endpoint?q=$query');

      //Handler error
      await _handleError(response!);
    }
    catch(e){
      //handle error
      await _handleError(response!);
    }
  }



  //Handle Http Error
  Future<void> _handleError(NetworkResponse? response)async {

    if(response == null){
      NotificationService.showMessageModal(message: "Unexpected error occurred.");
      return;
    }

    if(response.statusCode != NetworkService.successResponseCode){
      statusController.add(NetworkRequestStatus.error);
      NotificationService.showMessageModal(message:response.message ?? '');
      return;
    }

    //change request status to completed
    statusController.add(NetworkRequestStatus.completed);
  }


  //Reset request object
  void _cleanUp(){
    response = null;
  }
}
