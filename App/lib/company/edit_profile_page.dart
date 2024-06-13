import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

//page
import 'package:adopte_un_candidat/skills.dart';
import 'package:adopte_un_candidat/useful.dart';

import 'profile_view.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({super.key});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  String _name = '';
  final String _job = '';
  String _email = '';
  String _city = '';
  double _radius = 10.0;
  RangeValues _salaryRange = const RangeValues(0, 10000);
  final List<String> _selectedSkills = [];
  final List<String> _selectedActivitySectors = [];
  final List<String> _selectedCompanyCategories = [];
  final List<String> _selectedContractTypes = [];

  Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.currentTheme.colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themes.currentTheme.colorScheme.secondary,
          title: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Édition du Profil',
                  style: TextStyle(
                    color: themes.currentTheme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileView())),
                  child: Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: const Text(
                      'ok',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildSection(
            title: 'Informations de l\'entreprise',
            tiles: [
              _buildTextFieldTile(
                title: 'Nom',
                value: _name,
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              _buildTextFieldTile(
                title: 'Emploi proposé',
                value: _job,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              _buildTextFieldTile(
                title: 'Email',
                value: _email,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              _buildCityTile(),
            ],
          ),
          _buildSection(
            title: 'Localisation',
            tiles: [
              _buildRadiusTile(),
            ],
          ),
          _buildSection(
            title: 'Compétences et critères de recherche',
            tiles: [
              _buildExpansionTile(
                title: 'Compétences de l\'entreprise',
                items: _getSkillsByCategory(),
                selectedItems: _selectedSkills,
                onSelectItem: (String item) {
                  setState(() {
                    _selectedSkills.contains(item)
                        ? _selectedSkills.remove(item)
                        : _selectedSkills.add(item);
                  });
                },
              ),
              _buildExpansionTile(
                title: 'Secteur(s) d\'activité de l\'entreprise',
                items: activitySectors,
                selectedItems: _selectedActivitySectors,
                onSelectItem: (String item) {
                  setState(() {
                    _selectedActivitySectors.contains(item)
                        ? _selectedActivitySectors.remove(item)
                        : _selectedActivitySectors.add(item);
                  });
                },
              ),
              _buildExpansionTile(
                title: 'Catégorie de l\'entreprise',
                items: companyCategories,
                selectedItems: _selectedCompanyCategories,
                onSelectItem: (String item) {
                  setState(() {
                    _selectedCompanyCategories.contains(item)
                        ? _selectedCompanyCategories.remove(item)
                        : _selectedCompanyCategories.add(item);
                  });
                },
              ),
              _buildExpansionTile(
                title: 'Type de contrats proposés',
                items: contractTypes,
                selectedItems: _selectedContractTypes,
                onSelectItem: (String item) {
                  setState(() {
                    _selectedContractTypes.contains(item)
                        ? _selectedContractTypes.remove(item)
                        : _selectedContractTypes.add(item);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> tiles}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 20, bottom: 5),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: themes.currentTheme.colorScheme.onPrimary,
            ),
          ),
        ),
        const DividerWidget(),
        for (int i = 0; i < tiles.length; i++)
          Column(
            children: [
              if (i != 0) const HalfDividerWidget(),
              tiles[i],
            ],
          ),
        const DividerWidget(),
      ],
    );
  }

  Widget _buildTextFieldTile({
    required String title,
    required String value,
    required Function(String) onChanged,
  }) {
    return _buildTile(
      context: context,
      title: title,
      child: SizedBox(
        width: 300,
        child: TextField(
          style: TextStyle(
            color: themes.currentTheme.colorScheme.onPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Entrez $title',
            hintStyle: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary.withOpacity(0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color:
                    themes.currentTheme.colorScheme.onPrimary.withOpacity(0.3),
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildCityTile() {
    return _buildTextFieldTile(
      title: 'Ville',
      value: _city,
      onChanged: (value) {
        setState(() {
          _city = value;
        });
      },
    );
  }

  Widget _buildRadiusTile() {
    return _buildTile(
      context: context,
      title: 'Dans un rayon de',
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            width: 200,
            child: Slider(
              value: _radius,
              min: 0,
              max: 100,
              divisions: 20,
              label: _radius.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
          ),
          Text(
            '${_radius.toStringAsFixed(1)} km',
            style: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalaryRangeTile() {
    return _buildTile(
      context: context,
      title: 'Échelle de salaire',
      child: Row(
        children: [
          Text(
            '€${_salaryRange.start.round()}',
            style: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary,
            ),
          ),
          Expanded(
            child: RangeSlider(
              values: _salaryRange,
              min: 0,
              max: 10000,
              divisions: 100,
              labels: RangeLabels(
                '€${_salaryRange.start.round()}',
                '€${_salaryRange.end.round()}',
              ),
              onChanged: (values) {
                setState(() {
                  _salaryRange = values;
                });
              },
            ),
          ),
          Text(
            '€${_salaryRange.end.round()}',
            style: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required BuildContext context,
    required String title,
    IconData? icon,
    VoidCallback? onPressed,
    Widget? child,
    Color? titleColor,
    Color? iconColor,
  }) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: titleColor ?? themes.currentTheme.colorScheme.onPrimary,
              ),
            ),
            leading: Icon(
              icon,
              color: iconColor ?? themes.currentTheme.colorScheme.onPrimary,
            ),
            onTap: onPressed,
            tileColor: themes.currentTheme.colorScheme.secondary,
          ),
          if (child != null)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: child,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required List<String> items,
    required List<String> selectedItems,
    required Function(String) onSelectItem,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: MultiSelectDialogField(
        items:
            items.map((item) => MultiSelectItem<String>(item, item)).toList(),
        title: Text(title),
        selectedColor: Colors.blue,
        buttonIcon: Icon(
          Icons.arrow_drop_down,
          color: themes.currentTheme.colorScheme.onPrimary,
        ),
        buttonText: Text(
          title,
          style: TextStyle(
            color: themes.currentTheme.colorScheme.onPrimary,
          ),
        ),
        onConfirm: (values) {
          setState(() {
            selectedItems.clear();
            selectedItems.addAll(values);
          });
        },
      ),
    );
  }

  List<String> _getSkillsByCategory() {
    List<String> sortedSkills = [];
    for (var category in skillCategories) {
      sortedSkills.addAll(category.skills);
    }
    return sortedSkills;
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFC3C3C3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class HalfDividerWidget extends StatelessWidget {
  const HalfDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFC3C3C3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
