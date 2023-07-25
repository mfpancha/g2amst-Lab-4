class FilterChipData {
  String label;
  bool isSelected;

  FilterChipData(this.label, this.isSelected);
}

List<FilterChipData> categories = [
  FilterChipData("Collares", false),
  FilterChipData("Juguetes", false),
  FilterChipData("Ropa", false),
  FilterChipData("Alimento", false)
];