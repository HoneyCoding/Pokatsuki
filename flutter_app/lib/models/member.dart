class Member {
  String name;
  String description;
  String? assetUrl;

  Member(this.name, this.description, this.assetUrl);
  Member.withoutAssetUrl(this.name, this.description) {
    assetUrl = null;
  }
}
