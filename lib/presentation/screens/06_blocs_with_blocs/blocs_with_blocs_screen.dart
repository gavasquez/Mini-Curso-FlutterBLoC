import 'package:blocs_app/presentation/blocs/07-historic_location/hisotric_location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final geLocationCubit = context.watch<GeolocationCubit>().state.location;
    final historicLocationBloc = context.watch<HisotricLocationBloc>();
    final locationState = historicLocationBloc.state;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Ubicaciones: ${locationState.howManyLocations}'),
      ),
      body:ListView.builder(itemBuilder: (context, index) {
        final location = locationState.location[index];
        final (lat, lng) = location;
        return ListTile(
          title: Text('Lat: $lat, Lng: $lng'),
        );
      },itemCount: locationState.howManyLocations),
    );
  }
}