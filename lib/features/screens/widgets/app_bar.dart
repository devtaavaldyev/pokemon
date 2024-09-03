// ignore_for_file: must_be_immutable

part of '../pokemon_screen.dart';

class _AppBar extends StatelessWidget {
  // ignore: unused_element
  _AppBar({super.key});

  String name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PokeApp',
              style: AppTextStyles.white48w700,
            ),
            const SizedBox(width: 12),
            Image.asset(
              'assets/images/icon.png',
              scale: 11,
            )
          ],
        ),
        const SizedBox(height: 22),
        const Text(
          'Pokemon list',
          style: AppTextStyles.white24w600,
        ),
        const SizedBox(height: 12),
        const Text(
          'Find the pokemon you want',
          style: AppTextStyles.white14w500,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Flexible(
              child: AppTextField(
                onChanged: (name) {
                  this.name = name;
                  if (name.isEmpty) {
                    BlocProvider.of<PokemonCubit>(context).getPokemons(name);
                  }
                },
              ),
            ),
            // ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                if (name.isNotEmpty) {
                  BlocProvider.of<PokemonCubit>(context).getPokemons(name);
                }
              },
              child: Container(
                // ignore: sort_child_properties_last
                child: const Icon(
                  Icons.search,
                  color: AppColors.fieldText,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.itemPoints,
                ),
                height: 46,
                width: 46,
              ),
            )
          ],
        ),
      ],
    );
  }
}
