import 'package:flutter/material.dart';
import 'package:adopte_un_candidat/useful.dart';
import '../skills.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SkillsFilterPage extends StatefulWidget {
  @override
  _SkillsFilterPageState createState() => _SkillsFilterPageState();
}

class _SkillsFilterPageState extends State<SkillsFilterPage> {
  String _city = '';
  double _radius = 10.0;
  List<String> _selectedSkills = [];
  List<String> _selectedActivitySectors = [];
  List<String> _selectedCompanyCategories = [];
  List<String> _selectedContractTypes = [];
  List<String> _selectedDiplomas = [];
  List<String> _selectedPersonality = [];

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
                  'Filtres de matching',
                  style: TextStyle(
                    color: themes.currentTheme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
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
            title: 'Localisation',
            tiles: [
              _buildCityTile(),
              _buildRadiusTile(),
            ],
          ),
          _buildSection(
            title: 'Filtres avancés',
            tiles: [
              _buildExpansionTile(
                title: 'Compétences',
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
                title: 'Diplomes',
                items: Diplomas,
                selectedItems: _selectedDiplomas,
                onSelectItem: (String item) {
                  setState(() {
                    _selectedDiplomas.contains(item)
                        ? _selectedDiplomas.remove(item)
                        : _selectedDiplomas.add(item);
                  });
                },
              ),
              _buildExpansionTile(
                title: 'Personnalité',
                items: Personality,
                selectedItems: _selectedPersonality,
                onSelectItem: (String item) {
                  setState(() {
                    _selectedPersonality.contains(item)
                        ? _selectedPersonality.remove(item)
                        : _selectedPersonality.add(item);
                  });
                },
              ),
              _buildExpansionTile(
                title: 'Secteur(s) d\'activité',
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
                title: 'Type de contrats',
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
        DividerWidget(),
        for (int i = 0; i < tiles.length; i++)
          Column(
            children: [
              if (i != 0) HalfDividerWidget(),
              tiles[i],
            ],
          ),
        DividerWidget(),
      ],
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
        items: items.map((item) => MultiSelectItem<String>(item, item)).toList(),
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

  Widget _buildCityTile() {
    return _buildTile(
      context: context,
      title: 'Ville',
      child: Container(
        width: 300,
        child: TextField(
          style: TextStyle(
            color: themes.currentTheme.colorScheme.onPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Entrez une ville',
            hintStyle: TextStyle(
              color: themes.currentTheme.colorScheme.onPrimary.withOpacity(0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: themes.currentTheme.colorScheme.onPrimary.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadiusTile() {
    return _buildTile(
      context: context,
      title: 'Dans un rayon de',
      child: Row(
        children: [
          Spacer(),
          Container(
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
          Text('${_radius.toStringAsFixed(1)} km',
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
    IconData ? icon,
    VoidCallback? onPressed,
    Widget? child,
    Color? titleColor,
    Color? iconColor,
  }) {
    return Container(
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

  List<String> _getSkillsByCategory() {
    List<String> sortedSkills = [];
    for (var category in skillCategories) {
      sortedSkills.addAll(category.skills);
    }
    return sortedSkills;
  }
}

class DividerWidget extends StatelessWidget {
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