/* Cria o objeto carros com todos os atributos
 */

class Carros{
  String? id;
  String? brandName;
  String? modelName;
  int? colorId;
  int? brandId;
  int? modelYear;
  String? transmissionType;
  int? mileage;
  String? url;
  double? price;
  String? fuelType;
  bool? favorite = false;

  Carros({
    this.brandId, this.brandName, this.colorId,
    this.fuelType, this.mileage, this.modelName,
    this.modelYear, this.price, this.transmissionType,
    this.url, this.favorite, this.id
  });

 

  Carros.fromJson(Map<String , dynamic> map, bool favoritar){
    brandId = map['brand_id'];
    brandName = map['brand_name'];
    fuelType = map['fuel_type'];
    modelName = map['model_name'];
    transmissionType = map['transmission_type'];
    url = map['image_url'];
    modelYear = map['model_year'];
    mileage = map['mileage'];
  colorId = map['color_id'];
  price = map['price'];
  id = map['id'];
  favorite = favoritar; 
   
  }

 
}