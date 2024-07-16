import 'package:start_up_workspace/resources/helpers/all_imports.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({
    super.key,
    required this.selectedCountryFlag,
    required this.selectedCountryCode,
    required this.onSelect,
  });

  final String selectedCountryFlag;
  final String selectedCountryCode;
  final void Function(Country) onSelect;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: customTheme.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: const Size.fromHeight(48.0),
      ),
      onPressed: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          favorite: ['JO', 'SA'],
          exclude: ['IL'],
          onSelect: (Country country) {
            onSelect(country);
          },
          countryListTheme: CountryListThemeData(
            backgroundColor: customTheme.darkGrey,
            inputDecoration: InputDecoration(
              hintStyle: theme.textTheme.titleLarge!.copyWith(
                color: customTheme.textField,
                fontWeight: FontWeight.normal,
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
              prefixIconColor: customTheme.white,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.secondary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            searchTextStyle: theme.textTheme.titleLarge!.copyWith(
              color: customTheme.white,
              fontWeight: FontWeight.normal,
            ),
            textStyle: theme.textTheme.titleLarge!.copyWith(
              color: customTheme.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      },
      child: Row(
        children: [
          ScaleText(
            '$selectedCountryCode+',
            style: theme.textTheme.titleLarge!.copyWith(
              color: customTheme.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          ScaleText(
            selectedCountryFlag,
            style: theme.textTheme.titleLarge!.copyWith(
              color: customTheme.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),

          // const Icon(
          //   Icons.arrow_drop_down_outlined,
          // )
        ],
      ),
    );
  }
}
