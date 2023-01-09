class ExtensionDetails {
  String name;
  String description;
  String version;
  String extensionWidth;
  String extensionHeight;
  ExtensionDetails({
    this.name = "app_name",
    this.description = "app_description",
    this.version = "1.0.0",
    this.extensionWidth = "200px",
    this.extensionHeight = "200px",
  });

  @override
  String toString() {
    return 'ExtensionDetails(name: $name, description: $description, version: $version, extensionWidth: $extensionWidth, extensionHeight: $extensionHeight)';
  }
}
