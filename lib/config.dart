class Config
{
  int? id,price,stock;
  String? title;
  String? des;
 dynamic ?rating;
 String ?thumnail;
 List imges=[];

  Config(this.id, this.price, this.stock, this.title, this.des, this.rating,
      this.thumnail, this.imges);

  static get(Map m)
  {
    return Config(m['id'],m['price'],m['stock'],m['title'],m['description'],m['rating'],m['thumbnail'],m['images']);
  }

}