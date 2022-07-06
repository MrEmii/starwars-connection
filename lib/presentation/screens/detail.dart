import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/provider/detail_provider.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/presentation/ui/detail/info_section.dart';
import 'package:starwars_connection/presentation/ui/detail/info_text.dart';
import 'package:starwars_connection/presentation/ui/loading_modal.dart';

class DetailScreen extends StatefulWidget {
  final Person person;
  const DetailScreen({Key? key, required this.person}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<DetailProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      LoadingModal.show(context, () async {
        await provider.fetchVehicles();
        await provider.fetchStarships();
        await provider.fetchPlanet();
        provider.notify();
      });
    });
  }

  @override
  void dispose() {
    provider.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<DetailProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          InfoSectionDetail(
            title: "Más sobre ${widget.person.name}",
            children: [
              InfoTextDetail(leadInfo: "Fecha de nacimiento", info: widget.person.birthYear, icon: PhosphorIcons.cakeBold),
              InfoTextDetail(leadInfo: "Genero", info: widget.person.gender, icon: PhosphorIcons.genderIntersexBold),
              InfoTextDetail(leadInfo: "Color de ojos", info: widget.person.eye, icon: PhosphorIcons.eyeBold),
              InfoTextDetail(leadInfo: "Peso", info: widget.person.mass, icon: PhosphorIcons.barbellBold),
              InfoTextDetail(leadInfo: "Naves", info: widget.person.starships.length.toString(), icon: PhosphorIcons.airplaneBold),
              InfoTextDetail(leadInfo: "Vehiculos", info: widget.person.vehicles.length.toString(), icon: PhosphorIcons.carBold),
              InfoTextDetail(leadInfo: "Planeta natal", info: provider.planet?.name ?? "", icon: PhosphorIcons.planetBold),
            ],
          ),
          const SizedBox(height: 16),
          if (widget.person.vehicles.isNotEmpty)
            InfoSectionDetail(
              title: "Vehiculos (${widget.person.vehicles.length})",
              children: provider.vehicles?.map((e) => InfoTextDetail(leadInfo: "Vehiculo", info: e.name, icon: PhosphorIcons.carBold)).toList() ?? [],
            ),
          const SizedBox(height: 16),
          if (widget.person.starships.isNotEmpty)
            InfoSectionDetail(
              title: "Naves (${widget.person.starships.length})",
              children: provider.starships?.map((e) => InfoTextDetail(leadInfo: "Naves", info: e.name, icon: PhosphorIcons.airplaneBold)).toList() ?? [],
            )
        ],
      ),
    );
  }
}
