import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersPage(
      {super.key, required this.currentFilters, required this.saveFilters});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false,
      _lactoseFree = false,
      _vegan = false,
      _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
      {required String title,
      required String description,
      required bool currentValue,
      required Function(bool) updateValue}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your Meal Selection',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  title: 'Gluten-Free',
                  description: 'Only include Gluten-Free Meals.',
                  currentValue: _glutenFree,
                  updateValue: (newValue) {
                    setState(() => _glutenFree = newValue);
                  },
                ),
                _buildSwitchListTile(
                  title: 'Lactose-Free',
                  description: 'Only include Lactose-Free Meals.',
                  currentValue: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() => _lactoseFree = newValue);
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only include Vegan Meals.',
                  currentValue: _vegan,
                  updateValue: (newValue) {
                    setState(() => _vegan = newValue);
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only include Vegetarian Meals.',
                  currentValue: _vegetarian,
                  updateValue: (newValue) {
                    setState(() => _vegetarian = newValue);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
